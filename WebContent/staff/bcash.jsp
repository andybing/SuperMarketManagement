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
<title>SMKT | CASH</title>
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
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed" onload="setVip()">
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
				data-target=".navbar-collapse"> <img
				src="../assets/img/menu-toggler.png" alt="" />
			</a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav navbar-nav pull-right">

				<li class="dropdown user"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" data-hover="dropdown"
					data-close-others="true"> <img alt=""
						src="../assets/img/avatar1_small.jpg" /> <span class="username"><%=session.getAttribute("name")%></span>
						<i class="fa fa-angle-down"></i>
				</a>
					<ul class="dropdown-menu">
						<li><a href="staff_info.jsp"><i class="fa fa-user"></i>个人信息</a></li>

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
					<!-- BEGIN SIDEBAR TOGGLER BUTTON --> <!-- <div class="sidebar-toggler hidden-phone"></div>  -->
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
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
				<li class=" "><a href="bindexcash.jsp"> <i
						class="fa fa-home"></i> <span class="title">首页</span> <span
						class="selected"></span>
				</a></li>
				<li class=""><a href="bseenews.jsp"> <i class="fa fa-gift"></i>
						<span class="title">公告栏</span> <span class="arrow "></span>
				</a></li>
				<li><a class="" href="bmember.jsp"> <i class="fa fa-leaf"></i>
						<span class="title">会员管理</span> <span class="arrow "></span>
				</a></li>
				<li><a href="bsalemanagement.jsp"> <i
						class="fa fa-folder-open"></i> <span class="title">销售管理</span> <span
						class="arrow "></span>
				</a></li>
				<li class="start active"><a href="bcash.jsp"> <i
						class="fa fa-folder-open"></i> <span class="title">收银</span> <span
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
						<li><i class="fa fa-home"></i> <a href="bindexcash.jsp">主页</a>
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


				<div>
					<form role="form" action="../Saleinsert" method="post"
						id="saleInsert">
						<div class="form-group">

							<label for="productID"> 商品编号： </label> <input type="text"
								name="productID" class="form-control" id="productId">
						</div>

						<div class="form-group">
							<label for="quantity"> 商品销售数量： </label> <input type="text"
								name="quantity" class="form-control" id="quantity">
						</div>
						<div class="form-group">
							<label for="vip"> 是否会员 </label> &nbsp;&nbsp; <input
								type="checkbox" name="vip" class="vip" id="vip" /> <input
								type="hidden" name="vipFlag" id="vipFlag"
								value="<%=session.getAttribute("vip")%>" />
						</div>
						<button type="button" class="btn btn-info" align="center"
							onclick="checkForm()">确定</button>
						<input type="reset" class="btn btn-info" align="center" />
					</form>

					<hr size=3000 color="black">

					<table class='table table-striped'>
						<tr>
							<td>商品编号</td>
							<td>商品名称</td>
							<td>商品单价</td>
							<td>购买数量</td>
							<td>商品总计</td>
							<td>操作</td>
						</tr>

					</table>

					<%
						PreparedStatement pstat = null;
						ResultSet rs = null;
						String sql = null;

						String state = null;
						double sum = 0;
						Connection conn = DbUtil.getConnection();
						sql = "select SUM(money) from `sales` where state='未完成'";
						pstat = conn.prepareStatement(sql);
						rs = pstat.executeQuery();

						if (rs.next()) {
							sum = rs.getDouble(1);
						}

						out.print("<h3><strong>" + "合计" + sum + "元" + "</strong>");
						out.print("<strong>"
								+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员折扣 0.9折"
								+ "</strong></h3>");
					%>
					&nbsp;

					<form role="form" action="../Clear" method="post"
						style="margin-left:0px;">
						<strong>应收：</strong><input type="text" name="yingshou"
							value="<%=sum%>" readonly="readonly" id="yingshou" /> <strong>实收：</strong><input
							type="text" name="shishou" onblur="zhao()" id="shishou" /> <strong>找零：</strong><input
							type="text" name="zhaoling" id="zhaoling" readonly="readonly" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="submit" class="btn btn-info" align="center"
							style="width:150px;height:40px;font-size:20px;">收款</button>
					</form>
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
		<script
			src="../assets/plugins/jqvmap/jqvmap/maps/jquery.vmap.world.js"
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
		<script
			src="../assets/plugins/bootstrap-daterangepicker/moment.min.js"
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

		<script src="../assets/scripts/app.js" type="text/javascript"></script>
		<script src="../assets/scripts/index.js" type="text/javascript"></script>
		<script src="../assets/scripts/tasks.js" type="text/javascript"></script>

		<script type="text/javascript">
			function zhao() {
				var yingshou = document.getElementById("yingshou").value;
				var shishou = document.getElementById("shishou").value;
				if (shishou == null || shishou.trim().length == 0) {
					alert("请输入实收金额");
					document.getElementById("shishou").focus();
					return false;
				}
				var zhaoling = shishou - yingshou;
				document.getElementById("zhaoling").value = (zhaoling+"").substring(0, (zhaoling+"").indexOf(".")+2);
			}

			function setVip() {
				var vipFlag = document.getElementById("vipFlag").value;
				if (vipFlag == "1") {
					document.getElementById("vip").checked = "checked";
				}
			}

			function checkForm() {
				var vip = document.getElementById("vip").checked;
				var productId = document.getElementById("productId").value;
				var quantity = document.getElementById("quantity").value;

				if (productId.trim().length == 0) {
					alert("请输入要购买的商品编号");
					return false;
				}
				if (quantity.trim().length == 0) {
					alert("请输入要购买的商品数量");
					return false;
				}
				$.getJSON("../getStorage?productID="+productId, function(data){
					if(parseInt(data[0].amount) == -1) {
						alert("库存中没有此商品了，不能购买！");
						document.getElementById("productId").focus();
						return false;
					}
					
					if(parseInt(data[0].amount) < parseInt(quantity)) {
						alert("商品库存量不足,现在库存量为: "+ data[0].amount);
						return false;
					}else {
						document.getElementById("saleInsert").action = "../Saleinsert?vip=" + vip;
						document.getElementById("saleInsert").submit();
					}
				});
			}

			$(document).ready(function() {
				$.getJSON("../Sale",function(data) {
					$("table tr:gt(0)").remove();
					var html = "";
					for ( var i = 0; i < data.length; i++) {
						html += "<tr><td>"
						+ data[i].productID
						+ "</td>";
						html += "<td>"
							+ data[i].name
							+ "</td>";
						html += "<td>"
								+ data[i].price
								+ "</td>";
						html += "<td>"
								+ data[i].quantity
								+ "</td>";
						html += "<td>"
								+ data[i].money
								+ "</td>";
						html += "<td>"
						+ "<form role='form' action='../Deleteorder?id="
								+ data[i].id+"&productID="+data[i].productID+"&quantity="+data[i].quantity
								+ "' method='post'><button type='submit' class='btn btn-success'>删除</button></form>"
								+ "</td></tr>";
								}
					$("table").append(html);
					});
				});
		</script>
</body>
</html>
