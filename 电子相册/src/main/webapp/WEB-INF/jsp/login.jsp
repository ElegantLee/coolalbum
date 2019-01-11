<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html style="font-size: 79.06px;">

<head>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title>SE空间，发现生活的美</title>

<script src="js/register.js"></script>
<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/login.css">
<link id="layuicss-laydate" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/laydate/default/laydate.css"
	media="all">
<link id="layuicss-layer" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/layer/default/layer.css" media="all">
<link id="layuicss-skincodecss" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/code.css" media="all">
</head>

<body>

	<div class="login-wrap t-clear">
		<div class="login-hd">
			<a href="/"><img class="logo" alt="" src="images/SEzone-logo.png"></a>
		</div>
		<div class="login-form-wrap">
			<div class="login-form-panel t-clear">
				<form class="layui-form login-form-box js_login_form_box"
					 method="post" action="user/login.action">
					<div class="login-form-panel-hd">
						<h2 class="tit">用户登录</h2>
					</div>
					<div class="layui-form-item">
						<input name="username" id="username" class="layui-input" autofocus="autofocus" required
							lay-verify="required" autocomplete="off" value=""
							placeholder="请输入用户名">
					</div>
					<div class="layui-form-item">
						<input name="password" id="password" class="layui-input"
							 required lay-verify="required" value=""
							placeholder="请输入密码">
					</div>
					<div class="layui-form-item">
						<div class="layui-input-inline">
							<input name="codeInput" id="codeInput" required=""
								lay-verify="code" lay-vertype="tips" placeholder="请输入验证码"
								autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid">
							<img src="safecode.action" alt="验证码" width="100" height="38"
								style="margin-top: -8px; cursor: pointer;" name="safecode"
								onclick="this.src=this.src+'?'">
						</div>
					</div>
					<div class="layui-form-item t-mt5">
						<button class="layui-btn layui-btn-fluid layui-btn-danger"
							onclick="send();">登 录</button>
					</div>
					<div class="layui-form-item t-mt5">
						<a href="user/register.jsp"
							class="layui-btn layui-btn-fluid layui-btn-danger">注册</a>
					</div>
					<div style="color: red;text-align: center;width: 300px;margin-bottom: 20px">${msg }</div>
				</form>

			</div>
			<div class="copyright">Copyright © 2019 SEzone网 版权所有
				粤ICP备894654号-1</div>
		</div>
	</div>
	<!-- <div
		class="layui-layer layui-layer-dialog layui-layer-border layui-layer-msg layui-layer-hui"
		id="error-message" type="dialog" times="20" showtime="3000"
		contype="string" style="z-index: 19891034; top: 293px; left: 338px;">
		<div id class="layui-layer-content">${requestScope.msg }</div>
		<span class="layui-layer-setwin"></span>
	</div> -->
</body>

</html>

