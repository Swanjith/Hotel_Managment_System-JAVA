package com.hotelapp.model;

import java.math.BigDecimal;
import java.util.Date;

public class Reservation {
    private int reservationID;
    private String customerName;
    private String roomNumber;
    private Date checkInDate;
    private Date checkOutDate;
    private BigDecimal totalAmount;

    // Constructors
    public Reservation() {
    }

    public Reservation(int reservationID, String customerName, String roomNumber, Date checkInDate, Date checkOutDate, BigDecimal totalAmount) {
        this.reservationID = reservationID;
        this.customerName = customerName;
        this.roomNumber = roomNumber;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.totalAmount = totalAmount;
    }
    
    // Getters and Setters
    public int getReservationID() {
        return reservationID;
    }

    public void setReservationID(int reservationID) {
        this.reservationID = reservationID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "Reservation{" +
               "reservationID=" + reservationID +
               ", customerName=\'" + customerName + "\'" +
               ", roomNumber=\'" + roomNumber + "\'" +
               ", checkInDate=" + checkInDate +
               ", checkOutDate=" + checkOutDate +
               ", totalAmount=" + totalAmount +
               '}';
    }
}

