<%@ page language="java" import="java.util.*" import="data.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	User user = (User) request.getSession().getAttribute("userInfo");
%> --%>
<%
	String login = (String) session.getAttribute("login");
	String username = (String) session.getAttribute("name");
%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>物流管理平台</title>
<link href="${APP_PATH }/CSS/img.css" rel="stylesheet" type="text/css" />
<link href="${APP_PATH }/CSS/StudentStyle.css" rel="stylesheet"
	type="text/css" />
<%-- <link href="${APP_PATH }/Script/jBox/Skins/Blue/jbox.css"
	rel="stylesheet" type="text/css" /> --%>
<link href="${APP_PATH }/CSS/ks.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>

<script src="${APP_PATH }/Script/jBox/i18n/jquery.jBox-zh-CN.js"
	type="text/javascript"></script>
<script src="${APP_PATH }/Script/Common.js" type="text/javascript"></script>
<script src="${APP_PATH }/Script/Data.js" type="text/javascript"></script>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH }/Script/Base.js" type="text/javascript"></script>
<link href="${APP_PATH }/CSS/style.css" rel="stylesheet" type="text/css" />
<style>
.pagination li {
	display: inline;
	margin-left: 0;
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
}

.disabled {
	display: inline;
}
</style>
</head>
<body>

	<div class="banner">
		<div class="bgh">
			<div class="page">
				<div id="logo">

					<img src="${APP_PATH }/image/logo.jpg" alt="" class="titleimg" />

				</div>
				<div class="topxx">

					<%=username%>&nbsp;欢迎您！<a
						href="${APP_PATH }/manager/managerLagout.jsp">安全退出</a>
				</div>

			</div>
		</div>
	</div>
	<div class="page">
		<div class="box mtop">
			<div class="leftbox">
				<div class="l_nav2">
					<div class="ta1">
						<strong>信息管理</strong>
						<div class="leftbgbt"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="${APP_PATH }/manager/managerActive.jsp">物流动态</a>
						</div>
						<div>
							<a href="${APP_PATH }/manager/managerGoods.jsp">货物信息</a>
						</div>
						<div>
							<a href="${APP_PATH }/manager/managerCarMeg.jsp">车辆信息</a>
						</div>

					</div>
					<div class="ta1">
						<strong>会员管理</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="${APP_PATH }/manager/managerUser.jsp">管理会员</a>
						</div>
					</div>
					<div class="ta1">
						<strong>系统管理</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="${APP_PATH }/manager/managerSystem.jsp">系统管理</a>
						</div>
					</div>

				</div>
			</div>
			<div class="rightbox">

				<h2 class="mbx">信息管理 &gt; 车辆信息</h2>
				<div class="morebt">
					<ul>
						<li><a class="tab2"
							href="${APP_PATH }/manager/managerActive.jsp">物流动态</a></li>
						<li><a class="tab2"
							href="${APP_PATH }/manager/managerGoods.jsp">货物信息</a></li>
						<li><a class="tab1"
							href="${APP_PATH }/manager/managerCarMeg.jsp">车辆信息</a></li>

					</ul>
				</div>
				<div class="cztable">
					<div class="container">
						<div class="modal fade" id="recordAddModal" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title" id="myModalLabel">车辆信息</h4>
									</div>
									<div class="modal-body">

										<form class="form-horizontal" id="formCarMeg">
											<div class="form-group" style="display: none">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">id</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="code" name="code">
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">车牌号码</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="title"
														name="trademark" placeholder="trademark...">
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">车辆品牌</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="brand"
														name="brand" placeholder="brand...">
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">车辆类型</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="style"
														name="style" placeholder="style...">
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">车辆限量</label>
												<div class="col-sm-6">
													<input type="number" class="form-control" id="carload"
														name="carload" placeholder="carload..."> &nbsp;吨
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">已用年限</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="usedtime"
														name="usedtime" placeholder="usedtime..."> &nbsp;年
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">驾驶员</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="drivername"
														name="drivername" placeholder="drivername...">
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">证件号码</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="licencenumber"
														name="licencenumber" placeholder="licencenumber...">
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">证件类型</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="licencestyle"
														name="licencestyle" placeholder="licencestyle...">
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">驾驶员驾龄</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="drivertime"
														name="drivertime" placeholder="drivertime..."> &nbsp;年
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">运输类型</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="transpotstyle"
														name="transpotstyle" placeholder="transpotstyle..."> 
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">联系人</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="linkman"
														name="linkman" placeholder="linkman..."> 
												</div>
											</div>
											<div class="form-group">
												<label for="UserName_add_input"
													class="col-sm-2 control-label">联系电话</label>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="linkphone"
														name="linkphone" placeholder="linkphone..."> 
												</div>
											</div>
											<div class="form-group">
												<label for="Password_add_input"
													class="col-sm-2 control-label">备注信息</label>
												<div class="col-sm-10">
													<textarea name="remark" id="remark" class="form-control"
														cols="10" rows="5" placeholder="在这里输入备注信息..."></textarea>
													<!-- <input type="text" class="form-control" name="content"
														id="content" placeholder="content"> -->
												</div>
											</div>

											<div class="form-group">
												<label for="author_add_input" class="col-sm-2 control-label">发布人</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="username"
														name="username" placeholder="username..">
												</div>
											</div>
										</form>


									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">关闭</button>
										<button type="button" class="btn btn-primary"
											id="add_save_btn">保存</button>
											
										<button style="display: none"  type="button" class="btn btn-primary"
											id="edit_record_btn">修改</button>
									</div>
								</div>
							</div>
						</div>

						<!-- 按钮 -->
						<div class="row" style="height: 40px">
							<div class="col-md-4 col-md-offset-8">
								<button type="button" class="btn btn-primary"
									id="user_add_modal_btn">新增</button>
							</div>
						</div>

						<!-- 表格数据 -->
						<div class="row">
							<div class="col-md-12">
								<table class="table table-hover" id="records_table">
									<thead>
										<tr>
											<th width="11%" height="29" align="center">车牌号码</th>
											<th width="11%" height="29" align="center">车辆品牌</th>
											<th width="11%" height="29" align="center">类型</th>
											<th width="11%" height="29" align="center">车辆限量</th>
											<th width="11%" height="29" align="center">已使用</th>
											<th width="11%" height="29" align="center">驾驶员驾龄</th>
											<th width="11%" height="29" align="center">运输类型</th>
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

				</div>
			</div>
			<div class="footer">
				<p>Copyright&copy; 2018 All Rights Reserved</p>
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
					url : "${APP_PATH}/carsMegs",
					data : "pn=" + pn,
					type : "GET",
					success : function(result) {
						//console.log(result);
						//1.解析并显示记录信息，
						build_record_table(result);
						//2.解析并显示分页信息
						build_page_info(result);
						//3.显示分页条数据
						build_page_nav(result);
					}
				});
			}

			function build_record_table(result) {
				$("#records_table tbody").empty();
				totalRecord = result.extend.pageInfo.list;
				var records = result.extend.pageInfo.list;
				$
						.each(
								records,
								function(index, item) {
									//alert(item.userName);
									var td1 = $("<td></td>").append(
											item.trademark);
									var td2 = $("<td></td>").append(item.brand);
									var td3 = $("<td></td>").append(item.style);
									var td4 = $("<td></td>").append(
											item.carload + "吨");
									var td5 = $("<td></td>").append(
											item.usedtime + "年");
									var td6 = $("<td></td>").append(
											item.drivertime + "年");
									var td7 = $("<td></td>").append(
											item.transpotstyle);

									var editBtn = $(
											"<button onclick='editRecord( "
													+ index + " )'></button>")
											.addClass("btn btn-primary btn-sm")
											.append(
													$("<span></span>")
															.addClass(
																	"glyphicon glyphicon-pencil"))
											.append(" 修改");
									var delBtn = $(
											"<button onclick='removeRecord( "
													+ item.code + " )'></button>")
											.addClass("btn btn-danger btn-sm")
											.append(
													$("<span></span>")
															.addClass(
																	"glyphicon glyphicon-trash"))
											.append(" 删除");
									var btnTd = $("<td></td>").append(editBtn)
											.append(" ").append(delBtn);

									$("<tr></tr>").append(td1).append(td2)
											.append(td3).append(td4)
											.append(td5).append(td6).append(td7).append(btnTd)
											.appendTo("#records_table tbody");
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

			//点击新增按钮弹出模态框
			$("#user_add_modal_btn").click(function() {
				$('#formCarMeg')[0].reset();
				//发送ajax请求，查出角色信息，显示在模态框中
				$("#recordAddModal").modal({
					backdrop : "static"
				});
				$("#add_save_btn").show(); 
				$("#edit_record_btn").hide(); 
			});

			$("#add_save_btn").click(function() {
				//1.模态框中填写的表单数据提交给服务器进行保存
				//2.发送ajax请求保存员工
				/* alert($("#formCarMeg").serialize()); */
				$.ajax({
					url : "${APP_PATH}/carMeg",
					type : "POST",
					data : $("#formCarMeg").serialize(),
					success : function(result) {
						//1.关闭模态框
						$("#recordAddModal").modal('hide');
						//2.显示最后一页,来电保存的数据
						to_page(1);

					}

				});

			});
			
			$("#edit_record_btn").click(function() {
				//1.模态框中填写的表单数据提交给服务器进行保存
				//2.发送ajax请求保存员工
				/* alert($("#formCarMeg").serialize()); */
				$.ajax({
					url : "${APP_PATH}/update/carMeg",
					type : "POST",
					data : $("#formCarMeg").serialize(),
					success : function(result) {
						//1.关闭模态框
						$("#recordAddModal").modal('hide');
						//2.显示最后一页,来电保存的数据
						to_page(1);

					}

				});

			});

			function editRecord(index) {
				var item = totalRecord[index];
				$('#recordAddModal input[name=code]').val(item.code);
				$('#recordAddModal input[name=trademark]').val(item.trademark);
				$('#recordAddModal input[name=brand]').val(item.brand);
				$('#recordAddModal input[name=style]').val(item.style);
				$('#recordAddModal input[name=carload]').val(item.carload);
				$('#recordAddModal input[name=usedtime]').val(item.usedtime);
				$('#recordAddModal input[name=drivername]').val(item.drivername);
				$('#recordAddModal input[name=drivertime]').val(item.drivertime);
				$('#recordAddModal input[name=licencenumber]').val(item.licencenumber);
				$('#recordAddModal input[name=licencestyle]').val(item.licencestyle);
				$('#recordAddModal input[name=transpotstyle]').val(item.transpotstyle);
				$('#recordAddModal input[name=linkman]').val(item.linkman);
				$('#recordAddModal input[name=linkphone]').val(item.linkphone);
				$('#recordAddModal textarea[name=remark]').val(item.remark);
				$('#recordAddModal input[name=username]').val(item.username);
				$("#recordAddModal").modal({
					backdrop : "static"
				});
				$("#add_save_btn").hide(); 
				$("#edit_record_btn").show(); 
			}

			function removeRecord(id) {
				$.ajax({
					url : "${APP_PATH}/remove/carMeg",
					data : "id=" + id,
					type : "GET",
					success : function(result) {
						to_page(1);
					}
				});
			}

			function dateToStr(formatStr, date) {
				formatStr = arguments[0] || "yyyy-MM-dd HH:mm:ss";
				date = arguments[1] || new Date();
				var str = formatStr;
				var Week = [ '日', '一', '二', '三', '四', '五', '六' ];
				str = str.replace(/yyyy|YYYY/, date.getFullYear());
				str = str.replace(/yy|YY/, (date.getYear() % 100) > 9 ? (date
						.getYear() % 100).toString() : '0'
						+ (date.getYear() % 100));
				str = str.replace(/MM/,
						date.getMonth() > 9 ? (date.getMonth() + 1) : '0'
								+ (date.getMonth() + 1));
				str = str.replace(/M/g, date.getMonth());
				str = str.replace(/w|W/g, Week[date.getDay()]);

				str = str.replace(/dd|DD/, date.getDate() > 9 ? date.getDate()
						.toString() : '0' + date.getDate());
				str = str.replace(/d|D/g, date.getDate());

				str = str.replace(/hh|HH/, date.getHours() > 9 ? date
						.getHours().toString() : '0' + date.getHours());
				str = str.replace(/h|H/g, date.getHours());
				str = str.replace(/mm/, date.getMinutes() > 9 ? date
						.getMinutes().toString() : '0' + date.getMinutes());
				str = str.replace(/m/g, date.getMinutes());

				str = str.replace(/ss|SS/, date.getSeconds() > 9 ? date
						.getSeconds().toString() : '0' + date.getSeconds());
				str = str.replace(/s|S/g, date.getSeconds());

				return str;
			}
		</script>
</body>
</html>
