<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.common.*"%>
<%@page import="org.model.*"%>
<%@page import="org.dal.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 评论 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
<link rel="stylesheet" type="text/css" href="css/wangEditor.min.css">
<script type="text/javascript" src="js/wangEditor.min.js"></script>
<style type="text/css">
.submit {
	width: 100px;
	height: 30px;
	position: relative;
	margin: 10px 87%;
	border-radius: 8px;
	background-color: #72B9FF;
	color: white;
}

.submit:hover {
	background-color: #3385FF;
	font-weight: bold;
	cursor: pointer;
}
</style>
</head>
<%
request.setCharacterEncoding("utf-8");
if("login".equals(request.getParameter("action")))
{
	Reader reader=new Reader();
	String username=request.getParameter("txtUserName");
	String password=request.getParameter("txtPassword");
	if(!reader.isExist(username,password)){
		out.println("<script>alert('用户名或密码错误');</script>");
	}else{
		Utilty.writeCookie(response, "user",username);
		response.sendRedirect("../novel/novel-information.jsp?id="+DataConverter.toInt(request.getParameter("id")));
	}
}
if("save".equals(request.getParameter("action")))
{
	Comment comment=new Comment();
	CommentInfo info=new CommentInfo();
	info.setNovelId(DataConverter.toInt(request.getParameter("id")));
	info.setContext(request.getParameter("txtContext"));
	info.setReaderName(Utilty.readCookie(request, "reader"));
	comment.insert(info);
	response.sendRedirect("../novel/novel-information.jsp?id="+DataConverter.toInt(request.getParameter("id")));
}
String data=Utilty.readCookie(request, "user");
if(DataValidator.isNullOrEmpty(data))
{
%>
<body>
	<form id="form1" name="form1" method="post"
		action="comment/comment.jsp?action=login">
		<table>
			<tr>
				<td><input name="id" type="hidden" id="id"
					value="<%=request.getParameter("id") %>" /></td>
				<td><input name="txtUserName" type="text" id="txtUserName" /></td>
				<td><input name="txtPassword" type="password" id="txtPassword" /></td>
				<td><input type="submit" name="button" id="button" value="提交" /></td>
			</tr>
		</table>
	</form>
	<%} else{ %>
	<%=Utilty.readCookie(request, "user") %>：欢迎您的评论
	<form name="commentForm" method="post"
		action="comment/comment.jsp?action=save">
		<input name="id" type="hidden"
			value="<%=request.getParameter("id") %>" />
		<p style="width:100%">
			<textarea rows="8" cols="30" name="txtContext" id="txtContext"></textarea>
		</p>
		<input class="submit" type="submit" name="button" value="回复" />
	</form>
	<%
	}
%>
</body>
<script type="text/javascript">
    	var editor = new wangEditor('txtContext');
    	editor.config.menus = [
    	                       '|',     // '|' 是菜单组的分割线
    	                       'bold',
    	                       'underline',
    	                       'italic',
    	                       'strikethrough',
    	                       'eraser',
    	                       'forecolor',
    	                       'emotion',
    	                       'img',
    	                       'bgcolor'
    	                    ];
    	editor.create();
	</script>
</html>
