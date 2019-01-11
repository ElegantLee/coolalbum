<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html style="font-size: 79.16px;">
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>SE空间</title>
		<meta name="title" content="资料设置">
		<link href="css/global.css" rel="stylesheet">
		<script src="js/hm1.js"></script>
		<script src="js/hm2.js"></script>
		<script src="js/jquery-1.12.1.min.js"></script>
		<script src="js/header_footer.js"></script>
		<link id="layuicss-laydate" rel="stylesheet" href="css/layui-v2.3.0/css/modules/laydate/default/laydate.css" media="all">
		<link id="layuicss-layer" rel="stylesheet" href="css/layui-v2.3.0/css/modules/layer/default/layer.css" media="all">
		<link id="layuicss-skincodecss" rel="stylesheet" href="css/layui-v2.3.0/css/modules/code.css" media="all">
		<link href="css/setting.css" rel="stylesheet" />
		<link href="css/personal.css" rel="stylesheet">
		<link href="css/vendor/jcrop/css/jquery.Jcrop.min.css" rel="stylesheet">
		<link href="css/vendor/jcrop/css/myjcrop.css" rel="stylesheet" />
		<link href="css/layui-v2.3.0/css/layui.css" rel="stylesheet" />
	</head>

	<body>
		<div class="t-header js_header" id="header"></div>

		<div class="t-content">
			<div class="personal-container">
				<div class="personal-main t-desktop-layout-main">
					<div class="t-desktop-layout-main-inner">
						<div class="t-desktop-layout-main-hd">
							<h2>资料设置</h2>
							<div class="t-desktop-tab">
								<ul class="t-desktop-tab-nav">
									<li class="t-desktop-tab-nav-item active">
										<a href="user/setting.jsp">个人资料</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="t-desktop-layout-main-bd">
							<div class="setting-panel">
								<div class="setting-panel-hd">
									<h3>个人资料设置 - <span class="desc"></span></h3>
								</div>
								<div class="setting-panel-bd">
									<div id="userInfo">
										<!--  个人头像-->
										<div class="setting-panel-bd-box update-user-avatar" id="update_avatar_container">
											<div class="user-avatar">
												<img name="avatar" id="user_avatar" class="lazy-img js_user_avatar" alt="" src='<c:if test="${empty user.avar }">images/avatar/default_avatar.jpg</c:if><c:if test="${not empty user.avar }" >${user.avar}</c:if>'>
												<p id="demoText"></p>
											</div>
											<button class="layui-btn t-bg-rose" name="avatar" id="upload_btn" type="button">更改头像</button>
											<input type="file" id="btn_file" name="avar" style="display:none" accept="" />
										</div>
										<form class="layui-form camerist-setting-info-form" action="user/updateInfo.action" method="post">
											<div class="setting-panel-bd-box">
												<h3>基本资料</h3>
												<div class="layui-form-item">
													<label class="layui-form-label"><i class="icon-star"></i>昵称</label>
													<div class="layui-input-inline">
														<input name="username" class="layui-input" required="" type="text" placeholder="请输入昵称" value=""
														 autocomplete="off" lay-verify="required">
													</div>
												</div>
												<div class="layui-form-item">
													<label class="layui-form-label">性别</label>
													<div class="layui-input-inline">
														<input name="gender" title="男" type="radio" value="1" />
														<div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i>
															<div>男</div>
														</div>
														<input name="gender" title="女" type="radio" value="2">
														<div class="layui-unselect layui-form-radio">
															<i class="layui-anim layui-icon"> </i>
															<div>女</div>
														</div>
													</div>
												</div>
												<div class="layui-form-item">
													<label class="layui-form-label"><i class="icon-star"></i>密码</label>
													<div class="layui-input-inline">
														<input name="password" class="layui-input" required="" type="text" placeholder="请输入新密码" value=""
														 autocomplete="off" lay-verify="required">
													</div>
												</div>
												<div class="layui-form-item">
													<label class="layui-form-label">出生日期</label>
													<div class="layui-input-inline">
														<input name="birthDate" class="layui-input" id="birth_laydate" type="text" value="1996-01-01" lay-key="1">
													</div>
												</div>
											</div>
											<div class="setting-panel-bd-box">
												<h3>联系方式</h3>
												<div class="layui-form-item">
													<label class="layui-form-label">邮箱</label>
													<div class="layui-input-inline">
														<input name="email" class="layui-input" type="text" placeholder="请输入您的邮箱" value="" autocomplete="off">
													</div>
												</div>
												<div class="layui-form-item">
													<input type="hidden" name="newAvatar" id="newAvatar" value=""/>
												</div>
											</div>
											<div class="setting-panel-bd-box">
												<div class="layui-form-item">
													<div class="layui-input-block">
														<button class="layui-btn t-bg-rose t-mt5" style="margin-left: 100px;" lay-filter="*"
														 lay-submit="">立即提交</button>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- <button class="layui-btn t-bg-rose" onclick="test();"  id="test_btn" type="button">test</button>-->
		<div class="footer" id="footer"></div>
		<script type="text/javascript">
			function F_Open_dialog() {
				document.getElementById("btn_file").click();
			}
		</script>
		<script src="https://static.tantupix.com/pc/static/vendor/js-libs/md5.min.js" charset="utf-8"></script>
		<script src="https://cdn.staticfile.org/plupload/2.1.9/plupload.full.min.js" charset="utf-8"></script>
		<!-- <script src="../../static/vendor/qiniu-js-sdk-1.0.24/dist/qiniu.min.js?v=4e6bda5" charset="utf-8"></script> -->
		<script src="https://cdn.jsdelivr.net/bluebird/latest/bluebird.min.js" charset="utf-8"></script>
		<script src="css/layui-v2.3.0/layui.all.js" charset="utf-8"></script>
		<script src="js/lazyload.min.js" charset="utf-8"></script>
		<script src="https://static.tantupix.com/pc/static/vendor/js-libs/template-web.js" charset="utf-8"></script>
		<script src="https://static.tantupix.com/pc/static/vendor/js-libs/jquery.flex-images.min.js" charset="utf-8"></script>
		<script src="https://static.tantupix.com/pc/static/vendor/js-libs/jquery.qrcode.min.js" charset="utf-8"></script>
		<script src="js/util.js" charset="utf-8"></script>
		<script src="js/global.js" charset="utf-8"></script>
		<script id="sozz" src="https://jspassport.ssl.qhimg.com/11.0.1.js"></script>
		<script src=" https://s.ssl.qhres.com/ssl/ab77b6ea7f3fbf79.js" charset="utf-8"></script>
		<script src="js/info.js" charset="utf-8"></script>
		<script>
			layui.use('laydate', function() {
				var laydate = layui.laydate; //执行一个laydate实例  
				laydate.render({
					elem: '#birth_laydate' //指定元素 
				});
			});
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
							$('#newAvatar').attr('value',res.data.src);
							return layer.msg('头像上传成功!');
						}
						if (res.code === 2) {
							return layer.msg('不支持该图片类型');
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
	<!-- 	<script>
			function test(){
				layer.msg('test');			
			}
		</script> -->
</body>

</html>
