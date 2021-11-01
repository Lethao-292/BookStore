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


        <title>Edit Book Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <form action="MainController" method="POST" class="container">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-sub">						
                            <h4 class="modal-title">Edit Book</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group my-2">
                                <input type="text" value="${book.id}" class="form-control" name="txtId" readonly>
                        </div>
                        <div class="form-group my-2">
                            <input type="text" value="${book.title}" placeholder="Title" class="form-control" name="txtTitle" required maxlength="60">
                        </div>
                        <div class="form-group my-2">
                            <input type="url" value="${book.image}" placeholder="Image URL" class="form-control" name="txtImage" maxlength="200">
                        </div>
                        <div class="form-group my-2">
                            <input type="number" value="${book.quantity}" placeholder="Quantity" class="form-control" name="txtQuantity" required min="1">
                        </div>
                        <div class="form-group my-2">
                            <input type="number" value="${book.price}" placeholder="Price" class="form-control" name="txtPrice" required min="0">
                        </div>
                        <div class="form-group my-2" id="auAva">
                            <label>Author</label>
                            <select name="authorOp" class="form-select form-control" aria-label="Default select example">
                                <c:forEach items="${listAu}" var="a">
                                    <option value="${a.name}" ${book.category.id == c.id ? 'selected' :''}>${a.name}</option>
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
                                    <option value="${c.id}" ${book.category.id == c.id ? 'selected' :''}>${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>                            
                        <div class="form-group my-2">
                            <label>Description</label>
                            <textarea name="description" class="form-control" required>${book.description}</textarea>                                
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-sub" onclick="goBack()" value="Cancel">
                        <input type="submit" class="btn btn-main" value="Edit" name="action">
                    </div>
                </div>
            </div>
        </form>    
    </body>
</html>