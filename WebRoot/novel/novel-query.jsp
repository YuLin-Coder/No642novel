<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 小说管理 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("utf-8");
	Novel novel=new Novel();
	String keyword=request.getParameter("keyword");
	List<NovelInfo> list=novel.getList(keyword);
%>

<html>
  <head>  
    <title>小说查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css"
	href="../css/novel-information.css">

  </head>
  
  <body>
    <div class="center">
    	<div class="header">
			<h1>
				<a>应有尽有小说网站</a>
			</h1>
			<ul>
				<li><a href="#">设为首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">加入收藏</a></li>
			</ul>
		</div>
    </div>
    <div class="content1">
    <%
    		for(NovelInfo info:list){
    	%>
    	<div class="p">
				<p>分类：<%=info.getGenreName()%></p>
			</div>
			<div class="mate">
				<p>投票总数：<%=info.getVoteNumber()%></p>
			</div>
			<h1 class="title"><%=info.getTitle()%></h1>
			<p class="time"><%=info.getCreatedTime()%></p>
			<div>
				<p class="count"><%=info.getContext()%></p>
			</div>
    	<%
    		}
    	%>
    </div>
  </body>
</html>