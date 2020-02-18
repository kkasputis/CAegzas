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
<title>Naujas Patiekalas</title>
</head>
<body>
<jsp:include page="top-menu.jsp"/>
<div style="width:90%; margin: auto;">

	<form:form method="POST" modelAttribute="newDish"
		enctype="multipart/form-data">
		<section>
			<!-- Visos klaidos surenkamos iš žemiau ir rodomos šioje vietoje -->
			<form:errors path="*" element="div" />
			<fieldset>
				<legend>Pridėti patiekalą:</legend>

				<div>
					<label>Pavadinimas</label>
					<form:input class="newdishinput" path="pavadinimas" type="text" required="true" />
					<form:errors path="pavadinimas" />
				</div>
								<div>
					<label>Aprašymas</label>
					<form:textarea class="newdishinput" path="aprasymas" rows="2" required="true"/>
				</div>
				<div class="file-upload">





  <div class="image-upload-wrap">
   
    <form:input class="file-upload-input" type='file' onchange="readURL(this);" accept="image/*" path="image" required="true" />
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











				<input class="menubutton" type="submit" value="Pridėti patiekalą" style="display:block; margin-left: auto; margin-right: auto;" />

			</fieldset>
		</section>
	</form:form>
	</div>
</body>
<style>
.newdishinput {
  width: 95%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

</style>
<script src="../uploadimage.js"></script>
<script class="jsbin" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
</html>