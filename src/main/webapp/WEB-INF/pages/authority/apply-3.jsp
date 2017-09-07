<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<%@include file="/WEB-INF/includes/commons_css.jsp"%>
<style>
#footer {
	padding: 15px 0;
	background: #fff;
	border-top: 1px solid #ddd;
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/includes/navigate_bar.jsp"%>
	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h1>实名认证 - 申请</h1>
		</div>

		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation"><a href="#"><span class="badge">1</span>
					基本信息</a></li>
			<li role="presentation"><a href="#"><span class="badge">2</span>
					资质文件上传</a></li>
			<li role="presentation"><a href="#"><span class="badge">3</span>
					邮箱确认</a></li>
			<li role="presentation" class="active"><a href="#"><span
					class="badge">4</span> 申请确认</a></li>
		</ul>

		<form role="form" style="margin-top: 20px;">
			<div class="form-group">
				<label for="exampleInputEmail1">验证码</label> <input type="text"
					class="form-control" id="exampleInputEmail1"
					placeholder="请输入你邮箱中接收到的验证码">
					<!-- 将session中的验证码存入此隐藏输入框，用以在js中校对验证码是否正确 -->
					<input id="checkCode" type="hidden" value="${code }" />
					
			</div>
			<button type="button" onclick="javascript:;" class="btn btn-primary">重新发送验证码</button>
			<button type="button" id="applyCompleteBtn" 
				class="btn btn-success">申请完成</button>
		</form>
		<hr>
	</div>
	<%@include file="/WEB-INF/includes/tailbar.jsp" %>
	<%@include file="/WEB-INF/includes/commons_js.jsp" %>
	<script>
		$("#applyCompleteBtn").click(function(){
			var code = $("#checkCode").val();
			var inputCode = $("#exampleInputEmail1").val();
			console.log(code + "/" + inputCode);
			if(code == inputCode){
				//验证码正确跳转到成功页面
				location.href = "${App_path}/tosuccess.html";
			}else{
				layer.msg("验证码错误，请重新输入");
			}
		});
	</script>
</body>
</html>