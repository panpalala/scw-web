<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="navbar-wrapper">
	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="${ App_path}/index.html"
						style="font-size: 32px;">尚筹网-创意产品众筹平台</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse"
					style="float: right;">
					<c:if test="${empty loginUser }">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="${ App_path}/login.jsp">登录</a></li>
							<li><a href="${ App_path}/reg.jsp">注册</a></li>
						</ul>
					</c:if>
					<c:if test="${!empty loginUser }">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i>
									${loginUser.loginacct }<span class="caret"></span></a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="${App_path }/member.html"><i
											class="glyphicon glyphicon-scale"></i> 会员中心</a></li>
									<li><a href="#"><i class="glyphicon glyphicon-comment"></i>
											消息</a></li>
									<li class="divider"></li>
									<li><a href="${App_path }/logout"><i
											class="glyphicon glyphicon-off"></i> 退出系统</a></li>
								</ul>
							</li>
						</ul>
					</c:if>
				</div>
			</div>
		</nav>

	</div>
</div>