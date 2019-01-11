<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>我的相册</title>
<link rel="stylesheet" href="css/layui-v2.3.0/css/layui.css">
<link rel="stylesheet" href="css/photographers.css">
<link rel="stylesheet" href="css/global.css">

<script src="js/jquery-1.12.1.min.js"></script>
<script src="js/header_footer.js"></script>
</head>

<body>
	<div class="t-header  js_header" id="header"></div>

	<div class="t-content" id="center"></div>
	<div style="height:100px;"></div>
	<div style="width: 320px; height:400px; margin-left: 40%;">
		<form class="layui-form layui-form-pane" action="photo/queryscenery1.action">

			<div class="layui-form-item">
				<label class="layui-form-label">相册名</label>
				<div class="layui-input-inline">
					<input name="albumname" class="layui-input" type="text"
						placeholder="请输入" autocomplete="off" lay-verify="required">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">类别</label>
				<div style="width:190px;" class="layui-input-block">
					<select name="albumtype" lay-filter="aihao" style="display:none">
						<option value="风景">风景</option>
						<option value="人物">人物</option>
						<option value="美食">美食</option>
						<option value="汽车">汽车</option>
						<option value="其他">其他</option>
					</select>

				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">权限</label>
				<div style="width:190px;" class="layui-input-block">
					<select name="secreRank" id="ShowWithPassword"
						lay-filter="ShowWithPassword" style="display:none">
						<option value="公开">公开</option>
						<option value="秘密公开">秘密公开</option>
						<option value="保密">保密</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item " id="test1">

				<div class="layui-input-inline" id="AlbumPassword"></div>
			</div>



			<div style="text-align: center;" class="layui-form-item">
				<button class="layui-btn" >提交</button>
			</div>



		</form>
	</div>

	<div class="footer" id="footer"></div>
</body>
<script src="css/layui-v2.3.0/layui.all.js"></script>
<script>

layui.use(['form'], function() {
         form=layui.form;
form.on('select(ShowWithPassword)', function(data){   
	if(document.getElementById("ShowWithPassword").value=="秘密公开"){
    document.getElementById("AlbumPassword").innerHTML="<input name='a' class='layui-input' type='text' placeholder='请设置密码' autocomplete='off' lay-verify='required' />";
   }else{

   document.getElementById("AlbumPassword").innerHTML=" ";
   }
	});
});




layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [
      /^[\S]{6,12}$/
      ,'密码必须6到12位，且不能出现空格'
    ]
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    })
    return false;
  });
 
  //表单初始赋值
  form.val('example', {
    "username": "贤心" // "name": "value"
    ,"password": "123456"
    ,"interest": 1
    ,"like[write]": true //复选框选中状态
    ,"close": true //开关状态
    ,"sex": "女"
    ,"desc": "我爱 layui"
  })
  
  
});

</script>
</html>
