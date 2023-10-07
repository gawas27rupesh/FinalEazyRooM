<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>tenant</title>
<style type="text/css">
body {
	background-image: linear-gradient(rgba(1, 1, 1, .6), rgba(1, 1, 1, .6)),
		url('<c:url value="/resources/room1.jpg"/>');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	color: white;
	font-weight: bold;
}

img {
	border-radius: 50%;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container">
		<div class="container mt-5">
			<table>
				<tr>
					<td><a href="tenantadd"> <img
							src="<c:url value="/resources/add.jpg"/>" height="230px"
							width="230px">
					</a> <a href="tenantadd"
						class="btn btn-outline-primary center mt-4 ml-5">CREATE ADDs</a></td>
					
					<td class="container-mt-3"><a href="seeallowner"> <img
							src="<c:url value="/resources/people.jpg"/>" height="230px"
							width="230px">
					</a>  <button type="button"
                    class="btn btn-outline-primary center mt-4 ml-5"
                    data-toggle="modal" data-target="#seeOwner">SEE ALL OWNER</button></td>
					
					<td><a href="postdeletetenant"> <img
							src="<c:url value="/resources/delete.jpg"/>" height="230px"
							width="230px">
					</a> <a href="postdeletetenant"
						class="btn btn-outline-primary center mt-4 ml-5">SEE YOUR ADDs</a>
					</td>
				</tr>
			</table>
			<c:choose>
				<c:when test="${utype eq 'admin'}">
					<div class="container mt-5 text-center">
						<a href="home" class="btn btn-outline-danger">GO BACK</a>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
	<!-- Modal See Tenant-->
	<div class="modal fade" id="seeOwner" tabindex="-1"
		aria-labelledby="seeOwnerLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="seeOwnerLabel">SEE ALL TETANT</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="col-md-10 offset-md-2">
						<form action="seeowner" method="get">
							<table cellspacing="15px" cellpadding="5px">
								<tr>
									<td><input type="hidden" name="utype" value="owner"
										required></td>
								</tr>
								<tr>
									<td><label for="state">ENTER STATE:</label></td>
									<td><select name="state" id="ustate" class="input"
										style="width: 100%; cursor: pointer;">
											<option value="1" disabled selected>Select</option>
									</select></td>
								</tr>
								<tr>
									<td><label for="city">ENTER CITY:</label></td>
									<td><select name="city" id="ucity" class="input"
										style="width: 100%; cursor: pointer;">
											<option value="1" disabled selected>Select</option>
									</select></td>
								</tr>
							</table>
							<div class="col-md-10 offset-md-3 mt-4">
								<button type="submit" class="btn btn-outline-success">SEE
									ALL</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(
				function() {
					debugger;
					$.ajax({
						url : "allState",
						method : "GET",
						dataType : "json",
						success : function(data) {
							debugger;
							console.log(data);
							var dropdown = $("#ustate");
							$.each(data, function(index) {
								$("#ustate").append(
										'<option value="'+ data[index].sname+ '">'
												+ data[index].sname
												+ '</option>');
							})
						},
						error : function(error) {
							console
									.error("Error fetching state data: "
											+ error);
						}
					});
				});

		$('#ustate').on(
				'change',
				function() {
					debugger;
					$('#ucity').empty();
					let sname = $('#ustate').val();
					$.ajax({
						url : "AllCityOfState/" + sname,
						method : "GET",
						dataType : "json",
						success : function(data) {
							debugger;
							console.log(data);
							var dropdown = $("#ucity");
							$.each(data.city, function(index) {
								$("#ucity").append(
										"<option value="+ data.city[index].cname+ ">"
												+ data.city[index].cname
												+ "</option>");
							});
						},
						error : function(error) {
							console
									.error("Error fetching state data: "
											+ error);
						}
					});
				});
	</script>
</body>
</html>