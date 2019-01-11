<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link id="layuicss-laydate" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/laydate/default/laydate.css"
	media="all">
<link id="layuicss-layer" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/layer/default/layer.css" media="all">
<link id="layuicss-skincodecss" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/code.css" media="all">
<link href="css/layui-v2.3.0/css/layui.css" rel="stylesheet" />
<script src="js/jquery-1.12.1.min.js"></script>
<script src="css/layui-v2.3.0/layui.all.js" charset="utf-8"></script>
<title>上传图片</title>


</head>
<body>
	<!--  个人头像-->
	<div class="setting-panel-bd-box update-user-avatar"
		id="update_avatar_container">
		<div class="user-avatar">
			<img name="user_avatar" id="user_avatar" class="lazy-img js_user_avatar" alt=""
				src='<c:if test="${empty user.avar }">images/avatar/default_avatar.jpg</c:if><c:if test="${not empty user.avar }" >${user.avar}</c:if>'>
		</div>
		<button class="layui-btn t-bg-rose" name="avatar" id="upload_btn"
			type="button">更改头像</button>
		<input type="file" id="btn_file" name="avar" style="display:none"
			accept="" />
	</div>
	
	<!-- <div class="layui-upload">
		<div class="layui-upload-list">
			<img class="layui-upload-img" id="demo1">
			<p id="demoText"></p>
		</div>
		<button type="button" class="layui-btn" id="upload_btn">上传图片</button>

	</div> -->
	<script>
		layui.use('upload', function() {
			var $ = layui.jquery,
				upload = layui.upload;
	
			//普通图片上传
			var uploadInst = upload.render({
				elem : '#upload_btn',
				url : 'user/updateAvatar.action',
				before : function(obj) {
					//预读本地文件示例，不支持ie8
					obj.preview(function(index, file, result) {
						$('#user_avatar').attr('src', result); //图片链接（base64）
					});
				},
				done : function(res) {
					//如果上传失败
					if (res.code === 0) {
						return layer.msg('文件上传成功!');
					}
					if (res.code === 2) {
						return layer.msg('不支持该上传类型');
					}
					if (res.code === 3) {
						return layer.msg('文件为空');
					} else {
						return layer.msg('文件上传异常');
	
					}
				//上传成功
				},
				error : function() {
					//演示失败状态，并实现重传
					var demoText = $('#demoText');
					demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
					demoText.find('.demo-reload').on('click', function() {
						uploadInst.upload();
					});
				}
			});
		});
	</script>
</body>
</html>
