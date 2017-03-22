<%-- 
    Document   : data
    Created on : Mar 17, 2017, 2:10:43 AM
    Author     : AnhDT
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="com.fuction.MongoDB"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="Entity.InformationObj"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body style="padding: 0 20px">
        <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span><i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand page-scroll" href="#page-top">Crawler Test</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a class="page-scroll" href="index.jsp">HOME</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="data.jsp">DATA</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%
            ArrayList<InformationObj> listObj = new ArrayList<>();
            listObj = MongoDB.getObj();
        %>
        <h3 style="margin-top: 75px;"> List of Apartment: </h3>
        <table id="lsUser" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th class="th">No</th>
                    <th class="th">Area</th>
                    <th class="th">Address</th> 
                    <th class="th">Utilities</th>
                    <th class="th">Environment</th>
                    <th class="th">Description</th>
                    <th class="th">Price</th>
                    <th class="th">City</th>
                    <th class="th">District</th>
                    <th class="th">Function</th>
                </tr>
            </thead>
            <tbody>
                <%      int i = 0;
                    for (InformationObj io : listObj) {
                        i++;%>
                <tr>
                    <td><%=i%></td>
                    <td><%=io.getArea()%></td> 
                    <td><%=io.getAddress()%></td> 
                    <td><%=io.getUtilities()%></td>
                    <td><%=io.getEnvironment()%></td>
                <%
                    String temp = "";
                    if(io.getDescription().length() > 300){
                        temp = io.getDescription().substring(0, 300) + "... ";
                    }else{
                        temp = io.getDescription();
                    }
                %>
                    <td><%=temp%></td>
                    <td><%=io.getPrice()%></td>
                    <td><%=io.getCity()%></td>
                    <td><%=io.getDistrict()%></td>
                    <td><a target="_blank" href="detail.jsp?id=<%=i-1%>"> Detail </a></td>
                </tr>
                <% }%>
            </tbody>
        </table>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
        <script src="//cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js"></script>
        <script src="js/dataTable.js"></script>
    </body>
</html>
