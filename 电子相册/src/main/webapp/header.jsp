<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<base href="<%=basePath%>">
<html>
<div class="t-nav-wrap">
	<form action="photo/search.action" method="post">
		<div class="t-nav-hd">
			<a href="index.jsp" class="t-nav-logo"></a> <i
				class="t-nav-toggle collapsed layui-icon layui-icon-more-vertical"></i>
		</div>
		<div class="t-nav-collapse t-clear">
			<ul class="t-nav t-nav-left" itemprop="breadcrumb">
				<li class="t-nav-item"><a href="index.jsp">首页</a></li>
			</ul>

			<ul class="t-nav t-nav-right">
				<li style="margin-right: 30px; margin-top: 13px;"
					class="t-nav-item t-nav-item-arrow"><select
					class="search-type" name="searchType" lay-filter="aihao">
						<option value="0" selected="">按相片名</option>
						<option value="1">按相册名</option>
				</select></li>

				<!-- 未登录的状态 -->
				<c:if test="${empty user}">
					<li style="margin-right: 20px;" class="t-nav-item t-nav-item-arrow"><a
						href="dispatcher/login.action">登录</a></li>
					<li style="margin-right: 20px;" class="t-nav-item t-nav-item-arrow"><a
						href="dispatcher/register.action">注册</a></li>
				</c:if>

				<!-- 登入后的状态 -->
				<c:if test="${!empty user}">
					<li style="margin-right: 20px;" class="t-nav-item t-nav-item-arrow">
						<a href="javascript:void(0);"> <span class="t-nav-img-wrap">
								<span
								style="background:url(${sessionScope.user.avar}) center center/cover no-repeat"
								class="t-nav-img"> </span>${sessionScope.user.userName }
						</span>
					</a>
						<dl class="t-nav-child">
							<dd>
								<a href="dispatcher/album.action">个人主页</a>
							</dd>
							<dd>
								<a href="dispatcher/setting.action">资料设置</a>
							</dd>
							<dd>
								<a href="user/logout.action">安全退出</a>
							</dd>
						</dl>
					</li>
				</c:if>

			</ul>

			<div class="t-common-search-header t-right">
				<div class="t-common-search-container">
					<input id="search_kw" placeholder="搜索感兴趣的内容" name="content">
					<div class="t-common-search-line"></div>
					<div class="t-common-search-icon" onclick="searchEnter()">
						<input id="commit" type="submit" style="display:none">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
	function searchEnter(){
		document.getElementById("commit").click();
	}
</script>
</html>

