<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
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
        <link rel="stylesheet" type="text/css" href="css/mangager.css" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

        <title>Cart Page</title>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <c:if test="${not empty sessionScope.cart.cartDetail}">
            <div class="shopping-cart container">
                <div class="row py-3 table-responsive">
                    <table class="table table-hover">
                        <thead class="bg-sub">
                            <tr>
                                <th>No</th>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.cart.cartDetail.values()}" var="book" varStatus="counter">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>
                                        <div>
                                            <img src="${book.image}" width="70" class="img-fluid rounded shadow-sm">
                                            <div class="ml-3 d-inline-block align-middle">
                                                <h5 class="mb-0"> <a href="DetailController?bookId=${book.id}" class="text-dark d-inline-block">${book.title}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="align-middle"><strong>${book.price} đ</strong></td>
                                    <td class="align-middle">
                                        <input type="hidden" name="bookId" value="${book.id}">
                                        <input type="number" name="txtQuantity" value="${book.quantity}">
                                    </td>
                                    <td class="align-middle">
                                        <input type="submit" class="btn btn-danger" name="action" value="Remove">
                                    </td>
                                    <td class="align-middle">
                                        <button type="submit" class="btn btn-warning" name="action" value="UpdateCart">Update</button>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- End -->


                <div class="row py-5 p-4 bg-white rounded shadow-sm">
                    <div class="col-lg-6">
                        <div class="bg-sub rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                        <div class="p-4">
                            <div class="input-group mb-4 border rounded-pill p-2">
                                <input type="text" placeholder="Enter Discount Code" aria-describedby="button-addon3" class="form-control border-0">
                                <div class="input-group-append border-0">
                                    <button id="button-addon3" type="button" class="btn btn-main px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Use</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="bg-sub rounded-pill px-4 py-3 text-uppercase font-weight-bold">Total</div>
                        <div class="p-4">
                            <ul class="list-unstyled mb-4">
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">ProductTotal</strong><strong>${sessionScope.cart.getTotal()} đ</strong></li>
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Discount</strong><strong>0 đ</strong></li>
                                <hr/>
                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                                    <h5 class="font-weight-bold">${sessionScope.cart.getTotal()} đ</h5>
                                </li>
                            </ul>
                            <form action="MainController" method="POST">
                                <input class="btn btn-main rounded-pill py-2 btn-block" type="submit" name="action" value="Order"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty sessionScope.cart.cartDetail}">
            <h3 class="text-danger container">Your cart is empty</h3>
        </c:if>
    </body>

</html>
</html>
