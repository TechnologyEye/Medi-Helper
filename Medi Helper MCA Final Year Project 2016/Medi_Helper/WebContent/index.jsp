<!DOCTYPE html>
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
                <!--<a class="navbar-brand" href="#page-top">Medi_Helper</a>-->
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="page-scroll">
                        <a href="#page-top">Home</a>
                    </li>
					<li class="page-scroll">
                        <a href="#login">Login</a>
                    </li>
					<li class="page-scroll">
                        <a href="#registration">Registration</a>
                    </li>
				 	
					<li class="page-scroll">
                        <a href="#contact">Contact</a>
                        
                    </li> 
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <header class="home">
		<div class="home_wrap">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="intro-text">
							<img src="img/TemplateImg/logo-main.png" alt=""/>
							
							<div class="name">
								<div class="flexslider">
								    <ul class="slides">
										<li>
											Medi_Helper
										</li>
										<li>
											Dia_Care
										</li>
										
								    </ul>
								</div>
							</div>
							<br>
						</div>
						<div class="text-center">
							<ul class="list-inline">
								<li><a href="http://www.facebook.com/" target="blank" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
								</li>
								<li><a href="https://plus.google.com" target="blank"  class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
								</li>
								<li><a href="http://www.twitter.com/" target="blank"  class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
								</li>
								<li><a href="https://in.linkedin.com" target="blank"  class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
								</li>
								<li><a href="https://dribbble.com/" target="blank"  class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
								</li>
							</ul>
						</div>
						<div class="text-center">
							<div class="page-scroll menu-icon">
								<a href="#login">
									<i class="fa fa-angle-down fa-lg fa-border"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </header>
	<div class="gap-50"></div>
	<br><br><br><br>
    <section class="grey-area talkabout ">
		<h2 class="main_heading animatezoomin">Let's Talk About Your Disease</h2>
		
			<div class="gap-80"></div>
			<div class="page-scroll">
				<a href="#registration" class="btn btn-default btn-lg animatezoomin"><i class="fa fa-hand-o-right fa-fw"></i> GET IN TOUCH</a>
			</div>
	</section>	
	<section class="" id="login">
        <div class="container">
            
			<div class="gap-30"></div>
			<div class="row"> 
				<div class="col-lg-8 no-right-padding-large">
					<div id="aboutslider" class="carousel slide fancy-carousel" data-ride="carousel">
						<div class="carousel-inner">
							<div class="item active">
								<img src="img/team/slider1.jpg" alt="First slide"/>
								<div class="carousel-caption">
									<p>
									
									</p>
								</div>
							</div>
							<div class="item">
								<img src="img/team/slider2.jpg" alt="First slide"/>
								<div class="carousel-caption">
									<p>
										
									</p>
								</div>
							</div>
							<div class="item">
								<img src="img/team/slider3.jpg" alt="First slide"/>
								<div class="carousel-caption">
									<p>
										
									</p>
								</div>
							</div>
						</div>
						<a class="left carousel-control" href="#aboutslider" data-slide="prev">
						<i class="fa fa-angle-left fa-lg"></i>
						</a>
						<a class="right carousel-control" href="#aboutslider" data-slide="next">
						<i class="fa fa-angle-right fa-lg"></i>
						</a>
					</div>
				</div>
				<div class="col-lg-4 primary-background margin-small">
					<div class="text-center animateup">
						<div class="inline-icons-text section-heading">
							
							<span class="inline-icon heading-width">
								<span class="heading-text">Login</span>
							</span>
						</div>
					</div>
					<div class="gap-30"></div>
					<form action="login.jsp"  name="myForm_log" onsubmit="return validateForm_login()">
                        <div class="form-group input-group col-xs-12 floating-label-form-group">
							<span class="input-group-addon"> <i class="fa fa-envelope-o fa-lg"></i> </span>
							<label for="name">User Email</label>											
							<input class="form-control" type="email" name="email" id="email" placeholder="Email"/>
						</div>
						<div class="form-group input-group col-xs-12 floating-label-form-group">
							<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
							<label for="name">Password</label>	
							<input class="form-control" type="password" name="pass" id="pass" placeholder="Password">
						</div>
						
						<%
						HttpSession invalidUser=request.getSession();
						String msg = (String)invalidUser.getAttribute("Invalid");
									if(msg!=null)
									{
						
						%>
						<h3>
						<%
							out.println(msg);	
						    invalidUser.invalidate();
							}
						%>
						</h3>
						<div class="gap-30"></div><br><br>
                        <div class="form-group col-xs-12">
							<span class="col-md-6" style="padding-left:0;"><button type="submit" class="btn btn-default btn-lg">Login</button></span>
							<span class="col-md-6" style="font-size:16px; text-align:right;"> <uli ng-show="logged" class="page-scroll">
                        <a href=forget_pass.jsp>Forget <br>Password</a>
                    </uli> </span>
						</div>
                    </form>
				</div>
			</div>
        </div>
    </section>
