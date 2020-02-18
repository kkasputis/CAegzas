<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administratoriaus meniu</title>
</head>
<body>
<jsp:include page="top-menu.jsp"/>
<a href="../admin/add" class="mygtukas virsus">Naujas patiekalas</a>
<div class="pattitle">Visi Patiekalai</div>
 <c:forEach items="${index}" var="patiekalas">
  <div class="patiekalas">
<div class="dishname">Pavadinimas: ${patiekalas.pavadinimas}
</div>
<div>
<img src="../images/${patiekalas.id}.jpg" class="dishimage" />
</div>
<div>

<a href="../admin/trinti?id=${patiekalas.id}" class="mygtukas desine">Trinti patiekalą</a>
<a href="../admin/edit?id=${patiekalas.id}" class="mygtukas kaire">Redaguoti patiekalą</a>
</div>
</div>
</c:forEach>

</body>
<style>
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
  padding-bottom: 70px;
  width: 90%;
  margin-top: 65px;
    overflow: auto;
}
.dishimage {
  display: block;
  margin-left: auto;
  margin-right: auto;
width: 80%;

}
.dishname {
font-size: 30px;
  color: black;
  text-align: left;
  margin-left: 16%;
  border-radius: 10px;

}
.mygtukas {
 background-color: #E8E8E8; /* Green */
  border: none;
  color: black;
  padding: 20px;

  text-decoration: none;
  display: inline;
  font-size: 16px;
  margin: 4px 2px;

 
  cursor: pointer;
  border-radius: 10px;

}
.desine {
 position: absolute;
  right: 16%;

}
.kaire {
 position: absolute;
  left: 16%;

}
.virsus {
 position: absolute;
 right: 10%;

}
.mygtukas:hover {
 background-color: #737373;
   color: #E8E8E8;
}
.pattitle {
 position: absolute;
margin: 30px;
font-size: 20px;
}
</style>
</html>