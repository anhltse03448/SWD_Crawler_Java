/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fuction;

import java.io.IOException;
import java.util.ArrayList;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/**
 *
 * @author AnhDT
 */
public class GetData {

    public static ArrayList<String> addData(String url) throws IOException {
        GetLink gl = new GetLink();
        GetData gd = new GetData();
        ArrayList<String> lsLinkFull = new ArrayList<>();
        ArrayList<String> lsLinkFull2 = new ArrayList<>();
        ArrayList<String> lsResult = new ArrayList<>();
        lsLinkFull = (ArrayList<String>) gl.getLink(url, "a", "/");
        
        String content = "";

        for (String s : lsLinkFull) {
            System.out.println(s);
            try {
                content = gd.getData(s);
                if (!content.equals("{\n"
                        + "	 \"RoomNumber\" : \"\",\n"
                        + "	 \"Area\" : \"\",\n"
                        + "	 \"Address\" : \"\",\n"
                        + "	 \"Direction\" : \"\",\n"
                        + "	 \"NumberOfBedRooms\" : \"\",\n"
                        + "	 \"NumberOfBathRooms\" : \"\",\n"
                        + "	 \"Project\" : \"\",\n"
                        + "	 \"Floor\" : \"\",\n"
                        + "	 \"Utilities\" : \"\",\n"
                        + "	 \"Environment\" : \"\",\n"
                        + "	 \"Description\" : \"\",\n"
                        + "	 \"PricePerMetreSquare\" : \"\",\n"
                        + "	 \"Price\" : \"\",\n"
                        + "	 \"Image\" : \"\",\n"
                        + "	 \"City\" : \"\",\n"
                        + "	 \"District\" : \"\"\n"
                        + "}")) {
                    lsResult.add(content);
                }
            } catch (Exception e) {
                System.out.println("Error");
            }
        }
        return lsResult;
    }

    public static String getData(String URL) throws IOException {
        String content = "";
        String roomNumber = "";
        String area = "";
        String address = "";
        String address1 = "";
        String address2 = "";
        String direction = "";
        String numberOfBedRooms = "";
        String numberOfBathRooms = "";
        String project = "";
        String floor = "";
        String utilities = "";
        String environment = "";
        String description = "";
        String pricePerMetreSquare = "";
        String price = "";
        String image = "";
        String city = "";
        String district = "";

        Document doc = Jsoup.connect(URL).get();

        try {
            //roomNumber = "";
            area = doc.getElementById("MainContent_ctlDetailBox_lblSurface").text();
            address1 = doc.getElementById("MainContent_ctlDetailBox_lblStreet").text();
            address2 = doc.getElementById("MainContent_ctlDetailBox_lblWard").text();
            if(address1.isEmpty())
                address = address2;
            else
                address = address1 + ", " + address2;
            direction = doc.getElementById("MainContent_ctlDetailBox_lblFengShuiDirection").text();
            numberOfBedRooms = doc.getElementById("MainContent_ctlDetailBox_lblBedRoom").text();
            numberOfBathRooms = doc.getElementById("MainContent_ctlDetailBox_lblBathRoom").text();
            project = doc.getElementById("MainContent_ctlDetailBox_lblProject").text();
            floor = doc.getElementById("MainContent_ctlDetailBox_lblFloor").text();
            utilities = doc.getElementById("MainContent_ctlDetailBox_lblUtility").text();
            environment = doc.getElementById("MainContent_ctlDetailBox_lblEnvironment").text();
            description = doc.getElementById("Description").text();
            //pricePerMetreSquare = "";
            price = doc.getElementById("MainContent_ctlDetailBox_lblPrice").text();
            //image = "";
            city = doc.getElementById("MainContent_ctlDetailBox_lblCity").text();
            district = doc.getElementById("MainContent_ctlDetailBox_lblDistrict").text();

        } catch (Exception e) {
        }

//        content = "{\n\t RoomNumber : \"" + roomNumber + "\",\n\t Area : \"" + area + "\",\n\t Address : \"" + address + "\",\n\t Direction : \"" + direction + "\",\n\t NumberOfBedRooms : \"" + numberOfBedRooms + "\",\n\t "
//                + "NumberOfBathRooms : \"" + numberOfBathRooms + "\",\n\t Project : \"" + project + "\",\n\t Floor : \"" + floor + "\",\n\t Utilities : \"" + utilities + "\",\n\t Environment : \"" + environment + "\""
//                + ",\n\t Description : \"" + description + "\",\n\t PricePerMetreSquare : \"" + pricePerMetreSquare + "\",\n\t Price : \"" + price + "\",\n\t Image : \"" + image + "\""
//                + ",\n\t City : \"" + city + "\",\n\t District : \"" + district + "\"\n}";

        content = "{\n\t \"RoomNumber\" : \"" + roomNumber + "\",\n\t \"Area\" : \"" + area + "\",\n\t \"Address\" : \"" + address + "\",\n\t \"Direction\" : \"" + direction + "\",\n\t \"NumberOfBedRooms\" : \"" + numberOfBedRooms + "\",\n\t "
                + "\"NumberOfBathRooms\" : \"" + numberOfBathRooms + "\",\n\t \"Project\" : \"" + project + "\",\n\t \"Floor\" : \"" + floor + "\",\n\t \"Utilities\" : \"" + utilities + "\",\n\t \"Environment\" : \"" + environment + "\""
                + ",\n\t \"Description\" : \"" + description + "\",\n\t \"PricePerMetreSquare\" : \"" + pricePerMetreSquare + "\",\n\t \"Price\" : \"" + price + "\",\n\t \"Image\" : \"" + image + "\""
                + ",\n\t \"City\" : \"" + city + "\",\n\t \"District\" : \"" + district + "\"\n}";
        
        return content;
    }
}
