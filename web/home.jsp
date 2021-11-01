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
        <script src="css/main.js"></script>

        <title>Home Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container-fluid mx-5">
                <div class="row">
                <jsp:include page="left.jsp"></jsp:include>
                <span class="text-danger display-4 text-right">${error}</span>
                <div class="col-sm-8">
                    <div class="card-group">
                        <c:forEach items="${listB}" var="book">
                            <div class="col-12 col-md-6 col-lg-4 mb-2">
                                <div class="card card-custom mb-2 mr-1">
                                    <img class="card-img-top" src="${book.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <p class="text-dark text-break card-title"><a href="DetailController?bookId=${book.id}&categoryRadio=${categoryId}&txtSearch=${searchValue}&priceRange=${priceRange}">${book.title}</a></p>
                                        <p class="card-content text-danger font-weight-bold">${book.price} đ</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${endP ne 1}">
                        <div class="container">
                            <ul class="pagination">
                                <c:forEach begin="1" end="${endP}" var="i">
                                    <form action="MainController" method="POST">
                                        <li class="page-item d-inline-block">
                                            <input type="hidden" name="txtSearch" value="${searchValue}"/>
                                            <input type="hidden" name="categoryRadio" value="${categoryId}"/>
                                            <input type="hidden" name="priceRange" value="${priceRange}"/>
                                            <input type="hidden" name="indexP" value="${i}"/>
                                            <button type="submit" class="btn btn-link ${index == i ? 'btn-main text-light' : ''}" name="action" value="Search">${i}</button>
                                        </li>
                                    </form>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>

