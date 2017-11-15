<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="db.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">

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
                            <li>
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
                        <a href="logout_doctor.jsp" > <span ng-click="logout()"> Logout</span></a>
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
                 <h1 class="page-header">Blood Glucose</h1>

                <!-- Report table -->
                <section id="reports" class="portlet box blue reportTable" ng-show="show_reports">
                   <div class="portlet-title">
                    <div class="caption">
                    
									
                     <i class="fa fa-comments"></i>Listing Reports
                 </div>
                <a href="add_report_doctor.jsp">
                 <input type="button" name="Add Report" ng-click="addReport()" value="Add Report" class="pull-right btn purple"></a>

             </div>
             <div class="portlet-body">
                <div class="table-responsive">
                 <table class="table table-striped table-hover">
                  <thead>
                  <tr>
                    		<th>    S.No. </th>
                 <th>      Patient Name </th>

                 <th>
                     Report Name
                 </th>
                 <th>
                     Type
                 </th>
               <!--   <th>
                     Start Time
                 </th>
                 <th>
                     End Time
                 </th>
                 <th>
                     Rept Blood Sugar
                 </th>
                 <th>
                     rept_insulin
                 </th>
                 <th>
                     rept_carb
                 </th>
                 <th>
                 
                     rept_physical_activity
                 </th> -->

                 <th>
                     Description
                 </th>
                 <th>
                     Created Date Time
                 </th>
                 <th>
                     Action
                 </th>
                
             </tr>
         </thead>
         <tbody>
           <!-- ngRepeat: report in reports --><tr ng-repeat="report in reports" class="ng-scope">
           		
           	<%int i=1; %>	
                 		
       <% 
		   				
    //  HttpSession s1=request.getSession();
		String id1=(String)dr.getAttribute("userId");
		int id2=Integer.parseInt(id1);								

	try {

	    ps = con.prepareStatement("select * from report where rept_doctor_id=?");	

	    ps.setInt(1, id2);				

		ResultSet rs = ps.executeQuery();
		 ResultSet rs3=null;
		if(rs.next())
		{
			
			//HttpSession s1=request.getSession();
			session.setAttribute("usrdata",rs);
			do
			{
				ps=con.prepareStatement("select user_username,user_type from user where user_id=?");
				ps.setInt(1, rs.getInt(2));
				rs3=ps.executeQuery();
				rs3.next();	
		
	%>
										
     
         <td class="ng-binding"><%=i%></td>
         
         <td class="ng-binding"><%=rs3.getString(1)%></td>

         <td class="ng-binding"> <%=rs.getString(4)%> </td>
         <td class="ng-binding"> <%=rs.getString(5)%> </td>

        
         <td class="ng-binding"><%=rs.getString(6)%></td>
             
         <td class="ng-binding"><%=rs.getString(7)%></td>
             
           <td>
  
             <span ng-click="" class="btn default btn-xs purple"><i class="fa fa-edit"></i> Me </span>
          </td>
         
          <td>
          <span ng-click="" class="btn default btn-xs green">
   <a href=view_report_doctor.jsp?srno=<%=rs.getInt(1)%>> <i class="fa fa-edit"></i> view </span></a>
           </td>
           
            <td>
               <span ng-click="" class="btn default btn-xs danger ">
  <a href=delet_report_doctor.jsp?srno=<%=rs.getInt(1)%>> <i class="fa fa-edit"></i> delete </span></a> 
            </td>
          </tr>
  
         
   <% i++;
			 }while(rs.next());	
			 } %>
         
                 </tbody>
</table>
         		<%
         		}
					catch (Exception ref) {
												ref.printStackTrace();
											}
										%>
                 
        

</div>
</div>
</section>






<!-- Report table end -->
</div>
</div>
</div>
   
       <div class="col-sm-2 rightSidebar" style="margin-top:30px;">
          <!-- <h4>Dummy heading</h4> -->
           <ul class="nav nav-sidebar">
          
             <li><i class="fa fa-circle" ></i><%@include file="view_user_do_pa.jsp"%> </li>
               
          </ul>
         
        </div>
        
        </div></section>
<br/><br/><br/><br/><br/> 
<footer class="text-center">
 <div class="footer-below">
  <div class="container">
   <div class="row">
    <div class="col-lg-10">
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
