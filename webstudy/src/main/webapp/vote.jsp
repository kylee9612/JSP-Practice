<%@page import="dao.VoteDAO"%>
<%@ include file="fix/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wrap">
	<section class="vote">
		<h2>투표하기</h2>
		<table border = "1">
		<thead>
			<th>주민번호</th>
			<th>성명</th>
			<th>투표번호</th>
			<th>투표시간</th>
			<th>투표장소</th>
			<th>유권자확인</th>
		</thead>
			<tr>
			<td><input type = "text" name="jumin" id = "jumin"></td>
			<td><input type ="text" name="name" id = "name"></td>
			<td><select name="number" id = "number">
			<option value ="1">1</option>
			<option value ="2">2</option>
			<option value ="3">3</option>
			<option value ="4">4</option>
			<option value ="5">5</option>
			</select></td>
			<td><input type ="text" name="time" id = "time"></td>
			<td><input type ="text" name="area" id ="area"></td>
			<td>
			<input type ="radio" name="confirm" value ="Y" checked="checked" >확인
			<input type ="radio" name="confirm" value="N" >미확인
			</td>
			</tr>
		</table>
		<div class = "buttons">
			<button id ="submit" onclick="submitVal()">투표하기</button>
			<button id="reset" onclick="reset()">다시하기</button>
		</div>
	</section>
</div>
<script>
let jumin = document.getElementById("jumin");
let name = document.getElementById("name");
let number = document.getElementById("number");
let time = document.getElementById("time");
let area = document.getElementById("area");
let confirm = document.getElementsByName("confirm");

function reset(){
	jumin.value = "";
	name.value = "";
	number.value = "1";
	time.value="";
	area.value="";
}

function submitVal(){
	location.href = "/webstudy/ServiceServlet?jumin="+jumin.value+"&name="+name.value+"&number="+number.value+"&time="+time.value+"&area="+area.value+"&confirm="+confirm.value;
}


</script>

<%@ include file="fix/footer.jsp"%>