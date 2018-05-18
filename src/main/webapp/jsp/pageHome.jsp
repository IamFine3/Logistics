<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>物流管理平台</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
	<script
		src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
		<link href="${APP_PATH }/CSS/style.css" type="text/css" rel="stylesheet">
<style>
	tr {
		height: 24px;
	}
	td {
	font-size: 12px;
	}
</style>
</head>
<body link="#ffffff" alink="#FFCC66" vlink="#FF3300">
	<div>
		<jsp:include page="top.jsp" />
	</div>
	<div>
		<table width="786" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="260" height="255" valign="top" background="../image/8.jpg">

					<jsp:include page="left.jsp" flush="true" />
				</td>
				<td width="484" valign="top">
					<!-- 货物信息 -->
					<table width="100" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img src="../image/13.jpg" width="370" height="39"></td>
						</tr>
					</table>
					<table width="380" border="0" cellpadding="0" cellspacing="0"
						background="../image/14.jpg">
						<tr>
							<td valign="top">

								<table width="380" border="0" cellpadding="0" cellspacing="0"
									id="users_table">
									<tbody></tbody>
								</table>
							</td>
						</tr>
					</table> <!-- 车辆信息  -->
					<table width="100" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><img src="../image/16.jpg" width="370" height="23"></td>
						</tr>
					</table>
					<table width="370" border="0" cellpadding="0" cellspacing="0"
						background="../image/17.jpg">
						<tr>
							<td valign="top">

								<table width="370" border="0" cellpadding="0" cellspacing="0"
									id="carMeg_table">
									<tbody></tbody>
								</table>
							</td>
						</tr>
					</table>

				</td>
				<td valign="top" width="215" background="../image/12.jpg"><jsp:include
						page="right.jsp" flush="true" /></td>
			</tr>
		</table>

	</div>

	<!-- 页尾 -->
	<div>
		<jsp:include page="down.jsp" flush="true" />
	</div>

	<script type="text/javascript">
		//1.页面加载完成后，直接发送ajax请求，要到分页数据
		$(function() {
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/goodsMegs",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//console.log(result);
					//1.解析并显示货物信息
					build_user_table(result);
					
				}
			});
			
			$.ajax({
				url : "${APP_PATH}/carsMegs",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					//2.解析并显示车辆信息
					build_cars_table(result);
				}
			});
		}
		
		/* 货物信息展示 */
		function build_user_table(result) {
			$("#users_table tbody").empty();
			var users = result.extend.pageInfo.list;
			$.each(users, function(index, item) {
				var tdLeft = $("<td width='36px'>&nbsp;</td>");
				var tdInfo = $("<td></td>")
						.append(
								item.goodsstyle + " -- " + item.goodsname + " -- "
										+ item.startprovince + " -- "
										+ item.startcity + " -- "
										+ item.endprovince + " -- "
										+ item.endcity);
				$("<tr></tr>").append(tdLeft).append(tdInfo).appendTo(
						"#users_table tbody");
				
			});

			/* var moreInfo = $("<td></td>").append(">>>更多信息>>>");  */
			var tdLeft = $("<td width='36px'>&nbsp;</td>");
			var moreInfo = $("<td style='text-align: right'></td>")
					.append(
							"<a href='${APP_PATH }/jsp/goods_select.jsp'>&nbsp;>>>更多信息&nbsp;&nbsp;&nbsp;</a>");
			$("<tr></tr>").append(tdLeft).append(moreInfo).appendTo(
					"#users_table tbody");
		}
		
		/* 车辆信息展示 */
		function build_cars_table(result) {
			$("#carMeg_table tbody").empty();
			var users = result.extend.pageInfo.list;
			$.each(users, function(index, item) {
				var tdLeft = $("<td width='36px'>&nbsp;</td>");
				var tdInfo = $("<td></td>")
						.append(
								item.trademark + " -- " + item.brand + " -- "
										+ item.style + " -- "
										+ item.carload + "吨  -- "
										+ item.transpotstyle );
				$("<tr></tr>").append(tdLeft).append(tdInfo).appendTo(
						"#carMeg_table tbody");
			});

			/* var moreInfo = $("<td></td>").append(">>>更多信息>>>");  */
			var tdLeft = $("<td width='36px'>&nbsp;</td>");
			var moreInfo = $("<td style='text-align: right'></td>")
					.append(
							"<a href='${APP_PATH }/jsp/car_select.jsp'>&nbsp;>>>更多信息&nbsp;&nbsp;&nbsp;</a>");
			$("<tr></tr>").append(tdLeft).append(moreInfo).appendTo(
					"#carMeg_table tbody");
		}

		function dateToStr(formatStr, date) {
			formatStr = arguments[0] || "yyyy-MM-dd HH:mm:ss";
			date = arguments[1] || new Date();
			var str = formatStr;
			var Week = [ '日', '一', '二', '三', '四', '五', '六' ];
			str = str.replace(/yyyy|YYYY/, date.getFullYear());
			str = str
					.replace(/yy|YY/, (date.getYear() % 100) > 9 ? (date
							.getYear() % 100).toString() : '0'
							+ (date.getYear() % 100));
			str = str.replace(/MM/, date.getMonth() > 9 ? (date.getMonth() + 1)
					: '0' + (date.getMonth() + 1));
			str = str.replace(/M/g, date.getMonth());
			str = str.replace(/w|W/g, Week[date.getDay()]);

			str = str.replace(/dd|DD/, date.getDate() > 9 ? date.getDate()
					.toString() : '0' + date.getDate());
			str = str.replace(/d|D/g, date.getDate());

			str = str.replace(/hh|HH/, date.getHours() > 9 ? date.getHours()
					.toString() : '0' + date.getHours());
			str = str.replace(/h|H/g, date.getHours());
			str = str.replace(/mm/, date.getMinutes() > 9 ? date.getMinutes()
					.toString() : '0' + date.getMinutes());
			str = str.replace(/m/g, date.getMinutes());

			str = str.replace(/ss|SS/, date.getSeconds() > 9 ? date
					.getSeconds().toString() : '0' + date.getSeconds());
			str = str.replace(/s|S/g, date.getSeconds());

			return str;
		}
	</script>

</body>

</html>

