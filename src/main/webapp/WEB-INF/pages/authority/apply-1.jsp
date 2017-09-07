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
	<%@include file="/WEB-INF/includes/navigate_bar.jsp" %>
	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h1>实名认证 - 申请</h1>
		</div>

		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation"><a href="#"><span class="badge">1</span>
					基本信息</a></li>
			<li role="presentation" class="active"><a href="#"><span
					class="badge">2</span> 资质文件上传</a></li>
			<li role="presentation"><a href="#"><span class="badge">3</span>
					邮箱确认</a></li>
			<li role="presentation"><a href="#"><span class="badge">4</span>
					申请确认</a></li>
		</ul>

		<form role="form" style="margin-top: 20px;" method="post" enctype="multipart/form-data">
			<c:forEach items="${accttypeCerts }" var="cert">
				<div class="form-group">
					<label>${cert.name }</label> 
					<input type="file" class="form-control changeImg" name="file"> 
					<input type="hidden" name="certid" value="${cert.id }">					
					<br> 
					<div class="previewImg">
					</div>
				</div>
			</c:forEach>
			<button type="button" onclick="window.location.href='${App_path}/toapply.html'"
				class="btn btn-default">上一步</button>
			<button type="button" id="submitBtn" to_href="${App_path}/toapply-2.html"
				class="btn btn-success">下一步</button>
		</form>
		<hr>
	</div>
	<!-- /container -->
	<%@include file="/WEB-INF/includes/tailbar.jsp" %>
	<%@include file="/WEB-INF/includes/commons_js.jsp" %>
	<script>
		//为图片上传框绑定改变事件
		$(".changeImg").change(function(){
			//获取选中上传的图片文件
			var file = $(this)[0].files[0];
			//如果文件不为空，为文件生成临时的Url
			if(file != null){
				var URL = window.URL || window.webkitURL;
				var imgUrl = URL.createObjectURL(file);
				//将选中的图片文件放到指定的div中，进行预览
				$(this).nextAll(".previewImg").empty().append("<img class='img-responsive' src='" + imgUrl + "'>");
			}
		});
		
		
		$("#submitBtn").click(function(){
			$("form:first").attr("action",$(this).attr("to_href")).submit();
			return false;
		});
	</script>
</body>
</html>