
<script type="text/javascript" src='javascripts/jquery.js'>
	
</script>
<ul id="menu-header" class="nav-bar horizontal">

	<li class=""><a href="index.jsp">Home</a></li>
	<%
		String em = (String) session.getAttribute("user");
	%>

	<%
		if (em != null) {
	%>

	<li class="has-flyout"><a href="#">Project</a><a href="#"
		class="flyout-toggle"></a>

		<ul class="flyout">

			<!-- 			<li class="has-flyout"><a href="blog_single.html">Login</a></li> -->

			<!-- 			<li class="has-flyout"><a href="products-page.html">Register</a></li> -->

			<li class="has-flyout"><a href="newJob.jsp">Plan a
					Job</a></li>

			<li class="has-flyout"><a href="alljobs">View all Jobs</a></li>

			<li class="has-flyout"><a href="products-page.html">Reports
					Generated</a></li>

			<li class="has-flyout"><a href="products-page.html">Planners</a></li>


		</ul></li>

	<%
		}
	%>

	<li class=""><a href="architecture.jsp"> Architecture</a></li>

	<li class=""><a href="modules.jsp">Modules</a></li>

	<li class=""><a href="pinterest-style.html">Gallery</a></li>

	<li class=""><a href="tiles.html">Developers</a></li>


	<%
		if (em != null) {
	%>
	<li style='color: white;'>Welcome <%=em%></li>
	<li class=""><a href="logout">Logout</a></li>

	<%
		} else {
	%>


	<li class=""><a href="register.jsp">Register</a></li>

	<li class=""><a href="login.jsp">Login</a></li>

	<%
		}
	%>



</ul>
<script type="text/javascript">
	//<![CDATA[
	$('ul#menu-header').nav - bar();
	//]]>
</script>
