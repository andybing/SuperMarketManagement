<%@ page import="java.sql.*,javax.sql.*,dao.DbUtil,java.text.*"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String name = (String) session.getAttribute("name");
	if(name == null) {
		response.sendRedirect("../login/index.html");
	}
%>
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>Manage_INDEX</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="MobileOptimized" content="320">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="../assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="../assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="../assets/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="../assets/plugins/gritter/css/jquery.gritter.css"
	rel="stylesheet" type="text/css" />
<link
	href="../assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<link href="../assets/plugins/fullcalendar/fullcalendar/fullcalendar.css"
	rel="stylesheet" type="text/css" />
<link href="../assets/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet"
	type="text/css" />
<link
	href="../assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="../assets/css/style-metronic.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/style-responsive.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/pages/tasks.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/themes/default.css" rel="stylesheet"
	type="text/css" id="style_color" />
<link href="../assets/css/custom.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<link rel="../shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner">
			<!-- BEGIN LOGO -->
			<a class="navbar-brand" href="index.html"> <img
				src="../assets/img/logo.png" alt="logo" class="img-responsive" />
			</a>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:void(0)" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse"> <img
				src="../assets/img/menu-toggler.png" alt="" />
			</a>
			<span style="display:block;font-size:12px;width:600px;height:60px;
				float:left;color:#fff;text-align:center;line-height:60px;margin-left:130px;">
				Copyright © 2016 SMKT Incorporated. All rights reserved By ChenYubing.
			</span>
			<ul class="nav navbar-nav pull-right">

				<li class="dropdown user"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-close-others="true"> <img alt=""
						src="../assets/img/avatar1_small.jpg" /> <span class="username"><%=session.getAttribute("name")%></span>
						<i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="manager_info.jsp"><i class="fa fa-user"></i>个人信息</a></li>

						<li class="divider"></li>
						<!-- <li><a href="javascript:;" id="trigger_fullscreen"><i
								class="fa fa-move"></i> 全屏</a></li>
						<li><a href="extra_lock.html"><i class="fa fa-lock"></i>
								锁屏</a></li> -->
						<li><a href="../logout"><i class="fa fa-key"></i> 退出</a></li>
					</ul></li>
				<!-- END USER LOGIN DROPDOWN -->
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu">
				<li>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<!-- <div class="sidebar-toggler hidden-phone"></div>  --><!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li>
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="extra_search.html"
						method="POST">
						<div class="form-container">
							<!-- <div class="input-box">
								<a href="javascript:;" class="remove"></a> <input type="text"
									placeholder="搜索..." /> <input type="button" class="submit"
									value=" " />
							</div>
							 -->
						</div>
					</form> <!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class=""><a href="index.jsp"> <i class="fa fa-home"></i>
						<span class="title">首页</span> <span class="selected"></span>
				</a></li>

				<li class="start active"><a href="index-manager.jsp"> <i
						class="fa fa-cogs"></i> <span class="title">发布公告</span> <span
						class="arrow "></span>
				</a></li>

				<li class=""><a href="manager-employer.jsp"> <i class="fa fa-table"></i>
						<span class="title">仓库职员管理</span> <span class="arrow "></span>
				</a></li>

				<li class=""><a href="manager-staff.jsp"> <i class="fa fa-cogs"></i>
						<span class="title">销售职员管理</span> <span class="arrow "></span>
				</a></li>



			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- END BEGIN STYLE CUSTOMIZER -->
			<!-- BEGIN PAGE HEADER-->
			<form class="form-horizontal templatemo-contact-form-1" role="form"
				action="../News" method="post" id="newForm">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
						SMKT超市<small>管理信息系统</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li><i class="fa fa-home"></i> <a href="index.jsp">主页</a> <i
							class="fa fa-angle-right"></i></li>
						<li class="pull-right">
							<div id="dashboard-report-range"
								class="dashboard-date-range tooltips" data-placement="top"
								data-original-title="Change dashboard date range">
								<i class="fa fa-calendar"></i> <span></span> <i
									class="fa fa-angle-down"></i>
							</div>
						</li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<h2 class="margin-bottom-15" align="center">
							公告栏
							</h2>
							<p>天天发布新消息，生活精彩不断ing</p>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12">
						<label for="subject" class="control-label">主题 *</label>
						<div class="templatemo-input-icon-container">
							<i class="fa fa-info-circle"></i> 
							<input type="text" class="form-control" name="subject" placeholder="主题" id="subject">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<label for="name" class="control-label">发布者 *</label>
						<div class="templatemo-input-icon-container">
							<i class="fa fa-user"></i> 
							<input type="text" value="<%=session.getAttribute("name") %>" readonly="readonly" class="form-control" name="name" placeholder="发布者" id="name">
						</div>
					</div>
				</div>



				<div class="form-group">
					<div class="col-md-12">
						<label for="message" class="control-label">公告 *</label>
						<div class="templatemo-input-icon-container">
							<i class="fa fa-pencil-square-o"></i>
							<textarea rows="8" cols="50" class="form-control" name="message"></textarea>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12">
						<input type="button" onclick="checkForm()" value="更新发布"
							class="btn btn-danger pull-right">
					</div>
				</div>
			</form>

			<h1 align="center">历史公告</h1>
			<table class='table table-striped'>
				<tr>
					<td>主题</td>


					<td>时间</td>
					<td>发布者</td>
					<td>信息</td>
					<td>查看详情</td>
					<td>删除</td>
				</tr>

			</table>
		</div>
		<!-- END PAGE -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<!-- <div class="footer">
		<div class="footer-inner">Design by Sandy</div>
		<div class="footer-tools">
			<span class="go-top"> <i class="fa fa-angle-up"></i>
			</span>
		</div>
	</div> -->
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<!--[if lt IE 9]>
	<script src="assets/plugins/respond.min.js"></script>
	<script src="assets/plugins/excanvas.min.js"></script> 
	<![endif]-->
	<script src="../assets/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="../assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jquery.cookie.min.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="../assets/plugins/jqvmap/jqvmap/jquery.vmap.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.usa.js"
		type="text/javascript"></script>
	<script
		src="../assets/plugins/jqvmap/jqvmap/data/jquery.vmap.sampledata.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="../assets/plugins/flot/jquery.flot.resize.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jquery.pulsate.min.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/bootstrap-daterangepicker/moment.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/plugins/bootstrap-daterangepicker/daterangepicker.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/gritter/js/jquery.gritter.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
	<script
		src="../assets/plugins/fullcalendar/fullcalendar/fullcalendar.min.js"
		type="text/javascript"></script>
	<script
		src="../assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jquery.sparkline.min.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="../assets/scripts/app.js" type="text/javascript"></script>
	<script src="../assets/scripts/index.js" type="text/javascript"></script>
	<script src="../assets/scripts/tasks.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

	<!-- END JAVASCRIPTS -->
	<script type="text/javascript">
		function checkForm() {
			var name = document.getElementById("name").value;
			var subject = document.getElementById("subject").value;
			if(subject.length == 0) {
				alert("主题不能为空");
				document.getElementById("subject").focus();
				return false;
			}
			if(name.length == 0) {
				alert("发布人不能为空");
				return false;
			}
			document.getElementById("newForm").submit();
		}
		
		function del() {
			if(window.confirm("确定要删除吗?")){
				document.getElementById("del").submit();
			}else {
				return false;
			}
			
		}
	
		$(document)
				.ready(
						function() {
							$
									.getJSON(
											"../Seenews",
											function(data) {
												$("table tr:gt(0)").remove();
												var html = "";
												for ( var i = 0; i < data.length; i++) {
													html += "<tr><td>"
															+ data[i].subject
															+ "</td>";
													html += "<td>"
															+ data[i].time
															+ "</td>";

													html += "<td>"
															+ data[i].name
															+ "</td>";
													html += "<td>"
															+ data[i].message
															+ "</td>";

													html += "<td>"
															+ "<form role='form' action='newsdetail.jsp?id="
															+ data[i].id
															+ "' method='post'><button type='submit' class='btn btn-danger'>详情</button></form>"
															+ "</td>";
													html += "<td>"
															+ "<form id='del' role='form' action='../Deletenews?id="
															+ data[i].id
															+ "' method='post'><input type='button' class='btn btn-danger' onclick='del()' value='删除'></form>"
															+ "</td></tr>";

												}
												$("table").append(html);
											});
						});
	</script>
</body>


<!-- END BODY -->
</html>
