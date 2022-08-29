<%@ include file="fix/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wrap">
	<section class="view">
		<h2>후보조회</h2>
		<table border="1">
			<th>후보번호</th>
			<th>성명</th>
			<th>소속정당</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>지역구</th>
			<th>대표전화</th>
			<%
			for (int i = 0; i < list.size(); i++) {
				char scholar = list.get(i).getSchool();
				String school = "";
				if (scholar == '1')
					school = "고졸";
				else if (scholar == '2')
					school = "학사";
				else if (scholar == '3')
					school = "석사";
				else
					school = "박사";
			%>
			<tr>
				<td><%=list.get(i).getNumber()%></td>
				<td><%=list.get(i).getName()%></td>
				<td><%=list.get(i).getParty()%></td>
				<td><%=school%></td>
				<td><%=list.get(i).getJumin()%></td>
				<td><%=list.get(i).getCity()%></td>
				<td><%=list.get(i).getMobile()%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</div>

<%@ include file="fix/footer.jsp"%>