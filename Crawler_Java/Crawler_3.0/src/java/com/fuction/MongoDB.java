/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fuction;

import Entity.InformationObj;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;
import java.util.ArrayList;
import static java.util.Collections.list;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 *
 * @author AnhDT
 */
public class MongoDB {

    private final static String HOST = "localhost";
    private final static int PORT = 27017;
    private final static String DB = "DataCrawler";

    public static void input(ArrayList<String> lsResult) {
        try {
            Mongo mongo = new Mongo(HOST, PORT);
            DB db = mongo.getDB(DB);
            DBCollection collection = db.getCollection("Data");
            for (String s : lsResult) {
                DBObject dbObject = (DBObject) JSON.parse(s);
                collection.insert(dbObject);
            }
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
    }

    public static void display() {
        try {
            Mongo mongo = new Mongo(HOST, PORT);
            DB db = mongo.getDB(DB);
            DBCollection collection = db.getCollection("Data");
            System.out.println("Collection mycol selected successfully");
            DBCursor cursor = collection.find();
            int i = 1;
            while (cursor.hasNext()) {
                System.out.println("Inserted Document: " + i);
                String jsonString = cursor.next().toString();
                System.out.println(jsonString);
                JSONObject jsonObject = parseJSONObject(jsonString);
                System.out.println(jsonObject.get("Area"));
                i++;
            }
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static ArrayList<InformationObj> getObj() {
        ArrayList<InformationObj> list = new ArrayList<>();
        try {
            Mongo mongo = new Mongo(HOST, PORT);
            DB db = mongo.getDB(DB);
            DBCollection collection = db.getCollection("Data");
            System.out.println("Collection mycol selected successfully");
            DBCursor cursor = collection.find();
            while (cursor.hasNext()) {
                String jsonString = cursor.next().toString();
                //System.out.println(jsonString);
                JSONObject jsonObject = parseJSONObject(jsonString);
                
                String roomNumber = (String) jsonObject.get("RoomNumber");
                String area = (String) jsonObject.get("Area");
                String address = (String) jsonObject.get("Address");
                String direction = (String) jsonObject.get("Direction");
                String numberOfBedRooms = (String) jsonObject.get("NumberOfBedRooms");
                String numberOfBathRooms = (String) jsonObject.get("NumberOfBathRooms");
                String project = (String) jsonObject.get("Project");
                String floor = (String) jsonObject.get("Floor");
                String utilities = (String) jsonObject.get("Utilities");
                String environment = (String) jsonObject.get("Environment");
                String description = (String) jsonObject.get("Description");
                String pricePerMetreSquare = (String) jsonObject.get("PricePerMetreSquare");
                String price = (String) jsonObject.get("Price");
                String image = (String) jsonObject.get("Image");
                String city = (String) jsonObject.get("City");
                String district = (String) jsonObject.get("District");
                
                InformationObj iObj = new InformationObj(roomNumber, area, address, direction, numberOfBedRooms, 
                        numberOfBathRooms, project, floor, utilities, environment, description, pricePerMetreSquare, price, image, city, district);
                list.add(iObj);
            }
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public static JSONObject parseJSONObject(String jsonObject) {
        if (jsonObject == null || jsonObject.isEmpty()) {
            return null;
        }

        JSONParser parser = new JSONParser();
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return obj;
    }
}
