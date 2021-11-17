<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function check(){
	var fm2 = document.fm;
	
	if (fm2.content.value == ""){
		swal("내용을 입력해주세요"," ","warning");
		fm2.content.focus();
		return false;
	}else if (fm2.recv_nick.value == ""){
		swal("받는 사람을 입력해주세요"," ","warning");
		fm2.recv_nick.focus();
		return false;
	}
	
	fm2.action="<%=request.getContextPath()%>/noteSend.do";
	fm2.method="post";
	fm2.submit();
	
	return;
}

</script>
<head>
<link href="resources/css/styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<style>
.btn5 {
  display: inline-block;
  font-weight: 400;
  line-height: 1.5;
  color: white;
  text-align: center;
  text-decoration: none;
  vertical-align: middle;
  margin-right:10px;
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

.test12333 {
 border:0px;
 resize:none;
 outline:0;

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
	 margin-left:15%; 
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





<title>Insert title here</title>
</head>
<body>

<nav id="nav1">
  <a >
    
  </a>
</nav>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="${pageContext.request.contextPath}/noteListRecv.do" >받은쪽지함</a>
  <a href="${pageContext.request.contextPath}/noteListSend.do" >보낸쪽지함</a>
  
</div>
<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; 쪽지</span>
    </div>
	
	
    <form name="fm" >
    <table id="table1" style="width:800px;  " >
    <input type="hidden" name="send_nick" value="${sessionScope.membernickname }" >
    <tr>
    <td style="width:100px;  ">받는사람 :</td>
    <td><input type = "text" name="recv_nick" style="width:650px;"></td>
    </tr>  
    <tr style=" height:500px;  ">
    <td colspan=2><textarea class=test12333  Placeholder="남기실 말씀을 적어주세요." name="content"  style="width: 794px; height: 500px;"></textarea></td>
    
    </tr>
    </table>
    </form>
    
    <table id="table1" style="width:800px;">
<tr>
<td colspan=3><button class="btn" onclick="check();return false;">보내기</button></td>


</tr>
</table>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <nav id="nav2">
  <a >
    
  </a>
</nav>
    
    
    
    
    
    
</body>
</html>
