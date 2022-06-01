
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    <c:url var="logoutLink" value="MainController">
        <c:param name="action" value="Logout"></c:param>
    </c:url>
    <c:if test="${sessionScope.LOGIN_USER ne null}">
        <li><a href="${logoutLink}"><i class="fa fa-lock"></i> Đăng xuất</a></li>
    </c:if>
</body>
</html>
