<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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
<title>seeallowner</title>
<style>
body {
	background-image: linear-gradient(rgba(1, 1, 1, .7), rgba(1, 1, 1, .7)),
		url('<c:url value="/resources/EazyRooM.jpg"/>');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
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

.uid {
	width: 40px;
}

.name {
	width: 220px;
}

.postdate {
	width: 200px;
}

table.dataTable tbody th, table.dataTable tbody td {
	padding: 6px 7px;
}

table.dataTable thead th, table.dataTable tfoot th {
	font-weight: bold;
	font-size: small;
}

#owner_wrapper {
	color: #00FFFF;
}

.new_hover::before {
	content: "NEW";
	background-color: #DA1884;
	color: #fff;
	font-size: 8px;
	font-family: 'FuturaPT-Book';
	border-radius: 10px;
	position: absolute;
	left: 1px;
	width: 35px;
	height: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
	animation: blink 1s linear infinite;
}
@keyframes blink {
			0%{
				opacity: 0;
			}
		}
		

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
	.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active
	{
	color: #FFFF00 !important;
}

h1 {
	color: green;
}
</style>
</head>
<body>
	<h1>SEE ALL POST Of.</h1>
	<div class="container">
		<div class="row">
			<a href="pdf" class="btn btn-outline-success">DOWNLOAD PDF</a> <a
				href="ownerexcel" class="btn btn-outline-success">DOWNLOAD EXCEL</a>
			<table id="owner" class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col" class="uid">O_No</th>
						<th scope="col">UTYPE</th>
						<th scope="col" class="name">NAME</th>
						<th scope="col">CONT NO</th>
						<th scope="col">RENT</th>
						<th scope="col">STATE</th>
						<th scope="col">CITY</th>
						<th scope="col">ADDRESS</th>
						<th scope="col">GENDER</th>
						<th scope="col" class="postdate">POST DATE</th>
						<th scope="col">INTEREST</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${eazy}" var="e">
						<tr class="text-white">
							<td><c:choose>
									<c:when test="${e.newTag == 'New'}">
										<div class="new_hover">${e.uid}</div>
									</c:when>
									<c:otherwise>
                                        ${e.uid}
                                    </c:otherwise>
								</c:choose></td>
							<td>${e.utype}</td>
							<th scope="row">${e.name}</th>
							<td>${e.contno}</td>
							<td class="font-weight-bold">&#x20B9;${e.rent}</td>
							<td>${e.state}</td>
							<td>${e.city}</td>
							<td>${e.address}</td>
							<td>${e.gender}</td>
							<td>${e.postdate}</td>
							<td>  <input type="checkbox" checked data-toggle="toggle" data-on="Yes" data-off="No" data-onstyle="success" data-offstyle="danger" data-size="small">
</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="container text-center">
				<a href="tenant" class="btn btn-outline-success">GO BACK</a>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script
		src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

	<script>
		new DataTable('#owner', {
			order : [ [ 9, 'desc' ] ]
		});
	</script>
</body>
</html>
