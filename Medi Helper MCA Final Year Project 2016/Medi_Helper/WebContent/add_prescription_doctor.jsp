<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<title>Medi_Helper</title> 
	
	<script type="text/javascript">
	function preloader(){

		document.getElementById("loading").style.display = "none";
		document.getElementById("content").style.display = "block";

        }//preloader
        window.onload = preloader;
        </script>
				<!-- Bootstrap Core CSS -->
				<link href="css/bootstrap.css" rel="stylesheet" type="text/css">

					<link href="css/style.css" rel="stylesheet" type="text/css">
						<!-- Fonts -->
						<link href="font-awesome/css/font-awesome.min.css"
							rel="stylesheet" type="text/css">
							<link href="css/toaster.min.css" rel="stylesheet" />
							<link href="css/animate.css" rel="stylesheet" />
</head>
<body id="page-top" class="index" data-spy="scroll"
	data-target=".navbar-fixed-top" ng-app="diabities"
	ng-controller="mainCtrl">

	<div id="loading"></div>
	<div id="content">
		<!-- Navigation disable-->
		<nav
			class="navbar navbar-default navbar-fixed-top navbar-shrink text-center">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!--<a class="navbar-brand" href="#page-top">Dia Care</a>-->
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1" ng-controller="topMenuController">
				<ul class="nav navbar-nav">
					
					<li><a href="post_doctor.jsp">Home</a></li>

					<li ng-show="logged"><a href="report_doctor.jsp">Reports</a>
					</li>
					<!-- <li ng-show="logged" class="page-scroll">
                        <a href="#appointment">Appointments</a>
                    </li> -->

					<li ng-show="logged"><a href="appointments_doctor.jsp">Appointments</a>
					</li>

					<li ng-show="logged"><a href="prescription_doctor.jsp">Prescriptions</a>
					</li>

					<li ng-show="logged">
						<!-- <a href="#profile">Profile</a> --> <a
						href="profile_doctor.jsp">Profile</a>
					</li>


					<li ng-show="logged" class="page-scroll"><a href="#"> <span
							ng-click="logout()"> Logout</span></a></li>
					<br />
					<br />
					<li class="page-scroll" ng-show="logged"><span
						class="pull-right"> &nbsp &nbsp &nbsp Welcome : 
<%
HttpSession dr=request.getSession();

String id=(String)dr.getAttribute("email");
ResultSet rs2 =null;
try{
	
	 ps = con.prepareStatement("select user_username from user where user_email=? ");	

	    ps.setString(1, id);				

		 rs2 = ps.executeQuery();

}
catch(Exception e){
	
	e.printStackTrace();
}
if(rs2.next())
{
out.print(rs2.getString(1));
}  
                        
