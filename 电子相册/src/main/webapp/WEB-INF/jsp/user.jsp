<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html style="font-size: 40px;">
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>个人主页</title>
		<script src="js/jquery-1.12.1.min.js"></script>
		<script src="js/header_footer.js"></script>
		<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
		<link rel="stylesheet" href="css/global.css">
		<link id="layuicss-laydate" rel="stylesheet" href="css/layui-v2.3.0/css/modules/laydate/default/laydate.css" media="all">
		<link id="layuicss-layer" rel="stylesheet" href="css/layui-v2.3.0/css/modules/layer/default/layer.css" media="all">
		<link id="layuic -->ss-skincodecss" rel="stylesheet" href="css/layui-v2.3.0/css/modules/code.css" media="all">
		<link rel="stylesheet" href="css/photographers.css">
		<link rel="stylesheet" href="css/vendor/jcrop/css/jquery.Jcrop.min.css">
		<link rel="stylesheet" href="css/vendor/jcrop/css/myjcrop.css">
	</head>
	<body>
		
		<div class="t-header  js_header" id="header"></div>
		
		<!--背景图片和头像样式-->
		
		<div class="t-content" id="center">
		</div>
		
		<div class="footer" id="footer"></div>
	</body>
</html>
