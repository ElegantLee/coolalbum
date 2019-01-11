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

<title>SE空间-首页</title>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/myjs.js"></script>
<script src="js/jquery-1.12.1.min.js"></script>
<script src="js/script.js"></script>
<script src="js/vue.min.js"></script>
<script src="js/header_footer.js"></script>
<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
<link rel="stylesheet" href="css/global.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/center.css">
<link id="layuicss-laydate" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/laydate/default/laydate.css"
	media="all">
<link id="layuicss-layer" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/layer/default/layer.css"
	media="all">
<link id="layuicss-skincodecss" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/code.css" media="all">
<link id="layuicss-laydate" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/laydate/default/laydate.css"
	media="all">
<link id="layuicss-layer" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/layer/default/layer.css"
	media="all">
<link id="layuicss-skincodecss" rel="stylesheet"
	href="css/layui-v2.3.0/css/modules/code.css" media="all">
</head>

<body>
	<div class="t-header js_header" id="header"></div>

	<div class="main">
		<div class="main-inner body-width">
			<div class="banner clearfix">
				<div class="slider" id="slider">
					<ul class="slider-wrapper">
						<li class="item" data-title="这位上神！速速到我的本子里来"><a href="#"
							class="pic"><img src="images/cont/slider_img1.jpg" alt="#"></a>
						</li>
						<li class="item" data-title="想换上新衣去旅行！" data-author="by 占秋">
							<a href="#" class="pic"><img
								src="images/cont/slider_img2.jpg" alt="#"></a>
						</li>
						<li class="item" data-title="你的书写工具需要一个庇护所"
							data-author="by Moollly"><a href="#" class="pic"><img
								src="images/cont/slider_img3.jpg" alt="#"></a></li>
						<li class="item" data-title="气温起伏，一件外套保护你" data-author="by 郑南音">
							<a href="#" class="pic"><img
								src="images/cont/slider_img4.jpg" alt="#"></a>
						</li>
						<li class="item" data-title="鲜为人知的泰国小众小城——董里"><a href="#"
							class="pic"><img src="images/cont/slider_img5.jpg" alt="#"></a>
						</li>
					</ul>
					<a href="javascript:;" class="slider-prev"></a> <a
						href="javascript:;" class="slider-next"></a>

					<div class="slider-title">
						<h2></h2>
						<span></span>
					</div>
					<div class="slider-btns">
						<span class="item"></span> <span class="item"></span> <span
							class="item"></span> <span class="item"></span> <span
							class="item"></span>
					</div>
				</div>

				<div class="banner-info">
					<div class="news body-border">
						<ul>
							<li class="title">社区热点</li>
							<li class="link"><a href="#">冬天</a> <span></span> <a
								href="#">把生活过成一首诗</a> <span></span> <a href="#">早餐</a> <span></span>
								<a href="#">记下时间走过的路</a> <span></span> <a href="#">穿搭</a> <span></span>
								<a href="#">家居</a> <span></span> <a href="#">原创</a> <span></span>
							</li>
							<li class="choose"><a href="#">『人气连衣裙精选』 大合集</a> <span
								class="icon-text__pink">精选</span></li>
						</ul>
					</div>
				</div>
			</div>
				<div id="scenery" class="main-cont main-album">
					<div class="main-cont__title">
						<h3>风景</h3>
						<a href="photo/querymore.action?albumType=风景&userId=${sessionScope.user.id}" class="more">更多 ></a>
					</div>

					<ul class="main-cont__list clearfix">
					<template v-for="photo in photos">
						<li class="item item-cur"><a href="#" class="pic"> <img
								class="user-photo" :src="photo.address" />
						</a>
							<div class="waterfall-hover">
								<span class="mask"></span>

								<button class="btn-white btn-like" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['praisePoint('+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
								<button class="btn-white btn-comment" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['collecteThisPhoto(${sessionScope.user.id},'+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
							</div>
							<div class="waterfall-info">
								<p class="title">{{photo.photoName}}</p>
								<p class="icon">
									<span class="icon-star" v-bind:id="['collectionFlag'+photo.id]">{{photo.collectionFlag}}</span>
									<span class="icon-like" v-bind:id="['photo'+photo.id]">{{photo.praisePoint}}</span>
								</p>
							</div></li>
						</template>
					</ul>
			</div>





			<div id="car" class="main-cont main-album">
				<div class="main-cont__title">
					<h3>汽车</h3>
					<a href="photo/querymore.action?albumType=汽车&userId=${sessionScope.user.id}" class="more">更多 ></a>
				</div>
				<ul class="main-cont__list clearfix">
					<li class="item item-cur" v-for="photo in photos"><a href="#" class="pic"> <img
							class="user-photo" :src="photo.address" alt="#">
					</a>
						<div class="waterfall-hover">
							<span class="mask"></span>
							<button class="btn-white btn-like" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['praisePoint('+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
							<button class="btn-white btn-comment" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['collecteThisPhoto(${sessionScope.user.id},'+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
						</div>
						<div class="waterfall-info">
							<p class="title">{{photo.photoName}}</p>
							<p class="icon">
								<span class="icon-star" v-bind:id="['collectionFlag'+photo.id]">{{photo.collectionFlag}}</span>
								<span class="icon-like" v-bind:id="['photo'+photo.id]">{{photo.praisePoint}}</span>
							</p>
						</div></li>
				</ul>
			</div>

			<div id="person" class="main-cont main-album">
				<div class="main-cont__title">
					<h3>人物</h3>
					<a href="photo/querymore.action?albumType=人物&userId=${sessionScope.user.id}" class="more">更多 ></a>
				</div>
				<ul class="main-cont__list clearfix">
					<li class="item item-cur" v-for="photo in photos"><a href="#" class="pic"> <img
							class="user-photo" :src="photo.address" alt="#">
					</a>
						<div class="waterfall-hover">
							<span class="mask"></span>
							<button class="btn-white btn-like" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['praisePoint('+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
							<button class="btn-white btn-comment" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['collecteThisPhoto(${sessionScope.user.id},'+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
						</div>
						<div class="waterfall-info">
							<p class="title">{{photo.photoName}}</p>
							<p class="icon">
								<span class="icon-star" v-bind:id="['collectionFlag'+photo.id]">{{photo.collectionFlag}}</span>
								<span class="icon-like" v-bind:id="['photo'+photo.id]">{{photo.praisePoint}}</span>
							</p>
						</div></li>
				</ul>
			</div>
			
			<div id="food" class="main-cont main-album">
				<div class="main-cont__title">
					<h3>美食</h3>
					<a href="photo/querymore.action?albumType=美食&userId=${sessionScope.user.id}" class="more">更多 ></a>
				</div>
				<ul class="main-cont__list clearfix">
					<li class="item item-cur" v-for="photo in photos"><a href="#" class="pic"> <img
							class="user-photo" :src="photo.address" alt="#">
					</a>
						<div class="waterfall-hover">
							<span class="mask"></span>
							<button class="btn-white btn-like" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['praisePoint('+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
							<button class="btn-white btn-comment" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['collecteThisPhoto(${sessionScope.user.id},'+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
						</div>
						<div class="waterfall-info">
							<p class="title">{{photo.photoName}}</p>
							<p class="icon">
								<span class="icon-star" v-bind:id="['collectionFlag'+photo.id]">{{photo.collectionFlag}}</span>
								<span class="icon-like" v-bind:id="['photo'+photo.id]">{{photo.praisePoint}}</span>
							</p>
						</div></li>
				</ul>
			</div>

			<div id="other" class="main-cont main-album">
				<div class="main-cont__title">
					<h3>其他</h3>
					<a href="photo/querymore.action?albumType=其它&userId=${sessionScope.user.id}" class="more">更多 ></a>
				</div>
				<ul class="main-cont__list clearfix" >
					<li class="item item-cur"  v-for="photo in photos"><a href="#" class="pic"> <img
							class="user-photo" :src="photo.address" alt="#">
					</a>
						<div class="waterfall-hover">
							<span class="mask"></span>
							<button class="btn-white btn-like" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['praisePoint('+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
							<button class="btn-white btn-comment" <c:if test="${!empty sessionScope.user}">v-bind:onclick="['collecteThisPhoto(${sessionScope.user.id},'+photo.id+')']"</c:if><c:if test="${empty sessionScope.user}">onclick="window.location.href='dispatcher/login.action'"</c:if>></button>
						</div>
						<div class="waterfall-info">
							<p class="title">{{photo.photoName}}</p>
							<p class="icon">
								<span class="icon-star" v-bind:id="['collectionFlag'+photo.id]">{{photo.collectionFlag}}</span>
								<span class="icon-like" v-bind:id="['photo'+photo.id]">{{photo.praisePoint}}</span>
							</p>
						</div></li>
				</ul>
				
			</div>
			
			<div class="footer" id="footer"></div>
</body>
<script>
				var v_scenery = new Vue({
					el : '#scenery',
					data : {
						photos : [ {
							id : '',
							albumId : '',
							address : '',
							photoName : '',
							praisePoint : '',
							collectionFlag:''
						} ]
					}
				});
				var v_person = new Vue({
					el : '#person',
					data : {
						photos : [ {
							id : '',
							albumId : '',
							address : '',
							photoName : '',
							praisePoint : '',
							collectionFlag:''
						} ]
					}
				});
			var v_food = new Vue({
					el : '#food',
					data : {
						photos : [ {
							id : '',
							albumId : '',
							address : '',
							photoName : '',
							praisePoint : '',
							collectionFlag:''
						} ]
					}
				});
				var v_car = new Vue({
					el : '#car',
					data : {
						photos : [ {
							id : '',
							albumId : '',
							address : '',
							photoName : '',
							praisePoint : '',
							collectionFlag:''
						} ]
					}
				});
				var v_other = new Vue({
					el : '#other',
					data : {
						photos : [ {
							id : '',
							albumId : '',
							address : '',
							photoName : '',
							praisePoint : '',
							collectionFlag:''
						} ]
					}
				});
				function queryScenery(){
					var album = new Object();
					album.userId='${sessionScope.user.id}';
					album.albumType = "风景";
					console.log("send message:" + JSON.stringify(album));
					$.ajax({
						type : "POST",
						url : "/coolalbum/photo/queryscenery.action",
						dataType : "json",
						//contentType:"application/json",
						data : album,
						success : function(data) {
							console.log("recv message:" + JSON.stringify(data));
							v_scenery.photos = data;
							console.log(" table value:" + JSON.stringify(v_scenery.photos));
						},
						error : function(data, type, err) {
							console.log(type);
							console.log(err);
						}
					});
				}
				function queryPerson(){
					var album = new Object();
					album.userId='${sessionScope.user.id}';
					album.albumType = "人物";
					console.log("send message:" + JSON.stringify(album));
					$.ajax({
						type : "POST",
						url : "/coolalbum/photo/queryperson.action",
						dataType : "json",
						//contentType:"application/json",
						data : album,
						success : function(data) {
							console.log("recv message:" + JSON.stringify(data));
							v_person.photos = data;
							console.log(" table value:" + JSON.stringify(v_scenery.photos));
						},
						error : function(data, type, err) {
							console.log(type);
							console.log(err);
						}
					});
				}
				function queryFood(){
					var album = new Object();
					album.userId='${sessionScope.user.id}';
					album.albumType = "美食";
					console.log("send message:" + JSON.stringify(album));
					$.ajax({
						type : "POST",
						url : "/coolalbum/photo/queryfood.action",
						dataType : "json",
						//contentType:"application/json",
						data : album,
						success : function(data) {
							console.log("recv message:" + JSON.stringify(data));
							v_food.photos = data;
							console.log(" table value:" + JSON.stringify(v_scenery.photos));
						},
						error : function(data, type, err) {
							console.log(type);
							console.log(err);
						}
					});
				}
				function queryCar(){
					var album = new Object();
					album.userId='${sessionScope.user.id}';
					album.albumType = "汽车";
					console.log("send message:" + JSON.stringify(album));
					$.ajax({
						type : "POST",
						url : "/coolalbum/photo/querycar.action",
						dataType : "json",
						//contentType:"application/json",
						data : album,
						success : function(data) {
							console.log("recv message:" + JSON.stringify(data));
							v_car.photos = data;
							console.log(" table value:" + JSON.stringify(v_scenery.photos));
						},
						error : function(data, type, err) {
							console.log(type);
							console.log(err);
						}
					});
				}
				function queryOther(){
					var album = new Object();
					album.userId='${sessionScope.user.id}';
					album.albumType = "其它";
					console.log("send message:" + JSON.stringify(album));
					$.ajax({
						type : "POST",
						url : "/coolalbum/photo/queryother.action",
						dataType : "json",
						//contentType:"application/json",
						data : album,
						success : function(data) {
							//console.log("recv message:" + JSON.stringify(data));
							v_other.photos = data;
							//console.log(" table value:" + JSON.stringify(v_scenery.photos));
						},
						error : function(data, type, err) {
							console.log(type);
							console.log(err);
						}
					});
				}
				window.onload = function() {
					queryScenery();
					queryPerson();
					queryFood();
					queryCar();
					queryOther();
				};
				
				
			</script>
</html>