%>
						
						</span></li>


					<li ng-show="logged" class="page-scroll pull-right"><span
						ng-if="logged_user_online_status==0"
						ng-click="changeOnlineStatus(1)"> &nbsp Status :<b
							style="color: green"> Online </b>

					</span></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid --> </nav>

		<section class="innerHome" ng-controller="appointmentController"
			style="position:relative;" ng-show="logged">
		<div class="container">
			<div class="row">

				<div class="col-sm-2 sidebar" style="margin-top: 30px;">
					<div class="profileDet" ng-controller="ImageUploadController">
						<div class="profilePic">
							<img id="imgprvw1" src="images/doctor1.png" height="100px" alt="First slide" />
						</div>
						<input type="file" onchange="showimagepreview1(this)" name="image"
							id="image" ng-file-select="onFileSelect($files)">
							<h3>logged_username</h3>
					</div>
					<ul class="nav nav-sidebar leftSidebar"
						ng-controller="leftMenuController">
						<li><a href="post_doctor.jsp" ng-click="showPost()">Review Post</a></li>

						<li><a href="add_report_doctor.jsp" data-toggle="modal" data-target="#myModal1">Fill Report</a></li>
						
						<li><a href="add_appointment_doctor.jsp" data-toggle="modal" data-target="#myModal2">Fill Appointment</a></li>
						
						<li><a href="add_prescription_doctor.jsp" data-toggle="modal"	data-target="#prescriptionMyModal1">Fill Prescription</a></li>
						
						<li><a href="#reports" ng-click="showReports()">View
								Report</a></li>
					</ul>

				</div>

				<div class="col-sm-8 col-sm-offset-2 main" style="margin-top: 30px;">

					<center>
						<h1>
							<font color="#0099FF" size="+2">Add Prescription</font>
						</h1>
						<form class="form-group" action="addprescription_doctor.jsp">
							<br />
							<div class="row">
								<div class="col-sm-4" for="sel3">patient Name</div>
								<div class="col-sm-6">
									<select class="form-control" id="sel3" name="p_nm">
										<option></option>
										
										<% 
											try {
												ps = con.prepareStatement("select user_id,user_username from user where user_type=1 ");
												ResultSet rs = ps.executeQuery();
												if (rs.next()) {
													do {
										%>
											
									  <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>

										<%
											} while (rs.next());
												}
												else
												{
													System.out.println("rs next nhi hua");
												}

											} catch (Exception ref) {
												ref.printStackTrace();
											}
										%>
										
									
									</select>
								</div>
							</div>
							<br />


							<div class="row">
								<div class="col-sm-4">From</div>
								<div class="col-sm-6">
									<input type="date" name="f_dat" class="form-control" />

								</div>
							</div>
							<br />

							<div class="row">
								<div class="col-sm-4">To</div>
								<div class="col-sm-6">
									<input type="date" name="t_dat" class="form-control" />

								</div>
							</div>
							<br />

							<div class="row">
								<div class="col-sm-4">Insulin</div>
								<div class="col-sm-6">
									<input type="text" name="ins" placeholder="Insulin"
										class="form-control" />
								</div>
							</div>
							</br>

							<div class="row">
								<div class="col-sm-4">Tablet</div>
								<div class="col-sm-6">
									<input type="text" name="tab" placeholder="Tablet"
										class="form-control" />
								</div>
							</div>
							</br>
							
							<div class="row">
								<div class="col-sm-4" for="sel3">Time1</div>
								<div class="col-sm-6">
									<select class="form-control" id="sel3" name="t1">
										<option></option>
										<option value="1" name="">After/Before Lunch</option>
										<option value="2" name="">After/Before Break Fast</option>
										<option value="3" name="">After/Before Dinner</option>
										<option value="4" name="">After/Before Bed Time</option>
									</select>
								</div>
							</div>
							<br />
							
							<div class="row">
								<div class="col-sm-4" for="sel3">Time2</div>
								<div class="col-sm-6">
									<select class="form-control" id="sel3" name="t">
										<option></option>
										<option value="1" name="">After/Before Lunch</option>
										<option value="2" name="">After/Before Break Fast</option>
										<option value="3" name="">After/Before Dinner</option>
										<option value="4" name="">After/Before Bed Time</option>
									</select>
								</div>
							</div>
							<br />
							
							<div class="row">
								<div class="col-sm-4" for="sel3">Time3</div>
								<div class="col-sm-6">
									<select class="form-control" id="sel3" name="t3">
										<option></option>
										<option value="1" name="">After/Before Lunch</option>
										<option value="2" name="">After/Before Break Fast</option>
										<option value="3" name="">After/Before Dinner</option>
										<option value="4" name="">After/Before Bed Time</option>
									</select>
								</div>
							</div>
							<br/>

							<div class="row">
								<div class="col-sm-5"></div>
								<div class="col-sm-6">
									<input class="btn btn-info btn-lg pull-right" type="submit"
										value="Add Prescription"
										style="width: 200px; margin-right: 150px; padding-top: 10px; padding-bottom: 10px;" />
								</div>
							</div>
					</center>
				</div>
			</div>
		</div>

		<div class="col-sm-2 rightSidebar" style="margin-top: 30px;">
			<!-- <h4>Dummy heading</h4> -->
			<ul class="nav nav-sidebar">
				
				<li><i class="fa fa-circle"></i><%@include file="view_user_do_pa.jsp"%></li>
				
			</ul>

		</div>
	</div>
	</section>
	<br />
	<br />
	<br />
	<br />
	<br />
	<footer class="text-center">
	<div class="footer-below">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<center>Copyright &copy; 2016</center>
				</div>
			</div>
		</div>
	</div>
	</footer>

	<div class="scroll-top page-scroll visible-xs visble-sm">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
	</div>
	</div>
	<!-- gallery Modals -->
	<script type="text/javascript">
function showimagepreview1(input) 
{
	if (input.files && input.files[0]) 
	{
		var filerdr = new FileReader();
		filerdr.onload = function(e) 
		{
			$('#imgprvw1').attr('src', e.target.result);
		}
		filerdr.readAsDataURL(input.files[0]);
	}
}
</script>

	<script type="text/javascript"></script>
	<script type="text/javascript"></script>
	<!--<script src=">js/jquery-1.10.2.js"></script> -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/jquery.easing.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/jquery.flexslider-min.js"></script>
	<script src="js/jquery.knob.js"></script>
	<script src="js/countUp.min.js"></script>

	<script src="js/site.js"></script>
	<script src="js/main.js"></script>


	<script src="js/scripts/angular-cookies.js"></script>
	<script src="js/scripts/ngStorage.js"></script>

	<!-- toaster  -->
	<script src="js/angular-animate.js"></script>

	<script src="js/angular-animate.min.js"></script>

	<script src="js/toaster.min.js"></script>



	<script src="js/scripts/angular-translate.js"></script>
	<script src="js/scripts/loader-static-files.js"></script>
	<script src="js/scripts/storage-cookie.js"></script>
	<script src="js/scripts/storage-local.js"></script>
	<script src="js/app.js"></script>
	<script src="js/angular-file-upload.js"></script>



</body>
</html>