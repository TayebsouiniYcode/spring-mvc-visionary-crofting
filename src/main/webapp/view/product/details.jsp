<%@ include file="../components/header.jsp" %>

<!-- breadcrumb-section -->
<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>See more Details</p>
                    <h1>${product.getName()}</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="single-product mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="single-product-img">
                    <img src="../../static/img/products/${product.getId()}.png" alt="">
                </div>
            </div>
            <div class="col-md-7">
                <div class="single-product-content">
                    <h3>${product.getName()}</h3>
                    <p class="single-product-pricing"><span>Per one piece</span> ${product.getUnitaryPrice()} Dh</p>
                    <p>
                        ${product.getDescription()}
                    </p>
                    <div class="single-product-form">
<%--                        <form action="">--%>
<%--                            <input type="number" placeholder="0">--%>
<%--                        </form>--%>
                        <a href="/client/addtocart/${product.getProductReference()}" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                        <p><strong>Categories: </strong>${product.getCategory()}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../components/footer.jsp" %>
