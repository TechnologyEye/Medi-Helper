<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.*"%>
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
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="css/toaster.min.css" rel="stylesheet" />
        <link href="css/animate.css" rel="stylesheet" />
    </head>

    <body id="page-top" class="index" data-spy="scroll" data-target=".navbar-fixed-top" ng-app="diabities" ng-controller="mainCtrl">

    	<div id="loading"></div>
    	<div id="content">
    		<!-- Navigation disable-->
    		<nav class="navbar navbar-default navbar-fixed-top navbar-shrink text-center">
    			<div class="container">
    				<!-- Brand and toggle get grouped for better mobile display -->
    				<div class="navbar-header page-scroll">
    					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
    						<span class="sr-only">Toggle navigation</span>
    						<span class="icon-bar"></span>
    						<span class="icon-bar"></span>
    						<span class="icon-bar"></span>
    					</button>
    					<!--<a class="navbar-brand" href="#page-top">Dia Care</a>-->
    				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
    				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" ng-controller="topMenuController">
    					   <ul class="nav navbar-nav">
                            <li ng-show="logged">
                                <a href="post_doctor.jsp">Home</a>
                            </li>

                            <li ng-show="logged">
                                <a href="report_doctor.jsp">Reports</a>
                            </li>
                    <!-- <li ng-show="logged" class="page-scroll">
                        <a href="#appointment">Appointments</a>
                    </li> -->
                    
                    <li ng-show="logged">
                        <a href="appointments_doctor.jsp" >Appointments</a>
                    </li>

                    <li ng-show="logged">
                        <a href="prescription_doctor.jsp" >Prescriptions</a>
                    </li>

                    <li ng-show="logged">
                        <!-- <a href="#profile">Profile</a> -->
                        <a href="profile_doctor.jsp">Profile</a>
                    </li>


                    <li ng-show="logged" class="page-scroll">
                        <a href="logout_doctor.jsp" >  Logout</a>
                    </li>
<br/><br/>
                    <li class="page-scroll" ng-show="logged">
                        <span class="pull-left"> &nbsp &nbsp &nbsp Welcome : 
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
</span>
                    </li>


                    <li ng-show="logged" class="page-scroll pull-right" >
                        <span ng-if="logged_user_online_status==0" ng-click="changeOnlineStatus(1)"> &nbsp Status :<b style="color:green"> Online </b>

                        </span>
                        
                     </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    	<section class="innerHome" ng-controller="appointmentController" style="position:relative;" ng-show="logged">
    		<div class="container">
    			<div class="row">

    				<div class="col-sm-2 sidebar" style="margin-top:30px;">
    					<div class="profileDet" ng-controller="ImageUploadController">
    						<div class="profilePic">
    							<img id="imgprvw1" src="images/doctor1.png"  height="100px" alt="First slide"/> 
    						</div>
    						<input type="file" onchange="showimagepreview1(this)" name="image" id="image" ng-file-select="onFileSelect($files)">
    						<h3>logged_username</h3>

    					</div>
    					<ul class="nav nav-sidebar leftSidebar" ng-controller="leftMenuController">
    						<li><a href="post_doctor.jsp" ng-click="showPost()">Review Post</a></li>

                            <li><a href="add_report_doctor.jsp" data-toggle="modal" data-target="#myModal1">Fill Report</a></li>
                            <li><a href="add_appointment_doctor.jsp" data-toggle="modal" data-target="#myModal2">Fill Appointment</a></li>
                            <li><a href="add_prescription_doctor.jsp" data-toggle="modal" data-target="#prescriptionMyModal1">Fill Prescription</a></li>
                            <li><a href="#reports" ng-click="showReports()">View Report</a></li>
                        </ul>

                    </div>
                    <div class="col-sm-8 col-sm-offset-2 main" style="margin-top:30px;">
                    <form action="add_post_doctor.jsp">
                     <h1 class="page-header">Blood Glucose</h1>

                     <div class="form-group input-group col-xs-12" ng-show="show_post">
                     
                      <textarea class="form-control" input type="text" placeholder="Enter your post" name="post" ></textarea>
                      <input type="submit" class="pull-right btn red" value="Submit Post" ng-click="submitPost()">
                  </div>
</form>
                  
                   <%
             		
                       String id1=(String)dr.getAttribute("userId");
               		int id2=Integer.parseInt(id1);								

               	try {

               	    ps = con.prepareStatement("select * from post");	
               		ResultSet rs = ps.executeQuery();
               		 ResultSet rs3=null;
               		if(rs.next())
               		{ 
               			do
               			{
               			ps=con.prepareStatement("select user_username from user where user_id=?");
               			ps.setInt(1, rs.getInt(2));
               			 rs3=ps.executeQuery();
               			rs3.next();
               	                      
                       %>
                       <div class="postList" >
                      <div class="postSec" class="ng-scope" ng-show="show_post">
                       
                      
                       <div class="col-sm-3" class="ng-binding">
                       
                        <img ng-if="post.user_profileimg" src="images/doctor1.png" class="img-responsive" alt="Generic placeholder thumbnail">
                       

                    </div>
                    
                    <div class="col-sm-9" class="ng-binding">
          
                        <h3><%=rs3.getString(1) %></h3>
                        <p><%=rs.getString(3)%></p>
                        <span class="pull-right"><%=rs.getString(4) %></span>
                        
                    </div>
                    
                    
                </div></div>
                   
                 <%
                 
               		 }
               			while(rs.next());
               		
               		}
               	}
				catch (Exception ref)
                {
					ref.printStackTrace();
				}
                 %>
               
              
                <div class="col-sm-2 rightSidebar" style="margin-top:30px;">
          <!-- <h4>Dummy heading</h4> -->
           <ul class="nav nav-sidebar">
            
            <li><i class="fa fa-circle"></i><%@include file="view_user_do_pa.jsp"%></li>
  
          </ul>
         
        </div>

<footer class="text-center">
 <div class="footer-below">
  <div class="container">
   <div class="row">
    <div class="col-lg-8">
     Copyright &copy; 2016
 </div>
</div>
</div>
</div>
</footer>

<div class="scroll-top page-scroll visible-xs visble-sm">
 <a class="btn btn-primary" href="#page-top">
  <i class="fa fa-chevron-up"></i>
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
<script type="text/javascript" ></script>	
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


<script src="js/scripts/angular-cookies.js" ></script>
<script src="js/scripts/ngStorage.js" ></script>

<!-- toaster  -->
<script src="js/angular-animate.js"></script>

<script src="js/angular-animate.min.js"></script>

<script src="js/toaster.min.js"></script>



<script src="js/scripts/angular-translate.js"></script>
<script src="js/scripts/loader-static-files.js"></script>
<script src="js/scripts/storage-cookie.js"></script>
<script src="js/scripts/storage-local.js"></script>
<script src="js/app.js" ></script>
<script src="js/angular-file-upload.js" ></script>



</body>

<toaster-container toaster-options="{
'closeButton': false,
'debug': false,
'positionClass': 'toast-top-right',
'onclick': null,
'showDuration': '200',
'hideDuration': '1000',
'timeOut': '5000',
'extendedTimeOut': '1000',
'showEasing': 'swing',
'hideEasing': 'linear',
'showMethod': 'fadeIn',
'hideMethod': 'fadeOut'
}"></toaster-container>



</html>
