<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>

	<form id="rFrm" name="rFrm" action="replyInsert" method="post">
		<h2>댓글작성이지롱</h2>
		<table>
			<tr>


			</tr>
			<tr>
				<td><input type="hidden" name="pageNo" value="${pageNo}">
				<input type="hidden" name="id" value="${sessionScope.id}">
				<input type="hidden" name="nickname" value="${sessionScope.nickname}">
				<input type="hidden" name="profile" value="${sessionScope.profile}">
				 작성일:<input type="hidden" name="r_date" value="<%=sf.format(nowTime)%>"><%=sf.format(nowTime)%><br>
				</td>
				<td><textarea rows="3" cols="50" name="replyContent"
						id="replyContent"></textarea></td>
				<td><input type="submit" value="댓글전송"
					style="width: 80px; height: 50px"></td>
			</tr>
		</table>
	</form>
	<!-- 댓글 리스트 출력 -->
	${id}
	<table id="rTable">
		<c:forEach var="reply" items="${rList}">
			<tr height="20" align="center">
				<td width="100">${reply.id}</td>
				<td width="100">${reply.replyContent}</td>
				<td width="200">${reply.r_date}</td>
			</tr>
		</c:forEach>
	</table>

<script type="text/javascript">
function replyInsert(bNum){
	console.log("bNum=",bNum);
	let obj=$('#rFrm').serializeObject();//폼의 모든 데이터를 js객체로 변환
	obj.r_bnum=bNum;   //객체에 원글번호 추가
	
	let json=JSON.stringify(obj);  //obj--->json
	$.ajax({
		type:'post', //json일때는 post
		url: 'rest/replyinsert',  //'list/member/10','list/board/10'
		//1.get: 쿼리스트링(주소창 노출)
		// post: urlencoded 방식 
		//data: {r_bnum:bNum, r_contents:$('#r_contents').val()},
		//data: $('#rFrm').serialize(), //폼전체 데이터 전송 
		//data: obj,
		//2.json 을 서버로 넘김(서버에서 @RequestBody 받아야 함.)
		data:json,
		//쿼리스트링 또는 urlencoded 방식이 아닌 json형식을 서버에 전송할께...
		contentType:"application/json; charset=UTF-8", 		
		dataType:'json', 
		success:function(data,status,xhr){
			console.log(data);  //출력 확인
			//댓글 리스트 출력하세요..
			let rlist='';
			/* for(var i=0;i<data.length;i++){
				rlist+='<tr height="25" align="center">'
				+'<td width="100">'+data[i].r_id+'</td>'
				+'<td width="200">'+data[i].r_contents+'</td>'
				+'<td width="200">'+data[i].r_date+'</td></tr>';
			} */
			$.each(data.rList, function(i,reply){
				console.log(reply);
				rlist+='<tr height="25" align="center">'
					+'<td width="100">'+reply.r_id+'</td>'
					+'<td width="200">'+reply.r_contents+'</td>'
					+'<td width="200">'+reply.r_date+'</td></tr>';
			});
			$('#rTable').html(rlist);
			$('#r_contents').val('');
			$('#r_contents').focusin();
		},
		error:(err)=>{console.log(err); 
		              console.log(err.responseText); //responseEntity사용시 출력메세지
		             }
	});	//ajax End
}//replyInsert End

</script>

</body>
</html>