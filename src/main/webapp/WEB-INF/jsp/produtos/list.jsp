<%@ taglib prefix="authz"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Dashboard - W8 Admin</title>
		<meta name="description" content="This is page-header (.page-header &gt; h1)" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!--basic styles-->

		<link href="<c:url value="/assets/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" />
		<link href="<c:url value="/assets/bootstrap/css/bootstrap-responsive.min.css"/>" rel="stylesheet"/>
		<link rel="stylesheet" href="<c:url value="/assets/themes/font-awesome/css/font-awesome.min.css"/>"/>

		<!--[if IE 7]>
		  <link rel="stylesheet" href="<c:url value="/assets/themes/font-awesome/css/font-awesome-ie7.min.css"/>" />
		<![endif]-->

		<!--page specific plugin styles-->

		<link rel="stylesheet" href="<c:url value="/assets/themes/css/prettify.css"/>" />

		<!--fonts-->

		<link rel="stylesheet" href="<c:url value="http://fonts.googleapis.com/css?family=Open+Sans:400,300"/>" />

		<!--ace styles-->

		<link rel="stylesheet" href="<c:url value="/assets/themes/css/w8.min.css"/>" />
		<link rel="stylesheet" href="<c:url value="/assets/themes/css/w8-responsive.min.css"/>" />
		<link rel="stylesheet" href="<c:url value="/assets/themes/css/w8-skins.min.css"/>" />
		
		<link href="<c:url value="/assets/css/vpsa.css" />" rel="stylesheet" media="screen">
				
		<link id="theme" rel="stylesheet" type="text/css" media="all" href="<c:url value="/assets/css/default.less"></c:url>">
		<script src="<c:url value="/assets/js/less-1.4.1.min.js" />" type="text/javascript"></script>

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="/assets/themes/css/ace-ie.min.css" />
		<![endif]-->

		<!--inline styles if any-->
	</head>

	<body>
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a href="#" class="brand">
						<small>
							<i class="icon-unlock-alt"></i>
							W8 Admin
						</small>
					</a><!--/.brand-->

					<ul class="nav ace-nav pull-right">
						<li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-tasks"></i>
								<span class="badge badge-grey">4</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
								<li class="nav-header">
									<i class="icon-ok"></i>
									4 Tasks to complete
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Software Update</span>
											<span class="pull-right">65%</span>
										</div>

										<div class="progress progress-mini ">
											<div style="width:65%" class="bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Hardware Upgrade</span>
											<span class="pull-right">35%</span>
										</div>

										<div class="progress progress-mini progress-danger">
											<div style="width:35%" class="bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Unit Testing</span>
											<span class="pull-right">15%</span>
										</div>

										<div class="progress progress-mini progress-warning">
											<div style="width:15%" class="bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">Bug Fixes</span>
											<span class="pull-right">90%</span>
										</div>

										<div class="progress progress-mini progress-success progress-striped active">
											<div style="width:90%" class="bar"></div>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										See tasks with details
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="purple">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-bell-alt icon-only icon-animated-bell"></i>
								<span class="badge badge-important">8</span>
							</a>

							<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-closer">
								<li class="nav-header">
									<i class="icon-warning-sign"></i>
									8 Notifications
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-pink icon-comment"></i>
												New Comments
											</span>
											<span class="pull-right badge badge-info">+12</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<i class="btn btn-mini btn-primary icon-user"></i>
										Bob just signed up as an editor ...
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-success icon-shopping-cart"></i>
												New Orders
											</span>
											<span class="pull-right badge badge-success">+8</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										<div class="clearfix">
											<span class="pull-left">
												<i class="btn btn-mini no-hover btn-info icon-twitter"></i>
												Followers
											</span>
											<span class="pull-right badge badge-info">+11</span>
										</div>
									</a>
								</li>

								<li>
									<a href="#">
										See all notifications
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="green">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-envelope-alt icon-only icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>

							<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-closer">
								<li class="nav-header">
									<i class="icon-envelope"></i>
									5 Messages
								</li>

								<li>
									<a href="#">
										<img src="themes/images/avatar.png" class="msg-photo" alt="Alex's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Alex:</span>
												Ciao sociis natoque penatibus et auctor ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>a moment ago</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="#">
										<img src="themes/images/avatar3.png" class="msg-photo" alt="Susan's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Susan:</span>
												Vestibulum id ligula porta felis euismod ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>20 minutes ago</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="#">
										<img src="themes/images/avatar4.png" class="msg-photo" alt="Bob's Avatar" />
										<span class="msg-body">
											<span class="msg-title">
												<span class="blue">Bob:</span>
												Nullam quis risus eget urna mollis ornare ...
											</span>

											<span class="msg-time">
												<i class="icon-time"></i>
												<span>3:15 pm</span>
											</span>
										</span>
									</a>
								</li>

								<li>
									<a href="#">
										See all messages
										<i class="icon-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>

						<li class="light-blue user-profile">
							<a data-toggle="dropdown" href="#" class="user-menu dropdown-toggle">
								<img class="nav-user-photo" src="themes/images/user.png" alt="Jason's Photo" />
								<span id="user_info">
									<small>Welcome,</small>
									Jason
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer" id="user_menu">
								<li>
									<a href="#">
										<i class="icon-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i>
										Profile
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="#">
										<i class="icon-off"></i>
										Logout
									</a>
								</li>
							</ul>
						</li>
					</ul><!--/.w8-nav-->
				</div><!--/.container-fluid-->
			</div><!--/.navbar-inner-->
		</div>

		<div class="container-fluid" id="main-container">
			<a id="menu-toggler" href="#">
				<span></span>
			</a>

			<div id="sidebar">
				<div id="sidebar-shortcuts">
					<div id="sidebar-shortcuts-large">
						<button class="btn btn-small btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-small btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-small btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-small btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!--#sidebar-shortcuts-->

				<ul class="nav nav-list">
					<li class="active">
						<a href="index.html">
							<i class="icon-dashboard"></i>
							<span>In�cio</span>
						</a>
					</li>
					
					<c:forEach items="${categorys}" var="entry" > 
						<li>		
							<c:choose>
								<c:when test="${fn:length(entry.value) gt 0}">
									<a href="<c:url value="/product/load/${entry.key.id}" />" class="dropdown-toggle" >
										<i class="icon-desktop"></i>
										<span>${entry.key.description}</span>
										<b class="arrow icon-angle-down"></b>
									</a>
									
									<ul class="submenu">
			                   		<c:forEach items="${entry.value}" var="valueListMap"> 
			                        	<li>
											<a href="<c:url value="/product/load/${valueListMap.id}" />">
												<i class="icon-double-angle-right"></i>
													${valueListMap.description}
											</a>
										</li>
			                   		</c:forEach> 
			                   		</ul>									
								</c:when>
								<c:otherwise>
									<li>
										<a href="<c:url value="/product/load/${entry.key.id}" />">
											<i class="icon-text-width" ></i>
											<span>${entry.key.description}</span>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
																								                   		
						</li>
          		   </c:forEach> 
																
				</ul><!--/.nav-list-->

				<div id="sidebar-collapse">
					<i class="icon-double-angle-left"></i>
				</div>
			</div>

			<div id="main-content" class="clearfix">
				<div id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="icon-home"></i>
							<a href="#">Home</a>

							<span class="divider">
								<i class="icon-angle-right"></i>
							</span>
						</li>
						<li class="active">Dashboard</li>
					</ul><!--.breadcrumb-->

					<div id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="input-small search-query" id="nav-search-input" autocomplete="off" />
								<i class="icon-search" id="nav-search-icon"></i>
							</span>
						</form>
					</div><!--#nav-search-->
				</div>

				<div id="page-content" class="clearfix">
					<div class="page-header position-relative">
						<h1>
							Dashboard
							<small>
								<i class="icon-double-angle-right"></i>
								overview &amp; stats
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<!--PAGE CONTENT BEGINS HERE-->

						<div class="alert alert-block alert-success">
							<button type="button" class="close" data-dismiss="alert">
								<i class="icon-remove"></i>
							</button>

							<i class="icon-ok green"></i>

							Welcome to
							<strong class="green">
								W8
								<small>(v1.0)</small></strong>, the lightweight, feature-rich, easy to use and well-documented admin template.
						</div>

						<div class="space-6"></div>
						
							<!-- CONTEUDO -->
							<form class="form-search"  method="get" id="search-produtos">
								<div class="input-append">
								  <input type="text" id="filter-product" class="input-large search-query span2">
									<button type="submit" class="btn" onclick="submitSearch('<c:url value="/filter/" />');">Buscar</button>
								</div>
							</form>
							
							<div class="field-row">
								<div class="field field-3-columns">							
											
										<c:choose>
											<c:when test="${fn:length(products) > 0}">
												<c:forEach var="product" items="${products}">													
														<!--  <a class="link" href="<c:url value="/detail/${product.id}" />"><c:out value="${product.description}" /></a>  -->
														<input type="text" value="${product.description}"/>													
												</c:forEach>
											</c:when>
											<c:when test="${fn:length(products) <= 0}">
												<p>Realize uma busca para encontrar o produto desejado.</p>
											</c:when>
										</c:choose>	
																										
								</div>
							</div>
							<c:if test="${numberOfPages > 1 && fn:length(products) > 0}">
								<div class="btn-group">
					
										<c:if test="${currentPage != 1}">
											<a class="btn" href="<c:url value="?page=${prevPage}" />">Anterior</a>
										</c:if>
										<c:if test="${currentPage != numberOfPages}">
											<a class="btn" href="<c:url value="?page=${nextPage}" />">Pr�ximo</a>
										</c:if>
					
								</div>
							</c:if>
							
							
						</div><!--/row-->

						<!--PAGE CONTENT ENDS HERE-->
					</div><!--/row-->
				</div><!--/#page-content-->

				<div id="ace-settings-container">
					<div class="btn btn-app btn-mini btn-warning" id="ace-settings-btn">
						<i class="icon-cog"></i>
					</div>

					<div id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hidden">
									<option data-class="default" value="#438EB9">#438EB9</option>
									<option data-class="skin-1" value="#222A2D">#222A2D</option>
									<option data-class="skin-2" value="#C6487E">#C6487E</option>
									<option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; Choose Skin</span>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-header" />
							<label class="lbl" for="ace-settings-header"> Fixed Header</label>
						</div>

						<div>
							<input type="checkbox" class="ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
						</div>
					</div>
				</div><!--/#ace-settings-container-->
			</div><!--/#main-content-->
		</div><!--/.fluid-container#main-container-->

		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only bigger-110"></i>
		</a>

		<!--basic scripts-->

		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		less-1.4.1.min.js
		<script type="text/javascript">
			window.jQuery || document.write("<script src='/catalagovpsa/assets/themes/js/jquery-1.9.1.min.js'>"+"<"+"/script>");
		</script>
		<script src="<c:url value="/assets/bootstrap/js/bootstrap.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery-ui-1.10.3.custom.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.ui.touch-punch.min.js"/>"></script>
		
		<script src="<c:url value="/assets/themes/js/jquery.slimscroll.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.easy-pie-chart.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.sparkline.min.js"/>"></script>
		
		<script src="<c:url value="/assets/themes/js/jquery.flot.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.flot.pie.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/jquery.flot.resize.min.js"/>"></script>

		<!--w8 scripts-->

		<script src="<c:url value="/assets/themes/js/w8-elements.min.js"/>"></script>
		<script src="<c:url value="/assets/themes/js/w8.min.js"/>"></script>
		
		<script src="<c:url value="/assets/js/events.js" />"></script>				

		<!--inline scripts related to this page-->

		<script type="text/javascript">
			$(function() {
			
				$('.dialogs,.comments').slimScroll({
			        height: '300px'
			    });
				
				$('#tasks').sortable();
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
			
				var oldie = $.browser.msie && $.browser.version < 9;
				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: oldie ? false : 1000,
						size: size
					});
				})
			
				$('.sparkline').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html', {tagValuesAttribute:'data-values', type: 'bar', barColor: barColor , chartRangeMin:$(this).data('min') || 0} );
				});
			
			
			
			
			  var data = [
				{ label: "social networks",  data: 38.7, color: "#68BC31"},
				{ label: "search engines",  data: 24.5, color: "#2091CF"},
				{ label: "ad campaings",  data: 8.2, color: "#AF4E96"},
				{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
				{ label: "other",  data: 10, color: "#FEE074"}
			  ];
			
			  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
			  $.plot(placeholder, data, {
				
				series: {
			        pie: {
			            show: true,
						tilt:0.8,
						highlight: {
							opacity: 0.25
						},
						stroke: {
							color: '#fff',
							width: 2
						},
						startAngle: 2
						
			        }
			    },
			    legend: {
			        show: true,
					position: "ne", 
				    labelBoxBorderColor: null,
					margin:[-30,15]
			    }
				,
				grid: {
					hoverable: true,
					clickable: true
				},
				tooltip: true, //activate tooltip
				tooltipOpts: {
					content: "%s : %y.1",
					shifts: {
						x: -30,
						y: -50
					}
				}
				
			 });
			
			 
			  var $tooltip = $("<div class='tooltip top in' style='display:none;'><div class='tooltip-inner'></div></div>").appendTo('body');
			  placeholder.data('tooltip', $tooltip);
			  var previousPoint = null;
			
			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$(this).data('tooltip').show().children(0).text(tip);
					}
					$(this).data('tooltip').css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$(this).data('tooltip').hide();
					previousPoint = null;
				}
				
			 });
			
			
			
			
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});
			
			
				$('#recent-box [data-rel="tooltip"]').tooltip({plw8ment: tooltip_plw8ment});
				function tooltip_plw8ment(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			})
		</script>
	</body>
</html>
