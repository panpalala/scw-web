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
     <h1>申请成功，我们将在3-5个工作日进行处理，请及时关注</h1>
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