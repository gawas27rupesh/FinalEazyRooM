<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script
	src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://unpkg.com/intro.js/minified/introjs.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<style>
.header .navbar {
	background-color: rgb(255, 255, 255) !important;
	box-shadow: rgb(58, 164, 250) 0px 3px 10px;
	background: url('<c:url value="/resources/h1.jpg"/>');
	background-size: 100% 100%;
}

.badge-wrap {
	position: relative;
	top: -22px;
	left: 9px;
	font-size: 8px;
	height: 13px;
	width: 15px;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 6px solid white;
	border-radius: 50%;
}

.badge {
	position: relative;
	top: 0px;
	font-size: 8px;
	height: 11px;
	width: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 50%;
	background-color: #00ADEE;
}

.bell img {
	width: 26px;
	font-size: 22px;
}

.logo {
	mix-blend-mode: multiply;
	filter: contrast(1);
	height: 70px;
}

.navbar a, .navbar ul li, .navbar span {
	color: #0e0e0e !important;
}

.heading {
	color: #090909;
	font-family: Georgia, 'Times New Roman', Times, serif;
	font-weight: bold;
}

.text-logout {
	display: none;
	position: absolute;
	color: #000;
	bottom: -20px;
	right: 8px;
	height: 2rem;
	width: 100px;
	text-align: center;
}

.logout img {
	mix-blend-mode: multiply;
	filter: contrast(1);
}



.bell {
	 position: relative;
	margin-right: 16px;
	margin-top: 16px;
}

.bell img {
	width: 20px;
	font-size: 22px;
}
.notification.bold {
            font-weight: bold;
        }
.bellCount{
	position: relative;
    top: -22px;
    left: 9px;
    font-size: 8px;
    height: 13px;
    width: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 6px solid white;
    border-radius: 50%;
}
.bellBadge{
	position: relative;
    top: 0px;
    font-size: 8px;
    height: 11px;
    width: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    background-color: #00ADEE!important;
    color:white;
}

.dropdown-content2 {
	display: none;
	position: absolute !important;
	left: -261px !important;
	top: 47px;
	min-width: 160px;
	overflow: auto;
	z-index: 1;
	border-radius: 5px;
	height: auto;
	max-height: 172px;
}

 .notification {
            display: none;
            background-color: rgb(255, 255, 255);
            color: #333;
            text-align: center;
            padding: 10px;
            position: absolute; /* Change to absolute positioning */
            top: 50px; /* Adjust the top position to place it below the bell icon */
            right: 10px;
            border: 1px solid rgb(0, 255, 255);
            border-radius: 4px;
            z-index: 1;
        }
        
        .notification.active {
            font-weight: bold;
        }

</style>
</head>

<body>
	<div class="header">
		<nav class="navbar navbar-expand-lg bg-body-tertiary">
			<div class="container-fluid">
				<div class="logo col-4">
					<img src="<c:url value="/resources/logoer.png"/>" alt="" width=""
						height="100px">
				</div>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<div class="heading col-6 text-center">
						<h1>EazyRooM</h1>
					</div>
					<div class="main">
						<c:forEach items="#" var="t">
							<div onclick="showNotification()" class="bell dropbtn">
								<img src="<c:url value="/resources/bell.png"/>" alt=""> <span
									class="bellCount"> <sup class="bellBadge rounded-circle">1</sup>
								</span>
							</div>
						</c:forEach>

						<div id="notification" class="notification" onmouseover="removeBold()">
							<c:forEach items="#" var="i">
								<a
									onclick="changeCount('NominationCount.do','empBatchId','#')">
									Rupesh Gawas Insterested on your post.</a>
							</c:forEach>
							<c:forEach items="#" var="i">
								<a
									onclick="changeCount('TrainingCount.do','empTrainingId','#')">#
									Interested</a>
							</c:forEach>
						</div>

					</div>
					<div class="logout col-6" style="text-align: right;">
						<img src="<c:url value="/resources/logoutlogo.png"/>" alt=""
							height="50"> <span id="logout">${username}</span>
						<p class="text-logout">
							<a href="logout" class="btn btn-outline-danger">Logout</a>
						</p>
					</div>
				</div>
			</div>
		</nav>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script>
		$("#logout").click(function() {
			$(".text-logout").toggle();
		});
	</script>

	<script>
		$(document).ready(function() {
			$(".dropdownHeader").click(function() {
				$(".dropdown-menu1").toggle();
			});
		});
		$(function() {
			$('body').on('mouseup', function() {
				$('.dropdown-menu1').hide();
			});
		});
		function myFunction() {

			var x = document.getElementById("myDropdown");
			x.classList.toggle("show");

		}
		$(function() {
			$('body').on('mouseup', function() {
				$(".dropdown-content2").removeClass("show");
			});
		});

		function changeCount(url, key, id) {
			var form = document.createElement("form");

			form.setAttribute("method", "POST");
			form.setAttribute("action", url);

			var input1 = document.createElement("input");
			input1.setAttribute("type", "text");
			input1.name = key;
			input1.value = id;

			form.appendChild(input1);
			document.body.appendChild(form);
			form.submit();

		}
	</script>

	<script>
		$(document).ready(function() {
			$('#open-popup').click(function() {
				$('#popup-modal').modal('show');
			});
		});
	</script>
<script>
function showNotification() {
    var notification = document.getElementById('notification');
     var isBold = notification.classList.contains('bold');
    
    if (isBold) {
         notification.classList.remove('bold');
    } else {
         notification.classList.add('bold');
    }
    
     notification.style.display = 'block';
}
function removeBold() {
    var notification = document.getElementById('notification');
    notification.classList.remove('bold');
}
</script>
</body>

</html>