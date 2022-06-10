<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
    <title>Đăng ký</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="vendors/css/grid.css">
    <link rel="stylesheet" type="text/css" media="screen" href="css/sign_up.css"/>
    <link rel="stylesheet" href="resources/css/queries.css">
    <style>
        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }
    </style>
</head>
<body class="animsition">
<!--Header-->
<jsp:include page="_header.jsp"/>
<!--Sign up-->
<section>
    <form action="signUp" onsubmit="return checkPassword()" method="post">
        <input type="hidden" name="anticsrf" value="<c:out value='${csrfPreventionSalt}'/>"/>
        <h2>Đăng ký tài khoản</h2>
        <!-- -->
        <label>Họ và tên:</label>
        <input type="text" name="hoten">
        <br>
        <label>Số điện thoại:</label>
        <input type="number" name="sdt">
        <br>
        <label style="display:inline-block">Ngày sinh:</label>
        <input id="dateOfBirth" type="date" name="ngaySinh" value="">
        <br>
        <label>Địa chỉ:</label>
        <input type="text" name="diaChi">
        <br>
        <label>Tên đăng nhập:</label>
        <input type="text" placeholder="Username" name="username" required="" id="username"/>
        <br>
        <label>Mật khẩu:</label>
        <input type="password" placeholder="Password" name="password" required="" id="password"/>
        <br>
        <label>Nhập lại mật khẩu:</label>
        <input type="password" placeholder="Password" required="" id="cpassword"/>
        <span style="color: rgb(238, 17, 17);" id="message_error"></span>
        <span style="color: rgb(28,206,57);" id="message_success"></span>
        <br>
        <input id="submit" type="submit" name="submit" value="Đăng ký">
    </form>
</section>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
        <span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
</div>

<script src="vendor/jquery/moment.min.js"></script>
<script src="vendor/jquery/jquery-3.4.1.min.js"></script>
<!--===============================================================================================-->
<!--Funtion-->
<script type="text/javascript">
<%--    check password when type--%>
    document.getElementById("password").onkeyup = function () {
        var format = /[!@#$%^&*()_+\-=\[\]{}:\\|,.<>\/?]+/;
        var formatAlphabetCap = /[ABCDEFGHIJKLMNOPQRSTUVWXYZ]+/;
        var formatAlphabet = /[abcdefghijklmnopqrstuvwxyz]+/;
        var formatNumber = /[1234567890]+/;
        var pw = document.getElementById("password").value;
        //check empty password field
        if(pw == "") {
            document.getElementById("message_error").innerHTML = "**Không để trống !";
            document.getElementById("submit").disabled = true;
        }else {
            //minimum password length validation
            if(pw.length < 8) {
                document.getElementById("message_error").innerHTML = "**Mật khẩu tối thiểu 8 kí tự";
                document.getElementById("submit").disabled = true;
            }else if(format.test(pw) == false || formatAlphabetCap.test(pw) == false
                || formatNumber.test(pw) == false || formatAlphabet.test(pw) == false) {
                document.getElementById("message_error").innerHTML = "**Mật khẩu cần có ít nhất 1 chữ cái, 1 chữ số, 1 chữ in hoa và 1 kí tự đặc biệt";
                document.getElementById("submit").disabled = true;
            }else {
                document.getElementById("message_error").outerHTML = "";
                document.getElementById("message_success").innerHTML = "Mật khẩu an toàn"
                document.getElementById("submit").disabled = false;
            }
        }
    }

    function checkPassword() {
        var fpw = document.getElementById("password").value;
        var spw = document.getElementById("cpassword").value;

        if (fpw != spw) {
            document.getElementById('message_error').innerHTML = "<span >Mật khẩu chưa khớp</span>";
            return false;
        }
        return true;
    }
</script>
<!--===============================================================================================-->
<script>
    $("input").on("change", function () {
        this.setAttribute(
            "data-date",
            moment(this.value, "YYYY-MM-DD")
                .format(this.getAttribute("data-date-format"))
        )
    }).trigger("change")
</script>

<!--===============================================================================================-->
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

</body>

</html>