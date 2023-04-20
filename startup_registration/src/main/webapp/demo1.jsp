<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="cd" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
</head>
<body>
First Name:<c:out value="${param.firstName}"></c:out><br/> 
Last Name:<c:out value="${param.lastName}"></c:out> <br>
First Name:<cd:out value="${param.firstName}"></cd:out><br/> 
Last Name:<cd:out value="${param.lastName}"></cd:out> 
</body>
</html>