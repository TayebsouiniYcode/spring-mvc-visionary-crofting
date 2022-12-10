<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/12/2022
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../components/header.jsp" %>

<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>Youcode product</p>
                    <h1>Products</h1>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- products -->
<div class="product-section mt-150 mb-150">
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <div class="product-filters">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <li data-filter=".strawberry">Strawberry</li>
                        <li data-filter=".berry">Berry</li>
                        <li data-filter=".lemon">Lemon</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="row product-lists">
            <c:forEach items="${products}" var="product">
                <div class="col-lg-4 col-md-6 text-center strawberry">
                    <div class="single-product-item">
                        <div class="product-image">
                            <a href="/product/${product.getId()}"><img src="../../static/img/products/${product.getId()}.png" alt=""></a>
                        </div>
                        <h3>${product.getName()}</h3>
                        <p class="product-price"><span>Per One piace</span> ${product.getUnitaryPrice()} Dh</p>
                        <a href="/client/addtocart/${product.getProductReference()}" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                    </div>
                </div>
            </c:forEach>
        </div>

<%--        <div class="row">--%>
<%--            <div class="col-lg-12 text-center">--%>
<%--                <div class="pagination-wrap">--%>
<%--                    <ul>--%>
<%--                        <li><a href="#">Prev</a></li>--%>
<%--                        <li><a href="#">1</a></li>--%>
<%--                        <li><a class="active" href="#">2</a></li>--%>
<%--                        <li><a href="#">3</a></li>--%>
<%--                        <li><a href="#">Next</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>


<%@ include file="../components/footer.jsp" %>

