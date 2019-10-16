<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
						if (em == null) {

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

				<div class="twelve columns">

					<%
						String res = request.getParameter("res");
						if (res != null && res.equals("success")) {
					%>
					<h3>Successfully create a new Job</h3>
					<%
						} else if (res != null && res.equals("fail")) {
					%>
					<h3>
						Something went wrong while creating a job. <br> <a
							href='newJob.jsp'>Click here </a>to try again
					</h3>
					<%
						} else {
					%>

					<div class='nine columns'>
						<form action='newjob' method='post'>
							<label> Select the Job you want to plan </label> <select
								name='type'>
								<option value='1'>Apache Server Log Analysis</option>
								<option value='2'>Frequency count</option>
								<option value='3'>Weather Analysis</option>
							</select> <br> <br> <label> Select the frequency of the
								Job </label> <select name='freq' id='freq'>
								<option value='1'>Daily</option>
								<option value='2'>Weekly</option>
								<option value='3'>Monthly</option>
							</select> <br>

							<div id='wd'>
								<label> Select the day in a week </label> <select name='weekday'>
									<option value='2'>Monday</option>
									<option value='3'>Tuesday</option>
									<option value='4'>Wednesday</option>

									<option value='5'>Thursday</option>
									<option value='6'>Friday</option>
									<option value='0'>Saturday</option>
									<option value='1'>Sunday</option>
								</select>
							</div>
							<br>

							<div id='md'>
								<label> Select the day in a month </label> <input type=text
									name='monthday' placeholder='Appropriate day of month ' /> <br>
							</div>
							<label> Specify the time at which your Job has to be run
								(hh:mm) </label> <input type=text name='runtime' placeholder='hh:mm' />

							<br> <label> Specify the input folder name </label> <input
								type=text name='inputpath'
								placeholder='Relative from /user/root' /> <br> <label>
								Enter the email ID for receiving notifications </label> <input type=text
								name='email' placeholder='example@gmail.com' /> <br> <br>
							<input type=submit value='PLAN' class='button large round' /> <input
								type=reset value='CLEAR' class='button large round' />

						</form>
						<%
							}
						%>
					</div>
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


<script>
	$(document).ready(function() {
		$('#wd').fadeOut();
		$('#md').fadeOut();

		$('#freq').change(function() {
			var chk = $('#freq').val();
			if (chk == 1) {
				$('#wd').fadeOut();
				$('#md').fadeOut();
			} else if (chk == 2) {
				$('#wd').fadeIn();
				$('#md').fadeOut();
			} else if (chk == 3) {
				$('#wd').fadeOut();
				$('#md').fadeIn();
			}

		});
	});
</script>

