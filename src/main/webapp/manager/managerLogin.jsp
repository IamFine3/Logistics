<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="../CSS/style.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="../CSS/xgxt_login.css" />
<title>用户登录</title>
</head>
<body>
	<script type="text/javascript">
		function check() {
			if (document.form1.name.value == "") {
				alert("用户名不能为空！");
				document.form1.name.focus();
				return false;
			}
			if (document.form1.password.value == "") {
				alert("密码不能为空！");
				document.form1.password.focus();
				return false;
			}
			managerLogin();
		}
		
		function managerLogin() {
			console.log("注册...");
			$.ajax({
				url : "${APP_PATH }/manager/login",
				type : "POST",
				data : $("#formUser").serialize(),
				dataType : "json",
				success : function(result) {
					/* alert(result.extend.register); */
					if (result.extend.managerLogin) {
						window.location.href = '${APP_PATH }/manager/managerCarMeg.jsp';
					} else {
						alert("用户名或密码错误!");
						document.getElementById("name").focus();
					}
				},
				error : function(result) {
					alert("失败..." + result);
					console.log("失败..." + result);
				}
			});
		}
		
	</script>
	<div id="header">
		<div class="header_title">
			<!-- <img src="img/logo.png"  width=15% height=15% /> -->
			<span class="title_con">物流管理平台</span>
		</div>
	</div>
	<form name=form1 id="formUser" method="POST" action="#">
		<div>
			<center>
				<div class="con">
					<div class="con_title">
						<span class="con_title_sp">欢迎登录物流管理平台</span>
					</div>
					<div class="con_panel">
						<div class="con_input">
							<span>用户名：</span><input name="name" type="text" placeholder="用户名" />
						</div>
						<div class="con_input">
							<span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password"
								name="password" placeholder="密码" />
						</div>
						<input type="submit" value="登    录" class="submit-btn"
							onclick="return check()" /> <input type="button" value="注   册"
							class="submit-btn" onclick="window.location=('managerRegister.jsp')" />
					</div>
				</div>
			</center>
		</div>
	</form>


</body>
</html>
