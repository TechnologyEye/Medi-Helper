<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Medi_Helper</title>
    <script type="text/javascript" src="js_validation/formscript."></script>
    <script type="text/javascript">
        function preloader(){
            document.getElementById("loading").style.display = "none";
            document.getElementById("content").style.display = "block";
        }//preloader
        window.onload = preloader;
	</script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="css/animate.css" rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <!-- Fonts -->
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
	<link href="fonts/font-awesome.min.css">
</head>
<body id="page-top" class="index" data-spy="scroll" data-target=".navbar-fixed-top">
<div id="loading"></div>
<div id="content">
    <!-- Navigation -->
 
 <body>

    
   <section class="contact" id="registration">
        <h2 class="main_heading animatezoomin text-center" style="display:block;">Update Password</h2>
		
			<div class="gap-50"></div>
			<div class="container animatezoomin" >
				<div class="row">
					<div class="col-sm-12">
						<div class="container" style="width:600px;">
							
							
							<div class="gap-20"></div>
							<h3 class="text-center"></h3>
				            <div class="row">
				                <div class="col-md-12 text-center animateup">
				                    <form action="ConfirmPsw.jsp" for="role" name="myForm" onsubmit="return validateForm()">
				                       
                       <div class="form-group input-group col-xs-12 floating-label-form-group">
							<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
							<label for="name">New Password</label>											
							<input class="form-control" type="password" name="new_pass" id="new_pass" placeholder="New Password"/>
						</div>
						<div class="form-group input-group col-xs-12 floating-label-form-group">
							<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
							<label for="name">Confirm Password</label>	
							<input class="form-control" type="password" name="con_pass" id="con_pass" placeholder="Confirm Password">
						</div>
					               
				          <div class="form-group col-xs-12">
						    	<button type="submit" class="btn btn-default btn-lg"> Go Login Page </button>
						  </div>
				        </form>
				    </div>			
			      </div>
		       </div>
		   </div>
	     </div>
      </div>	
   </section><br/><br/><br/><br/><br/><br/>  
</form>
</body>
</html>