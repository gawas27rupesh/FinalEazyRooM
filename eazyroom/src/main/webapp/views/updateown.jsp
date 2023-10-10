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
<title>consumercreateadds</title>
<style>
body {
	background-image: linear-gradient(rgba(1, 1, 1, .7), rgba(1, 1, 1, .7)),
		url('<c:url value="/resources/EazyRooM.jpg"/>');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	font-weight: bold;
}
</style>
</head>
<body>
	 <div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">UPDATE YOUR
						ADVERTISE</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath }/updateowner"
						method="post">
						<table cellspacing="15px" cellpadding="5px">
							<tr>
								<td><input type="hidden" id="utype" value="owner"
									name="utype"></td>
							</tr>
							<tr>
								<td><input type="hidden" id="id" value="${eazy.eid }"
									name="id"></td>
							</tr>
							<tr>
								<td><label for="name">ENTER NAME:</label></td>
								<td><input type="text" id="name" name="name"
									placeholder="Enter Capitals Only" value="${eazy.name}" required></td>
							</tr>
							<tr>
								<td><input type="hidden" id="contno" name="contno"
									value="${eazy.contno}" placeholder="Enter Number Only" required></td>
							</tr>
							<tr>
								<td><label for="rent">ENTER RENT:</label></td>
								<td><input type="number" id="rent" name="rent"
									value="${eazy.rent}" placeholder="Enter Rent" required></td>
							</tr>
							<tr>
								<td><input type="hidden" id="pswd" name="pswd"
									value="${eazy.pswd}" placeholder="Enter password" required></td>
							</tr>
							<tr>
								<td><label for="state">ENTER STATE:</label></td>
								<td><input type="text" id="state" name="state"
									value="${eazy.state}" placeholder="Enter room required state"
									required></td>
							</tr>
							<tr>
								<td><label for="city">ENTER CITY:</label></td>
								<td><input type="text" id="city" name="city"
									value="${eazy.city}" placeholder="Enter room required city"
									required></td>
							</tr>
							<tr>
								<td><label for="city">ENTER ADDRESS:</label></td>
								<td><input type="text" id="address" name="address"
									value="${eazy.address}"
									placeholder="Enter room required address" required></td>
							</tr>
							<tr>
								<td><label for="gender">GENDER:</label></td>
								<td><input type="radio" id="gender" name="gender"
									value="male" required>MALE <input type="radio"
									id="gender" name="gender" value="female" required>FEMALE</td>
							</tr>
						</table>
						<div class="col-md-7 offset-md-1 mt-5">
							<a href="${pageContext.request.contextPath }/postdeleteown"
								class="btn btn-outline-danger">GO BACK</a>
							<button type="submit" class="btn btn-outline-success">UPLOAD
								POST</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
$(document).ready(function() {
    $('#exampleModal').modal('show'); // Show the modal when the page is loaded
});
</script>
</body>
</html>