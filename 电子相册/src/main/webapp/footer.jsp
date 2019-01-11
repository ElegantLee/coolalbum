<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<div class="layui-container">
	<div class="layui-row layui-col-space20 t-mt3 t-mb3">
		<div class="layui-col-lg4 layui-col-md3 layui-col-sm12">
			<h4>SE空间 - 可分享、记录生活点滴的温暖空间</h4>
			<p>SE空间是一个以图会友的原创电子相册，致力于相片的发现、分享，是热爱生活的人的聚集地。</p>
		</div>
		<div class="layui-col-lg5 layui-col-md5 layui-col-sm12 footer-qrcode">
			<h4>打赏一下</h4>
			<ul class="free-qrcode-list">
				<li><img src="images/QRCode/qrcode_1547124617697.png" alt="">
					<p>微信</p>
				</li>
				<li><img src="images/QRCode/qrcode_2019011020495.png" alt="">
					<p>QQ</p>
				</li>
				<li><img src="images/QRCode/1547124637553.png" alt="">
					<p>支付宝</p>
				</li>
			</ul>
		</div>
	</div>
</div>
