<%@ page import="beans.SanPham" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <title>Product Management</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
</head>

<body class="animsition">

<!-- Header Admin -->
<!-- Header -->
<jsp:include page="_header.jsp"/>
<!-- Product -->
<section class="bg0 p-t-23 p-b-140">
    <div class="container">
        <div class="p-b-10">
            <h3 class="ltext-103 cl5">
                Product Management
            </h3>
        </div>

        <div class="flex-w flex-sb-m p-b-52">
            <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter=".listProduct">
                    Quản lý sản phẩm
                </button>

                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".createProduct">
                    Thêm sản phẩm
                </button>
            </div>
        </div>
    </div>

    <div class="row isotope-grid m-lr-auto p-l-100">
        <div class=" isotope-item listProduct p-r-50 p-b-30">
            <!-- Block2 -->
            <div class="block2">
                <div class="m-lr-auto m-lr-0-xl wrap-table-product-management">
                    <table class="table-product-management">
                        <!--SanPham(maSP, tenSP, maLoaiSP, maTH, hinhSP, giaSP, ngayDangBan)-->
                        <tr class="table_head">
                            <th class="column-1">Sản phẩm</th>
                            <th class="column-2">Tên</th>
                            <th class="column-3">Loại</th>
                            <th class="column-4">Thương hiệu</th>
                            <th class="column-5">Giá (vnđ)</th>
                            <th class="column-6">Số lượng</th>
                            <th class="column-7">Sửa</th>
                            <th class="column-8">Xóa</th>
                        </tr>
                        <c:forEach items="${listSP}" var="o">
                            <tr class="table_row">
                                <td class="column-1">
                                    <div class="how-itemcart1">
                                        <img src="${o.hinhSP}" alt="IMG">
                                    </div>
                                </td>
                                <td class="column-2">${o.tenSP}</td>
                                <td class="column-3">${o.getTenLoaiSP(listLoaiSP)}</td>
                                <td class="column-4">${o.getTenThuongHieu(listTH)}</td>
                                <td class="column-5">
                                    <fmt:formatNumber maxFractionDigits="0" value="${o.giaSP}"/>
                                </td>
                                <td class="column-6">${o.soLuongSP}</td>
                                <td class="column-7">
                                    <a href="${pageContext.request.contextPath}/editProduct?maSP=${o.maSP}">
                                        <div class="flex-c-m stext-101 cl2 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
                                            Sửa
                                        </div>
                                    </a>
                                </td>
                                <td class="column-8">
                                    <a href="${pageContext.request.contextPath}/deleteProduct?maSP=${o.maSP}">
                                        <div class="flex-c-m stext-101 cl2 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
                                            Xóa
                                        </div>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        <div class=" isotope-item listProduct createProduct ">
            <!-- Block2 -->
            <div class="block2">
                <!-- Create new product -->
                <div class="m-lr-auto bor10 p-lr-40 p-t-30 p-b-40 m-r-40 m-lr-0-xl p-lr-15-sm">
                    <form action="productManagement" method="post">
                        <h4 class="mtext-109 cl2 p-b-30">
                            Create Product
                        </h4>
                        <div class="flex-w flex-t p-tb-34">
                            <div class="size-208">
								<span class="stext-110 cl2">
									Tên sản phẩm:
								</span>
                            </div>

                            <div class="size-101">
                                <div class="bor8 bg0 size-101">
                                    <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="text" name="tenSPnew"
                                           placeholder="Tên sản phẩm">
                                </div>
                            </div>
                        </div>

                        <div class="flex-w flex-t p-t-1 p-b-33">
                            <div class="size-208">
								<span class="stext-110">
									Loại sản phẩm:
								</span>
                            </div>

                            <select class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9 size-101" name="maLoaiSPnew">
                                <c:forEach items="${listLoaiSP}" var="lsp">
                                    <option value="${lsp.maLoaiSP}">${lsp.tenLoaiSP}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="flex-w flex-t p-t-1 p-b-33">
                            <div class="size-208">
								<span class="stext-110 cl2">
									Thương hiệu:
								</span>
                            </div>

                            <select class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9 size-101" name="maTHnew">
                                <c:forEach items="${listTH}" var="th">
                                    <option value="${th.maTH}">${th.tenTH}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="flex-w flex-t p-t-1 p-b-33">
                            <div class="size-208">
								<span class="stext-110 cl2">
									Hình sản phẩm (URL):
								</span>
                            </div>

                            <div class="size-101">
                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="text" name="hinhSPnew"
                                           placeholder="ex: image/nike/1.jpg">
                                </div>
                            </div>
                        </div>

                        <div class="flex-w flex-t p-t-1 p-b-33">
                            <div class="size-208">
								<span class="stext-110 cl2">
									Giá (vnđ):
								</span>
                            </div>

                            <div class="size-101">
                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="number" name="giaSPnew"
                                           placeholder="ex: 1000000">
                                </div>
                            </div>
                        </div>

                        <div class="flex-w flex-t p-t-1 p-b-33">
                            <div class="size-208">
								<span class="stext-110 cl2">
									Số lượng sản phẩm:
								</span>
                            </div>

                            <div class="size-101">
                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="number" name="soLuongSPnew"
                                           placeholder="ex: 10">
                                </div>
                            </div>
                        </div>

                        <div class="flex-w flex-t p-t-1 p-b-33">
                            <div class="size-208">
								<span class="stext-110 cl2">
									Ngày đăng bán:
								</span>
                            </div>

                            <div class="size-101">
                                <div class="bor8 bg0 m-b-12">
                                    <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="date"
                                           name="ngayDangBannew">
                                </div>
                            </div>
                        </div>

                        <button type="submit"
                                class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                            Create product
                        </button>
                    </form>
                </div>
            </div>
        </div>

    </div>
