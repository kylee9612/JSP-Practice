<%@page import="java.sql.Date"%>
<%@page import="model.VoteDTO"%>
<%@page import="dao.VoteDAO"%>
<%@ include file="fix/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wrap">
	<section class="check">
		<%
		VoteDAO voteDao = VoteDAO.getInstance();
		ArrayList<VoteDTO> vList = voteDao.getVoteList();
		%>
		<h2>투표검수조회</h2>
		<table border="1">
			<th>성명</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유권자확인</th>
			<%
			for (int i = 0; i < vList.size(); i++) {
				String gender = "";
				int genCheck = Integer.parseInt(vList.get(i).getJumin().substring(6, 7));
				if (genCheck % 2 == 1)
					gender = "남";
				else
					gender = "여";

				String jumin = vList.get(i).getJumin();
				String birth = "19";
				if (genCheck > 2)
					birth = "20";
				int bYear = Integer.parseInt(birth)*100+Integer.parseInt(jumin.substring(0, 2));
				int bMonth = Integer.parseInt(jumin.substring(2, 4));
				int bDay = Integer.parseInt(jumin.substring(4, 6));
				birth = bYear + "년" + bMonth + "월" + bDay + "일";
				Date today = new Date(System.currentTimeMillis());
				int year = Integer.parseInt(today.toString().substring(0, 4));
				int month = Integer.parseInt(today.toString().substring(5, 7));
				int day = Integer.parseInt(today.toString().substring(8, 10));
				int age = year - bYear;
				if (month < bMonth)
					age--;
				else if (month == bMonth) {
					if (day < bDay)
				age--;
				}
			%>
			<tr>
				<td><%=vList.get(i).getName()%></td>
				<td><%=birth%></td>
				<td>만 <%=age%>세
				</td>
				<td><%=gender%></td>
				<td><%=vList.get(i).getNumber()%></td>
				<td><%=vList.get(i).getTime().substring(0, 2) + ":" + vList.get(i).getTime().substring(2, 4)%></td>
				<td><%=vList.get(i).getConfirm() == 'Y' ? "확인" : "미확인"%></td>
			</tr>
			<%
			}
			%>
		</table>
	</section>
</div>

<%@ include file="fix/footer.jsp"%>