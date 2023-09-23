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
<link
	href="https://kendo.cdn.telerik.com/themes/6.2.0/default/default-main.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script src="https://kendo.cdn.telerik.com/2023.1.314/mjs/kendo.all.js"
	type="module"></script>
<link href="http://fonts.cdnfonts.com/css/futura-pt" rel="stylesheet">
<script
	src="https://kendo.cdn.telerik.com/2023.1.314/js/kendo.all.min.js"></script>

<title>pdf</title>
<style>
table.dataTable tbody th, table.dataTable tbody td {
	color: black;
}

.h1, h1 {
	font-size: 2.5rem;
	text-align: center;
}

#pdfContent {
	text-align: center;
}

.page[size='A4'] {
	width: 790px;
	height: 100px;
}
.table .thead-dark th {
    text-align: center;
    font-size: small;
}
td {
    color: black;
    font-size: small;
}


</style>
</head>
<body>
	<div class="btnWrap">
		<button id="downloadpdf" style="z-index: 999;" class="download-btn">
			Download
			<svg xmlns="http://www.w3.org/2000/svg" width="18.688"
				height="18.688" viewBox="0 0 18.688 18.688">
				<g id="Icon_feather-upload" data-name="Icon feather-upload"
					transform="translate(0.7 0.7)">
					<path id="Path_113" data-name="Path 113"
					d="M21.788,22.5v3.842a1.921,1.921,0,0,1-1.921,1.921H6.421A1.921,1.921,0,0,1,4.5,26.342V22.5"
					transform="translate(-4.5 -10.975)" fill="none" stroke="#00adee"
					stroke-linecap="round" stroke-linejoin="round" stroke-width="1.4" />
					<path id="Path_114" data-name="Path 114" d="M9.6,4.8,4.8,0,0,4.8"
					transform="translate(13.383 11.525) rotate(180)" fill="none"
					stroke="#00adee" stroke-linecap="round" stroke-linejoin="round"
					stroke-width="1.4" />
					<path id="Path_115" data-name="Path 115" d="M0,0V11.525"
					transform="translate(8.64 11.525) rotate(180)" fill="none"
					stroke="#00adee" stroke-linecap="round" stroke-linejoin="round"
					stroke-width="1.4" />
				</g>
			</svg>
		</button>
	</div>
	<div class="page" id="pdfContent">
		<div class="Second_page">
			<div class="head">
				<h1>SEE ALL POSTs OF ${utype}</h1>
			</div>
			<div class="container">
				<div class="row">
					<table id="owner" class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">NAME</th>
								<th scope="col">CONT NO</th>
								<th scope="col">RENT</th>
								<th scope="col">STATE</th>
								<th scope="col">CITY</th>
								<th scope="col">ADDRESS</th>
								<th scope="col">GENDER</th>
								<th scope="col">POST DATE</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${eazy }" var="e">
								<tr class="text-white">
									<th scope="row">${e.name }</th>
									<td>${e.contno }</td>
									<td class="font-weight-bold">Rs. ${e.rent }</td>
									<td>${e.state }</td>
									<td>${e.city }</td>
									<td>${e.address }</td>
									<td>${e.gender }</td>
									<td>${e.postdate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
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
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>
	<script>
		$('#downloadpdf').click(function() {
			var hfToggle = $("#headerFooterTemplateId").html();
			var empName = "Owner";
			kendo.drawing.drawDOM("#pdfContent", {
				forcePageBreak : ".newPage",
				paperSize : "A4",
				forcePageBreak : ".nextPage",
				multiPage : true,
				margin : {
					top : "0.5cm",
					bottom : "0.5cm",
					left : "0cm",
					right : "0cm"
				},
				scale : 0.7,
				template : hfToggle
			}).then(function(group) {
				kendo.drawing.pdf.saveAs(group, empName + ".pdf")
			});
		});
	</script>
</body>
</html>
