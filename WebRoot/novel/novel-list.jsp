<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 小说列表 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>小说分类查询</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./css/novel-list.css">

  </head>
  <%
	Novel novel=new Novel();
	int classId=DataConverter.toInt(request.getParameter("classId"));
	List<NovelInfo> list=novel.getListBygenreId(classId);
	//获得小说分类
	Genre genre=new Genre();
	List<GenreInfo> clist=genre.getList();
%>
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
     <div class="content">
    	<%
    		for(NovelInfo info:list){
    	%>
    	<div class="post">
    		<h1 class="title"><a href="author/author-novel-infomation.jsp?id=<%=info.getId()%>"><%=info.getTitle() %></a></h1>
    		<p class="byline"><%=info.getCreatedTime() %></p>
    		<div class="entry">
    			<p><%=Utilty.Substring(info.getContext(), 300) %>
    		</div>
    		<p class="meta"><a class="more">分类：<%=info.getGenreName() %></a>
    			&nbsp;&nbsp;&nbsp;<a href="author/author-novel-infomation.jsp?id=<%=info.getId()%>">详情</a>&nbsp;&nbsp;&nbsp;
    		</p>
    	</div>
    	<%
    		}
    	%>
    </div>
    </div>
  </body>
</html>