<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html style="font-size: 57.8667px;">
	<head>
	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
		<title>我的相片</title>
		
		<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
		<link rel="stylesheet" href="css/photographers.css">
		<link rel="stylesheet" href="css/global.css">
		<link rel="stylesheet" href="css/center.css">
		<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
		<link rel="stylesheet" href="css/photographers.css">
		<link rel="stylesheet" href="css/global.css">
		<link rel="stylesheet" href="css/center.css">
		<script src="js/jquery-1.12.1.min.js" charset="utf-8"></script>
		<script src="js/header_footer.js"></script>
		<!-- <script src="js/replace/header_footer.js"></script> -->
		<script src="js/header_footer.js"></script>
		<script src="css/layui-v2.3.0/layui.js" charset="utf-8"></script>
	    <script src="js/vue.min.js"></script>
		<meta http-equiv="Cache-Control" content="no-cache,no-transform,no-siteapp">
		<meta property="og:type" content="acticle">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="dns-prefetch" href="//static.tantupix.com">
		<link rel="dns-prefetch" href="//www.tantupix.com">
		<link rel="dns-prefetch" href="//thumbimage.tantupix.com">
		<link rel="dns-prefetch" href="//oympf5rsi.bkt.clouddn.com">
		<link rel="dns-prefetch" href="//q.qlogo.cn">
		<link rel="dns-prefetch" href="//cdn.jsdelivr.net">
		<link href="css/layui-v2.3.0/css/layui.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/global.css">
		<link id="layuicss-laydate" rel="stylesheet" href="css/layui-v2.3.0/css/modules/laydate/default/laydate.css" media="all">
		<link id="layuicss-layer" rel="stylesheet" href="css/layui-v2.3.0/css/modules/layer/default/layer.css" media="all">
		<link id="layuicss-skincodecss" rel="stylesheet" href="css/layui-v2.3.0/css/modules/code.css" media="all">
		<!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
  <![endif] -->
        <script src="css/layui-v2.3.0/layui.all.js"></script>
	</head>
	<body>

 		<div class="t-header  js_header" id="header"></div>
		
		<!--背景图片和头像样式-->
		
		<div class="t-content" id="center">
		</div>
		
		

		<div class="layui-upload">
			<button  class="layui-btn" id="test2" type="button">上传图片到此相册</button>
			<button  class="layui-btn layui-btn-danger" onclick="delphoto();">删除选中图片</button>
			<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
				本次上传图片：
				<div class="layui-upload-list" id="demo2"></div>
				<input  type="hidden" id="btn"  class="layui-btn layui-btn-danger" value="确认上传">
			</blockquote>
		</div>
		

		<form action="" method="post" id="myphoto">
        <template v-for="photo in albums">
      
			<div style="float: left;margin-left:40px;" class="main-cont main-waterfall">
				  <input type="checkbox" name="delphotocheckbox" :value="photo.id" title="发呆" lay-skin="primary">
				<ul style="width:332px;height:282px;" class="main-cont__list clearfix">

					<li style="width:331px;height:281px;" style="margin-left:20px" class="item item-cur">

						<span class="pic">
								<img  style="width:330px;height:280px;" :src="photo.address" >
							</span>
						
					</li>

				</ul>
			</div>
</template>
		

			
		</form>

		
	
				<div class="t-align-center t-clear t-mt5" id="folderListPage"></div>
			</div>
		<div class="footer" id="footer"></div> 


	<input type="hidden" name="albumid" value="${albumid}">
	
	</body>
	
<script>

var v_myphoto = new Vue({
	el : '#myphoto',
	data : {
		messa : '',
		albums : [ {
			id : '',
			albumId : '',
			address : '',
			photoName : '',
			praisePoint : ''
		} ]
	}
});


window.onload = function() {
	var albumid;
	$.ajax({
		type : "POST",
		url : "/coolalbum/photo/albumphoto.action",
		dataType : "json",
		//contentType:"application/json",
		data : {
			"albumid":$("input[name='albumid']").val()
		},
		success : function(data) {
			console.log("recv message:" + JSON.stringify(data));
			v_myphoto.albums = data;
			console.log(" table value:" + JSON.stringify(v_myphoto.albums));
		},
		error : function(data, type, err) {
			console.log(type);
			console.log(err);
		}
	});
};



/* 
删除照片
*/
function  delphoto() {
	var aa =[];
	var albumid;
	$("input[name='delphotocheckbox']:checked").each(function(index,item)
	{
		aa.push($(this).val());
	}		
	)

	$.ajax({
		type : "POST",
		url : "/coolalbum/photo/delphoto.action",
		dataType : "json",
		//contentType:"application/json",
		data:{
			"cc":""+aa+"",
			"albumid":$("input[name='albumid']").val()
		},
		success : function(data) {
			console.log("recv message:" + JSON.stringify(data));
			v_myphoto.albums = data;
			console.log(" table value:" + JSON.stringify(v_myphoto.albums));
		},
		error : function(data, type, err) {
			console.log(type);
			console.log(err);
		}
	});
};







layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  var albumid;
  //多图片上传
  upload.render({
    elem: '#test2'
    ,url: '/coolalbum/photo/onloadphoto.action'
    ,multiple: true
    ,acceptMime: 'image/*'
    ,accept:'images'
    ,auto: false
    ,bindAction: '#btn'
    ,data:{
    	"albumid":$("input[name='albumid']").val()
    }
    ,choose: function(obj){
        obj.preview(function(index, file, result){
            $('#demo2').append('<img style="width:350px;height:280px;margin-left:20px;margin-top:20px;" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
          });
          document.getElementById("btn").type="button";
        }
        ,before: function(obj){
          //预读本地文件示例，不支持ie8
          document.getElementById("btn").type="hidden";
        }
        ,done: function(res){
      //上传完毕
    	v_myphoto.albums = res;
    	console.log(" table valueasdasd1:" + JSON.stringify(res));
    	console.log(" table valueasdasd2:" + JSON.stringify(v_myphoto.albums));
    }
  });
  
 
  
});





</script>
</html>

