<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%!int stars;%>
<%!int ivertinimas;%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${patiekalas.pavadinimas}</title>
</head>
<body>






	<jsp:include page="top-menu.jsp" />
	<div class="dish">
		<div class="dishpavadinimas">Pavadinimas:
			${patiekalas.pavadinimas}</div>
		<p class="dishimg">
			<img src="images/${patiekalas.id}.jpg" style="vertical-align: middle; float:left; margin-right: 10px;"
				width="50%" />Aprasymas: ${patiekalas.aprasymas}
	</p>


		<div class="patiekaloivertinimas">
		
			Įvertinimas:<span style="font-size: 200%; color: #FFD700;">&starf;</span>
			${ivertinimas}/ iš balsų: ${patiekalas.komentarai.size()}
			
		</div>

	</div>
	<div class="komentarusekcija">
		<div style="font-size: 200%; margin-left: 4px">Komentarai:</div>
					<table class="commlist" id="commlist" border="1">
					<tr>
    <th width="160px">Vartotojas</th>
    <th width="160px">Ivertinimas</th>
        <th width="160px">Laikas</th>        
              <th>Komentaras</th>
  </tr>
		<c:forEach items="${patiekalas.komentarai}" var="komentaras">

		
	
					<tr>
						<td><a href="user?id=${komentaras.userName}" style="color: black; text-decoration: none;"><img
							src="../userimg/${komentaras.userName}.jpg"
							class="usercommentimage" style="margin-right: 3px;"/>${komentaras.userName}:</a>
					</td>
					<td>	<c:forEach var="i" begin="1" end="${komentaras.ivertinimas}">
							<span style="font-size: 200%; color: #FFD700;">&starf;</span>
						</c:forEach>
						<c:forEach var="i" begin="1" end="${5-komentaras.ivertinimas}">
							<span style="font-size: 200%; color: #ddd;">&starf;</span>
						</c:forEach>
					</td>



						<td> [${komentaras.date}] </td> 
						<td> ${komentaras.komentaras} </td>
					</tr>
			
			
		</c:forEach>
		<form:form method="POST" modelAttribute="newComment">
	</table>
			<section>

				<fieldset>

					<legend>Rašyti komentarą:</legend>
						<div>Įvertinimas:</div>
					
	
							
	 <div class="rate">
    <form:radiobutton id="star5" name="rate" value="5" path="ivertinimas" required="true" />
    <label for="star5" title="Labai skanus!">5 žvaigždutės</label>
    <form:radiobutton id="star4" name="rate" value="4" path="ivertinimas" required="true" />
    <label for="star4" title="Skanus">4 žvaigždutės</label>
    <form:radiobutton id="star3" name="rate" value="3" path="ivertinimas" required="true" />
    <label for="star3" title="Vidutiniškas">3 žvaigždutės</label>
    <form:radiobutton id="star2" name="rate" value="2" path="ivertinimas" required="true" />
    <label for="star2" title="Neskanus">2 žvaigždutės</label>
    <form:radiobutton id="star1" name="rate" value="1" path="ivertinimas" required="true" />
    <label for="star1" title="Labai neskanus">1 žvaigždutė</label>
  </div>
					
					
					
					<div>
						<div class="komentarastitle">Komentaras</div>
						<form:input class="komentaroinput" path="komentaras" type="text"
							rows="2" placeholder="Komentaras.." required="true" />
						<form:errors path="komentaras" />
					</div>
					<div>

					
					</div>



				</fieldset>
				<div>
					<input type="submit" value="Pridėti komentarą"
						class="menubutton submitbtn" />
				</div>
			</section>
		</form:form>
	</div>
</body>





<style>
table {
  border-collapse: collapse;
  width: 100%;
}
th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}



.komentarastitle {
margin-top: 40px;
}
.rate {
position: absolute;

    float:left;
    margin-top: -3px;

}
.rate:not(:checked) > input {

    display: none;
}
.rate:not(:checked) > label {
    float:right;
    width:1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:30px;
    color:#ddd;
}
.rate:not(:checked) > label:before {
    content: '★ ';
}
.rate > input:checked ~ label {
    color: #FFD700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #FFD700;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #FFD700;
}

.usercommentimage {
	height: 50px;
	width: 50px;
	vertical-align: middle;
	border-radius: 50px;
	overflow: hidden;
	object-fit:cover;
}

.dish {
	margin: auto;
	border-style: inset;
	border-radius: 5px;
	padding-top: 15px;
	width: 90%;
	margin-top: 65px;
	overflow: auto;
}

.dishpavadinimas {
	font-size: 25px;
	text-align: left;
	margin-left: 50px;
}

.dishimg {
	text-align: left;
	white-space: break-spaces;
}

.patiekaloivertinimas {
	float: inline-start;

}

.komentarusekcija {
	margin: auto;
	border-style: inset;
	border-radius: 5px;
	padding-top: 15px;
	width: 90%;
	margin-top: 10px;
	overflow: auto;
	margin-bottom: 15px;
}
.komentaroinput {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;

}
.submitbtn {
	text-align: center;
	margin-left: 45%;
}
input[type=text] {
  width: 200px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
  background-color: white;
  background-position: 10px 10px; 
  background-repeat: no-repeat;
  padding: 12px 20px 12px 40px;
  -webkit-transition: width 0.4s ease-in-out;
  transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
  width: 100%;
  rows: 2;
}

</style>
</html>