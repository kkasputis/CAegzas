<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pakeisti slaptažodį</title>
</head>
<body>
<jsp:include page="top-menu.jsp"/>

<div style="margin: auto; text-align:center; width:80%;">
<div style="color:red;">${message}</div>
<form:form method="POST" modelAttribute="changePass">
			<section>
		<!-- Visos klaidos surenkamos iš žemiau ir rodomos šioje vietoje -->
<form:errors path="*" element="div"/>
			<fieldset>
			
				<legend>Slaptažodžio keitimas</legend>



				<div>
					<label>Senas slaptažodis</label>
					<form:input path="oldPassword" class="komentaroinput" type="password" required="true" placeholder="Senas slaptažodis.."/>
					<form:errors path="username" />
				</div>

				<div>
					<label>Naujas slaptažodis</label>
					<form:input  name="password" class="komentaroinput" id="password" path="password" type="password" required="true" placeholder="Slaptažodis.."/>
					<form:errors path="password" />
				</div>
							<div>
					<label>Pakartoti slaptažodi</label>
					<input  name="password_confirm" class="komentaroinput" id="password_confirm" type="password" required placeholder="Pakartoti slaptažodį.." oninput="check(this)"/>
				
				</div>

	


						<input class="menubutton" type="submit" value="Keisti" />
				
			</fieldset>
	</section>
		</form:form>
		</div>
</body>
<script type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('password').value) {
            input.setCustomValidity('Nesutampa slaptažodis.');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }
</script>
<style>
.komentaroinput {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;

}
</style>
</html>