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
<html>
<head>
<title>库存管理</title>
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
<style>
input[id="sousuo"] {
	display: inline-block;
	background: #df1f26;
	color: #FFF;
	font-size: 15px;
	line-height: 29px;
	text-transform: uppercase;
	border: none;
	outline: none;
	transition: 0.2s;
	-webkit-transition: 0.2s;
	-moz-transition: 0.2s;
	-o-transition: 0.2s;
}

input[id="keyword"] {
	width: 200px;
	color: #9198A3;
	font: 300 15px/25px Lato, 微软雅黑;
	background: #fff;
	outline: none;
	border: 1px solid;
}
</style>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner">
			<!-- BEGIN LOGO -->
			<a class="navbar-brand" href="javascript:void(0)"> <img
				src="../assets/img/logo.png" alt="logo" class="img-responsive" />
			</a>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse"> <img src="img/menu-toggler.png"
				alt="" />
			</a> <span
				style="display:block;font-size:12px;width:600px;height:60px;
				float:left;color:#fff;text-align:center;line-height:60px;margin-left:130px;">
				Copyright © 2016 SMKT Incorporated. All rights reserved By
				ChenYubing. </span>
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
						<!-- <li><a href="javascript:void(0)" id="trigger_fullscreen"><i
								class="fa fa-move"></i> 全屏</a></li>
						<li><a href="javascript:void(0)"><i class="fa fa-lock"></i>
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
					<!-- BEGIN SIDEBAR TOGGLER BUTTON --> <!-- <div class="sidebar-toggler hidden-phone"></div>  -->
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li>
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					<form class="sidebar-search" action="extra_search.html"
						method="POST">
						<div class="form-container">
							<!-- <div class="input-box">
								<a href="javascript:;" class="remove"></a>
								<input type="text" placeholder="搜索..."/>
								<input type="button" class="submit" value=" "/>
							</div> -->
						</div>
					</form> <!-- END RESPONSIVE QUICK SEARCH FORM -->


				</li>

				<li>
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM --> <!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li class=" "><a href="index-employee.jsp"> <i
						class="fa fa-home"></i> <span class="title">首页</span> <span
						class="selected"></span>
				</a></li>
				<li class=""><a href="n1.jsp"> <i class="fa fa-table"></i>
						<span class="title">公告栏</span> <span class="arrow "></span>
				</a></li>

				<li class="start active"><a href="storage.jsp"> <i
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
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3 class="page-title">
						SMKT超市<small>管理信息系统</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li><i class="fa fa-home"></i> <a href="index-employee.jsp">主页</a>
							<i class="fa fa-angle-right"></i></li>
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
						<h3>更新库存</h3>

						<form id="newform" method="post" action="../modifyamount">
							<div>
								<span>IBSN编码&nbsp;&nbsp; </span> <input type="text"
									name="productID" id="productID" readonly="readonly">
							</div>
							<br>
							<div>
								<span>商品名称 &nbsp; </span> <input type="text" name="name"
									id="name" readonly="readonly">
							</div>
							<br>
							<div>
								<span>更新数量 &nbsp; </span> <input type="text" name="amount"
									id="amount">
							</div>
							<br> <input type="button" onclick="checkForm()" value="提交">
						</form>

					</div>
					<div class="clearfix"></div>
					<div class="col-md-3"></div>
				</div>
			</div>
		</div>
		<!-- END PAGE -->
	</div>
	
	<script src="../assets/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script
		src="../assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js"
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
	<script
		src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.russia.js"
		type="text/javascript"></script>
	<script src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js"
		type="text/javascript"></script>
	<script
		src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.europe.js"
		type="text/javascript"></script>
	<script
		src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.germany.js"
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
	<script src="../assets/scripts/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript">
		function checkForm() {
			var amount = document.getElementById("amount").value;
			if(amount == null || amount.trim().length == 0 || !/^[0-9]+$/.test(amount)){
				alert("请输入正确的库存数量");
				return false;
			}
			
			if(!/^[0-9]+$/.test(amount) || amount < 0) {
				alert("输入的库存数量不正确");
				return false;
			}
			document.getElementById("newform").submit();
		}
	
		$(document).ready(
				function() {

					var url = location.href;
					//获取pid的参数值
					var es = /productID=/;
					es.exec(url);
					var productID = RegExp.rightContext;
					var aurl = "&productID=" + productID;
					$("form[id='newform']").attr("action",
							"../modifyamount?productID=" + productID);

					//var servlet = "productQuery?productID=" + productID;
					$.getJSON("../updateproduct?productID=" + productID,
							function(jsonData) {

								$("input[id='productID']").val(
										jsonData.productID);
								$("input[id='name']").val(jsonData.name);
								$("input[id='amount']").val(jsonData.amount);
							});
				});
	</script>
</body>
</html>