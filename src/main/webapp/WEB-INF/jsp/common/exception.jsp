<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.opensymphony.xwork2.ActionContext" %>
<%@ page import="com.mpe.portal.web.utils.WebText" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%=WebText.WEB_TITLE%></title>
</head>
<body>
<p>
<%
    Exception e1 = (Exception) ActionContext.getContext().getValueStack().findValue("exception");
    e1.printStackTrace(response.getWriter());
%>
</p>
</body>
</html>
