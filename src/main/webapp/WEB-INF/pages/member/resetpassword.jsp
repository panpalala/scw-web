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

    <div class="container">
      <form class="form-signin" role="form" action="${App_path }/modifyPassword" method="post">
      	<input type="hidden" name="token" value="${param.token }" />
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 修改密码
        	<br/>&nbsp;&nbsp;<span style="color: red;font-size: 14px">${msg }</span>
        </h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="inputSuccess4" 
			 name="password" placeholder="请输入新密码" value="${TUser.loginacct }" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="inputSuccess4" 
			 name="confirmPassword" placeholder="请再次输入密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
        <a id="submitBtn" class="btn btn-lg btn-success btn-block" >提交</a>
      </form>
    </div>
     <%@include  file="/WEB-INF/includes/commons_js.jsp" %>
    <script>
    	$("#submitBtn").click(function(){
    		$("form:first").submit();
    		return false;
    	});
    	
    </script>
  </body>
</html>