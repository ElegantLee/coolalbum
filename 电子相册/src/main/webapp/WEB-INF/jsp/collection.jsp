<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
	<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>我的收藏</title>
		<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/center.css">
		<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
		<link rel="stylesheet" href="css/photographers.css">
		<link rel="stylesheet" href="css/global.css">
		<script src="js/myjs.js"></script>
		<script src="js/vue.min.js"></script>
		<script src="js/jquery-1.12.1.min.js"></script>
		<script src="js/header_footer.js"></script>
	</head>
	<body>
		<div class="t-header  js_header" id="header"></div>
		
		<div class="t-content" id="center"></div>
		
		<div class="photographer-detail-bd js_photographer_detail_bd">
			<input type="hidden" id="to_user_id" value="670504">
			<div class="favorite-list">
				<div class="js_favorite_list" data-type="products">
					<div class="layui-container"> <span class="layui-btn t-bg-rose t-mb5" onclick="Global.addFavorite(1,Photographers.getFolderOrFavoriteLists)"></span>
						<div class="layui-row layui-col-space20" id="favoriteList">
						<div id="collection" class="main-cont main-album">
					<div class="main-cont__title">
					</div>

					<ul class="main-cont__list clearfix">
					<template v-for="photo in photos">
						<li class="item item-cur"><a href="#" class="pic"> <img
								class="user-photo" :src="photo.address" />
						</a>
							<div class="waterfall-hover">
								<span class="mask"></span>

								<button class="btn-white btn-comment" v-bind:onclick="['collecteThisPhoto(${sessionScope.user.id},'+photo.id+')']"></button>
							</div>
							<div class="waterfall-info">
								<p class="title">{{photo.photoName}}</p>
								<p class="icon">
									<span class="icon-star" v-bind:id="['collectionFlag'+photo.id]">{{photo.collectionFlag}}</span>
								</p>
							</div></li>
						</template>
					</ul>
			</div>
							</div>
						<div class="t-align-center t-clear t-mt5" id="favoriteListPage"></div>
					</div>
				</div>
				<div class="js_favorite_list t-hide" data-type="articles">
					<div class="layui-container">
						<div class="article-list layui-row layui-col-space20" id="favoritesArticleList" style="padding-top:0">
							<div class="empty-status-box">
								<i class="icon-empty-state"></i>
								<p class="tips">暂无收藏的图文</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer" id="footer"></div>
	</body>
	<script type="text/javascript">
	var v_collection = new Vue({
					el : '#collection',
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
		var collection=new Object();
		collection.userId=${sessionScope.user.id};
		$.ajax({
		type : "POST",
		url : "/coolalbum/collection/querycollection.action",
		dataType : "json",
		//contentType:"application/json",
		data : collection,
		success : function(data) {
			console.log("recv message:" + JSON.stringify(data));
			v_collection.photos=data;
			console.log(" table value:" + JSON.stringify(v_collection.photos));
		},
		error : function(data, type, err) {
			console.log(type);
			console.log(err);
		}
	});
	</script>
</html>