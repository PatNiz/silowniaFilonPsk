<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Zarejestruj się</title>
    <%@ include file="../segments/stylesheets.jspf" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/forms.css">
    <script src="timer.js"></script>
</head>
<body onload="odliczanie();">

<%@ include file="../segments/header.jspf" %>
<div id="menu">
    <div id="zegar"></div>
    <div style="clear:both;"></div>
    <div class="lokalizacja">
        <a href="https://www.google.com/maps/place/Ds+Filon/@50.877842,20.6450446,15z/data=!4m5!3m4!1s0x0:0x28d15ae78cc383ef!8m2!3d50.877842!4d20.6450446" target="_blank" class="tilelink"><i class="icon-location-circled"></i><br />lokalizacja</a>
    </div>
    <div class="administrator">
        <c:choose>
            <c:when test="${empty pageContext.request.userPrincipal}">
                <a href="${pageContext.request.contextPath}/login" class="tilelink">Zaloguj</a>
            </c:when>
            <c:when test="${not empty pageContext.request.userPrincipal}">
                <a href="${pageContext.request.contextPath}/logout" class="tilelink">Wyloguj</a>
            </c:when>
        </c:choose>
    </div>
    <div class="kontakt">
        <a href="kontakt.jsp" class="tilelink"><i class="icon-gmail"></i><br />Kontakt</a>
    </div>
</div>
        <div id="main">
        <form action="${pageContext.request.contextPath}/signup" method="post" class="user-form">
            <h2 class="user-form-title">Zarejestruj się</h2>
            <input name="username" placeholder="Nazwa użytkownika" required>
            <input name="email" placeholder="email" type="email" required>
            <input name="password" placeholder="Hasło" type="password" required>
            <button class="user-form-button">Zarejestruj się</button>
        </form>
        </div>
<%@ include file="../segments/footer.jspf" %>
</body>
</html>
