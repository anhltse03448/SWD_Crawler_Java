/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entity;

/**
 *
 * @author AnhDT
 */
public class InformationObj {

    private String RoomNumber;
    private String Area;
    private String Address;
    private String Direction;
    private String NumberOfBedrooms;
    private String NumberOfBathrooms;
    private String Project;
    private String Floor;
    private String Utilities;
    private String Environment;
    private String Description;
    private String PricePerMetreSquare;
    private String Price;
    private String Images;
    private String City;
    private String District;

    public InformationObj() {
    }

    public InformationObj(String RoomNumber, String Area, String Address, String Direction, String NumberOfBedrooms, String NumberOfBathrooms, String Project, String Floor, String Utilities, String Environment, String Description, String PricePerMetreSquare, String Price, String Images, String City, String District) {
        this.RoomNumber = RoomNumber;
        this.Area = Area;
        this.Address = Address;
        this.Direction = Direction;
        this.NumberOfBedrooms = NumberOfBedrooms;
        this.NumberOfBathrooms = NumberOfBathrooms;
        this.Project = Project;
        this.Floor = Floor;
        this.Utilities = Utilities;
        this.Environment = Environment;
        this.Description = Description;
        this.PricePerMetreSquare = PricePerMetreSquare;
        this.Price = Price;
        this.Images = Images;
        this.City = City;
        this.District = District;
    }

    public String getRoomNumber() {
        return RoomNumber;
    }

    public void setRoomNumber(String RoomNumber) {
        this.RoomNumber = RoomNumber;
    }

    public String getArea() {
        return Area;
    }

    public void setArea(String Area) {
        this.Area = Area;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getDirection() {
        return Direction;
    }

    public void setDirection(String Direction) {
        this.Direction = Direction;
    }

    public String getNumberOfBedrooms() {
        return NumberOfBedrooms;
    }

    public void setNumberOfBedrooms(String NumberOfBedrooms) {
        this.NumberOfBedrooms = NumberOfBedrooms;
    }

    public String getNumberOfBathrooms() {
        return NumberOfBathrooms;
    }

    public void setNumberOfBathrooms(String NumberOfBathrooms) {
        this.NumberOfBathrooms = NumberOfBathrooms;
    }

    public String getProject() {
        return Project;
    }

    public void setProject(String Project) {
        this.Project = Project;
    }

    public String getFloor() {
        return Floor;
    }

    public void setFloor(String Floor) {
        this.Floor = Floor;
    }

    public String getUtilities() {
        return Utilities;
    }

    public void setUtilities(String Utilities) {
        this.Utilities = Utilities;
    }

    public String getEnvironment() {
        return Environment;
    }

    public void setEnvironment(String Environment) {
        this.Environment = Environment;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getPricePerMetreSquare() {
        return PricePerMetreSquare;
    }

    public void setPricePerMetreSquare(String PricePerMetreSquare) {
        this.PricePerMetreSquare = PricePerMetreSquare;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getImages() {
        return Images;
    }

    public void setImages(String Images) {
        this.Images = Images;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    @Override
    public String toString() {
        return "{\n\t RoomNumber : \"" + RoomNumber + "\",\n\t Area : \"" + Area + "\",\n\t Address : \"" + Address + "\",\n\t Direction : \"" + Direction + "\",\n\t NumberOfBedRooms : \"" + NumberOfBedrooms + "\",\n\t "
                + "NumberOfBathRooms : \"" + NumberOfBathrooms + "\",\n\t Project : \"" + Project + "\",\n\t Floor : \"" + Floor + "\",\n\t Utilities : \"" + Utilities + "\",\n\t Environment : \"" + Environment + "\""
                + ",\n\t Description : \"" + Description + "\",\n\t PricePerMetreSquare : \"" + PricePerMetreSquare + "\",\n\t Price : \"" + Price + "\",\n\t Image : \"" + Images + "\""
                + ",\n\t City : \"" + City + "\",\n\t District : \"" + District + "\"\n}";
    }
}
