<%@page import="model.CandidateDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ include file ="fix/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
<link rel ="stylesheet" href="/webstudy/css/rank.css">
</head>
<div class = "wrap">
<section class = "rank">
<h2>후보자 등수</h2>
<table border="1">
<th>후보번호</th>
<th>성명</th>
<th>총투표건수</th>
<%
	for(int i = 0 ; i < list.size(); i++){
		%>
		<tr>
			<td><%=list.get(i).getNumber()%></td>
			<td><%=list.get(i).getName()%></td>
			<td><%=list.get(i).getVote()%></td>
		</tr>
		<%
	}
%>

</table>
</section>
</div>

<%@ include file ="fix/footer.jsp"%>