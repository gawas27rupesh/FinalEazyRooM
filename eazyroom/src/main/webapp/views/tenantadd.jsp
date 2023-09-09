<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

<title>tenantcreateadds</title>
<style>
body {
	background-image: linear-gradient(rgba(1, 1, 1, .4), rgba(1, 1, 1, .4)),
		url('<c:url value="/resources/EazyRooM.jpg"/>');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	color: aliceblue;
	font-weight: bold;
}

h1 {
	font-family: 'Times New Roman', Times, serif;
	height: 60px;
	background-color: rgb(8, 35, 37);
	text-align: center;
	color: aliceblue;
	font-weight: bold;
}
</style>
</head>
<body>
	<h1>CREATE YOUR ADVERTISE</h1>
	<div class="col-md-8 offset-md-4">
		<form action="donetenant" method="post">
			<table cellspacing="15px" cellpadding="5px">
				<tr>
					<td><input type="hidden" id="utype" value="tenant"
						name="utype"></td>
				</tr>
				<tr>
					<td><input type="hidden" id="contno" name="contno"
						value="${contno}" required></td>
				</tr>
				<tr>
					<td><input type="hidden" id="pswd" name="pswd" value="${pswd}"
						required></td>
				</tr>
				<tr>
					<td><label for="name">ENTER NAME:</label></td>
					<td><input type="text" id="name" name="name"
						placeholder="Enter Capitals Only" required></td>
				</tr>
				<tr>
					<td><label for="rent">ENTER BUDGET:</label></td>
					<td><input type="number" id="rent" name="rent"
						placeholder="Enter Budget" required></td>
				</tr>
				<tr>
					<td><label for="state">ENTER STATE:</label></td>
					<td><select name="state" id="state" class="input"
						onclick="getState()" style="width: 100%; cursor: pointer;">
							<option value="1" disabled selected>Select</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="city">ENTER CITY:</label></td>
					<td><select name="city" id="city" class="input"
						onclick="getCity()" style="width: 100%; cursor: pointer;">
							<option value="1" disabled selected>Select</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="city">ENTER ADDRESS:</label></td>
					<td><input type="text" id="address" name="address"
						placeholder="Enter room required address" required></td>
				</tr>
				<tr>
					<td><label for="gender">GENDER:</label></td>
					<td><input type="radio" id="gender" name="gender" value="male">MALE
						<input type="radio" id="gender" name="gender" value="female">FEMALE
					</td>
				</tr>
			</table>

			<div class="col-md-7 offset-md-1 mt-5">
				<a href="tenant" class="btn btn-outline-danger">GO BACK</a>
				<button type="submit" class="btn btn-outline-success">UPLOAD
					POST</button>
			</div>
		</form>
	</div>
	<script>
	$(document).ready(
			function() {debugger;
				$.ajax({
					url : "allState",
					method : "GET",
					dataType : "json",
					success : function(data) {debugger;
					console.log(data);
						var dropdown = $("#state");
						$.each(data, function(index) {
							$("#state").append("<option value="+ data[index].sid+ ">"+ data[index].sname +"</option>");
						})
					},
					error : function(error) {
						console.error("Error fetching state data: "+ error);
					}
				});
			});
	
					$('#state').on('change', function () {debugger;
					$('#city').empty();
					let sid=$('#state').val();
				    $.ajax({
					url : "AllCityOfState/"+sid,
					method : "GET",
					dataType : "json",
					success : function(data) {debugger;
					console.log(data);
						var dropdown = $("#city");
						$.each(data.city, function(index) {
							$("#city").append("<option value="+ data.city[index].cname+ ">"+ data.city[index].cname +"</option>");
						});
					},
					error : function(error) {
						console.error("Error fetching state data: "+ error);
					}
				}); 
			}); 
	</script>
</body>
</html>