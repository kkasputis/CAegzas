<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="../uploadimage.css">
<title>Pakeisti ${patiekalas.pavadinimas}</title>
</head>
<body>


<jsp:include page="top-menu.jsp"/>
<div style="width:90%; margin: auto;">
<form:form method="POST" modelAttribute="patiekalas"
		enctype="multipart/form-data">
		<section>
			<!-- Visos klaidos surenkamos iš žemiau ir rodomos šioje vietoje -->
			<form:errors path="*" element="div" />
			<fieldset>
				<legend>Redaguoti patiekalą:</legend>

				<div>
					<label>Pavadinimas</label>
					<form:input class="newdishinput" path="pavadinimas" type="text" required="true" value="${patiekalas.pavadinimas}" />
					<form:errors path="pavadinimas" />
				</div>
								<div>
					<label>Aprašymas</label>
					<form:textarea class="newdishinput" path="aprasymas" rows="2" required="true" value="${patiekalas.aprasymas}" />
				</div>
				<div>
				<img src="../images/${patiekalas.id}.jpg" style="display:block; margin-left: auto; margin-right: auto; width:50%" />
					

				<div class="file-upload">
				<div class="image-upload-wrap">
    <form:input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" path="image" />
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

				</div>
				
				<input class="menubutton" type="submit" value="Pakeisti patiekalą" style="display:block; margin-left: auto; margin-right: auto;"/>

			</fieldset>
		</section>
	</form:form>
	</div>
	<div style="text-align:left; margin-left:5%; margin-top:10px;">Komentarai:</div>
	<table class="commlist" id="commlist" border="1">
					<tr>
    <th width="160px">Vartotojas</th>
    <th width="160px">Ivertinimas</th>
        <th width="160px">Laikas</th>        
              <th>Komentaras</th>
               <th width="160px">Trinti komentarą</th>
               </tr>
		<c:forEach items="${patiekalas.komentarai}" var="komentaras">
		
			
			
					<tr>
					<td><a href="user?id=${komentaras.userName}" style="color: black; text-decoration: none;"><img
							src="../userimg/${komentaras.userName}.jpg"
							class="usercommentimage" style="margin-right: 3px;"/>${komentaras.userName}:</a>
					</td>
					<td>
					<c:forEach var = "i" begin = "1" end = "${komentaras.ivertinimas}">
      <span style="font-size:200%;color:#FFD700;">&starf;</span>
      </c:forEach>
      					<c:forEach var = "i" begin = "1" end = "${5-komentaras.ivertinimas}">
          <span style="font-size:200%;color:#ddd;">&starf;</span>
      </c:forEach>
					</td>
					

					<td>
						[${komentaras.date}] </td>
					<td>	${komentaras.komentaras} </td>
						<td>
						<a class="usermenubutton" href="../admin/deltecomment?id=${komentaras.komentaro_id}&patid=${patiekalas.id}">Trinti komentarą</a>
						</td>
					</tr>
			
		
		</c:forEach>
			</table>
				<div style="margin-bottom:40px;"></div>
</body>
<style>
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
.usercommentimage {
	height: 50px;
	width: 50px;
	vertical-align: middle;
	border-radius: 50px;
	overflow: hidden;
	object-fit:cover;
}

.newdishinput {
  width: 95%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
.usermenubutton:hover {
 background-color: #737373;
   color: #E8E8E8;
}
table {
  border-collapse: collapse;
  width: 90%;
  margin: auto;
}
th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
</style>
<script src="../uploadimage.js"></script>
<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</html>