<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="UTF-8">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<%@include file="/WEB-INF/includes/commons_css.jsp" %>
	<link rel="stylesheet" href="${App_path}/css/login.css">
	<style>

	</style>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="${App_path}/index.jsp" style="font-size:32px;">尚筹网-密码重置</a></div>
        </div>
      </div>
    </nav>
	<br/>
	<br/>
	<br/>
	<br/>
    <div class="container">
      <c:if test="${empty requestScope.msg }">
	      <form class="form-signin" role="form" action="${App_path }/resetPassword" method="post">
	        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 密码重置</h2>
			  <div class="form-group has-success has-feedback">
				<input type="text" class="form-control" id="inputSuccess4" 
				 name="email" placeholder="请输入注册邮箱" style="margin-top:10px;">
			  </div>
	        <a id="confirmReset" class="btn btn-lg btn-success btn-block" > 确认重置</a>
	      </form>
      </c:if>
      <c:if test="${!empty requestScope.msg }">
      	<h1>我们已经给<span style="color: red">${msg }</span>发送了验证码，请注意查收！</h1>
      </c:if>
    </div>
     <%@include  file="/WEB-INF/includes/commons_js.jsp" %>
    <script>
    	$("#confirmReset").click(function(){
    		$("form:first").submit();
    		return false;
    	});
    	
    </script>
  </body>
</html>