<!--     <section class="grey-area testimonial-section" id="registration">
		<h2 class="main_heading animatezoomin">Registration</h2>
		
			<div class="gap-50"></div>
			<div class="container animatezoomin" >
				<div class="row">
					<div class="col-sm-12">
						<div class="container" style="width:600px;">
							
							
							<div class="gap-20"></div>
							<h3 class="text-center">Lorem ipsum dolor sit amet</h3>
				            <div class="row">
				                <div class="col-md-12 text-center animateup">
				                    <form role="form">
				                        <div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
											<label for="name">Username</label>											
											<input class="form-control" type="text" name="name" id="name" placeholder="Name">
										</div>
										<div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
											<label for="name">Password</label>											
											<input class="form-control" type="password" name="name" id="name" placeholder="Password">
										</div>
				                        <div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-envelope-o fa-lg"></i> </span>
											<label for="email">Email Address</label>
											<input class="form-control" type="email" name="email" id="email" placeholder="Email Address">
										</div>
										 <div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
											<label for="name">Phone</label>											
											<input class="form-control" type="text" name="name" id="name" placeholder="Phone">
										</div>
				                        <div class="form-group input-group col-xs-12 floating-label-form-group message-addon">
											<span class="input-group-addon"> <i class="fa fa-pencil-square-o fa-lg"></i> </span>
											<label for="message">Address</label>
											<textarea placeholder="Address" class="form-control" name="message" id="message" rows="5"></textarea>
										</div>
				                       
				                        <br>
				                        <div class="form-group col-xs-12">
											<button type="submit" class="btn btn-default btn-lg">Send</button>
										</div>
				                       
				                    </form>
				                </div>
								
				            </div>
				        </div>
					</div>
				
						
				</div>
					
			</div>		
			
	</section> -->

    <section class="contact" id="registration">
        <h2 class="main_heading animatezoomin text-center" style="display:block;">Registration</h2>
		
			<div class="gap-50"></div>
			<div class="container animatezoomin" >
				<div class="row">
					<div class="col-sm-12">
						<div class="container" style="width:600px;">
							
							
							<div class="gap-20"></div>
							<h3 class="text-center"></h3>
				            <div class="row">
				                <div class="col-md-12 text-center animateup">
				                    <form action="registration.jsp" for="role" name="myForm" onsubmit="return validateForm()">
				                        <div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
											<label for="name">Username</label>											
											<input class="form-control" type="text" name="name" id="name" placeholder="Name">
										</div>
										<div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
											<label for="name">Password</label>											
											<input class="form-control" type="password" name="pass" id="pass" placeholder="Password">
										</div>
				                        <div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-envelope-o fa-lg"></i> </span>
											<label for="email">Email Address</label>
											<input class="form-control" type="email" name="email" id="email" placeholder="Email Address">
										</div>
										 <div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-fw fa-phone"></i> </span>
											<label for="name">Phone</label>											
											<input class="form-control" type="text" name="phon" id="phon" placeholder="Phone">
										</div>
										<div class="form-group input-group col-xs-12 floating-label-form-group">
					            <span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
					            <label for="user_type">User Type</label>
					            <select class="selectDrop form-control ng-pristine ng-valid" placeholder="User Type" ng-model="user.user_type" name="user_ty">
					           
					             <option value="1" name="1">Patient</option>
					             <option value="2" name="2">Doctor</option>
					         </select>		
					     </div>
						                      
							<div class="form-group input-group col-xs-12 floating-label-form-group">
					            <span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
					            <label for="user_type">Security Question</label>
					            <select class="selectDrop form-control ng-pristine ng-valid" placeholder="Security Question" ng-model="user.user_type" name="security_que">
					           
					             <option>what is your nick name</option>
					             <option>what is your favorite color</option>
					             <option>what is your favorite fruit</option>
					             <option>what is your favorite game</option>
					             <option>what is your favorite flower</option>
					             <option>what is your favorite  movie</option>
					         </select>		
					     </div>
					     
					                  <div class="form-group input-group col-xs-12 floating-label-form-group">
											<span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>
											<label for="name">Security Answer</label>											
											<input class="form-control" type="text" name="security_ans" id="name" placeholder="Security Answer">
										</div>
					                 <div class="form-group input-group col-xs-12 floating-label-form-group message-addon">
											<span class="input-group-addon"> <i class="fa fa-pencil-square-o fa-lg"></i> </span>
											<label for="message">Address</label>
											<textarea placeholder="Address" class="form-control" name="message" id="message" rows="5"></textarea>
										</div> 
										
				                       
				                        <br>
				                        <div class="form-group col-xs-12">
											<button type="submit" class="btn btn-default btn-lg"> Submit </button>
										</div>
				                       
				                    </form>
				                </div>
								
				            </div>
				        </div>
					</div>
				
						
				</div>
					
			</div>	
		
	</section><br/><br/><br/><br/><br/><br/>
	<form action="contact.jsp" name="myForm1" onsubmit="return validate_contact()">
	<section class="contact ng-scope" ng-hide="logged" id="contact" ng-controller="contactFormCtrl">
     <div class="container">
      <h2 class="main_heading animatezoomin text-center animated zoomIn" style="display:block;">Contact Us</h2>

      <div class="gap-50"></div>
      <h3 class="text-center">We Are Ready To Work With You</h3>
      <div class="row">
       <div class="col-md-7 animateright animated fadeInRight">
      
         <div class="form-group input-group col-xs-12 floating-label-form-group">
          <span class="input-group-addon"> <i class="fa fa-user fa-lg"></i> </span>

          <label for="name">Name</label>

          <input class="form-control ng-pristine ng-invalid ng-invalid-required"  ng-model="contact.contact_name" type="text" name="name" id="name" placeholder="Name">
      </div>
      <div class="form-group input-group col-xs-12 floating-label-form-group">
          <span class="input-group-addon"> <i class="fa fa-envelope-o fa-lg"></i> </span>
          <label for="email">Email Address</label>
          <input class="form-control ng-pristine ng-invalid ng-invalid-required ng-valid-email" ng-model="contact.contact_email" type="email" name="email" id="email" placeholder="Email Address">
      </div>
      <div class="form-group input-group col-xs-12 floating-label-form-group message-addon">
          <span class="input-group-addon"> <i class="fa fa-pencil-square-o fa-lg"></i> </span>
          <label for="message">Message</label>
          <textarea placeholder="Message" ng-model="contact.contact_message" class="form-control ng-pristine ng-invalid ng-invalid-required" name="message" id="message" rows="5"></textarea>
      </div>
      <br>
      
      <div class="form-group col-xs-12">
          <button type="submit" class="btn btn-default btn-lg" >Submit</button>
      </div>

  </form>
