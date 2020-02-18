<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restorano meniu</title>
</head>
<body>
<jsp:include page="top-menu.jsp"/>
<div class="pattitle">Patiekalų sąrašas:</div>

 <c:forEach items="${index}" var="patiekalas">
 <div class="patiekalas">
<div class="dishname">${patiekalas.pavadinimas}
</div>
<div>
<img src="./images/${patiekalas.id}.jpg" class="dishimage" />
</div>
<div>
<a href="patiekalas?id=${patiekalas.id}" class="mygtukas">Plačiau</a>

</div>
</div>
</c:forEach>

</body>
<style>
.pattitle {
margin-bottom: 5px;
margin-top: 10px;
margin-left: 10%;
text-align: left;
font-size: 30px;
}
.patiekalas {
margin: auto;
border-style: inset;
border-radius: 5px;
  padding-top: 15px;
  padding-bottom: 25px;
  width: 70%;
}
.dishimage {
  display: block;
  margin-left: auto;
  margin-right: auto;
width: 80%;
margin-bottom: 15px;

}
.dishname {
font-size: 30px;
  color: black;
  text-align: left;
  margin-left: 12%;
  border-radius: 10px;

}
.mygtukas {
 background-color: #E8E8E8; /* Green */
  border: none;
  color: black;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: flex;
  font-size: 16px;
  margin: 4px 2px;
  margin-left: 12%;
 justify-content:space-around;
 width: 100px;
  cursor: pointer;
  border-radius: 10px;

}
.mygtukas:hover {
 background-color: #737373;
   color: #E8E8E8;
}
</style>
</html>