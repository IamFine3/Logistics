<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>会员注册</title>
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
</head>
<script type="text/javascript">
	function check() {
		if (form1.name.value == "") {
			alert("请输入你的用户名");
			form1.name.focus();
			return false;
		}
		if (form1.password.value == "") {
			alert("请输入你注册的密码");
			form1.password.focus();
			return false;
		}
		if (form1.repassword.value == "") {
			alert("请输入确认密码");
			form1.repassword.focus();
			return false;
		}
		if (form1.password.value != form1.repassword.value) {
			alert("你输入的两次密码不一致");
			return false;
		}
		if (form1.email.value == "") {
			alert("请输入你的Email址");
			form1.email.focus();
			return false;
		}

		if (form1.phone.value == "") {
			alert("请输入你的联系电话");
			form1.phone.focus();
			return false;
		}
		register();
	}

	function register() {
		console.log("注册...");
		$.ajax({
			url : "${APP_PATH}/register",
			type : "POST",
			data : $("#formUser").serialize(),
			dataType : "json",
			success : function(result) {
				/* alert(result.extend.register); */
				if (result.extend.register > 0) {
					alert("注册成功,请登录...");
					window.location.href = '${APP_PATH }/jsp/pageHome.jsp';
				} else {
					alert("用户名已注册,请重新输入用户名...");
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
<body>
	<center>
		<div>
			<div>
				<jsp:include page="top.jsp" />
			</div>
			<div>
				<form method="POST" action="" name="form1" id="formUser">

					<table width="100%" height="42" border="0" cellpadding="0"
						cellspacing="0" background="../image/20.jpg">
						<tr>
							<td valign="bottom"><table width="100" border="0"
									align="center" cellpadding="0" cellspacing="0">
									<tr>
										<td><img src="../image/21.jpg" width="791" height="35"></td>
									</tr>
								</table></td>
						</tr>
					</table>
					<table width="791" border="0" cellpadding="0" cellspacing="0"
						background="../image/22.jpg">
						<tr>
							<td height="63"><div align="center">
									<p>
										<b>会员注册</b>
									</p>
								</div></td>
						</tr>
					</table>

					<table width="791" height="205" border="0" cellpadding="0"
						cellspacing="0" background="../image/23.jpg">
						<tr>
							<td width="46%" align="left" height="27"><div align="right">用户名：</div></td>
							<td width="54%" align="left"><input type="text" name="name" id="name"
								size="20"></td>
						</tr>
						<tr>
							<td width="46%" height="27">
								<p align="right">密码：</p>
							</td>
							<td width="54%"><input type="password" name="password"
								size="20"></td>
						</tr>
						<tr>
							<td width="46%" height="27">
								<p align="right">确认密码：</p>
							</td>
							<td width="54%"><input name="repassword" type="password"
								size="20" maxlength="16"></td>
						</tr>
						<tr>
							<td width="46%" height="27">
								<div align="right">性别：</div>
							</td>
							<td width="54%">&nbsp; 男 <input type="radio" value="男"
								checked name="gender"> &nbsp; 女 <input type="radio"
								name="gender" value="女"></td>
						</tr>
						<tr>
							<td width="46%" height="27">
								<p align="right">电话：</p>
							</td>
							<td width="54%"><input type="text" name="phone" size="20"></td>
						</tr>
						<tr>
							<td width="46%" height="27">
								<p align="right">Email：</p>
							</td>
							<td width="54%"><input type="text" name="email" size="20"></td>
						</tr>
						<tr>
							<td height="16" colspan="2">
								<div align="center">
									<input type="button" value="注册" name="Submit"
										onClick="check()"> <input type="reset"
										value="重置"> &nbsp;&nbsp;<a
										href="${APP_PATH }/jsp/pageHome">返回</a>
								</div>
							</td>
						</tr>
					</table>

					<table width="100" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img src="../image/24.jpg" width="791" height="203"></td>
						</tr>
					</table>
				</form>
			</div>

		</div>

	</center>
</body>
</html>
