<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>货物信息</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
		request。getContextPath()方法获取当前项目路径
 -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="dateUtil.js"></script>
<link href="../CSS/style.css" type="text/css" rel="stylesheet">
</head>
<body link="#ffffff" alink="#FFCC66" vlink="#FF3300">
	<div>
		<div>
			<jsp:include page="top.jsp" />
		</div>

		<!-- 页面主要内容 -->
		<div style="margin-left: 10%; width: 80%">
		<p style="font-size:16px; text-align: center;color:#337ab7;">货物信息</p>
			<!-- 表格数据 -->
			<div id="listInfo">
				<div class="row">
					<div class="col-md-12">
						<table class="table table-hover" id="users_table">
							<thead>
								<tr>
									<th width="786" height="29" align="center">货物类型</th>
									<th width="786" height="29" align="center">货物名称</th>
									<th width="786" height="29" align="center">货物数量</th>
									<th width="786" height="29" align="center">数量单位</th>
									<th width="786" height="29" align="center">起始省市</th>
									<th width="786" height="29" align="center">抵达省市</th>
									<th width="786" height="29" align="center">运输时间</th>
									<th width="786" height="29" align="center">联系电话</th>
									<th width="786" height="29" align="center">联系人</th>
									<th width="786" height="29">操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								</tr>
							</tbody>

						</table>
					</div>
				</div>

				<div class="row">
					<!-- 分页记录数 -->
					<div class="col-md-6" id="page_info_area"></div>

					<!-- 分页条-->
					<div class="col-md-6 col-md-offset-6" id="page_nav_area"></div>
				</div>
			</div>
			<!-- 详细  -->
			<div id="detailInfo">
				<div id="title"></div>
				<div class="row">
					<div class="col-md-12">
						<table class="table table-hover" id="detail_table">
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
		<!-- 页尾 -->
		<div>
			<jsp:include page="../WEB-INF/views/down.jsp" flush="true" />
		</div>

	</div>

	<script type="text/javascript">
		var totalRecord;
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
					//1.解析并显示员工信息，
					build_user_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					//3.显示分页条数据
					build_page_nav(result);
				}
			});
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
		function build_user_table(result) {
			$("#users_table tbody").empty();
			var users = result.extend.pageInfo.list;
			$.each(users, function(index, item) {
				var userIdTd = $("<td></td>").append(item.goodsstyle);
				var userNameTd = $("<td></td>").append(item.goodsname);
				var goodsnumberTd = $("<td></td>").append(item.goodsnumber);
				var goodsunitTd = $("<td></td>").append(item.goodsunit);
				var startprovinceTd = $("<td></td>").append(
						item.startprovince + "-" + item.startcity);
				var endprovinceTd = $("<td></td>").append(
						item.endprovince + "-" + item.endcity);
				var transporttimeTd = $("<td></td>").append(
						dateToStr('yyyy-MM-dd HH:mm:ss', new Date(
								item.transporttime)));
				var issuedateTd = $("<td></td>").append(
						dateToStr('yyyy-MM-dd HH:mm:ss', new Date(
								item.issuedate)));
				var phoneTd = $("<td></td>").append(item.phone);
				var linkTd = $("<td></td>").append(item.link);

				var showDetail = $("<td></td>").append(
						$("<button onclick='showDetail( " + item.id
								+ " )'></button>").addClass(
								"btn btn-default btn-sm").append(
								$("<span></span>").addClass(
										"glyphicon glyphicon-search")).append(
								" 查看"));

				$("<tr></tr>").append(userIdTd).append(userNameTd).append(
						goodsnumberTd).append(goodsunitTd).append(
						startprovinceTd).append(endprovinceTd).append(
						transporttimeTd).append(issuedateTd).append(phoneTd)
						.append(linkTd).append(showDetail).appendTo(
								"#users_table tbody");
			});
		}

		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前 " + result.extend.pageInfo.pageNum + " 页，总 "
							+ result.extend.pageInfo.pages + " 页，总 "
							+ result.extend.pageInfo.total + " 条记录");
			totalRecrd = result.extend.pageInfo.total;
		}

		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");

			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;").attr("href", "#"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;").attr("href", "#"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}

			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append(
						$("<a></a>").append(item).attr("href", "#"));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);

			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		function showDetail(id) {
			/* alert("code: " + id); */
			$.ajax({
				url : "${APP_PATH}/goodMeg/id",
				data : "id=" + id,
				type : "GET",
				success : function(result) {
					console.log(result);
					console.log(result.extend.pageInfo);
					$("#title").empty();
					$("<p style='font-size: 16px; font-weight: bold;'></P>").append("货物信息展示").appendTo("#title");
					// 显示具体信息
					build_detail_table(result);
				}
			});
		}

		function build_detail_table(result) {
			$("#detail_table tbody").empty();
			var item = result.extend.pageInfo;
			var tr = $("<tr></tr>");
			var td1 = $("<td width='17%' height='29' align='center'></td>")
					.append("货物类型");
			var td2 = $("<td width='36%' height='29' align='center'></td>")
					.append(item.goodsstyle);
			var td3 = $("<td width='17%' height='29' align='center'></td>")
					.append("货物名称");
			var td4 = $("<td width='30%' height='29' align='center'></td>")
					.append(item.goodsname);
			tr.append(td1).append(td2).append(td3).append(td4).appendTo(
					"#detail_table tbody");

			td1 = $("<td width='17%' height='29' align='center'></td>").append(
					"货物数量");
			td2 = $("<td width='36%' height='29' align='center'></td>").append(
					item.goodsnumber);
			td3 = $("<td width='17%' height='29' align='center'></td>").append(
					"数量单位");
			td4 = $("<td width='36%' height='29' align='center'></td>").append(
					item.goodsunit);
			var tr = $("<tr></tr>");
			tr.append(td1).append(td2).append(td3).append(td4).appendTo(
					"#detail_table tbody");

			td1 = $("<td width='17%' height='29' align='center'></td>").append(
					"起始省市");
			td2 = $("<td width='36%' height='29' align='center'></td>").append(
					item.startprovince + " " + item.startcity);
			td3 = $("<td width='17%' height='29' align='center'></td>").append(
					"抵达省市");
			td4 = $("<td width='30%' height='29' align='center'></td>").append(
					item.endprovince + " " + item.endcity);
			var tr = $("<tr></tr>");
			tr.append(td1).append(td2).append(td3).append(td4).appendTo(
					"#detail_table tbody");

			td1 = $("<td width='17%' height='30' align='center'></td>").append(
					"运输类型");
			td2 = $("<td width='36%' height='30' align='center'></td>").append(
					item.style);
			td3 = $("<td width='17%' height='30' align='center'></td>").append(
					"运输时间");
			td4 = $("<td width='30%' height='30' align='center'></td>").append(
					dateToStr("yyyy-MM-dd", new Date(item.transporttime)));
			var tr = $("<tr></tr>");
			tr.append(td1).append(td2).append(td3).append(td4).appendTo(
					"#detail_table tbody");

			td1 = $("<td width='17%' height='29' align='center'></td>").append(
					"联系电话");
			td2 = $("<td width='36%' height='29' align='center'></td>").append(
					item.phone);
			td3 = $("<td width='17%' height='29' align='center'></td>").append(
					"联系人");
			td4 = $("<td width='30%' height='29' align='center'></td>").append(
					item.link);
			var tr = $("<tr></tr>");
			tr.append(td1).append(td2).append(td3).append(td4).appendTo(
					"#detail_table tbody");

			td1 = $("<td width='17%' height='29' align='center'></td>").append(
					"发布时间");
			td2 = $("<td width='36%' height='29' align='center'></td>").append(
					dateToStr("yyyy-MM-dd", new Date(item.issuedate)));
			td3 = $("<td width='17%' height='29' align='center'></td>").append(
					"发布人");
			td4 = $("<td width='30%' height='29' align='center'></td>").append(
					item.username);
			var tr = $("<tr></tr>");
			tr.append(td1).append(td2).append(td3).append(td4).appendTo(
					"#detail_table tbody");

			td1 = $("<td width='17%' height='65' align='center'></td>").append(
					"备注");
			td2 = $("<td width='83%' height='65' colspan='3'></td>").append(
					"<p align='left'><textarea rows='3' cols='76'>" + item.remark +"</textarea></p>");
			var tr = $("<tr></tr>");
			tr.append(td1).append(td2).appendTo("#detail_table tbody");
			
			td1 = $("<td width='17%' height='65' align='center'></td>").append(
					"车辆要求");
			td2 = $("<td width='83%' height='65' colspan='3'></td>").append(
					"<p align='left'><textarea rows='3' cols='76'>" + item.request +"</textarea></p>");
			var tr = $("<tr></tr>");
			tr.append(td1).append(td2).appendTo("#detail_table tbody");

		}
	</script>

</body>


</html>