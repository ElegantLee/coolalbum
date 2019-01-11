<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html style="font-size: 57.6px;">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>SE空间，发现生活的美</title>
<meta name="title" content="  SE空间,发现生活的美">
<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="css/login.css">
<link id="layuicss-laydate" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/laydate/default/laydate.css"
	media="all">
<link id="layuicss-layer" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/layer/default/layer.css" media="all">
<link id="layuicss-skincodecss" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/code.css" media="all">
<script src="js/jquery-1.12.1.min.js"></script>
<script src="js/register.js"></script>
</head>
<body>
	<div class="login-wrap t-clear">
		<div class="login-hd">
			<a href="/"><img class="logo" alt="" src="images/SEzone-logo.png"></a>
		</div>
		<div class="login-form-wrap">
			<div class="login-form-panel t-clear">
				<form class="layui-form login-form-box js_login_form_box" onsubmit="return isCorrect()" method="post" action="user/register.action">
					<div class="login-form-panel-hd">
						<h2 class="tit">用户注册</h2>
					</div>
					<div class="layui-form-item">
						<input name="username" id="username" required=""
							lay-verify="required" lay-vertype="tips" placeholder="请输入用户名"
							autocomplete="off" class="layui-input" onblur="send();">
					</div>
					<div class="layui-form-item">
						<input type="password" name="password" id="password" required=""
							lay-verify="password" lay-vertype="tips" placeholder="请输入密码"
							autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-item">
						<input type="password" name="repassword" id="repassword"
							required="" lay-verify="password" lay-vertype="tips"
							placeholder="请再次输入密码" autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-item">
						<input name="请输入邮箱" name="email" id="email" required=""
							lay-verify="email" lay-vertype="tips" placeholder="请输入邮箱"
							autocomplete="off" class="layui-input">
					</div>
					<div class="layui-form-item t-mt5">
						<button class="layui-btn layui-btn-fluid layui-btn-danger">立即注册</button>
					</div>
					<div id="error_msg" style="color: red;text-align: center;width: 300px;margin-bottom: 20px">${msg }</div>
				</form>

				<div class="login-third-party t-clear">
					<a href="index.jsp" class="t-right login-tips-txt t-ml5">随便看看</a> <a
						href="user/login.jsp" class="t-right login-tips-txt t-rose">立即登录</a>
				</div>
			</div>
			<div class="copyright">Copyright © 2017 SE空间 版权所有
				粤ICP备16107621号-1</div>
		</div>
	</div>
	<script type="text/javascript">
		function send() {
			var username;
// 			alert(username);
			$.ajax({
				type : "GET",
				url : "user/isExist.action",
				dataType : "json",
				scriptCharset : 'UTF-8',
				contentType: "application/json;charset=UTF-8",
				data : {"username":$("input[name='username']").val()},
				success : function(data){
					$("#error_msg").text(data.msg);
				},
				error : function(data, type, err) {
					alert("error");
				}
			});
		}
		;
	</script>

</body>
</html>

