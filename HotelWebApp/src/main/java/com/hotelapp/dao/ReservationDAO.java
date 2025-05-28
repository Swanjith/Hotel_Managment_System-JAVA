package com.hotelapp.dao;

import com.hotelapp.model.Reservation;
import java.sql.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    // Add a new reservation
    public boolean addReservation(Reservation reservation) throws SQLException {
        String sql = "INSERT INTO Reservations (CustomerName, RoomNumber, CheckIn, CheckOut, TotalAmount) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, reservation.getCustomerName());
            pstmt.setString(2, reservation.getRoomNumber());
            pstmt.setDate(3, new java.sql.Date(reservation.getCheckInDate().getTime()));
            pstmt.setDate(4, new java.sql.Date(reservation.getCheckOutDate().getTime()));
            pstmt.setBigDecimal(5, reservation.getTotalAmount());
            
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        reservation.setReservationID(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider logging this instead
            throw e; // Re-throw to be handled by the servlet
        }
        return false;
    }

    // Get a reservation by ID
    public Reservation getReservationById(int reservationId) throws SQLException {
        String sql = "SELECT * FROM Reservations WHERE ReservationID = ?";
        Reservation reservation = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reservationId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                reservation = new Reservation();
                reservation.setReservationID(rs.getInt("ReservationID"));
                reservation.setCustomerName(rs.getString("CustomerName"));
                reservation.setRoomNumber(rs.getString("RoomNumber"));
                reservation.setCheckInDate(rs.getDate("CheckIn"));
                reservation.setCheckOutDate(rs.getDate("CheckOut"));
                reservation.setTotalAmount(rs.getBigDecimal("TotalAmount"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return reservation;
    }

    // Get all reservations
    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM Reservations ORDER BY CheckIn DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationID(rs.getInt("ReservationID"));
                reservation.setCustomerName(rs.getString("CustomerName"));
                reservation.setRoomNumber(rs.getString("RoomNumber"));
                reservation.setCheckInDate(rs.getDate("CheckIn"));
                reservation.setCheckOutDate(rs.getDate("CheckOut"));
                reservation.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return reservations;
    }

    // Update an existing reservation
    public boolean updateReservation(Reservation reservation) throws SQLException {
        String sql = "UPDATE Reservations SET CustomerName = ?, RoomNumber = ?, CheckIn = ?, CheckOut = ?, TotalAmount = ? WHERE ReservationID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, reservation.getCustomerName());
            pstmt.setString(2, reservation.getRoomNumber());
            pstmt.setDate(3, new java.sql.Date(reservation.getCheckInDate().getTime()));
            pstmt.setDate(4, new java.sql.Date(reservation.getCheckOutDate().getTime()));
            pstmt.setBigDecimal(5, reservation.getTotalAmount());
            pstmt.setInt(6, reservation.getReservationID());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    // Delete a reservation
    public boolean deleteReservation(int reservationId) throws SQLException {
        String sql = "DELETE FROM Reservations WHERE ReservationID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reservationId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    // --- Report Methods ---

    // Report: Reservations in a date range
    public List<Reservation> getReservationsByDateRange(java.util.Date startDate, java.util.Date endDate) throws SQLException {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT * FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ? ORDER BY CheckIn";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setDate(1, new java.sql.Date(startDate.getTime()));
            pstmt.setDate(2, new java.sql.Date(endDate.getTime()));
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setReservationID(rs.getInt("ReservationID"));
                reservation.setCustomerName(rs.getString("CustomerName"));
                reservation.setRoomNumber(rs.getString("RoomNumber"));
                reservation.setCheckInDate(rs.getDate("CheckIn"));
                reservation.setCheckOutDate(rs.getDate("CheckOut"));
                reservation.setTotalAmount(rs.getBigDecimal("TotalAmount"));
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return reservations;
    }

    // Report: Rooms booked most frequently (Simplified: count occurrences of room numbers)
    // For a more accurate "most frequent", you might need a more complex query or a dedicated table for room bookings over time.
    public List<Object[]> getMostFrequentlyBookedRooms(int limit) throws SQLException {
        List<Object[]> roomCounts = new ArrayList<>();
        String sql = "SELECT RoomNumber, COUNT(RoomNumber) AS BookingCount FROM Reservations GROUP BY RoomNumber ORDER BY BookingCount DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, limit);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                roomCounts.add(new Object[]{rs.getString("RoomNumber"), rs.getInt("BookingCount")});
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return roomCounts;
    }

    // Report: Total revenue over a period
    public BigDecimal getTotalRevenueOverPeriod(java.util.Date startDate, java.util.Date endDate) throws SQLException {
        BigDecimal totalRevenue = BigDecimal.ZERO;
        String sql = "SELECT SUM(TotalAmount) AS TotalRevenue FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setDate(1, new java.sql.Date(startDate.getTime()));
            pstmt.setDate(2, new java.sql.Date(endDate.getTime()));
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                totalRevenue = rs.getBigDecimal("TotalRevenue");
                if (totalRevenue == null) {
                    totalRevenue = BigDecimal.ZERO;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return totalRevenue;
    }
}

