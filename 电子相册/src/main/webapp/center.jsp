<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!--背景图片和头像样式-->
<base href="<%=basePath%>">

<div class="photographer-detail photographer-detail-container">
	<div class="default-thumb"
		style="background:url(images/ub1920x436.jpg) center center/cover no-repeat">
		<div class="photographer-detail-zoneimg js_zoneimg"
			style="background:url(images/ub1920x436.jpg) center center/cover no-repeat"></div>
	</div>

	<div class="photographer-detail-hd t-clear">
		<!-- 头像部分 -->
		<div class="photographer-detail-avatar"
			style='background:url(<c:if test="${empty sessionScope.user.avar }">images/avatar/default_avatar.jpg</c:if><c:if test="${not empty sessionScope.user.avar }" >${sessionScope.user.avar}</c:if>) center center/cover no-repeat'>
			<div class="photographer-detail-avatar inner"
				style='background:url(<c:if test="${empty sessionScope.user.avar }">images/avatar/default_avatar.jpg</c:if><c:if test="${not empty sessionScope.user.avar }" >${sessionScope.user.avar}</c:if>) center center/cover no-repeat'></div>
		</div>
		<div class="photographer-detail-hd-content layui-container">
			<h1 class="nickname">${sessionScope.user.userName }</h1>
		</div>
	</div>
	<div class="t-content-nav js_photographer_detail_nav">
		<ul class="t-content-nav-inner">
			<li class="t-content-nav-item"><a href="dispatcher/album.action">相册 <span
					class="js_folder_count"></span></a>
			</li>
			<li class="t-content-nav-item"><a href="dispatcher/collection.action">收藏</a></li>
			<li class="t-content-nav-item"><a href="user/fan.jsp">粉丝 <span
					class="js_fans_count"></span></a>
			</li>
			<li class="t-content-nav-item"><a href="user/attention.jsp">关注
					<span class="js_follows_count"></span></a>
			</li>
		</ul>
	</div>
</div>


