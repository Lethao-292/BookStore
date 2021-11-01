<%@page import="model.dto.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-main">
        <c:if test="${sessionScope.user ne null}">
            <div class="container">
                <a class="navbar-brand mx-5" href="HomeController">Welcome ${sessionScope.user.fullname}</a>
                <div class="justify-content-end mx-5" id="navbarsExampleDefault"> 
                    <ul class="navbar-nav m-auto">
                        <c:if test="${sessionScope.user.role eq 'User'}">
                            <li class="nav-item mx-3 my-1">
                                <a class="text-white align-middle" href="cart.jsp">
                                    <i class="fa  fa-lg fa-shopping-cart"></i> &nbsp; Cart
                                    <span class="badge badge-light">${sessionScope.cart.cartDetail.size()}</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="HistoryController">Cart History</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.user.role eq 'Admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="ManagementController?indexP=1&statusOp=active">Manage Book</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutController">Logout</a>
                        </li>                        
                    </ul>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.user eq null}">
            <div class="container">
                <a class="navbar-brand mx-5" href="HomeController">Welcome Anomymous</a>
                <div class="justify-content-end mx-5" id="navbarsExampleDefault"> 
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>                        
                    </ul>
                </div>
            </div>
        </c:if>
    </nav>
    <section class="text-center bg-sub p-5 mb-5">
        <div class="container">
            <h1>Tina Book Store</h1>
            <p>Professional IT Book</p>
        </div>
    </section>
</header>