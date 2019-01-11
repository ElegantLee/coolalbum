<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>更多相片</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery-1.12.1.min.js"></script>
<script src="js/myjs.js"></script>
<script src="js/script.js"></script>
<script src="js/vue.min.js"></script>
<script src="js/header_footer.js"></script>
<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/center.css">
<link id="layuicss-laydate" rel="stylesheet"
	href="../css/layui-v2.3.0/css/modules/laydate/default/laydate.css"
	media="all">
<link id="layuicss-layer" rel="stylesheet"
	href="../css/layui-v2.3.0/css/modules/layer/default/layer.css"
	media="all">
<link id="layuicss-skincodecss" rel="stylesheet"
	href="../css/layui-v2.3.0/css/modules/code.css" media="all">
<link id="layuicss-laydate" rel="stylesheet"
	href="../css/layui-v2.3.0/css/modules/laydate/default/laydate.css"
	media="all">
<link id="layuicss-layer" rel="stylesheet"
	href="../css/layui-v2.3.0/css/modules/layer/default/layer.css"
	media="all">
<link id="layuicss-skincodecss" rel="stylesheet"
	href="../css/layui-v2.3.0/css/modules/code.css" media="all">

</head>
	

<body>
	<div class="t-header js_header" id="header"></div>
	
	</div>
				<div id="more" class="main-cont main-album">

					<ul class="main-cont__list clearfix">
					<c:forEach items="${photos}" var="photo">
						<li class="item item-cur" ><a href="#" class="pic"> <img
								class="user-photo" src="${photo.address}" />
						</a>
							<div class="waterfall-hover">
								<span class="mask"></span>

								<button class="btn-white btn-like" <c:if test="${!empty sessionScope.user}">onclick="praisePoint(${photo.id})"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
								<button class="btn-white btn-comment" <c:if test="${!empty sessionScope.user}">onclick="collecteThisPhoto(${sessionScope.user.id},${photo.id})"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
							</div>
							<div class="waterfall-info">
								<p class="title">${photo.photoName }</p>
								<p class="icon">
									<span class="icon-star" id="collectionFlag${photo.id}">${photo.collectionFlag}</span>
									<span class="icon-like" id="photo${photo.id }">${photo.praisePoint}</span>
								</p>
							</div></li>
							</c:forEach>
					</ul>
			</div>
</body>

</html>
