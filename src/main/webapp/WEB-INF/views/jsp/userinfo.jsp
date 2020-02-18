<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="./uploadimage.css">
<title>${userName} Informacija</title>
</head>
<body>
	<jsp:include page="top-menu.jsp" />
	<div style="text-align:center; font-size: 200%;"> ${userName} </div>
			<img src="../userimg/${userName}.jpg" class="usercommentimage" style="display: block; width: 40%; margin-left: auto; margin-right: auto;"/>
			<c:if test="${pageContext.request.userPrincipal.name == userName}">
			
			<div style="text-align: center; font-size: 200%;">Pakeisti profilio nuotrauką</div>
<form:form method="POST" modelAttribute="newUser" enctype="multipart/form-data">
<div class="file-upload">





  <div class="image-upload-wrap">
   
    <form:input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" path="userImage" required="true" />
    <div class="drag-text">
      <h3>Pasirinkite nuotrauką</h3>
    </div>
  </div>
  <div class="file-upload-content">
    <img class="file-upload-image" src="#" alt="Valtotojo nuotrauka" />
    <div class="image-title-wrap">
      <button type="button" onclick="removeUpload()" class="remove-image">Pašalinti <span class="image-title">Įkelti nuotrauką</span></button>
    </div>
    </div>
    
    
    
    
    
    
    </div>
						<input class="menubutton" type="submit" value="Pakeisti" style="display:block; margin-left: auto; margin-right: auto;" />
				<div style="display:block; text-align: center; margin-top: 15px; margin-bottom: 15px;">
				<a href="../changepassword" class="usermenubutton" >Keisti slaptažodį</a>
				</div>
		</form:form>
</c:if>
<div style="text-align:center; font-size: 200%;">Vartotojo komentarai:</div>
					<table class="commlist" id="commlist" border="1">
					<tr>
    <th width="160px">Pavadinimas</th>
    <th width="160px">Ivertinimas</th>
        <th width="160px">Laikas</th>        
              <th>Komentaras</th>
               <th width="160px">Žiūrėti patiekalą</th>
               	<c:if test="${(pageContext.request.userPrincipal.name == userName) || (pageContext.request.userPrincipal.name == 'admin') }">
                <th width="160px">Trinti komentarą</th>
                </c:if>
  </tr>
	<c:forEach items="${comments}" var="komentaras">


				<tr>
				<td>
				${komentaras.patiekalas.pavadinimas}
				</td>
				<td>
					<c:forEach var="i" begin="1" end="${komentaras.ivertinimas}">
							<span style="font-size: 200%; color: #FFD700;">&starf;</span>
						</c:forEach>
						<c:forEach var="i" begin="1" end="${5-komentaras.ivertinimas}">
							<span style="font-size: 200%; color: #ddd;">&starf;</span>
						</c:forEach>
					</td>


					<td>
						 [${komentaras.date}] 
						 </td>
						 <td>
						 ${komentaras.komentaras} 
						 </td>
						 <td>
					<a href="../patiekalas?id=${komentaras.patiekalas.id}" class="usermenubutton">Pažiūrėti patiekalą</a>
					</td>
		
						<c:if test="${(pageContext.request.userPrincipal.name == userName) || (pageContext.request.userPrincipal.name == 'admin') }">
									<td>
						<a href="../trintikomentara?id=${komentaras.komentaro_id}&username=${userName}" class="usermenubutton">Trinti komentarą</a>
						</td>
						</c:if>
						</tr>
		
			
		</c:forEach>
		</table>
		<div style="margin-bottom:40px;"></div>
</body>
<style>
table {
  border-collapse: collapse;
  width: 80%;
  margin: auto;
}
th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.usermenubutton {
 background-color: #E8E8E8; 
  border: none;
  color: black;
  padding: 5px;
  text-align: center;
  text-decoration: none;
  display: inline;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 10px;
  margin-bottom: 6px;
}
.usermenubutton:hover {
 background-color: #737373;
   color: #E8E8E8;
}
</style>
<script src="./uploadimage.js"></script>
<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</html>