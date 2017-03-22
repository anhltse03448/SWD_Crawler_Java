/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fuction;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 *
 * @author AnhDT
 */
public class GetLink {

    public List<String> getLink(String URL, String element, String containString) throws IOException {
        //get useful information
        Document doc = Jsoup.connect(URL).get();
        //get all links and recursively call the processPage method
        Elements aElements = doc.getElementsByTag(element);
        String link = "";
        ArrayList<String> lsLink = new ArrayList<>();
        ArrayList<String> lsLinkFull = new ArrayList<>();
        
        for (Element e : aElements) {
            link = e.attr("href");
            if (link.contains(containString)) {
                lsLink.add(link);               
            }
        }  
        
        for (String s : lsLink) {
            if (s.contains("http")) {
                s = "" + s;
            } else {
                s = "http://www.muabannhadat.vn" + s;                
            }            
            lsLinkFull.add(s);
        } 
        
        lsLinkFull = removeDuplicateElement(lsLinkFull);
        
        //WriteDataToFile.WriteDataToFile("link.txt", lsLinkFull, "Link");      
        return lsLinkFull;
    }
    
    public static ArrayList removeDuplicateElement(ArrayList arrList) {
        Set set = new HashSet();
        List newList = new ArrayList();
        for (Iterator iter = arrList.iterator(); iter.hasNext();) {
            Object element = iter.next();
            if (set.add(element)) {
                newList.add(element);
            }
        }
        arrList.clear();
        arrList.addAll(newList);
        return arrList;
    }
}
