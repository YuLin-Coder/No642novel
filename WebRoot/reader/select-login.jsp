<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
  <head>

    
    <title>角色选择登录界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  <html>
<div class="user_login">
        <div class="login_left">
            <img src="../image/1.jpg" alt="作家登录">
            <a href="../author/author-login.jsp">我是作家</a>
        </div>
        <div class="login_right">
            <img src="../image/2.jpg" alt="读者登录">
            <a href="../reader/reader-login.jsp">我是读者</a>
        </div>
    </div>
    <style>
    div,a,img{
        margin: 0;
        padding: 0;
    }
    .user_login{
        width:300px;
        height:200px;
        background:#3385FF;
        border:none;
    }
    .user_login .login_left{
        margin: 30px 20px 0 30px;
        float: left;
        text-align: center;
    }
    .user_login .login_right{
        margin: 30px 30px 0 20px;
        float: right;
        text-align: center;
    }
    .user_login img{
        display: block;
        border-radius: 50%;
    }
    .user_login a{
        display: inline-block;
        margin: 10px 0;
        padding: 2px 5px;
        color: #fff;
        cursor: pointer;
        text-decoration: none;
        font-size: 14px;
    }
    a{
    	text-decoration:none;
		color:white;
    }
    a:hover{
    color:black;
    font-weight:bold;
    text-decoration:underline;
    couser:pointer;
}
    </style>
</html>
