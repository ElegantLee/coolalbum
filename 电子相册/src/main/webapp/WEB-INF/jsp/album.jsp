<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<title>我的相册</title>
		<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
	    <link rel="stylesheet" href="css/layui-v2.3.0/css/modules/layer/default/layer.css">
		<link rel="stylesheet" href="css/photographers.css">
		<link rel="stylesheet" href="css/global.css">
		<script src="css/layui-v2.3.0/layui.all.js"></script>
		<script src="js/vue.min.js"></script>
		<script src="js/jquery-1.12.1.min.js"></script>
		<script src="js/header_footer.js"></script>

  </head>
  
  <body>
		<div class="t-header  js_header" id="header"></div>
		
		<div class="t-content" id="center"></div>
		
				<div class="photographer-detail-bd js_photographer_detail_bd">
			<input type="hidden" id="to_user_id" value="670504">
			<div class="layui-container">
			<a href="dispatcher/new_album.action">
				<span class="layui-btn t-bg-rose t-mb5" >添加相册</span>
				
				</a>
				<div id="album" class="layui-row layui-col-space20" id="folderList">
					
			
			
				<template  v-for="al in albums">
					
						<div style="width:330px;margin-left:30px;margin-top:20px;background:rgba(0,0,0,0,0);" class="layui-col-lg4 layui-col-md4 layui-col-sm6 layui-col-xs12">
						<div class="folder-item">
							<div  class="folder-item-operate">
								<!-- <a  :href="'photo/delalbum.action?del='+al.id"> -->
								<button style="background:rgba(0, 0, 0, 0); " :onclick="'del('+al.id+')'"> 
								<span class="js_del_folder icon-operate icon-operate-del" title="点击删除" data-id="672552" data-name="666"></span>
                               	</button>		
								<!-- </a> -->
							<!-- 	<a  href="dispatcher/myphoto.action"> -->
							<button style="background:rgba(0, 0, 0, 0); " :onclick="'edit('+al.id+')'"> 
								<span class="js_edit_folder icon-operate icon-operate-edit" title="点击编辑" data-id="672552" data-name="666"
								 data-secrecy="0"></span>
								 </button>
								<!--  </a> -->
							</div>
							<a  :href="'dispatcher/myphoto.action?albumid='+al.id">
							<div class="default-thumb" style="height:250px;width:330px;background:rgba(0,0,0,0,0);">
								
								<span class="folder-item-cover lazy-img" style="background: url(images/album_face.png) center center / cover no-repeat;width:330px;height:250px;"
								 data-src="https://thumbimage.tantupix.com/u/670504/20190102155601I7bC6V40f56d.jpg-h500?_="></span>
							   
							</div>
							 </a>
							 
							 
							 
							 
							 
							 
							 
							<div style="padding:0px" class="folder-item-bd" id="editor">
								             <h1>{{al.albumName}}</h1>
								             <h3><span style="color:cyan">{{al.photoNum}}</span>张图片</h3>
								             <h3 >{{al.secreRank}}</h3>
							</div>
							
							<div  :id="al.id">
								
							</div>
							
							
							
						</div>
						<input type="hidden" v-model="al.id" name="del">
						</div>
					
					</template>
					
					
					
					
				</div>
				<div class="t-align-center t-clear t-mt5" id="folderListPage"></div>
			</div>
		</div>
	
	
		<div class="footer" id="footer"></div>
		  <input type="checkbox" name="delphotocheckbox" title="发呆" lay-skin="primary">
		  
		  <button onclick="test();">测试</button>
	</body>
	
	
	
	<script>
				var v_scenery = new Vue({
					el : '#album',
					data : {
						messa : 'images/妹儿.jpg',
						albums : [ {
							id : '',
							userId : '',
							albumName : '',
							secreRank : '',
							albumPassword : '',
							albumType:'',
						    photoNum:''
						} ]
					}
				});

				/*  删除相册 */
				 function  del(aa){
					 var albumid;
					 console.log("send message:" + JSON.stringify(albumid));
					 $.ajax({
							type : "POST",
							url : "/coolalbum/photo/delalbum.action",
							dataType : "json",
							//contentType:"application/json",
							data :{
								"albumid":aa
							},
							success : function(data) {
								console.log("recv message:" + JSON.stringify(data));
								v_scenery.albums = data;
								layer.msg('删除成功！');
								console.log(" table value:" + JSON.stringify(v_scenery.albums));
							},
							error : function(data, type, err) {
								console.log(type);
								console.log(err);
								layer.msg('删除失败！');
							}
						});
				 } 
			/* 初始化本页面 */
				window.onload = function() {
				layer.msg('欢迎来到你的相册');
					var album = new Object();
					album.albumType = "风景";
					console.log("send message:" + JSON.stringify(album));
					$.ajax({
						type : "POST",
						url : "/coolalbum/photo/queryalbum.action",
						dataType : "json",
						//contentType:"application/json",
						data : album,
						success : function(data) {
							console.log("recv message:" + JSON.stringify(data));
							v_scenery.albums = data;
							console.log(" table value:" + JSON.stringify(v_scenery.albums));
						},
						error : function(data, type, err) {
							console.log(type);
							console.log(err);
						}
					});
				};
				
				
				
			/* 	layui.use(['form'], function() {
			         form=layui.form; */
		/* 	form.on('select(ShowWithPassword)',  */
				/* 	修改相册名字 */
				function edit(data){   
			    document.getElementById(data).innerHTML="<input name='a' class='layui-input' type='text' placeholder='输入要更改的相册名' autocomplete='off' lay-verify='required' /></br><button class='layui-btn' onclick='editor("+data+")' >提交</button>";
			    
		}
				/* 	修改相册名字 */
		function editor(data){
			var albumid;
			var name;
			 $.ajax({
					type : "POST",
					url : "/coolalbum/photo/editalbum.action",
					dataType : "json",
					//contentType:"application/json",
					data :{
						"albumid":data,
						"name":$("input[name='a']").val()
					},
					success : function(data1) {
						console.log("recv message:" + JSON.stringify(data1));
						v_scenery.albums = data1;
						document.getElementById(data).innerHTML="";
						layer.msg('修改成功！');
						console.log(" table value:" + JSON.stringify(v_scenery.albums));
					},
					error : function(data, type, err) {
						console.log(type);
						console.log(err);
						layer.msg('修改失败！');
					}
				}); 
		}
				
				
				
		/* 		);
			}); */
			</script>
</html>
