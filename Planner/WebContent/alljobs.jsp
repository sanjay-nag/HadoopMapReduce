<!DOCTYPE html>
<%@page import="col.mvit.pojo.Job"%>
<%@page import="java.util.List"%>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8" />

<meta name="viewport" content="width=device-width" />

<title>Sir MVIT | Big Data</title>


<!-- Included CSS Files (Compressed) -->
<link rel="stylesheet" href="stylesheets/foundation.min.css">
<!-- <link rel="stylesheet" href="stylesheets/main_white.css"> -->
<!-- <link rel="stylesheet" href="stylesheets/main_light.css"> -->
<link rel="stylesheet" href="stylesheets/main.css">
<link rel="stylesheet" href="stylesheets/app.css">

<script src="javascripts/modernizr.foundation.js"></script>

<!-- Google fonts -->
<link href=stylesheets/gstyle.css rel='stylesheet' type='text/css' />


</head>
<body>



	<div class="row">

		<a href="index.html"><img src="images/logo.png" alt="desc"
			style="border: none; margin-top: 25px" /></a>

	</div>


	<div class="row page_wrap" style="margin-top: -2px">
		<!-- page wrap -->
		<div class="twelve columns">
			<!-- page wrap -->


			<div class="row">

				<div class="twelve columns header_nav"
					style="margin-bottom: 0; box-shadow: none">

					<div class="twelve columns">

						<%@include file="header.jsp"%>
					</div>
					<%
						if (em==null) {
									
								response.sendRedirect("login.jsp");
								}
					%>
				</div>


			</div>
			<!-- END Header -->


			<div class="row">

				<div class="heading_dots hide-for-small">
					<h1 class="heading_supersize">
						<span class="heading_center_bg">All Jobs</span>
					</h1>
				</div>

				<div class="twelve columns" style='text-align: center;'>


					<%
						List<Job> jobs = (List<Job>)  request.getAttribute("jobs");
																										
																	if (jobs==null || jobs.size()==0) {
					%>
					SORRY ! No JOBS as of now
					<%
						} else {
					%>
					<table class='table table-hover'>
						<tr style='background-color: #fe563b; color: white;' height=40>
							<th>Type</th>
							<th>Daily</th>
							<th>Weekly</th>
							<th>Monthly</th>
							<th>Runtime</th>
							<th>Last run</th>
							<th>Status</th>
							<th>Input</th>
							<th>Email</th>
							<th>Action</th>
						</tr>

						<%
							for (Job job : jobs) {
						%>

						<tr valign="center">

							<td><%=job.getType()%></td>
							<td>
								<%
									if (job.getDaily() == 1) {
								%> YES <%
									} else {
								%> NO <%
									}
								%>
							</td>
							<td>
								<%
									if (job.getWeekly() == -1) {
								%> NO <%
									} else {
								%> YES <%
									}
								%>

							</td>
							<td>
								<%
									if (job.getMonthly() == -1) {
								%> NO <%
									} else {
								%> YES <%
									}
								%>
							</td>
							<td><%=job.getRuntime()%></td>
							<td><%=job.getLastrun()%></td>
							<td><%=job.getStatus()%></td>
							<td><%=job.getInput()%></td>
							<td><%=job.getEmail()%></td>
							<td>
								<form action='opFolders'>
									<input type=hidden name='id' value='<%=job.getId()%>' /> <input
										type=hidden name='input' value='<%=job.getInput()%>' /> <input
										type=submit value='VIEW' class='button round' />
								</form>
							</td>
						</tr>

						<%
							}
						%>

					</table>
					<%
						}
					%>

				</div>
			</div>








			<%@include file='footer.jsp'%>




			<div class="row">
				<div class="twelve columns">
					<ul id="menu3" class="footer_menu horizontal">
						<li class="">&copy; 2015 Sir MVIT</li>
					</ul>
				</div>
			</div>

			<script type="text/javascript">
				//<![CDATA[
				$('ul#menu3').nav - bar();
				//]]>
			</script>

		</div>

	</div>
	<!-- end page wrap) -->
	<!-- Included JS Files (Compressed) -->
	<script src="javascripts/foundation.min.js" type="text/javascript">
		
	</script>
	<!-- Initialize JS Plugins -->
	<script src="javascripts/app.js" type="text/javascript">
		
	</script>

</body>
</html>
