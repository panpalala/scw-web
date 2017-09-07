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

.seltype {
	position: absolute;
	margin-top: 70px;
	margin-left: 10px;
	color: red;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/includes/navigate_bar.jsp" %>

	<div class="container theme-showcase" role="main">
		<div class="page-header">
			<h1>实名认证 - 账户类型选择</h1>
		</div>
		<div style="padding-top: 10px;">
			<div class="row">
				<div class="col-xs-6 col-md-3">
					<h2>商业公司</h2>
					<span hidden="">1</span>
					<a class="thumbnail"> <img alt="100%x180"
						src="${App_path}/img/services-box1.jpg" data-holder-rendered="true"
						style="height: 180px; width: 100%; display: block;">
					</a>
				</div>
				<div class="col-xs-6 col-md-3">
					<h2>个体工商户</h2>
					<span hidden="">2</span>
					<a class="thumbnail"> <img alt="100%x180"
						src="${App_path}/img/services-box2.jpg" data-holder-rendered="true"
						style="height: 180px; width: 100%; display: block;">
					</a>
				</div>
				<div class="col-xs-6 col-md-3">
					<h2>个人经营</h2>
					<span hidden="">3</span>
					<a class="thumbnail"> <img alt="100%x180"
						src="${App_path}/img/services-box3.jpg" data-holder-rendered="true"
						style="height: 180px; width: 100%; display: block;">
					</a>
				</div>
				<div class="col-xs-6 col-md-3">
					<h2>政府及非营利组织</h2>
					<span hidden="">4</span>
					<a class="thumbnail"> <img alt="100%x180"
						src="${App_path}/img/services-box4.jpg" data-holder-rendered="true"
						style="height: 180px; width: 100%; display: block;">
					</a>
				</div>
			</div>
			<button id="authApplyBtn" type="button" class="btn btn-danger btn-lg btn-block">认证申请</button>
		</div>
		<!-- /container -->
		<!-- /END THE FEATURETTES -->
		</div>
		<%@include file="/WEB-INF/includes/tailbar.jsp" %>
		
		<%@include file="/WEB-INF/includes/commons_js.jsp" %>
		
		<script>
			var accttype;
			$(".thumbnail").click(
				function() {
					$('.seltype').remove();
					$(this).prepend('<div class="glyphicon glyphicon-ok seltype"></div>');
					accttype = $(this).prev("span").text();
			});
			
			$("#authApplyBtn").click(function(){
				if(accttype == null){
					layer.msg("请选择账户类型！");
					return;
				}
				location.href = "${App_path}/toapply.html?accttype=" + accttype;
			});
		</script>
</body>
</html>