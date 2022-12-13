<%@ page import="com.company.app.entity.Client" %>
<%@ include file="../components/header.jsp" %>

<%
    Client client = (Client) session.getAttribute ( "client" );
%>

<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>Youcode Shop</p>
                    <h1>Welcome ${client.getName()} in Dashboard</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- cart -->
<div class="cart-section mt-150 mb-150">
    <div class="container">
        <div class="row mt-150 mb-150">
            <div class="col-lg-12 col-md-12">
                <div class="cart-table-wrap">
                    <div class="mb-3">
                        <a class="btn btn-primary" href="/addproduct">Add new product</a>
                    </div>
                    <table class="cart-table">
                        <thead class="cart-table-head">
                        <tr class="table-head-row">
                            <th>Reference</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price (Dh)</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="product">
                            <tr class="table-body-row product-item">
                                <td>${product.getProductReference()}</td>
                                <td class="product-image"><img src="../../static/img/products/${product.getId()}.png" alt=""></td>
                                <td>${product.getName()}</td>
                                <td>${product.getQuantity()}</td>
                                <td>${product.getUnitaryPrice()}</td>
                                <td>${product.getCategory()}</td>
                                <td>
                                    <a href="/deleteproduct/${product.getId()}"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row mt-150 mb-150">
            <div class="col-lg-12 col-md-12">
                <div class="cart-table-wrap">
                    <table class="cart-table">
                        <thead class="cart-table-head">
                        <tr class="table-head-row">
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${clients}" var="client">
                            <tr class="table-body-row product-item">
                                <td>${client.getId()}</td>
                                <td>${client.getName()}</td>
                                <td>${client.getEmail()}</td>
                                <td>${client.getPhone()}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row mt-150 mb-150">
            <div class="col-lg-12 col-md-12">
                <div class="cart-table-wrap">
                    <table class="cart-table">
                        <thead class="cart-table-head">
                        <tr class="table-head-row">
                            <th>Id</th>
                            <th>Reference</th>
                            <th>Date</th>
                            <th>Client</th>
                            <th>Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${commands}" var="command">
                            <tr class="table-body-row product-item">
                                <td>${command.getId()}</td>
                                <td>${command.getRef()}</td>
                                <td>${command.getDateTime()}</td>
                                <td>${command.getClient().getName()}</td>
                                <td>${command.getTotalPrice()} <span>Dh</span></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../components/footer.jsp" %>
