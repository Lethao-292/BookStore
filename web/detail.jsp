<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">       
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.4/css/all.css">
        <link rel="stylesheet" type="text/css" href="css/style.css" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>

        <title>Home Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <div class="row mb-5">
                <jsp:include page="left.jsp"></jsp:include>
                    <div class="col-sm-9 container card">
                        <form action="MainController" method="POST">
                            <input type="hidden" name="bookId" value="${book.id}">
                        <div class="row">
                            <div class="col-sm-5 border-right gallery-wrap">
                                <div class="img-big-wrap">
                                    <div>
                                        <img src="${book.image}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <article class="card-body p-5">
                                    <h3 class="title mb-3">${book.title}</h3>

                                    <p class="price-detail-wrap price h3 text-warning"> 
                                        <span class="currency"></span><span class="num">${book.price} đ</span>
                                    </p> <!-- price-detail-wrap .// -->

                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-5 param param-inline">
                                            <dt>Quantity: </dt>
                                            <dd>
                                                <input type="number" name="txtQuantity" value="1" min="1"/>
                                                <p class="text-muted"> Store: ${book.quantity}</p>
                                            </dd>
                                        </div>
                                    </div> 

                                    <hr>
                                    <button type="button" class="btn btn-warning mx-3" onclick="goBack()">
                                        <i class="fa fa-lg fa-arrow-left"></i> &nbsp; Back
                                    </button>
                                    <c:if test="${sessionScope.user.role ne 'User'}">
                                        <button type="button" class="btn btn-main mx-3" onclick="checkRoleAsUser()">
                                            <i class="fas fa-lg fa-cart-plus"></i> &nbsp; Add to cart
                                        </button>
                                        <script>
                                            var checkRoleAsUser = function () {
                                                if (confirm("You must to be User to access this page. Do you want to Login?")) {
                                                    location = "LogoutController?des=1";
                                                }
                                            }
                                        </script>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role eq 'User'}" >
                                        <button class="btn btn-main mx-3" name="action" value="AddToCart">
                                            <i class="fas fa-lg fa-cart-plus"></i> &nbsp; Add to cart
                                        </button>
                                    </c:if>

                                    <hr/>
                                    <dl class="item-property">
                                        <dt>Description</dt>
                                        <dd>
                                            <p id="des" class="text-truncate">${book.description}</p>
                                            <button class="btn btn-link" id="myBtn" onclick="descriptionControl()">Read more</button>
                                        </dd>
                                    </dl>
                                </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->
                    </form>

                </div>
            </div>
        </div>
    </div>
</body>
</html>
