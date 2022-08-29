<%@page import="model.CandidateDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CandidateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구 의원 투표 프로그램</title>
<link rel = "stylesheet" href="/webstudy/css/header.css">
</head>
<body>
<%CandidateDAO canDAO = CandidateDAO.getInstance();
	ArrayList<CandidateDTO> list = canDAO.getCandidateList();
	for(int i = 0;  i<list.size(); i++){
		int max = list.get(i).getVote();
		int idx = i;
		for(int j = i+1; j < list.size(); j++){
			if(list.get(j).getVote() > max){
				max = list.get(j).getVote();
				idx = j;
			}
		}
		CandidateDTO can = list.get(i);
		list.set(i, list.get(idx));
		list.set(idx,can);
	}
	%>
<header class = "header">
	<span>지역구 의원 투표 프로그램 ver 1.0</span>
</header>
<nav class = "nav_bar">
	<p onclick = "location.href='/webstudy/view.jsp'">후보조회</p>
	<p onclick = "location.href='/webstudy/vote.jsp'">투표하기</p>
	<p onclick = "location.href='/webstudy/check.jsp'">투표검수조회</p>
	<p onclick = "location.href='/webstudy/rank.jsp'">후보자등수</p>
	<p onclick = "location.href='/webstudy/index.jsp'">홈으로</p>
</nav>