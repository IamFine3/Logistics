<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.util.*"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<table width="100%" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td height="80" align="center" background="../image/1.jpg">

			<table height="80" border="0" cellpadding="0" cellspacing="0"
				>
				<tr>
					<td width="787"></td>
				</tr>
			</table>

		</td>
	</tr>
</table>

<table width="100%" height="32" border="0" cellpadding="0"
	cellspacing="0" background="../image/3.jpg">
	<tr>
		<td><table width="786" border="0" align="center" cellpadding="0"
				cellspacing="0" background="../image/4.jpg">
				<tr>
					<th width="189" height="31" align="center">&nbsp;</th>
					<th width="597" height="31" align="center"><a href="${APP_PATH }/jsp/pageHome.jsp"
						class="a1">本站首页</a>&nbsp;|&nbsp;<a href="${APP_PATH }/jsp/active_select.jsp"
						class="a1">物流动态</a>&nbsp;|&nbsp;<a href="${APP_PATH }/jsp/goods_select.jsp"
						class="a1">货物信息</a>&nbsp;|&nbsp;<a href="${APP_PATH }/jsp/car_select.jsp"
						class="a1">车辆信息</a>&nbsp;|&nbsp;<a href="${APP_PATH }/jsp/register.jsp"
						class="a1">会员注册</a>&nbsp;|&nbsp;<a href="${APP_PATH }/jsp/logout.jsp" class="a1">退出</a></th>
				</tr>
			</table></td>
	</tr>
</table>