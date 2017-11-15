
function validateForm() {

    var x = document.forms["myForm"]["name"].value ;
    if (x == null || x == "") {
        alert("UserName must be filled out");
        return false;
    }
     var x = document.forms["myForm"]["pass"].value ;
    if (x == null || x == "") {
        alert("Password must be filled out");
        return false;
    }
     var x = document.forms["myForm"]["email"].value ;
    if (x == null || x == "") {
        alert("Email must be filled out");
        return false;
    }
    var x = document.forms["myForm"]["phon"].value ;
    if (x == null || x == "") {
        alert("Phon Number must be filled out");
        return false;
    }
    var x = document.forms["myForm"]["user_ty"].value ;
    if (x == null || x == "") {
        alert("User Type must be filled out");
        return false;
    }
    var x = document.forms["myForm"]["message"].value ;
    if (x == null || x == "") {
        alert("Address must be filled out");
        return false;
    }
    
    /*

     var age=document.getElementById('age1').value;
if(age == "")     
    return true;

//check if age is a number or less than or greater than 100
if (isNaN(age)||age<1||age>100)
{ 
    alert("The age must be a number between 1 and 100");
    return false;
}

 var x = document.forms["myForm"]["text1"].value ;
    if (x == null || x == "") {
        alert("Email must be filled out");
        return false;
    }
  


var x = document.forms["myForm"]["pwd"].value ;
    if (x == null || x == "") {
        alert("Password must be filled out");
        return false;
    }
     var x = document.forms["myForm"]["ads"].value ;
    if (x == null || x == "") {
        alert("Address must be filled out");
        return false;
    }
    */
}


function validate_contact() {

    var x = document.forms["myForm1"]["name"].value ;
    if (x == null || x == "") {
        alert("Name must be filled out");
        return false;
    }
    
    var x = document.forms["myForm1"]["email"].value ;
    if (x == null || x == "") {
        alert("Email must be filled out");
        return false;
    }
    
    var x = document.forms["myForm1"]["message"].value ;
    if (x == null || x == "") {
        alert("Message must be filled out");
        return false;
    }
    
}



function validateForm_login() {

    var x = document.forms["myForm_log"]["email"].value ;
    if (x == null || x == "") {
        alert("User Email must be filled out");
        return false;
    }
    
    var x = document.forms["myForm_log"]["pass"].value ;
    if (x == null || x == "") {
        alert("User Password must be filled out");
        return false;
    }
    
}
