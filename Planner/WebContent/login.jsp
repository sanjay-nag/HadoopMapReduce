<!DOCTYPE html>
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
<link href='stylesheets/gstyle.css' rel='stylesheet' type='text/css' />


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

				</div>


			</div>
			<!-- END Header -->


			<div class="row">

				<div class="heading_dots hide-for-small">
					<h1 class="heading_supersize">
						<span class="heading_center_bg">Login Form</span>
					</h1>
				</div>

				<div class="eight columns" style='text-align: center;'>

					<%
						String chk = request.getParameter("login");
						if (chk != null && chk.equals("fail")) {
					%>

					<h2>Sorry. !! You have entered an invalid ID or Password. Try
						again.</h2>
					<%
						}
					%>



					<form class='well' action='login' method='post'>
						<label>Enter your email : </label> <input type=text name='un'
							placeholder='Email' class='form-control' /> <label>Enter
							your password : </label> <input type=password name='pw'
							placeholder='Password' class='form-control' /> <input
							type=submit class="button round" value='LOGIN' /> <input
							type=reset class='button round' value='CLEAR' />

					</form>


				</div>
			</div>








			<%@include file='footer.jsp'%>




			<div class="row">
				<div class="twelve columns">
					<ul id="menu3" class="footer_menu horizontal">
						<li class="">&copy; 2015 Sir MVIT </li>
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
