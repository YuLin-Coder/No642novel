<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*"%>
<%@page import="org.model.*"%>
<%@page import="org.dal.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 小说信息 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("utf-8");
	Novel novel = new Novel();
	int id = DataConverter.toInt(request.getParameter("id"));
	NovelInfo info = novel.getNovelInfo(id);
	if (info == null) {
		out.println("<script>alert('小说ID有误');</script>");
	}
%>
<html>
<head>
<base href="<%=basePath%>">

<title>单个小说信息详情</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="./css/novel-information.css">
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
		<div class="content">
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

			
			<a name="comment" id="comment"></a>
			<p class="plun">评论：</p>
			<%
				Comment comment = new Comment();
				List<CommentInfo> cmlist = comment.getListByNovelId(id);
				for (CommentInfo cminfo : cmlist) {
					out.print("<div class=com1>");
					out.println(cminfo.getReaderName() + ":<br>");
					out.print("</div>");
					out.print("<div class=com2>");
					out.println(cminfo.getContext() + "<br>");
					out.print("</div>");
					out.print("<div class=com3>");
					out.println(cminfo.getCreatedTime() + "<br>");
					out.print("</div>");
					out.print("<div>");
				}
			%>
			<div class="cmt">
			<jsp:include page="../comment/comment.jsp">
				<jsp:param value="<%=id%>" name="id" />
			</jsp:include>
			</div>
		</div>
	</div>
</body>
</html>