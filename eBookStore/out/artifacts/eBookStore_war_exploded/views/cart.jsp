<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron">
                <div class="container">
                    <h1>Cart</h1>

                    <p>All the selected products in your shopping cart</p>
                </div>
            </div>
        </section>

        <section class="container" ng-app="cartApp">
            <div ng-controller = "cartCtrl" ng-init="initCartId('${cartId}', '${savedItemsId}')">
            <div>
                <a class="btn btn-danger pull-left" ng-click="clearCart()"><span
                        class="glyphicon glyphicon-remove-sign"></span>Clear Cart</a>
                <a href="<spring:url value="/order/${cartId}"/>"
                   class="btn btn-success pull-right"><span class="glyphicon-shopping-cart glyphicon"></span> Check out
                </a>
            </div>

            <table class="table table-hover">
                <tr>
                    <th>Product</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>
                <tr ng-repeat = "item in cart.cartItems">
                    <td>{{item.product.productName}}</td>
                    <td>{{item.product.productPrice}}</td>
                    <td>{{item.quantity}} <a href="#" ng-click="addToQuantity(item.product.productId)"><span class="glyphicon glyphicon-plus"></span></a>
                        <a href="#" ng-click="subtractFromQuantity(item.product.productId)"><span class="glyphicon glyphicon-minus"></span></a></td>
                    <td>{{item.totalPrice}}</td>
                    <td><a href="#" class="label label-danger" ng-click="removeFromCart(item.product.productId)">
                        <span class="glyphicon glyphicon-remove"></span>remove</a>
                        <a href="#" class="label label-primary" ng-click="saveItems(item.product.productId)">
                            <span class="glyphicon glyphicon-pushpin"></span>Save Item</a>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th>Grand Total</th>
                    <th>{{calGrandTotal()}}</th>
                    <th></th>
                </tr>
            </table>

            <a href="<spring:url value="/" />" class="btn btn-default">Continue Shopping</a>

                <h2>Saved Items</h2>

                <table class="table table-hover">
                    <tr>
                        <th>Product</th>
                        <th>Unit Price</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    <tr ng-repeat = "item2 in savedItems.cartItems">
                        <td>{{item2.product.productName}}</td>
                        <td>{{item2.product.productPrice}}</td>
                        <td>{{item2.quantity}}</td>
                        <td>{{item2.totalPrice}}</td>
                        <td><a href="#" class="label label-danger" ng-click="removeFromSave(item2.product.productId)">
                            <span class="glyphicon glyphicon-remove"></span>remove</a>
                            <a href="#" class="btn btn-warning btn-large" ng-click="addToCart('${product.productId}')">
                                <span class="glyphicon glyphicon-plus-sign"></span>Add to Cart</a>
                        </td>
                    </tr>
                </table>

            </div>
        </section>

    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.1/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js" /> "></script>
<%@include file="/WEB-INF/views/template/footer.jsp" %>