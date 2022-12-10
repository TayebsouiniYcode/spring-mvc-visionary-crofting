<%@ include file="../components/header.jsp" %>

<div class="breadcrumb-section breadcrumb-bg">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
                <div class="breadcrumb-text">
                    <p>Youcode Shop</p>
                    <h1>Cart</h1>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- cart -->
<div class="cart-section mt-150 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-12">
                <div class="cart-table-wrap">
                    <table class="cart-table">
                        <thead class="cart-table-head">
                        <tr class="table-head-row">
                            <th class="product-remove"></th>
                            <th class="product-image">Product Image</th>
                            <th class="product-name">Name</th>
                            <th class="product-price">Price</th>
                            <th class="product-quantity">Quantity</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="product">
                            <tr class="table-body-row">
                                <td class="product-remove"><a href="#"><i class="far fa-window-close"></i></a></td>
                                <td class="product-image"><img src="../../static/img/products/${product.getId()}.png" alt=""></td>
                                <td class="product-name">${product.getName()}</td>
                                <td class="product-price">${product.getUnitaryPrice()} Dh</td>
                                <td class="product-quantity"><input type="number" placeholder="0"></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="total-section">
                    <table class="total-table">
                        <thead class="total-table-head">
                        <tr class="table-total-row">
                            <th>Total</th>
                            <th>Price</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="total-data">
                            <td><strong>Subtotal: </strong></td>
                            <td id="subTotalCommand"></td>
                        </tr>
                        <tr class="total-data">
                            <td><strong>Shipping: </strong></td>
                            <td id="reduction"></td>
                        </tr>
                        <tr class="total-data">
                            <td><strong>Total: </strong></td>
                            <td id="totalCommand"></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="cart-buttons">
                        <a href="/cart" class="boxed-btn">Update Cart</a>
                        <a href="/checkout" class="boxed-btn black">Check Out</a>
                    </div>
                </div>

                <div class="coupon-section">
                    <h3>Apply Coupon</h3>
                    <div class="coupon-form-wrap">
                        <form action="index.html">
                            <p><input type="text" placeholder="Coupon"></p>
                            <p><input type="submit" value="Apply"></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end cart -->

<%@ include file="../components/footer.jsp" %>
