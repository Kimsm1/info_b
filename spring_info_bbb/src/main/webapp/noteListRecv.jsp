<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ezen.myapp.domain.*" %>    
<%NoteVo nv = (NoteVo)request.getAttribute("nv");%> 
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<style>
.hn{font-family: 'Hanna', sans-serif;}
        .jg{font-family: 'Jeju Gothic', sans-serif;}
.btn5 {
  display: inline-block;
  font-weight: 400;
  line-height: 1.5;
  color: white;
  text-align: center;
  text-decoration: none;
  vertical-align: middle;
 
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-color: black;
  border: 1px solid transparent;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}


#nav1{
	height:50px;
	background-color:black;

}
#nav2{
	height:50px;
	position: fixed;
	 bottom: 0;
	  width: 100%;


	background-color:black;

}
#table1{
	 margin-left:auto; 
    margin-right:auto;
    border : 1px solid black;

}

table {
    margin-left:auto; 
    margin-right:auto;
}



.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 50px;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}


        </style>
        <script>
function openNav() {
  document.getElementById("mySidenav").style.width = "240px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$.check = function(no){
	var no = no;
	//alert(no);

	$.ajax({
		url : "<%=request.getContextPath()%>/"+no+"/noteDelete.do",
		type : "get",
		dataType: "text",		
		success : function(data){
			if (data.length == 0){
				swal("데이터가 없습니다"," ","warning");
			}else
				swal("삭제되었습니다"," ","success");
				setTimeout('location.reload()',800);
		},
		   error: function( request, status, error ){
			    swal("에러입니다"," ","warning");
			    alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);
			   }		
	});
}        
</script>
<title>받은 쪽지함</title>
</head>



<body>
<nav id="nav1">
  <a style=color:white;>
  	받은쪽지함
  </a>
</nav>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="<%=request.getContextPath()%>/noteSendWant.do">쪽지쓰기</a>
 
  <a href="#">내게 쓰기</a>
  <a href="${pageContext.request.contextPath}/noteListSend.do">보낸쪽지함</a>
  
</div>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; 쪽지</span>
    </div>


<form name="frm" action="${pageContext.request.contextPath}/boardList.do" method="post">
<table class="type09" style="width:1400px; ">
<tr >
<td >
<select name="searchType">
<option value="subject">제목</option>
<option value="membernickname">작성자</option>
</select></td>
<td>
<input type="text" name="keyword" size="65" >
</td>
<td><input type="submit" name="submit" value="검색"  ></td>
</tr>
</table>
</form>

<div>



<table id="table1" style="width:1400px;  " >
<tr  style=background-color:#666;>
	 <td  style="width:100px; ">쪽지번호 </td>
	 <td style="width:100px; ">보낸사람  </td> 
	 <td style="width:919px; ">내용 </td>
	 <td style="width:281px; ">보낸 날짜</td>
	 <tr>

</table>
	<table style="width:1400px;  ">
    <c:forEach var = "nv" items="${alist}">
	 <tr>
	 <td style="width:100px; ">${nv.no }</td>
	 <td style="width:100px; ">${nv.send_nick }</td>
	 <td style="width:910px; ">${nv.content }</td>
	 <td style="width:160px; ">${nv.send_time }</td>
	 <td colspan=2 style="width:130px;">
	 <input type="button" class="btn5" name="del" id="del+${nv.no}" onclick="$.check(${nv.no});" value="삭제">
	 <input type="button" class="btn5" onclick="document.location.href='<%=request.getContextPath()%>/noteReplyPage.do?no=${nv.no}' " value="답장">
	 </td>
	
	 
	 </tr>
    </c:forEach>
    </table>
    
    <table  style="width:1400px;Text-align:center">
<tr>
<td>

<c:if test="${pm.prev == true }">
<a href="${pageContext.request.contextPath}/noteListRecv.do?page=${pm.startPage-1}&keyword=${pm.scri.keyword}">이전</a>
</c:if>
</td>
<td>

<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
<a href="${pageContext.request.contextPath}/noteListRecv.do?page=${i}&keyword=${pm.scri.keyword}">${i}</a>
</c:forEach>
</td>
<td>

<c:if test="${pm.next && pm.endPage >0}">
<a href="${pageContext.request.contextPath}/noteListRecv.do?page=${pm.endPage+1}&keyword=${pm.scri.keyword}">다음</a>
</c:if>
</td>
</tr>
</table>
    
     <nav id="nav2">
  <a >
    
  </a>
</nav>
</body>
</html>
