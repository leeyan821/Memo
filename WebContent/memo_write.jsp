<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import = "twoline.OnelineDTO" %>
<%@ page import = "twoline.OnelineDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String memo = request.getParameter("memo");
	OnelineDTO dto = new OnelineDTO();
	OnelineDAO dao = new OnelineDAO();
	dto.setMemo(memo);
	dao.insert(dto);
	response.sendRedirect("memo_list.jsp");
%>
</html>