<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
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
	src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

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

<title>seeallowner</title>
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
	color: rgb(215, 233, 250);
	text-align: center;
}
</style>
</head>
<body>
	<h1>SEE ALL OWNER ADDs</h1>

	<div class="col-md-8 offset-md-4">
		<form action="seeowner" method="get">
			<table cellspacing="15px" cellpadding="5px">
				<tr>
					<td><input type="hidden" id="utype" name="utype" value="owner"
						required></td>
				</tr>
				<tr>
					<td><label for="state">ENTER STATE:</label></td>
					<td><select name="state" id="state" class="input"
						style="width: 100%; cursor: pointer;">
							<option value="1" disabled selected>Select</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="city">ENTER CITY:</label></td>
					<td><select name="city" id="city" class="input"
						style="width: 100%; cursor: pointer;">
							<option value="1" disabled selected>Select</option>
					</select></td>
				</tr>
			</table>
			<div class="col-md-7 offset-md-1 mt-5">
				<a href="tenant" class="btn btn-outline-danger">GO BACK</a>
				<button type="submit" class="btn btn-outline-success">SEE
					ALL OWNER POST</button>
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
							$("#state").append('<option value="'+ data[index].sname+ '">'+ data[index].sname +'</option>');
						})
					},
					error : function(error) {
						console.error("Error fetching state data: "+ error);
					}
				});
			});
	
					$('#state').on('change', function () {debugger;
					$('#city').empty();
					let sname=$('#state').val();
				    $.ajax({
					url : "AllCityOfState/"+sname,
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