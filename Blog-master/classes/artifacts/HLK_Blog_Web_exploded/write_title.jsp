<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
request.setAttribute("path", basePath);  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'msg_publish.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <!-- 引入 layui.css -->
	  <!-- 引入 layui.css -->
	  <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css"/>

	  <!-- 引入 layui.js -->
	  <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
	<script type="text/javascript" src="ueditor/ueditor.config.js"></script>	 
    <script type="text/javascript" src="ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="js/Calendar3.js"></script>
    <style>
    	#messageBox {
    		width:80%;
    		height:auto;
    		margin-left:5%;
    	}
    </style>
  </head>
  	
  <body>
  	<div id="messageBox">

		<form class="layui-form layui-form-pane"  action="servlet/WriteTitServlet" method="post">
			<div class="layui-form-item">
				<label class="layui-form-label">文章标题</label>
				<div class="layui-input-block">
					<input type="text" lay-verify="required" id="title1" name="article" autocomplete="off" placeholder="请输入标题" class="layui-input">
				</div>
			</div>
<%--	  <p>文章标题：--%>
<%--	    <input type="text" name="article" size="50"/>--%>
<%--	  </p>--%>
			<div class="layui-form-item">
				<label class="layui-form-label">文章内容</label>
				<div class="layui-input-block">
					<textarea name="content" lay-verify="required" id="myEditor"></textarea>
					<script type="text/javascript">
						UEDITOR_CONFIG.UEDITOR_HOME_URL = './ueditor/';
						UE.getEditor('myEditor');
					</script>
				</div>
			</div>
<%--	  <p>文章内容：</p>--%>
<%--	  <div>--%>
<%--	  --%>
<%--	  </div>--%>
			<div class="layui-form-item">
				<label class="layui-form-label">文章摘要</label>
				<div class="layui-input-block">
					<textarea name="summary" lay-verify="required" id="sy" rows="5" cols="40" class="layui-textarea">
	  </textarea>
				</div>
			</div>
<%--			<br/>--%>
<%--	    文章摘要：<br/>--%>
<%--	  <textarea name="summary" rows="5" cols="40">--%>
<%--	  </textarea>--%>

			<div class="layui-form-item">
				<label class="layui-form-label">文章标签</label>
				<div class="layui-input-block">
					<input type="radio" name="label" value="1" title="python" checked="">
					<input type="radio" name="label" value="2" title="java">
					<input type="radio" name="label" value="3" title="c/c++" >
					<input type="radio" name="label" value="4" title="前端">
					<input type="radio" name="label" value="5" title="数据库">
					<input type="radio" name="label" value="6" title="计算机基础">
					<input type="radio" name="label" value="7" title="AI">
					<input type="radio" name="label" value="8" title="移动">
					<input type="radio" name="label" value="9" title="区块链">
					<input type="radio" name="label" value="10" title="其他">
<%--					<input type="radio" name="python" value="python" title="python" checked="">--%>
<%--					<input type="radio" name="java" value="java" title="java">--%>
<%--					<input type="radio" name="c/c++" value="c/c++" title="c/c++" >--%>
<%--					<input type="radio" name="前端" value="前端" title="前端">--%>
<%--					<input type="radio" name="数据库" value="数据库" title="数据库">--%>
<%--					<input type="radio" name="计算机基础" value="计算机基础" title="计算机基础">--%>
<%--					<input type="radio" name="AI" value="AI" title="AI">--%>
<%--					<input type="radio" name="移动" value="移动" title="移动">--%>
<%--					<input type="radio" name="区块链" value="区块链" title="区块链">--%>
<%--					<input type="radio" name="其他" value="其他" title="其他">--%>
<%--					--%>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">日期选择</label>
				<div class="layui-input-block">
					<input type="text" name="data" lay-verify="required" id="date1" autocomplete="off" class="layui-input">
				</div>
			</div>
<%--	  <br/><br/>--%>
<%--	       写作日期:--%>
<%--	  <input name="data" type="text" size="10"--%>
<%--      maxlength="10" onclick="new Calendar().show(this);" readonly="readonly" />--%>
      <br/>
	  <p align="center">
	    <input class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal" type="submit" lay-filter="demo1" lay-submit="" value="提交" />
	    <input class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal" type="reset" value="重置" />
		  <input class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal" onclick="draft()" type="button" value="存草稿" />
<%--		  location.href='${path}draft--%>
	  </p>
	  </form>
	</div>
  <script>
	  function draft(){
	  	var article=document.getElementById("title1").value;
		  var content=UE.getEditor('myEditor').getContent();
		  var summary=document.getElementById("sy").value;
		  var data=document.getElementById("date1").value;
		  var label;

		  var radio=document.getElementsByName("label");
		  for(var i=0;i<radio.length;i++){
		  	if(radio[i].checked==true){
           label=radio[i].value;
          break;
			 }

		  }
console.log(content);
console.log(summary)
		  window.location.href="<%=request.getContextPath()%>/draft?article="+article+"&content="+content+"&summary="+summary+"&data="+data+"&label="+label
	  }

	  layui.use(['form', 'layedit', 'laydate'], function(){
	  	var laydate = layui.laydate;
		  var form = layui.form;
		  var layer = layui.layer;
		  laydate.render({
			  elem: '#date'
		  });
		  laydate.render({
			  elem: '#date1'
		  });
		  form.on('submit(demo1)', function(data){
			  layer.alert(JSON.stringify(data.field), {
				  title: '最终的提交信息'
			  })

		  });

	  })
  </script>
  </body>
</html>