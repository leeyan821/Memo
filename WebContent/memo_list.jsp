<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "twoline.OnelineDTO" %>
<%@ page import = "twoline.OnelineDAO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>웹 서비스 실습</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Orelega+One&display=swap');
	* {
		font-family: 'Orelega One', cursive;
		font-size: 17px;
	}
	body {
		background-image: url("images/배경.png");
		background-size:cover;
	}
	h2 {
		text-align:center;
		font-size:40px;
		font-weight: bold;
		font-family: 'Orelega One', cursive;
		letter-spacing: 0.2em;
		height: 50px;
		color:#334668;
	}
	#container {
		border: 8px solid #4c5e71;	
		border-radius:30px;	
		margin:auto;
		padding-bottom: 30px;
		width:600px;
		height:auto;
		background: #f9f9f9;
	}
	input[type="text"] {
		width:250px;
		height: 30px;
	}
	form {
		padding:10px 20px;
	}
	.plus {
		text-align:center;
		height: 50px;
	}
	.write {
		margin:5px;
		width:300px;
		height:30px;
		line-height:30px;
	}
	.upload {
		width:90px;
		height:36px;
		line-height:36px;
		border:1px solid #4b709d;
		border-radius:5px;
		vertical-align:middle;
		font-size:15px;
		color:white;
		background-color:#4b709d;
	}
	.local {
		margin:5px 100px;
		padding-left: 5px;
	}
	.local p{
		margin:10px 5px;
		padding-right:40px;
		width: 290px;
	}
	.delete {
		float:right;
		background-color:#4b709d;
		color:white;
		border:1px solid #4b709d;
		border-radius:5px;
		font-size:15px;
	}	
</style>
</head>
<%
	OnelineDAO dao = new OnelineDAO();
	ArrayList<OnelineDTO> dtos = dao.getList();
%>
<body style="background-color: white;">
<div id="container">
	<h2>MEMO</h2>
		<form method="post" action="memo_write.jsp">
	<div class="plus">
		<input class="write" type="text" name="memo" placeholder="write"></input>	
		<input class="upload" type="submit" value="submit"></input>
	</div>
	<div class="local">
<%
	for(int i=0;i<dtos.size();i++) {
		OnelineDTO dto = dtos.get(i);
		out.println("<p>("+dto.getWdate()+") "+dto.getMemo() + 
		"<input type=\"button\" value=\"X\" class=\"delete\" onClick=\"location.href='memo_delete.jsp?no="+dto.getNo()+"'\"><br>");
		out.println("</input></p>");
	}	
%>	
	</div>
	</form>
</div>
</body>
</html>