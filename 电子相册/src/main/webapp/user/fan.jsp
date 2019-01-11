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
		<title>我的粉丝</title>
		<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
		<link rel="stylesheet" href="css/photographers.css">
		<link rel="stylesheet" href="css/global.css">
		
		<script src="js/jquery-1.12.1.min.js"></script>
		<script src="js/header_footer.js"></script>
	</head>
	<body>
		<div class="t-header  js_header" id="header"></div>
		
		<div class="t-content" id="center"></div>
			
		<div class="photographer-detail-bd js_photographer_detail_bd"><input type="hidden" id="to_user_id" value="670504">
			<div class="layui-container photographer-list">
				<div class="layui-row layui-col-space20" id="follows-list">
					<div class="layui-col-lg3 layui-col-md3 layui-col-sm4 layui-col-xs12">
						<div class="photographer-item">
							<div class="photographer-item-bd">
								<a href="/photographers/1657/product" target="_blank" rel="noreferrer noopener">
									<div class="photographer-item-avatar lazy-img" style="background: url(&quot;https://static.tantupix.com/ty/avatar/u/1657/20180301222751FStmfy&quot;) center center / cover no-repeat;"
									 data-src="https://static.tantupix.com/ty/avatar/u/1657/20180301222751FStmfy"></div>
									<h2 class="nickname">关注的username</h2>
								</a>
								<div class="statistic">
									<span class="t-mr2">作品 59</span>
									<span class="t-mr2">人气 8364</span>
									<span>粉丝 379</span>
								</div>
								<a class="default-thumb" href="/photographers/1657/product" target="_blank" rel="noreferrer noopener">
									<div class="photographer-item-cover lazy-img" style="background: url(&quot;https://static.tantupix.com/static/banner/ub1920x436.jpg-min400x300&quot;) center center / cover no-repeat;"
									 data-src="https://static.tantupix.com/static/banner/ub1920x436.jpg-min400x300"></div>
								</a>
								<span class="t-mt3 follow-btn js_follow_btn followed" data-id="1657" data-type="0">已关注</span>
							</div>
						</div>
					</div>
					<div class="layui-flow-more">没有更多关注的朋友啦！</div>
				</div>
			</div>
		</div>
		
		<div class="footer" id="footer"></div>
	</body>
</html>
