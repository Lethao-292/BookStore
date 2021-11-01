<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<form action="MainController" method="POST" class="col-sm-2">
        <div class="bg-main text-white text-uppercase p-3"><i class="fas fa-filter"></i> &nbsp; Filters</div>

        <div class="input-group input-group my-4">
            <input name="txtSearch" type="text" class="form-control" placeholder="Search..." value="${searchValue}">
            <div class="input-group-append">
                <button type="submit" class="btn btn-secondary" name="action" value="Search">
                    <i class="fa fa-lg fa-search"></i>
                </button>
            </div>
        </div>
        <hr/>
        <div class="px-4 pt-2">
            <h6 class="font-weight-bold mb-3">Category</h6>

            <div class="form-check pl-0 mb-3">
                <input type="radio" class="form-check-input filled-in" name="categoryRadio" value="0" checked>
                <label class="form-check-label small text-uppercase card-link-secondary">All</label>
            </div>
            <c:forEach items="${listC}" var="c">
                <div class="form-check pl-0 mb-3">
                    <input type="radio" class="form-check-input filled-in" name="categoryRadio" id="${c.id}" value="${c.id}" ${categoryId == c.id ? 'checked' : ''} />
                    <label class="form-check-label small text-uppercase card-link-secondary" for="${c.id}">${c.name}</label>
                </div>
            </c:forEach>
        </div>

        <hr/>

        <div class="px-4 pt-2">
            <h6 class="font-weight-bold mb-3">Price</h6>

            <div class="form-check pl-0 mb-3">
                <input type="radio" class="form-check-input" value="all" name="priceRange" checked>
                <label class="form-check-label small text-uppercase card-link-secondary">All</label>
            </div>
            <div class="form-check pl-0 mb-3">
                <input type="radio" class="form-check-input" value="under100" name="priceRange" ${price == "under100" ? 'checked' : ''}>
                <label class="form-check-label small text-uppercase card-link-secondary">Under 100,000đ</label>
            </div>
            <div class="form-check pl-0 mb-3">
                <input type="radio" class="form-check-input" value="100200" name="priceRange" ${price == "100200" ? 'checked' : ''}>
                <label class="form-check-label small text-uppercase card-link-secondary">100,000đ to 200,000đ</label>
            </div>
            <div class="form-check pl-0 mb-3">
                <input type="radio" class="form-check-input" value="200500" name="priceRange" ${price == "200500" ? 'checked' : ''}>
                <label class="form-check-label small text-uppercase card-link-secondary">200,000đ to 500,000đ</label>
            </div>
            <div class="form-check pl-0 mb-3">
                <input type="radio" class="form-check-input" value="500above" name="priceRange" ${price == "500above" ? 'checked' : ''}>
                <label class="form-check-label small text-uppercase card-link-secondary">500,000đ & Above</label>
            </div>
        </div>
</form>