</section>

<!-- Footer -->
<footer class="bg3 p-t-75 p-b-32">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Categories
                </h4>

                <ul>
                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Women
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Men
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Shoes
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Watches
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Help
                </h4>

                <ul>
                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Track Order
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Returns
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            Shipping
                        </a>
                    </li>

                    <li class="p-b-10">
                        <a href="#" class="stext-107 cl7 hov-cl1 trans-04">
                            FAQs
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    GET IN TOUCH
                </h4>

                <p class="stext-107 cl7 size-201">
                    Any questions? Let us know in store at 8th floor, 379 Hudson St, New York, NY 10018 or call us
                    on (+1) 96 716 6879
                </p>

                <div class="p-t-27">
                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-facebook"></i>
                    </a>

                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-instagram"></i>
                    </a>

                    <a href="#" class="fs-18 cl7 hov-cl1 trans-04 m-r-16">
                        <i class="fa fa-pinterest-p"></i>
                    </a>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3 p-b-50">
                <h4 class="stext-301 cl0 p-b-30">
                    Newsletter
                </h4>

                <form>
                    <div class="wrap-input1 w-full p-b-4">
                        <input class="input1 bg-none plh1 stext-107 cl7" type="text" name="email"
                               placeholder="email@example.com">
                        <div class="focus-input1 trans-04"></div>
                    </div>

                    <div class="p-t-18">
                        <button class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
                            Subscribe
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="p-t-40">
            <div class="flex-c-m flex-w p-b-18">
                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-01.png" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-02.png" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-03.png" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-04.png" alt="ICON-PAY">
                </a>

                <a href="#" class="m-all-1">
                    <img src="images/icons/icon-pay-05.png" alt="ICON-PAY">
                </a>
            </div>

            <p class="stext-107 cl6 txt-center">
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;
                <script>document.write(new Date().getFullYear());</script>
                All rights reserved | Made with <i
                    class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
                                                                        target="_blank">Colorlib</a> &amp; distributed
                by <a href="https://themewagon.com"
                      target="_blank">ThemeWagon</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

            </p>
        </div>
    </div>
</footer>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>

<!-- Modal1 -->
<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
    <div class="overlay-modal1 js-hide-modal1"></div>

    <div class="container">
        <div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
            <button class="how-pos3 hov3 trans-04 js-hide-modal1">
                <img src="images/icons/icon-close.png" alt="CLOSE">
            </button>
            <!-- Edit product -->
            <div class="m-lr-auto bor10 p-lr-40 p-t-30 p-b-40 m-r-40 m-lr-0-xl p-lr-15-sm">
                <form action="editProduct">
                    <h4 class="mtext-109 cl2 p-b-30">
                        Edit Product
                    </h4>
                    <div class="flex-w flex-t p-tb-34">
                        <div class="size-208">
								<span class="stext-110 cl2">
									Tên sản phẩm:
								</span>
                        </div>

                        <div class="size-101">
                            <div class="bor8 bg0 size-101">
                                <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="text" name="tenSPnew"
                                       placeholder="Tên sản phẩm">
                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-t p-t-1 p-b-33">
                        <div class="size-208">
								<span class="stext-110">
									Loại sản phẩm:
								</span>
                        </div>

                        <select class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9 size-101" name="maLoaiSPnew">
                            <c:forEach items="${listLoaiSP}" var="lsp">
                                <option value="${lsp.maLoaiSP}">${lsp.tenLoaiSP}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="flex-w flex-t p-t-1 p-b-33">
                        <div class="size-208">
								<span class="stext-110 cl2">
									Thương hiệu:
								</span>
                        </div>

                        <select class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9 size-101" name="maTHnew">
                            <c:forEach items="${listTH}" var="th">
                                <option value="${th.maTH}">${th.tenTH}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="flex-w flex-t p-t-1 p-b-33">
                        <div class="size-208">
								<span class="stext-110 cl2">
									Hình sản phẩm (URL):
								</span>
                        </div>

                        <div class="size-101">
                            <div class="bor8 bg0 m-b-12">
                                <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="text" name="hinhSPnew"
                                       placeholder="ex: image/nike/1.jpg">
                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-t p-t-1 p-b-33">
                        <div class="size-208">
								<span class="stext-110 cl2">
									Giá (vnđ):
								</span>
                        </div>

                        <div class="size-101">
                            <div class="bor8 bg0 m-b-12">
                                <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="number" name="giaSPnew"
                                       placeholder="ex: 1000000">
                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-t p-t-1 p-b-33">
                        <div class="size-208">
								<span class="stext-110 cl2">
									Số lượng sản phẩm:
								</span>
                        </div>

                        <div class="size-101">
                            <div class="bor8 bg0 m-b-12">
                                <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="number" name="soLuongSPnew"
                                       placeholder="ex: 10">
                            </div>
                        </div>
                    </div>

                    <div class="flex-w flex-t p-t-1 p-b-33">
                        <div class="size-208">
								<span class="stext-110 cl2">
									Ngày đăng bán:
								</span>
                        </div>

                        <div class="size-101">
                            <div class="bor8 bg0 m-b-12">
                                <input class="stext-111 cl2 plh3 size-111 p-lr-15" type="date"
                                       name="ngayDangBannew">
                            </div>
                        </div>
                    </div>

                    <button type="submit"
                            class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                        Submit
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<script>
    $(".js-select2").each(function () {
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
    $('.js-pscroll').each(function () {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function () {
            ps.update();
        })
    });
</script>
<!--===============================================================================================-->
<script src="js/main.js"></script>
<!--===============================================================================================-->
<script src="vendor/isotope/isotope.pkgd.min.js"></script>
</body>

</html>