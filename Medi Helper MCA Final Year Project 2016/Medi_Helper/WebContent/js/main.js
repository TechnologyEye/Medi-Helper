// jQuery for page scrolling feature - requires jQuery Easing plugin
$( document ).ready(function() {
	//alert("load me");
	$('.register-form').validate({
		//alert("calll me");
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                user_username: {
	                    required: true
	                },								
					
	               user_email: {
	                    required: true,
	                    email: true,
						remote: {
                        url: "index.php/login/check_email",
                        type: "post"
                     			}						
	                },
					
					/*user_email: {
	                    required: true					
	                },*/
					
					user_mobile: {
	                    required: true
	                },
	                user_address: {
	                    required: true
	                },
	               user_password: {
	                    required: true
	                }
	            },

	            messages: { // custom messages for radio buttons and checkboxes
	               user_email: {
							//required: 'Email address is required',
							//email: 'Please enter a valid email address',
							remote: 'This email address already in use.'
						}
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            submitHandler: function (form) {
					alert("Submit form");
	                form.submit();
	            }
	        });

			$('.register-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.register-form').validate().form()) {
	                    $('.register-form').submit();
	                }
	                return false;
	            }
	        });
 
 });