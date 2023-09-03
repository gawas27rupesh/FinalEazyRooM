<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>EazyRooM</title>
    <style type="text/css">
        body{
        background-image:linear-gradient(rgba(1,1,1,.6),rgba(1,1,1,.6)),url('<c:url value="/resources/ER.jpg"/>');
        background-repeat:no-repeat;
        background-attachment:fixed; 
        background-size:cover;
        color: aliceblue;
        }
        img{
            border-radius: 50%;
        }
        td{
            padding-left:120px;
            padding-right:120px;
        }
       </style>
</head>
<body>
<jsp:include page="header.jsp" />
    <div class="container">
            <div class="container mt-5">
                <table>
                    <tr>
                        <td class="container text-center">
                             <img alt="myimage"  src="<c:url value="/resources/img1.jpg"/>" height="300px" width="300px"><br><br>
                             <a href="tenant" class="btn btn-outline-success text-white"><b>TENANT</b></a>
                        </td>
                        <td class="container text-center">
                            <img  src="<c:url value="/resources/img2.PNG"/>" height="300px" width="300px"><br><br>
                            <a href="owner" class="btn btn-outline-success text-white"><b>OWNER</b></a>
                        </td>
                    </tr>
                </table>
             </div>
    </div>
</body>
</html>