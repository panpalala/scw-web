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
			<li role="presentation" class="active"><a href="#"><span
					class="badge">3</span> 邮箱确认</a></li>
			<li role="presentation"><a href="#"><span class="badge">4</span>
					申请确认</a></li>
		</ul>

		<form role="form" style="margin-top: 20px;" method="post">
			<div class="form-group">
				<label for="exampleInputEmail1">邮箱地址</label> <input type="text"
					class="form-control" id="exampleInputEmail1" name="email"
					value="${loginUser.email }">
			</div>
			<button type="button" onclick="window.location.href='${App_path}/toapply-1.html'"
				class="btn btn-default">上一步</button>
			<button type="button" id="submitBtn" to_href="${App_path}/toapply-3.html"
				class="btn btn-success">下一步</button>
		</form>
		<hr>
	</div>
	
	<%@include file="/WEB-INF/includes/tailbar.jsp" %>
	<%@include file="/WEB-INF/includes/commons_js.jsp" %>
	<script>
		
		$("#submitBtn").click(function(){
			$("form:first").attr("action",$(this).attr("to_href")).submit();
		});
		
	</script>
</body>
</html>