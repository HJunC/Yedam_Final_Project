<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- Title -->
                <section class="small-section bg-dark-alfa-50" data-background="images/full-width-images/section-bg-19.jpg">
                    <div class="container relative">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">STUDY</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                                    	스터디 찾기
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
         <!-- End Title -->
 <!-- Section -->
                <section class="page-section bg-dark light-content pt-0">
                    <div class="container relative">
                        
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                
                                <div class="table-responsive">
                                    <table class="table shopping-cart-table">
                                        <tr>
                                            <th>
                                                스터디번호
                                            </th>
                                            <th class="shopping-cart-table-title">
                                                지역
                                            </th>
                                            <th>
                                                언어
                                            </th>
                                            <th>
                                                스터디명
                                            </th>
                                            <th>
                                                스터디장
                                            </th>
                                            <th>
                                            	난이도
                                            </th>
                                            <th>
                                            	인원
                                            </th>
                                            <th>
                                            	학습기간
                                            </th>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="#"><img src="images/shop/previews/shop-prev-5.jpg" alt="" width="100" /></a>
                                            </td>
                                            <td class="shopping-cart-table-title">
                                                <a href="#" title="">Polo Shirt With Argyle Print</a>
                                            </td>
                                            <td>
                                                $25.99
                                            </td>
                                            <td>
                                                <form class="form">
                                                    <label for="quantity-1" class="sr-only">
                                                        Quantity
                                                    </label>
                                                    <input type="number" id="quantity-1" class="input-sm round" style="width: 60px;" min="1" max="100" value="1" />
                                                </form>
                                            </td>
                                            <td>
                                                $25.99
                                            </td>
                                            <td class="text-end text-nowrap">
                                                <a href="#" title="Remove item"><i class="fa fa-trash-alt"></i><span class="sr-only">Remove item</span></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="#"><img src="images/shop/previews/shop-prev-3.jpg" alt="" width="100" /></a>
                                            </td>
                                            <td class="shopping-cart-table-title">
                                                <a href="#" title="">Shirt With Mesh Sleeves</a>
                                            </td>
                                            <td>
                                                $30.00
                                            </td>
                                            <td>
                                                <form class="form">
                                                    <label for="quantity-2" class="sr-only">
                                                        Quantity
                                                    </label>
                                                    <input type="number" id="quantity-2" class="input-sm round" style="width: 60px;" min="1" max="100" value="1" />
                                                </form>
                                            </td>
                                            <td>
                                                $30.00
                                            </td>
                                            <td class="text-end text-nowrap">
                                                <a href="#" title="Remove item"><i class="fa fa-trash-alt"></i><span class="sr-only">Remove item</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                
                                <hr class="white" />
                                
                                <div class="row">
                                    <div class="col-md-4 text text-md-end order-first order-md-last mb-sm-10">
                                        <a href="" class="btn btn-mod btn-border-w btn-round btn-small">Update Cart</a>
                                    </div>
                                    <div class="col-md-8">
                                        <form action="#" class="form text-nowrap">
                                            <label for="coupon-code" class="sr-only">Coupon-code</label>
                                            <input type="text" name="coupon-code" id="coupon-code" class="input-sm round" placeholder="Coupon code" style="width: 200px;" pattern=".{3,100}" required />
                                            &nbsp;<button type="submit" class="btn btn-mod btn-round btn-border-w btn-small">Apply Coupon</button>
                                        </form>
                                    </div>                                    
                                </div>
                                
                                <hr class="mb-60" />
                                
                                <h2 class="h3">Calculate Shipping</h2>
                                
                                <div class="row">
                                    <div class="col-sm-6">
                                        
                                        <form action="#" class="form">
                                            
                                            <div class="mb-10">
                                                <label for="shipping-country">Country</label>
                                                <select id="shipping-country" class="input-md round form-control">
                                                    <option>Select Country</option>
                                                    <option>France</option>
                                                    <option>Ukraine</option>
                                                    <option>USA</option>
                                                </select>
                                            </div>
                                            
                                            <div class="mb-10">
                                                <label for="shipping-state">State</label>
                                                <input id="shipping-state" placeholder="State" class="input-md round form-control" type="text" pattern=".{3,100}" />
                                            </div>
                                            
                                            <div class="mb-10">
                                                <label for="shipping-postcode">Postcode / Zip</label>
                                                <input id="shipping-postcode" placeholder="Postcode / Zip" class="input-md round form-control" type="text" pattern=".{3,100}" />
                                            </div>
                                            
                                        </form>
                                        
                                    </div>
                                    <div class="col-sm-6 text-end">                                        
                                        
                                        <div>
                                            Cart subtotal: <strong>$45.95</strong>
                                        </div>
                                        
                                        <div class="mb-10">
                                            Shipping: <strong>$30.00</strong>
                                        </div>
                                        
                                        <div class="lead mt-0 mb-30">
                                            Order Total: <strong>$75.99</strong>
                                        </div>
                                        
                                        <div>
                                            <a href="" class="btn btn-mod btn-w btn-round btn-large">Proceed to Checkout</a>
                                        </div>
                                        
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        
                    </div>
                </section>
                <!-- End Section -->                
</body>
</html>