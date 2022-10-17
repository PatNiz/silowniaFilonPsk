<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Siłownia filon</title>
    <meta name="description" content="zapisy na siłownie" />
    <meta name="keywords" content="www, silownia, trening" />
    <%@ include file="../segments/stylesheets.jspf" %>
    <link rel="stylesheet" href="styles/css/fontello.css" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Lato|Josefin+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    <script src="timer.js"></script>
</head>
<body onload="odliczanie();">

<%@ include file="../segments/header.jspf" %>

<div style="clear:both;"></div>
<div id="menu">
    <div id="zegar"></div>
    <div style="clear:both;"></div>
    <div class="lokalizacja">
        <a href="https://www.google.com/maps/place/Ds+Filon/@50.877842,20.6450446,15z/data=!4m5!3m4!1s0x0:0x28d15ae78cc383ef!8m2!3d50.877842!4d20.6450446" target="_blank" class="tilelink"><i class="icon-location-circled"></i><br />lokalizacja</a>
    </div>
    <div class="zarejestruj">
        <a href="${pageContext.request.contextPath}/signup" class="tilelink" ><i class="icon-user"></i><br />Zarejestruj się</a>
    </div>
    <div class="kontakt">
        <a href="kontakt.jsp" class="tilelink"><i class="icon-gmail"></i><br />Kontakt</a>
    </div>
    <div class="administrator">
        <c:choose>
            <c:when test="${empty pageContext.request.userPrincipal}">
                <a href="${pageContext.request.contextPath}/login" class="tilelink">Zaloguj się</a>
            </c:when>
            <c:when test="${not empty pageContext.request.userPrincipal}">
                <a href="${pageContext.request.contextPath}/logout" class="tilelink">Wyloguj się</a>
            </c:when>
        </c:choose>
    </div>


</div>
<div id="main">
    <div class="motto">
        <i>Aby zerwać z nawykiem, wyrób sobie inny, który go wymaże.</i><br />- Mark Twain
    </div>
    <section class="form">
        <h1>Księga gości</h1>
        <form method="post">
            <fieldset>
                <legend>Zostaw po sobie ślad</legend>
                <label>
                    Twoja nazwa
                    <input name="author" placeholder="Jan Kowalski">
                </label>
                <label for="content">Treść wiadomości</label>
                <textarea name="message" placeholder="Zacznij pisać..." id="content" rows="5"></textarea>
                <button>Wyślij</button>
            </fieldset>
        </form>
    </section>
    <c:if test="${not empty requestScope.entries}">
        <section class="entries">
            <h2>Wasze wpisy (${requestScope.entries.size()})</h2>
            <c:forEach var="entry" items="${requestScope.entries}">
                <div class="entry">
                    <h3><c:out value="Autor: ${entry.author}"/></h3>
                    <p><c:out value="${entry.message}"/></p>
                </div>
            </c:forEach>
        </section>
    </c:if>
</div>

<%@ include file="../segments/footer.jspf" %>
</body>
</html>