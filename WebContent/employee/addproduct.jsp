<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>添加商品</title>
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
<link
	href="../assets/plugins/fullcalendar/fullcalendar/fullcalendar.css"
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
<link href="../assets/css/pages/tasks.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/css/themes/default.css" rel="stylesheet"
	type="text/css" id="style_color" />
<link href="../assets/css/custom.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico" />

<script type="text/javascript"
	src="../assets/script/jquery-1.11.1.min.js"></script>
<script id="jquery_172" type="text/javascript" class="library"
	src="js/jquery.min.js"></script>


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
				data-target=".navbar-collapse"> <img src="img/menu-toggler.png"
				alt="" />
			</a>
			<span style="display:block;font-size:12px;width:600px;height:60px;
				float:left;color:#fff;text-align:center;line-height:60px;margin-left:130px;">
				Copyright © 2016 SMKT Incorporated. All rights reserved By ChenYubing.
			</span>
			<ul class="nav navbar-nav pull-right">

				<li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" src="../assets/img/avatar1_small.jpg"/>
					<span class="username"><%=session.getAttribute("name") %></span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a href="employee_info.jsp"><i class="fa fa-user"></i>个人信息</a></li>
						
						<li class="divider"></li>
						<!-- <li><a href="javascript:;" id="trigger_fullscreen"><i class="fa fa-move"></i> 全屏</a></li>
						<li><a href="extra_lock.html"><i class="fa fa-lock"></i> 锁屏</a></li> -->
						<li><a href="../logout"><i class="fa fa-key"></i> 退出</a></li>
					</ul>
				</li>
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
					<!-- <div class="sidebar-toggler hidden-phone"></div> --> <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
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
				<li class=" "><a href="index-employee.jsp"> <i
						class="fa fa-home"></i> <span class="title">首页</span> <span
						class="selected"></span>
				</a></li>
				<li class=""><a href="n1.jsp"> <i class="fa fa-table"></i>
						<span class="title">公告栏</span> <span class="arrow "></span>
				</a></li>

				<li class=""><a href="storage.jsp"> <i
						class="fa fa-bookmark-o"></i> <span class="title">库存管理</span> <span
						class="arrow "></span>
				</a></li>

				<li class="start active"><a href="goods.jsp"> <i
						class="fa fa-sitemap"></i> <span class="title">商品管理</span> <span
						class="arrow "></span>
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
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
						SMKT超市<small>管理信息系统</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li><i class="fa fa-home"></i> <a href="index-employee.jsp">主页</a> <i
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


				<div class="container">
					<div class="col-md-3"></div>
					<div class="col-md-6 col-xs-12 login-right">
						<h3>添加商品</h3>

						<form method="post" action="../add" id="addForm">
							<div>
								<span>isbn编码&nbsp;&nbsp; </span> <input type="text"
									name="productID" id="productID">
							</div>
							<br>
							<div>
								<span>商品名称 &nbsp; </span> <input type="text" name="productname"
									id="productname">
							</div>
							<br>
							<div>
								<span>出售单价 &nbsp; </span> <input type="text" name="price"
									id="price">
							</div>
							<br>
							<div>
								<span>商品单位 &nbsp; </span> <input type="text" name="danwei"
									id="danwei">
							</div>
							<br>
							<div>
								<span>商品分类 &nbsp; </span> 
								<select name="fenlei" id="fenlei">
									<option value="果蔬类">果蔬类</option>
									<option value="粮油类">粮油类</option>
									<option value="调味品类">调味品类</option>
									<option value="零食类">零食类</option>
									<option value="生活用品类">生活用品类</option>
									<option value="生鲜肉类">生鲜肉类</option>
									<option value="洗漱用品类">洗漱用品类</option>
								</select>
							</div>
							<br>
							<div>
								<span>商品详情 </span>
								<textarea name="information" id="information"
									style="width: 96%; height: 80px;"
									bordercolor="RGB(221,219,219)"> </textarea>
							</div>
							<br> <input type="button" onclick="checkForm()" value="提交">
						</form>

					</div>
					<div class="clearfix"></div>
					<div class="col-md-3"></div>
				</div>

			</div>
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
	<script src="plugins/respond.min.js"></script>
	<script src="plugins/excanvas.min.js"></script> 
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
		<script
			src="../assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
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
		<script src="../assets/plugins/flot/jquery.flot.js"
			type="text/javascript"></script>
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

	<!-- 

<script src="scripts/bootstrap.min.js"></script> END JAVASCRIPTS -->
	<script src="../assets/scripts/jquery-1.11.1.min.js"></script>    
	<!-- END PAGE LEVEL SCRIPTS -->  

	<!-- END JAVASCRIPTS -->
	<script type="text/javascript">
		function checkForm() {
			var productname = document.getElementById("productname").value;
			var price = document.getElementById("price").value;
			var productid = document.getElementById("productID").value;
			var danwei = document.getElementById("danwei").value;
			if(productname.length == 0) {
				alert("商品名称不能为空");
				return false;
			}
			if(price.length == 0) {
				alert("商品价格不能为空");
				return false;
			}
			if(productid.length == 0) {
				alert("商品IBSN码不能为空");
				return false;
			}
			if(danwei.length == 0) {
				alert("商品单位不能为空");
				return false;
			}
			document.getElementById("addForm").submit();
		}
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
