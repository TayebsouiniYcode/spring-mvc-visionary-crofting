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
                            <th class="product-reference">Reference</th>
                            <th class="product-image">Product Image</th>
                            <th class="product-name">Name</th>
                            <th class="product-price">Price</th>
                            <th class="product-quantity">Quantity</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="product">
                            <tr class="table-body-row product-item">
                                <td class="product-reference">${product.getProductReference()}</td>
                                <td class="product-image"><img src="../../static/img/products/${product.getId()}.png" alt=""></td>
                                <td class="product-name">${product.getName()}</td>
                                <td class="product-price"> <span class="prices">${product.getUnitaryPrice()} </span> Dh</td>
                                <td class="product-quantity calculPrice"><span class="d-none">${product.getUnitaryPrice()}</span><input onclick="updateTotalPrice()" type="number" value=1></td>
                                <div class="d-none product-reference"> </div>
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
                            <td>
                                <span id="subTotal">0</span>
                                <span>Dh</span>
                            </td>
                        </tr>
                        <tr class="total-data">
                            <td><strong>Shipping: </strong></td>
                            <td>
                                <span id="shipping">0</span>
                                <span>Dh</span>
                            </td>
                        </tr>
                        <tr class="total-data">
                            <td><strong>Total: </strong></td>
                            <td>
                                <span id="total">0</span>
                                <span>Dh</span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="cart-buttons d-flex">
<%--                        <a href="/cart" class="boxed-btn">Update Cart</a>--%>

                        <form action="/passer_commande/${client.getId()}" name="passerCommande" method="post" modelAttribute="productListForm">
                            <input onclick="createForm()" type="submit" name="submit" value="Check Out" class="boxed-btn black">
                        </form>
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

<script>
    let subtotalPrice = 0.0;
    let shipping = 0.0;
    let totalPrice = 0.0;

    const pricesAndQuantity = document.querySelectorAll(".calculPrice");
    let subTotalElement = document.querySelector("#subTotal");
    let totalElement = document.querySelector("#total");

    pricesAndQuantity.forEach( elt => {
        subtotalPrice += parseFloat(elt.children[0].innerText) * parseInt(elt.children[1].value)
    });

    subTotalElement.innerText = subtotalPrice;
    totalElement.innerText = subtotalPrice + shipping;

    let form = document.forms["passerCommande"];
    let productReferenceAndQuantityList = new Array();

    function updateTotalPrice(event) {
        subtotalPrice = 0.0;
        pricesAndQuantity.forEach( elt => {
            subtotalPrice += parseFloat(elt.children[0].innerText) * parseInt(elt.children[1].value)
        });
        subTotalElement.innerText = subtotalPrice;
        totalElement.innerText = subtotalPrice + shipping;
    }



    let productItems = document.querySelectorAll(".product-item");

    function createForm(event) {
        let productListForm = "";
        productItems.forEach(product => {
            console.log(product.children[0].innerText + "," + product.children[4].children[1].value);
            productListForm += product.children[0].innerText + "," + product.children[4].children[1].value + "/";
        });
        let field = document.createElement("input");
        field.setAttribute("type", "hidden");
        field.setAttribute("name", "productListForm");
        field.setAttribute("value", productListForm);
        form.appendChild(field);
    }


    // Create an input element for Full Name

</script>

<%@ include file="../components/footer.jsp" %>
