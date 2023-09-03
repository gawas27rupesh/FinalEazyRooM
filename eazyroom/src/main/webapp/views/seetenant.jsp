<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>seeallowner</title>
    <style>
	body{
	background-image:linear-gradient(rgba(1,1,1,.9),rgba(1,1,1,.8)),url('<c:url value="/resources/hall.jpg"/>');
	background-repeat:no-repeat;
    background-attachment:fixed; 
	background-size:cover;
	}
	h1{
	font-family:"Times New Roman";
	}
</style>
</head>
<body>
	<div class="container mt-4 mr-3">
		
		<div class="row">
		
			<div class="col-md-8 offset-md-1 mt-3">
			
			<h1 class="text-center mb-3 text-white "><b>ALL TENANT POST IN YOUR CITY.</b></h1>
			<div>
			 <form action="seetenantgender" method="get">
				<table class="text-white">
					    
                         <tr>
                            <td><input type="hidden" name="city" value="${city}" required></td>
                        </tr>
                        <tr>
                            <td><input type="hidden" name="utype" value="tenant" required></td>
                        </tr>
					<tr>
		                <td><label for="gender">ENTER GENDER:</label></td>
		                <td> <input type="text" id="gender" name="gender">
		                	<button type="submit" class="btn btn-outline-success">SEE ALL TENANT POST</button>
		                </td>
		              </tr>
		              <tr>
		              	<td>
		              		   <a href="pdftenant/${city}"  class="btn btn-outline-primary">DOWNLOAD PDF</a>
		              	</td>
		              </tr>
              </table>
              </form>
			</div>
				<table class="table">
  <thead class="thead-dark">
    <tr>
    <th scope="col">UTYPE</th>
      <th scope="col">NAME</th>
      <th scope="col">CONT NO</th>
      <th scope="col">RENT</th>
      <th scope="col">CITY</th>
      <th scope="col">ADDRESS</th>
      <th scope="col">GENDER</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${eazy }" var="e">
    <tr class="text-white">
    	 <td>${e.utype }</td>
      <th scope="row">${e.name }</th>
      <td>${e.contno }</td>
      <td class="font-weight-bold">&#x20B9;${e.rent }</td>
       <td>${e.city }</td>
       <td>${e.address }</td>
        <td>${e.gender }</td>
    </tr>
   </c:forEach>
    
  </tbody>
</table>
	<div class="container text-center">
		<a href="seealltenant" class="btn btn-outline-danger">GO BACK</a>
	</div>	
	</div>
	</div>		
	</div>
</body>
</html>
