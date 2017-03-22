<%-- 
    Document   : index
    Created on : Mar 17, 2017, 1:09:41 AM
    Author     : AnhDT
--%>

<%@page import="com.fuction.getDataAPI"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.reflect.TypeToken"%>
<%@page import="com.entity.InformationObj"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crawler</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
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
            ArrayList<InformationObj> resultList = (ArrayList<InformationObj>)session.getAttribute("list");          
            int x = Integer.parseInt(request.getParameter("id"));    
        %>
        <div class="container">           
            <div class="col-md-12 col-sm-12">
                <div id="detail" class="row">
                    <h3 style="margin-top: 75px;"> Detail: </h3>
                    <table style="margin-top: 15px; margin-bottom: 100px;">
                        <tr>
                            <th class="col-md-3 col-sm-3">No</th>
                            <td><%=x+1%></td>
                        </tr>
                        <tr>
                            <th>Room Number</th>
                            <td><%=resultList.get(x).getRoomNumber()%></td>
                        </tr>
                        <tr>
                            <th>Area</th>
                            <td><%=resultList.get(x).getArea()%></td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td><%=resultList.get(x).getAddress()%></td>
                        </tr>
                        <tr>
                            <th>Direction</th>
                            <td><%=resultList.get(x).getDirection()%></td>
                        </tr>
                        <tr>
                            <th>Number of Bed Rooms</th>
                            <td><%=resultList.get(x).getNumberOfBedrooms()%></td>
                        </tr>
                        <tr>
                            <th>Number of Bath Rooms</th>
                            <td><%=resultList.get(x).getNumberOfBathrooms()%></td>
                        </tr>
                        <tr>
                            <th>Project</th>
                            <td><%=resultList.get(x).getProject()%></td>
                        </tr>
                        <tr>
                            <th>Floor</th>
                            <td><%=resultList.get(x).getFloor()%></td>
                        </tr>
                        <tr>
                            <th>Utilities</th>
                            <td><%=resultList.get(x).getUtilities()%></td>
                        </tr>
                        <tr>
                            <th>Environment</th>
                            <td><%=resultList.get(x).getEnvironment()%></td>
                        </tr>
                        <tr>
                            <th>Description</th>
                            <td><%=resultList.get(x).getDescription()%></td>
                        </tr>
                        <tr>
                            <th>Price Per Metre Square</th>
                            <td><%=resultList.get(x).getPricePerMetreSquare()%></td>
                        </tr>
                        <tr>
                            <th>Price</th>
                            <td><%=resultList.get(x).getPrice()%></td>
                        </tr>
                        <tr>
                            <th>Image</th>
                            <td><%=resultList.get(x).getImages()%></td>
                        </tr>
                        <tr>
                            <th>City</th>
                            <td><%=resultList.get(x).getCity()%></td>
                        </tr>
                        <tr>
                            <th>District</th>
                            <td><%=resultList.get(x).getDistrict()%></td>
                        </tr>
                        
                    </table>
                </div>
            </div>
        </div>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
