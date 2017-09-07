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
		  <li role="presentation" class="active"><a href="#"><span class="badge">1</span> 基本信息</a></li>
		  <li role="presentation"><a href="#"><span class="badge">2</span> 资质文件上传</a></li>
		  <li role="presentation"><a href="#"><span class="badge">3</span> 邮箱确认</a></li>
		  <li role="presentation"><a href="#"><span class="badge">4</span> 申请确认</a></li>
		</ul>
        
		<form role="form" action="${App_path}/toapply-1.html" method="post" style="margin-top:20px;">
		  <div class="form-group">
			<label>真实名称</label>
			<input type="text" class="form-control" name="realname" placeholder="请输入真实名称">
		  </div>
		  <div class="form-group">
			<label>身份证号码</label>
			<input type="text" class="form-control" name="cardnum" placeholder="请输入身份证号码">
		  </div>
          <button type="button" onclick="window.location.href='${App_path}/toaccttype.html'" class="btn btn-default">上一步</button>
		  <button type="submit" class="btn btn-success">下一步</button>
		</form>
		<hr>
    </div>
    <%@include file="/WEB-INF/includes/tailbar.jsp" %>
	<%@include file="/WEB-INF/includes/commons_js.jsp" %>
	<script>
        $('#myTab a').click(function (e) {
          e.preventDefault();
          $(this).tab('show');
        });        
	</script>
  </body>
</html>