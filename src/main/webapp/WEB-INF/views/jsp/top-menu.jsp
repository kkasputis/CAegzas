<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<div class="webtitle">
Restorano meniu
</div>
<c:if test="${pageContext.request.userPrincipal.name == null}">
<div class="topmenu2">
</c:if>
<c:if test="${pageContext.request.userPrincipal.name != null}">
<div class="topmenu">
</c:if>

<a href="../" class="menubutton">Pradzia</a>
<c:if test="${pageContext.request.userPrincipal.name == null}">
<a href="../login" class="menubutton">Prisijungti</a>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name != null}">
<c:if test="${pageContext.request.userPrincipal.name == 'admin'}">

<a href="../admin" class="menubutton">Administratoriaus meniu</a>

</c:if>
<a href="../user?id=${pageContext.request.userPrincipal.name}" class="menubutton"><img src="../userimg/${pageContext.request.userPrincipal.name}.jpg" class="userimage" align="middle">${pageContext.request.userPrincipal.name} profilis</a>
    <a href="../logout" class="menubutton">Atsijungi</a>
</c:if>
</div>
 <style>
 .userimage {

    height: 45px;
    width: 45px;
	margin-right: 3px;
	margin-bottom: 6px;
    border-radius: 50px;
    overflow:hidden;
    object-fit:cover;

}
.menubutton {
 background-color: #E8E8E8; 
  border: none;
  color: black;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 10px;
  margin-bottom: 6px;
}
.menubutton:hover {
 background-color: #737373;
   color: #E8E8E8;
}
.webtitle {
margin-bottom: 5px;
margin-top: 10px;
text-align: center;
font-size: 40px;

}
.topmenu {
border-style: inset;
border-radius: 5px;
  padding-top: 15px;
  padding-bottom: 5px;
}
.topmenu2 {
border-style: inset;
border-radius: 5px;
  padding-top: 20px;
  padding-bottom: 20px;
}
 </style> 

