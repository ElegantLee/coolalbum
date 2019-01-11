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
		<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
		<link rel="stylesheet" href="css/photographers.css">
		<link rel="stylesheet" href="css/global.css">
		
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
					<div class="layui-container"> <span class="layui-btn t-bg-rose t-mb5" onclick="Global.addFavorite(1,Photographers.getFolderOrFavoriteLists)">添加收藏夹</span>
						<div class="layui-row layui-col-space20" id="favoriteList"><a href="/photographers/670504/favorite?favorite_id=671155&amp;favorite_name=默认收藏夹"
							 class="layui-col-lg4 layui-col-md4 layui-col-sm6 layui-col-xs12">
								<div class="folder-item">

									<div class="default-thumb">
										<span class="folder-item-cover lazy-img" style="background: url(&quot;https://thumbimage.tantupix.com/thumb_u/3089/201808131553201Uhz7D5vFbbSn.jpg-h500?_=&quot;) center center / cover no-repeat;"
										 data-src="https://thumbimage.tantupix.com/thumb_u/3089/201808131553201Uhz7D5vFbbSn.jpg-h500?_="></span>
									</div>
									<div class="folder-item-bd">
										<h2 class="name">默认收藏夹</h2>
										<p class="count">2张图片</p>
									</div>
								</div>
							</a></div>
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
</html>