</div>
<div class="col-md-5 animateleft contact-sidebar animated fadeInLeft">
    <div class="inline-icons-text">
     <div class="inline-icon">
      <div class="btn-social btn-outline"><i class="fa fa-fw fa-map-marker"></i>
      </div>
  </div>
  <div class="inline-icon">
      <div class="marker">Programmers Point Indore</div>

  </div>
</div>
<div class="inline-icons-text">
 <div class="inline-icon">
  <div class="btn-social btn-outline"><i class="fa fa-fw fa-envelope"></i>
  </div>
</div>
<div class="inline-icon">
  <div class="marker">poojagupta12@gmail.com</div>

</div>
</div>
<div class="inline-icons-text">
 <div class="inline-icon">
  <div class="btn-social btn-outline"><i class="fa fa-fw fa-phone"></i>
  </div>							
</div>
<div class="inline-icon">
  <div class="marker">7697357463</div>

</div>
</div>
</div>
</div>
</div>

</section>
    
	<footer class="text-center">
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; 2014
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
   
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
    <script src="js/jquery.easing.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/jquery.appear.js"></script>
	<script src="js/jquery.flexslider-min.js"></script>
	<script src="js/jquery.knob.js"></script>
    <script src="js/countUp.min.js"></script>
	</script>
	
	<script src="js/site.js"></script>
	


</body>

</html>
