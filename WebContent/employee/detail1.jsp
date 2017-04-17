<%@ page import="java.sql.*,javax.sql.*,dao.DbUtil,java.text.*"
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	String userName = (String) session.getAttribute("name");
	if(userName == null) {
		response.sendRedirect("../login/index.html");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8" />
<title>SMKT | Detail</title>
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
<link rel="shortcut icon" href="favicon.ico" />
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
			<a href="javascript:;" class="navbar-toggle" data-toggle="collapse"
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
						<li><a href="employee_info.jsp"><i class="fa fa-user"></i>个人信息</a></li>

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
							</div> -->
						</div>
					</form> <!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class=" "><a href="index-employee.jsp"> <i
						class="fa fa-home"></i> <span class="title">首页</span> <span
						class="selected"></span>
				</a></li>
				<li class="start active"><a href="n1.jsp"> <i
						class="fa fa-table"></i> <span class="title">公告栏</span> <span
						class="arrow "></span>
				</a></li>

				<li class=""><a href="storage.jsp"> <i
						class="fa fa-bookmark-o"></i> <span class="title">库存管理</span> <span
						class="arrow "></span>
				</a></li>

				<li class=""><a href="goods.jsp"> <i class="fa fa-sitemap"></i>
						<span class="title">商品管理</span> <span class="arrow "></span>
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






			<%
				PreparedStatement pstat = null;
				ResultSet rs = null;
				String sql = null;

				String state = null;
				String name = null, subject = null, time = null, message = null;
				String id = request.getParameter("id");

				session.setAttribute("id", id);

				Connection conn = DbUtil.getConnection();
				sql = "select * from `news` where id='" + id + " '";
				pstat = conn.prepareStatement(sql);
				rs = pstat.executeQuery();

				if (rs.next()) {
					id = rs.getString("id").trim();
					name = rs.getString("name").trim();
					subject = rs.getString("subject").trim();
					time = rs.getString("time").trim();
					message = rs.getString("message").trim();

				}
			%>





			<a href="staff.jsp">销售员工中心</a> <a href="index-employee.jsp">仓储员工中心</a>





			<form class="form-horizontal templatemo-contact-form-1" role="form"
				method="post">
				<div class="form-group">
					<div class="col-md-12">
						<h1 class="margin-bottom-15" align="center">公告栏</h1>
						<p>天天发布新消息，生活精彩不断ing</p>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12">
						<label for="subject" class="control-label">主题 *</label>
						<div class="templatemo-input-icon-container">
							<i class="fa fa-info-circle"></i> <input type="text"
								class="form-control" name="subject"
								value="<%=rs.getString("subject")%>" readonly>
						</div>
					</div>
				</div>



				<div class="form-group">
					<div class="col-md-12">
						<label for="name" class="control-label">发布者 *</label>
						<div class="templatemo-input-icon-container">
							<i class="fa fa-user"></i> <input type="text"
								class="form-control" name="name"
								value="<%=rs.getString("name")%>" readonly>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<label for="time" class="control-label">更新时间 *</label>
						<div class="templatemo-input-icon-container">
							<i class="fa fa-envelope-o"></i> <input type="text"
								class="form-control" name="time"
								value="<%=rs.getString("time")%>" readonly>
						</div>
					</div>
				</div>


				<div class="form-group">
					<div class="col-md-12">
						<label for="message" class="control-label">公告 *</label>
						<div class="templatemo-input-icon-container">
							<i class="fa fa-pencil-square-o"></i>
							<textarea rows="8" cols="50" class="form-control" name="message"
								readonly><%=rs.getString("message")%></textarea>
						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-12">
						<a class="btn btn-danger" href="n1.jsp">返回</a>
					</div>
				</div>
			</form>



			<!-- END PAGE HEADER-->
			<!-- BEGIN DASHBOARD STATS -->

			<!-- END DASHBOARD STATS -->

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
	<script src="../assets/plugins/respond.min.js"></script>
	<script src="../assets/plugins/excanvas.min.js"></script> 
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
		$(document)
				.ready(
						function() {
							$
									.getJSON(
											"../Employer",
											function(data) {
												$("table tr:gt(0)").remove();
												var html = "";
												for ( var i = 0; i < data.length; i++) {
													html += "<tr><td>"
															+ data[i].id
															+ "</td>";
													html += "<td>"
															+ data[i].name
															+ "</td>";

													html += "<td>"
															+ data[i].email
															+ "</td>";
													html += "<td>"
															+ data[i].phone
															+ "</td>";
													html += "<td>"
															+ data[i].socialID
															+ "</td>";
													html += "<td>"
															+ data[i].onjobtime
															+ "</td>";

													html += "<td>"
															+ "<form role='form' action='modifystaff.jsp?id="
															+ data[i].id
															+ "' method='post'><button type='submit' class='btn btn-danger'>修改</button></form>"
															+ "</td>";
													html += "<td>"
															+ "<form role='form' action='../Deletestaff?id="
															+ data[i].id
															+ "' method='post'><button type='submit' class='btn btn-danger'>删除</button></form>"
															+ "</td></tr>";

												}
												$("table").append(html);
											});
						});
	</script>




</body>


<!-- END BODY -->
</html>
