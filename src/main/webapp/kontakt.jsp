<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="pl">
<head>
	<meta charset="utf-8" />
	<title>Dodaj Wpis-Siłownia</title>
	
		<link rel="stylesheet" href="styles/style.css" type="text/css" />
	<link rel="stylesheet" href="styles/css/fontello.css" type="text/css" />
	<link href='http://fonts.googleapis.com/css?family=Lato|Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

	
	
</head>
<body>


<%@ include file="WEB-INF/segments/header.jspf" %>
<div id="menu">
	<div id="wyswietl" >
		<a href="${pageContext.request.contextPath}"class="tilelink" > Wróc do Strony głownej<i class="icon-table"></i></a>
	</div>
</div>

<div id="main">
	<a><i class="icon-gmail"></i></br>kierownik akademika: kierwnik@gmail.com</br>osoba odpowiedzialna za siłownie: osoba@gmail.com</br></br></a>
</div>

<%@ include file="WEB-INF/segments/footer.jspf" %>
</body>
</html>