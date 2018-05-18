<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>物流动态</title>
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
		<jsp:include page="top.jsp" />
	</div>
	
	<!-- 页面主要内容 -->
	<div style="margin-left: 10%; width: 80%">
	<!-- 表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="users_table">
					<thead>
						<tr>
							<th>标题</th>
							<th>内容</th>
							<th>作者</th>
							<th>发布日期</th>
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
	
	<div>
		<jsp:include page="../WEB-INF/views/down.jsp" flush="true" />
	</div>

<script type="text/javascript">
			var totalRecord;
			//1.页面加载完成后，直接发送ajax请求，要到分页数据
			$(function() {
				to_page(1);
			});

			function to_page(pn) {
				$.ajax({
					url : "${APP_PATH}/logistics",
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
			
			function dateToStr(formatStr, date){
		        formatStr = arguments[0] || "yyyy-MM-dd HH:mm:ss";
		        date = arguments[1] || new Date();
		        var str = formatStr;   
		        var Week = ['日','一','二','三','四','五','六'];  
		        str=str.replace(/yyyy|YYYY/,date.getFullYear());   
		        str=str.replace(/yy|YY/,(date.getYear() % 100)>9?(date.getYear() % 100).toString():'0' + (date.getYear() % 100));   
		        str=str.replace(/MM/,date.getMonth()>9?(date.getMonth() + 1):'0' + (date.getMonth() + 1));   
		        str=str.replace(/M/g,date.getMonth());   
		        str=str.replace(/w|W/g,Week[date.getDay()]);   
		      
		        str=str.replace(/dd|DD/,date.getDate()>9?date.getDate().toString():'0' + date.getDate());   
		        str=str.replace(/d|D/g,date.getDate());   
		      
		        str=str.replace(/hh|HH/,date.getHours()>9?date.getHours().toString():'0' + date.getHours());   
		        str=str.replace(/h|H/g,date.getHours());   
		        str=str.replace(/mm/,date.getMinutes()>9?date.getMinutes().toString():'0' + date.getMinutes());   
		        str=str.replace(/m/g,date.getMinutes());   
		      
		        str=str.replace(/ss|SS/,date.getSeconds()>9?date.getSeconds().toString():'0' + date.getSeconds());   
		        str=str.replace(/s|S/g,date.getSeconds());   
		      
		        return str;   
		    }
			function build_user_table(result) {
				$("#users_table tbody").empty();
				var users = result.extend.pageInfo.list;
				$
						.each(
								users,
								function(index, item) {
 									var formatDate = dateToStr('yyyy-MM-dd HH:mm:ss', new Date(item.issuedate));
									var userIdTd = $("<td></td>").append(
											item.title);
									var contentTd = $("<td></td>").append(
											item.content);
									var userNameTd = $("<td></td>").append(
											item.author);
									
									var issDate = $("<td></td>").append(
											/* new Date(item.issuedate) */
											formatDate
											);
							
									/* var btnTd = $("<td></td>").append(editBtn)
											.append(" ").append(delBtn);
 */
									$("<tr></tr>").append(userIdTd).append(contentTd).append(
											userNameTd).append(issDate)
											.appendTo("#users_table tbody");
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
			
		</script>

</body>


</html>