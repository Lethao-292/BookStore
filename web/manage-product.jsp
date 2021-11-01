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


        <title>Manage Book Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="container">
                <form action="MainController" method="POST" class="container">
                    <div class="row">
                        <div class="col-sm-8">
                            <label for="statusOp" class="font-weight-bold h5">Status: </label>
                            <select class="btn bg-sub" name="statusOp">
                                <option value="active" selected>Active</option>
                                <option value="inactive" ${status == "inactive" ? 'selected' : ''}>Inactive</option>
                        </select>
                        <button class="btn btn-info ml-3" name="action" value="Manage">Search</button>
                    </div>
                    <a href="#addModal"  class="btn btn-warning mx-3" data-toggle="modal"><i class="fas fa-plus fa-lg"> &nbsp;&nbsp;Add New Product</i></a>
                </div>
            </form>
            <p class="text-danger display-4">${error}</p>
            <c:if test="${error eq null}">
                <table class="table table-hover table-bordered">
                    <thead class="bg-sub">
                        <tr>
                            <th>Id</th>
                            <th>Image</th>
                            <th>Detail</th>
                            <th>Status</th>
                                <c:if test="${status ne 'inactive'}">
                                <th>Action</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listB}" var="book">
                            <tr>
                                <td class="align-middle p-3">${book.id}</td>
                                <td class="align-middle">
                                    <img src="${book.image}" style="width: 100px; height: 120px" alt="Card image cap"/>
                                </td>
                                <td>
                                    <p class="h5">${book.title}</p>
                                    <p>Price: ${book.price} đ</p>
                                    <p>Quantity: ${book.quantity}</p>
                                    <p>Author: ${book.author.name}</p>
                                    <p>Category: ${book.category.name}</p>
                                    <p>Description: ${book.description}</p>
                                    <p>Import Date: ${book.importDate}</p>
                                </td>
                                <td class="align-middle ${book.status == "active" ? 'text-success' : 'text-danger'}">
                                    ${book.status}
                                </td>
                                <c:if test="${status ne 'inactive'}">
                                    <td class="align-middle">
                                        <a href="LoadEditController?bookId=${book.id}" class="edit"><i class="fas fa-edit fa-lg"></i></a>
                                        <br/><br/>
                                        <a href="DeleteController?bookId=${book.id}" class="delete" onclick="return confirm('Are you sure you want to delete this book?')"><i class="fas fa-trash-alt fa-lg"></i></a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:if test="${endP ne 1}">
                    <div class="container">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${endP}" var="i">
                                <form action="MainController" method="POST">
                                    <li class="page-item d-inline-block">
                                        <input type="hidden" name="statusOp" value="active"/>
                                        <input type="hidden" name="indexP" value="${i}"/>
                                        <button type="submit" class="btn btn-link ${index == i ? 'btn-main text-light' : ''}" name="action" value="Manage">${i}</button>
                                    </li>
                                </form>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
            </c:if>
        </div>

        <!-- Add Modal HTML -->
        <div id="addModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="MainController" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add New Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group my-2">
                                <input type="text" placeholder="Title" class="form-control" name="txtTitle" required maxlength="60">
                            </div>
                            <div class="form-group my-2">
                                <input type="url" placeholder="Image URL" class="form-control" name="txtImage" maxlength="200">
                            </div>
                            <div class="form-group my-2">
                                <input type="number" placeholder="Quantity" class="form-control" name="txtQuantity" required min="1">
                            </div>
                            <div class="form-group my-2">
                                <input type="number" placeholder="Price" class="form-control" name="txtPrice" required min="0">
                            </div>
                            <div class="form-group my-2" id="auAva">
                                <label>Author</label>
                                <select name="authorOp" class="form-select form-control" aria-label="Default select example">
                                    <c:forEach items="${listAu}" var="a">
                                        <option value="${a.name}">${a.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group my-2 d-none" id="auOther">
                                <input type="text" placeholder="Author" class="form-control" name="txtAuthor" maxlength="50">
                            </div>
                            <input value="Add Other" name="myAction" class="btn btn-link" id="myBtn" onclick="authorControl()">
                            <div class="form-group my-2">
                                <label>Category</label>
                                <select name="categoryOp" class="form-select form-control" aria-label="Default select example">
                                    <c:forEach items="${listC}" var="c">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>                            
                            <div class="form-group my-2">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>                                
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add" name="action">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>