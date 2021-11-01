<%-- 
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">       
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.4/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>


        <title>History Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
            <c:if test="${not empty listOrder}">
                <table class="table table-hover table-bordered">
                    <thead class="bg-sub">
                        <tr>
                            <th>Id</th>
                            <th>Shopping Date</th>
                            <th>Status</th>
                            <th>Total</th>
                            <th>Detail</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listOrder}" var="order">
                            <tr>
                                <td class="align-middle">${order.id}</td>
                                <td class="align-middle">${order.createDate}</td>
                                <td class="align-middle">${order.status}</td>
                                <td class="align-middle">${order.total}</td>
                                <td class="align-middle"><a class="btn btn-main" href="HistoryDetailController?orderId=${order.id}">Detail</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty listOrder}">
                <p class="text-danger display-4">Your have no Order</p>
            </c:if>
            <button type="button" class="btn btn-warning mx-3" onclick="goBack()">
                <i class="fa fa-lg fa-arrow-left"></i> &nbsp; Back
            </button>
        </div>
    </body>
</html>