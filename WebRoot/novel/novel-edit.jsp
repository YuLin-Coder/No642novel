<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="org.common.*" %>
<%@page import="org.model.*" %>
<%@page import="org.dal.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 发布小说 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>小说编辑发布界面</title>
	<script type="text/javascript" src="js/jquery-1.10.1.js"></script>
	<link rel="stylesheet" type="text/css" href="css/edit.css">
	<link rel="stylesheet" type="text/css" href="css/wangEditor.min.css">
	<script type="text/javascript" src="js/wangEditor.min.js"></script>
  </head>
 
  <body>
<% 
	request.setCharacterEncoding("utf-8");
	Genre cls=new Genre();
	List<GenreInfo>list=cls.getList();
	Novel novel=new Novel();
	NovelInfo ninfo=new NovelInfo();
	if("fabu".equals(request.getParameter("action")))
{	
	ninfo.setTitle(request.getParameter("txtTitle"));
	ninfo.setContext(request.getParameter("content"));
	ninfo.setGenreId(DataConverter.toInt(request.getParameter("selClass")));
	novel.insert(ninfo);
	out.println("<script>alert('发布成功');</script>");
}
%>	
<div class="header">	
	<h2>当前位置：小说编辑</h2>
</div>
  <a class="wel">欢迎您：<%=Utilty.readCookie(request, "user")%></a>
  <div class="context" >
    <form id="form1" name="form1" method="post" 
    action="novel/novel-edit.jsp?action=fabu" onsubmit="return check(this)">
    	<table>
    		<tr>
    		<td>小说所属分类:</td>
    		<td>
    		<select name="selClass" id="selClass" style="width:300px;height:30px;">
    			<%
    				for(GenreInfo cinfo:list){
    			%>
    			<option value="<%=cinfo.getId() %>">
    			<%if(cinfo.getId()==ninfo.getId()) %>
    			<%=cinfo.getName() %></option>
    			<%
    				}
    			%>
    		</select>
    		</td>
    		</tr>
    		<tr>
    		<td>小&nbsp;&nbsp;说&nbsp;&nbsp;&nbsp;标&nbsp;&nbsp;&nbsp;题:</td>
    		<td><input type="text" name="txtTitle" id="txtTitle" style="width:500px;height:30px"/></td>
    		</tr>
    		
    		<tr>
    			<td>小&nbsp;&nbsp;说&nbsp;&nbsp;&nbsp;内&nbsp;&nbsp;&nbsp;容:</td>
    			 <td style="width:1000px;"><textarea rows="25" name="content" id="content"></textarea> </td>
    		</tr>
    		
    <tr>
	<td colspan="2" class="inp">
		<input class="submit" type="submit" name="button" id="button" value="提交" style="color:#FFFFFF"/>
		<input class="submit" type="reset" name="button2" id="button2" value="重置"style="color:#FFFFFF" />
	</td>
	</tr>
    	</table>
    </form>
    </div>
  </body>
  	<script type="text/javascript">
    	var editor = new wangEditor('content');
    	editor.config.menus = [
					'bold',
					'underline',
					'italic',
					'strikethrough',
					'eraser',
					'forecolor',
					'bgcolor',
					'|',
					'link',
					'unlink',
					'table',
					'emotion',
					'|',
					'img',
					'video',
					'location',
    	                 ];
         
    	editor.create();
	</script>
</html>