var app = angular.module("diabities", ['ngCookies','toaster','angularFileUpload']);


function topMenuController($scope,$http,$location,$rootScope,$location,$cookieStore,toaster){

$rootScope.show_post =1;
  $scope.showReports = function(){
    $rootScope.show_post=0;
    $rootScope.show_reports = 1; 
    $rootScope.show_appointments = 0; 
    $rootScope.show_prescriptions = 0; 
    $rootScope.show_profile = 0;
  }

    $scope.showProfile = function(){
    $rootScope.show_post=0;
    $rootScope.show_reports = 0; 
    $rootScope.show_appointments = 0; 
    $rootScope.show_prescriptions = 0; 
    $rootScope.show_profile = 1;
  }

  

  $scope.showAppointments = function(){
    $rootScope.show_post=0;
    $rootScope.show_appointments = 1; 
    $rootScope.show_reports = 0; 
    $rootScope.show_prescriptions = 0; 
    $rootScope.show_profile = 0;
  }

   $scope.showPrescriptions = function(){
    $rootScope.show_post=0;
    $rootScope.show_appointments = 0; 
    $rootScope.show_reports = 0; 
    $rootScope.show_prescriptions = 1; 
     $rootScope.show_profile = 0;
  }

}

function leftMenuController($scope,$http,$location,$rootScope,$location,$cookieStore,toaster){
    
   $scope.showPost = function(){
    $rootScope.show_post=0;
    $rootScope.show_appointments = 0; 
    $rootScope.show_reports = 0; 
    $rootScope.show_prescriptions = 0; 
    $rootScope.show_post = 1;
     $rootScope.show_profile = 0;
  }

  $scope.showReports = function(){
    $rootScope.show_post=0;
    $rootScope.show_appointments = 0; 
    $rootScope.show_reports = 1; 
    $rootScope.show_prescriptions = 0; 
    $rootScope.show_post = 0;
     $rootScope.show_profile = 0;
  }

}

function ImageUploadController($scope,$http,$location,$rootScope,$location,$cookieStore,toaster,$upload){

  $rootScope.logged_user_profileimg=$cookieStore.get('logged_user_profileimg');

  $scope.onFileSelect = function($files) {

    $rootScope.logged_user_profileimg=$cookieStore.get('logged_user_profileimg');
    console.log("$rootScope.logged_user_profileimg++"+$rootScope.logged_user_profileimg);

    $scope.message = "";
    var logged_user_id=$cookieStore.get('logged_user_id');
    
    console.log("call file upload+++");
    for (var i = 0; i < $files.length; i++) {
      var file = $files[i];
      console.log(file);
      $scope.upload = $upload.upload({
        url: 'index.php/login/uploadImage/'+logged_user_id,
        method: 'POST',               
        file: file,
        data: {user_id:logged_user_id},

      }).success(function(data, status, headers, config) {
        console.log("file upload successfully+++data"+data);
           // alert(JSON.stringify(data));
           if(data.status=='success'){
            console.log("delete cookie of image prev");
            $cookieStore.remove('logged_user_profileimg');
            $cookieStore.put('logged_user_profileimg',data.user_profileimg);
            $rootScope.logged_user_profileimg=$cookieStore.get('logged_user_profileimg');
            console.log("$rootScope.logged_user_profileimg=========new==="+$rootScope.logged_user_profileimg);
          }
          toaster.pop('success','Image Upload','Image Upload successfully.');

          $scope.message = data;                
        }).error(function(data, status) {
          toaster.pop('error','Image Upload','Image Upload un successfully.');

           // console.log("file upload un successfully+++"+data);
           $scope.message = data;
         });
      }
    };

  }
  function mainCtrl($scope,$http,$location,$rootScope,$location,$cookieStore,toaster){

    var logged_user_type=$cookieStore.get('logged_user_type');
    $rootScope.RSlogged_user_type = logged_user_type;

    /* $scope.ChangeProfile = function ChangeProfile(){*/
   //console.log("call change profile function==")
   var logged_user_id=$cookieStore.get('logged_user_id');

   $http.post('index.php/login/getProfile',{user_id:logged_user_id})
   .then(function(response) {
    //alert(JSON.stringify(response));

    if (response) { 
      $rootScope.personalProfile=response.data.result[0];
    //console.log("$rootScope.personalProfile==="+JSON.stringify($rootScope.personalProfile));
  }else{
    console.log("no response");
  }
})
   /*}*/

   var is_logged = $cookieStore.get('is_logged');
   if(is_logged)
   {
    $rootScope.logged=true;

    var logged_user_type=$cookieStore.get('logged_user_type');
    $rootScope.RSlogged_user_type = logged_user_type;
    var logged_user_id=$cookieStore.get('logged_user_id');
    $rootScope.logged_user_id = logged_user_id;
    $rootScope.logged_username=$cookieStore.get('logged_username');
    $rootScope.logged_user_profileimg=$cookieStore.get('logged_user_profileimg');

    $rootScope.logged_user_online_status=$cookieStore.get('logged_user_online_status');

    

    $scope.changeOnlineStatus = function changeOnlineStatus(status){

      $http.post('index.php/login/changeOnlineStatus', {online_status:status,user_id:logged_user_id})
      .then(function(response) {
        if ( !response) {
          console.log("no response from server side");
        }else{
                   if(response.data)//response.data.status=="failure"
                   {    
                    //alert(JSON.stringify(response.data));
                  //  console.log(JSON.stringify(response));
                  if(response.data.status==0){
                      //alert(response.data.message);
                      toaster.pop('error','Online Status',response.data.message);

                    }else{

                     $cookieStore.remove('logged_user_online_status');
                     $cookieStore.put('logged_user_online_status',status);
                     $rootScope.logged_user_online_status=$cookieStore.get('logged_user_online_status');

                     toaster.pop('success','Online Status',response.data.message);



                   }

                 }
               }
             });



}

$http.post('index.php/login/getAppointment',{user_id:logged_user_id,user_type:logged_user_type})
.then(function(response) {

  if (response) { 
   // alert(JSON.stringify(response.data.result));
   $rootScope.appointments=response.data.result;
 }else{
  console.log("no response");
}
})


$http.post('index.php/login/getReports',{user_id:logged_user_id,user_type:logged_user_type})
.then(function(response) {
  if (response) { 

    $rootScope.reports=response.data.result;
  }else{

    console.log("no response");
  }
})

 $http.post('index.php/login/getPrescription',{user_id:logged_user_id,user_type:logged_user_type})
                      .then(function(response) {

                        $rootScope.logged_user_type = logged_user_type;

                        console.log("response of getPrescription line no 483=="+JSON.stringify(response));
                        
                        if (response) { 
                         $rootScope.prescriptions=response.data.result;
                       }else{
                        console.log("no response");
                      }
                    })

$location.path('home');
}
else
{
  $rootScope.logged=false;
  $location.path('login');
}

$scope.logout=function logout(){
  $rootScope.appointments=[];
  $rootScope.reports=[];
  $rootScope.prescriptions=[];
  $rootScope.post=[];
  $rootScope.posts=[];
  $rootScope.RSlogged_user_type='';
  $cookieStore.remove('is_logged');
  $cookieStore.remove('logged_user_type');
  $cookieStore.remove('logged_user_id');
  $cookieStore.remove('logged_username');
  $cookieStore.remove('logged_user_profileimg');
  $cookieStore.remove('logged_user_online_status');
  $rootScope.logged=false;
  $rootScope.logged_username='';

  $location.path('login');


}

/*$scope.test=function test(){
  alert("sd");
}*/

$scope.changeOnlineStatus = function changeOnlineStatus(status){

  $http.post('index.php/login/changeOnlineStatus', {online_status:status,user_id:logged_user_id})
  .then(function(response) {
    if ( !response) {
      console.log("no response from server side");
    }else{
                   if(response.data)//response.data.status=="failure"
                   {    
                    //alert(JSON.stringify(response.data));
                  //  console.log(JSON.stringify(response));
                  if(response.data.status==0){
                      //alert(response.data.message);
                      toaster.pop('error','Online Status',response.data.message);

                    }else{

                     $cookieStore.remove('logged_user_online_status');
                     $cookieStore.put('logged_user_online_status',status);
                     $rootScope.logged_user_online_status=$cookieStore.get('logged_user_online_status');

                     toaster.pop('success','Online Status',response.data.message);



                   }

                 }
               }
             });



}


$http.get('index.php/login/users')
.then(function(response) {

  if (response) { 
    $scope.users=response.data.result;

  }else{
    console.log("no response");
  }
})


$scope.submitPost=function(){

 console.log("call submitPost function");

 var logged_user_type=$cookieStore.get('logged_user_type');
 var logged_user_id=$cookieStore.get('logged_user_id');


 if($scope.post.post_desc=='')
 {
   toaster.pop('error','Post',"Post description is requires.");

   return false;
 }

 $http.post('index.php/login/add_post_api', {post_desc:$scope.post.post_desc,post_user_id:logged_user_id})
 .then(function(response) {
  if ( !response) {
    console.log("no response from server side");
  }else{
                   if(response.data)//response.data.status=="failure"
                   {    
                  //  console.log(JSON.stringify(response));
                  if(response.data.status==0){
                      //alert(response.data.message);
                      toaster.pop('error','Post',response.data.message);

                    }else{


                     toaster.pop('success','Post',response.data.message);

                     $http.get('index.php/login/getPosts')
                     .then(function(response) {
                      if (response) { 
                        $rootScope.posts=response.data.result;
                        $rootScope.post = {};
                      }else{
                        console.log("no response");
                      }
                    })

                   }

                 }
               }
             });

}

$http.get('index.php/login/getPosts')
.then(function(response) {
  if (response) { 

    $rootScope.posts=response.data.result;
    $rootScope.post = {};
  }else{
    console.log("no response");
  }
})

}


//showListingReports
function appointmentController($scope,$http,$location,$rootScope,$cookieStore,toaster)
{
  var logged_user_type=$cookieStore.get('logged_user_type');
  $rootScope.RSlogged_user_type = logged_user_type;

  $rootScope.appointment={};
  $rootScope.prescription={};
  $scope.addPrescription=function(){

   $rootScope.prescription={
    prescription_from:'',
    prescription_to:'',
    prescription_tablet:'',
    prescription_no_of_close : '',
    prescription_time : ''
  }

  toaster.pop('success','Prescription',"Add Prescription successfully");
}

$rootScope.appointment={
  appt_id:'',
  appt_patient_id:'',
  appt_doctor_id:'',
  appt_treatement_id:'',
  appt_booked_datetime : '',
  appt_status : ''

}

var logged_user_type=$cookieStore.get('logged_user_type');
$rootScope.RSlogged_user_type = logged_user_type;


$rootScope.report={};

$rootScope.report={
  rept_id:'',
  rept_user_id:'',
  rept_doctor_id:'',
  rept_name : '',
  rept_type : '',
  rept_desc : '',
  rept_createdon : '',
  report_mode : 'Add'

}

$rootScope.prescription={};

 $rootScope.prescription={
    prescription_id :'',
    prescription_from_date:'',
    prescription_to_date:'',
    prescription_insulin : '',
    prescription_tablet : '',
    prescription_number_of_close : '',
    prescription_time : '',
    prescription_doctor_id : '',
    prescription_patient_id : '',
    prescription_mode : 'Add',
    prescription_read_mode : false

  }

$rootScope.post={
  post_desc:''
};

$http.get('index.php/login/getDoctor')
.then(function(response) {

  if (response) { 
    $scope.doctors=response.data.result;

  }else{
    console.log("no response");
  }
})

$http.get('index.php/login/getPatient')
.then(function(response) {

  if (response) { 
    $scope.patients=response.data.result;

  }else{
    console.log("no response");
  }
})

$http.get('index.php/login/getTreatement')
.then(function(response) {

  if (response) { 
    $scope.treatements=response.data.result;
  }else{
    console.log("no response");
  }
})


$scope.closeReport = function(){
  $scope.closeAppointment="modal";
}

$scope.submitPrescription= function(){
  
  console.log("call submitReport function");

 var logged_user_id=$cookieStore.get('logged_user_id');

 var logged_user_type=$cookieStore.get('logged_user_type');
 $rootScope.RSlogged_user_type = logged_user_type;

 if($rootScope.RSlogged_user_type==1){
  $rootScope.prescription.prescription_patient_id = logged_user_id;
  $scope.prescription.prescription_patient_id = logged_user_id;
}

if($rootScope.RSlogged_user_type==2){
  $rootScope.prescription.prescription_doctor_id = logged_user_id;
    $scope.prescription.prescription_doctor_id = logged_user_id;
}


if( $scope.prescription.prescription_from=='' || $scope.prescription.prescription_to=='' || $scope.prescription.prescription_insulin=='' || $scope.prescription.prescription_tablet=='' || $scope.prescription.prescription_no_of_close=='')
{
 toaster.pop('error','Prescription','Field is required.');
 return false;
}

console.log("call add_prescription_api api===line number 464");

$http.post('index.php/login/add_prescription_api', {prescription_id:$scope.prescription.prescription_id,prescription_from_date:$scope.prescription.prescription_from,prescription_to_date:$scope.prescription.prescription_to,prescription_insulin:$scope.prescription.prescription_insulin,prescription_tablet:$scope.prescription.prescription_tablet,prescription_number_of_close:$scope.prescription.prescription_no_of_close,prescription_time:$scope.prescription.prescription_time,prescription_doctor_id:$scope.prescription.prescription_doctor_id,prescription_patient_id:$scope.prescription.prescription_patient_id,prescription_time1:$scope.prescription.prescription_time1,prescription_time2:$scope.prescription.prescription_time2,prescription_time3:$scope.prescription.prescription_time3,prescription_time4:$scope.prescription.prescription_time4})
.then(function(response) {

  console.log("add_prescription_api response line number 467=="+JSON.stringify(response));
  if ( !response) {
    console.log("no response from server side");
  }else{
                   if(response.data)//response.data.status=="failure"
                   {    
                  //  console.log(JSON.stringify(response));
                  if(response.data.status==0){
                      //alert(response.data.message);
                      toaster.pop('error','Prescription',response.data.message);

                    }else{


                      var logged_user_id=$cookieStore.get('logged_user_id');

                      var logged_user_type=$cookieStore.get('logged_user_type');
                      $rootScope.RSlogged_user_type = logged_user_type;

                      $rootScope.logged_user_id = logged_user_id;

                      //alert(response.data.message);
                      $scope.closeAppointment="modal";
                      document.getElementById("loading").style.display = "none";
                      toaster.pop('success','Prescription',response.data.message);
                      console.log("call 490 line============================");

                     $http.post('index.php/login/getPrescription',{user_id:logged_user_id,user_type:logged_user_type})
                      .then(function(response) {

                        $rootScope.logged_user_type = logged_user_type;

                        console.log("response of getPrescription line no 483=="+JSON.stringify(response));
                        
                        if (response) { 
                         $rootScope.prescriptions=response.data.result;
                         $rootScope.prescription={};
                         $rootScope.prescription.prescription_mode = 'Add';
                       }else{
                        console.log("no response");
                      }
                    })

                      
                    }

                  }
                }
              });
}

$scope.submitReport=function(){
 console.log("call submitReport function");

 var logged_user_id=$cookieStore.get('logged_user_id');

 var logged_user_type=$cookieStore.get('logged_user_type');
 $rootScope.RSlogged_user_type = logged_user_type;

 if($rootScope.RSlogged_user_type==1){
  $rootScope.report.rept_user_id = logged_user_id;
}

if($rootScope.RSlogged_user_type==2){
  $rootScope.report.rept_doctor_id = logged_user_id;
}


if($scope.report.rept_user_id==''|| $scope.report.rept_doctor_id=='' || $scope.report.rept_name=='' || $scope.report.rept_type=='' || $scope.report.rept_desc=='' || $scope.report.rept_createdon=='')
{
 toaster.pop('error','Report','Field is required.');

 return false;
}
$http.post('index.php/login/add_report_api', {rept_id:$scope.report.rept_id,rept_user_id:$scope.report.rept_user_id,rept_doctor_id:$scope.report.rept_doctor_id,rept_name:$scope.report.rept_name,rept_type:$scope.report.rept_type,rept_desc:$scope.report.rept_desc,rept_createdon:$scope.report.rept_createdon,rept_starttime:$scope.report.rept_starttime,rept_endtime:$scope.report.rept_endtime,rept_blood_sugar:$scope.report.rept_blood_sugar,rept_insulin:$scope.report.rept_insulin,rept_carb:$scope.report.rept_carb,rept_physical_activity:$scope.report.rept_physical_activity})
.then(function(response) {
  if ( !response) {
    console.log("no response from server side");
  }else{
                   if(response.data)//response.data.status=="failure"
                   {    
                  //  console.log(JSON.stringify(response));
                  if(response.data.status==0){
                      //alert(response.data.message);
                      toaster.pop('error','Report',response.data.message);

                    }else{


                      var logged_user_id=$cookieStore.get('logged_user_id');

                      var logged_user_type=$cookieStore.get('logged_user_type');
                      $rootScope.RSlogged_user_type = logged_user_type;

                      $rootScope.logged_user_id = logged_user_id;

                      //alert(response.data.message);
                      $scope.closeAppointment="modal";
                      document.getElementById("loading").style.display = "none";
                      toaster.pop('success','Report',response.data.message);
                      console.log("call 564 line============================");

                      $http.post('index.php/login/getReports',{user_id:logged_user_id,user_type:logged_user_type})
                      .then(function(response) {
                        console.log("response of getReports==line number 468=="+JSON.stringify(response));

                        if (response) { 
                          $rootScope.reports=response.data.result;
                          $rootScope.report = {};
                        }else{
                          console.log("no response");
                        }
                      })

                    /*  $http.post('index.php/login/getPrescription',{user_id:logged_user_id,user_type:logged_user_type})
                      .then(function(response) {

                        $rootScope.logged_user_type = logged_user_type;

                        console.log("response of getPrescription line no 483=="+JSON.stringify(response));
                        
                        if (response) { 
                         $rootScope.prescriptions=response.data.result;
                       }else{
                        console.log("no response");
                      }
                    })*/
                      
                    }

                  }
                }
              });

}

$scope.registerAppointments=function(){
 console.log("call registerAppointments function");
             // alert("ap id========"+$scope.appointment.appt_id);
            /* alert("appt_patient_id=="+$rootScope.appointment.appt_patient_id);
             alert("appt_doctor_id=="+$rootScope.appointment.appt_doctor_id);
             alert("appt_treatement_id=="+$rootScope.appointment.appt_treatement_id);
             alert("appt_booked_datetime="+$rootScope.appointment.appt_booked_datetime);
             alert("appt_status="+$rootScope.appointment.appt_status);
             */   
             var logged_user_id=$cookieStore.get('logged_user_id');

             if($rootScope.RSlogged_user_type==1){
              $rootScope.appointment.appt_patient_id = logged_user_id;
            }

            if($rootScope.RSlogged_user_type==2){
              $rootScope.appointment.appt_doctor_id = logged_user_id;
            }

            if($scope.appointment.appt_patient_id=='' || $scope.appointment.appt_doctor_id=='' || $scope.appointment.appt_treatement_id=='' || $scope.appointment.appt_booked_datetime=='')
            {
              //alert("Field is required.");
              toaster.pop('error','Appointment','Field is required.');

              return false;
            }

            $http.post('index.php/login/register_appt_api', {appt_id:$scope.appointment.appt_id,appt_patient_id:$scope.appointment.appt_patient_id,appt_doctor_id:$scope.appointment.appt_doctor_id,appt_treatement_id:$scope.appointment.appt_treatement_id,appt_booked_datetime:$scope.appointment.appt_booked_datetime,appt_status:$scope.appointment.appt_status,appt_notes:$scope.appointment.appt_notes})
            .then(function(response) {
              if ( !response) {
                console.log("no response from server side");
              }else{
                    //alert(JSON.stringify(response.data));
                   if(response.data)//response.data.status=="failure"
                   {    
                  //  console.log(JSON.stringify(response));
                  if(response.data.status==0){
                  //  alert(response.data);
                  toaster.pop('error','Appointment',response.data.message);

                }else{

                  $rootScope.appointment.appt_id='';


                  //   alert(response.data);
                  toaster.pop('success','Appointment',response.data.message);
                  var logged_user_type=$cookieStore.get('logged_user_type');
                  var logged_user_id=$cookieStore.get('logged_user_id');
                  $rootScope.RSlogged_user_type = logged_user_type;
                  $rootScope.logged_user_id = logged_user_id;

                  $http.post('index.php/login/getAppointment',{user_id:$rootScope.logged_user_id,user_type:$rootScope.RSlogged_user_type})
                  .then(function(response) {
                    if (response) { 

                      $rootScope.appointments=response.data.result;
                    }else{
                      console.log("no response");
                    }
                  })
                  $rootScope.appointment={};
                }

              }
            }
          });

}



$scope.confirmAppointments = function(id,status){
  if(status==1){
    var msga="Are you sure want to confirm this Appointment!";
  }else{
   var msga="Are you sure want to cancel this Appointment!";

 }
 if(confirm(msga)){

  $http.post('index.php/login/confirm_cancel_appt_api', {appt_id:id,appt_status:status})
  .then(function(response) {
    if ( !response) {
      console.log("no response from server side");
    }else{
                   if(response.data)//response.data.status=="failure"
                   {    
                 //   alert(JSON.stringify(response));
                  //  console.log(JSON.stringify(response));
                  if(response.data.status==0){
                  //  alert(response.data);
                  toaster.pop('error','Appointment',response.data.message);

                }else{

                  //   alert(response.data);
                  toaster.pop('success','Appointment',response.data.message);
                  var logged_user_type=$cookieStore.get('logged_user_type');
                  var logged_user_id=$cookieStore.get('logged_user_id');
                  $rootScope.RSlogged_user_type = logged_user_type;
                  $rootScope.logged_user_id = logged_user_id;

                  $http.post('index.php/login/getAppointment',{user_id:$rootScope.logged_user_id,user_type:$rootScope.RSlogged_user_type})
                  .then(function(response) {
                    if (response) { 

                      $rootScope.appointments=response.data.result;
                    }else{
                      console.log("no response");
                    }
                  })
                      //$rootScope.appointment={};
                    }

                  }
                }
              });
}
}

$scope.editAppointments=function(id){

 $http.post('index.php/login/getOneAppointment',{appt_id:id})
 .then(function(response) {
  if (response) { 
    $rootScope.appointment=response.data.result[0];
  }else{
    console.log("no response");
  }
})
}
$scope.addReport = function (){
  $rootScope.report={
    rept_id:'',
    rept_user_id:'',
    rept_doctor_id:'',
    rept_name : '',
    rept_type : '',
    rept_desc : '',
    rept_createdon : '',
    report_mode : 'Add',
    report_read_mode : false,

    
    rept_starttime : '',
    rept_endtime : '',
    rept_blood_sugar : '',
    rept_insulin : '',
    rept_carb : '',
    rept_physical_activity : ''

  }
}

$scope.addPrescription = function (){
  $rootScope.prescription={
    prescription_id :'',
    prescription_from_date:'',
    prescription_to_date:'',
    prescription_insulin : '',
    prescription_tablet : '',
    prescription_number_of_close : '',
    prescription_time : '',
    prescription_doctor_id : '',
    prescription_patient_id : '',
    prescription_mode : 'Add',
    prescription_read_mode : false,

    prescription_time1: '',
    prescription_time2 : '',
    prescription_time3 : '',
    prescription_time4 : ''

  }
}


$scope.addAppointment = function (){
 $rootScope.appointment={};

 $rootScope.appointment={
  appt_id:'',
  appt_patient_id:'',
  appt_doctor_id:'',
  appt_treatement_id:'',
  appt_booked_datetime : '',
  appt_status : '',
  appt_notes : ''

}
}



$scope.deletePrescription=function(id,action){


 if(confirm("Are you sure want to delete this Prescription !")){

  $http.post('index.php/login/delete_prescription_api',{prescription_id:id})
  .then(function(response) {
    console.log("response of delete report===="+JSON.stringify(response))
    if ( !response) {
      console.log("no response from server side");
    }else{
                         if(response.data)//response.data.status=="failure"
                         {    

                          if(response.data.status==0){
                           toaster.pop('error','Prescription',response.data.message);

                            //alert(response.data.message);

                          }else{

                            for (var i in $rootScope.prescriptions) {
                              if ($rootScope.prescriptions[i].prescription_id == id) {
                                $rootScope.prescriptions.splice(i, 1);

                              }
                            }
                            toaster.pop('success','Prescription',response.data.message);

                           // alert(response.data.message);

                         }

                       }
                     }
                   });

}


}

$scope.deleteReport=function(id,action){


 if(confirm("Are you sure want to delete this Report !")){

  $http.post('index.php/login/delete_report_api',{report_id:id})
  .then(function(response) {
    console.log("response of delete report===="+JSON.stringify(response))
    if ( !response) {
      console.log("no response from server side");
    }else{
                         if(response.data)//response.data.status=="failure"
                         {    

                          if(response.data.status==0){
                           toaster.pop('error','Report',response.data.message);

                            //alert(response.data.message);

                          }else{

                            for (var i in $rootScope.reports) {
                              if ($rootScope.reports[i].rept_id == id) {
                                $rootScope.reports.splice(i, 1);

                              }
                            }
                            toaster.pop('success','Report',response.data.message);

                           // alert(response.data.message);

                         }

                       }
                     }
                   });

}


}
$scope.editReport=function(id,action){

 $http.post('index.php/login/getreport',{report_id:id})
 .then(function(response) {
  if (response) { 
    $rootScope.report=response.data.result[0];
    if(action=='edit'){
      $rootScope.report.report_mode='Edit';
      $rootScope.report.report_read_mode = false;
    }
    if(action=='view'){
      $rootScope.report.report_mode='View';
      $rootScope.report.report_read_mode=true;
    }
  }else{
    console.log("no response");
  }
})
}

}

function contactFormCtrl($scope,$http,$location,$rootScope,toaster)
{

  $scope.contact={};

  $scope.contact={
    contact_name:'',
    contact_email:'',
    contact_message:''
  }

  $scope.submitContactForm=function(){

    if($scope.contact.contact_name=='' || $scope.contact.contact_email=='' )
    {
      toaster.pop('error','Contact Form','Field is required.');
      
      return false;
    }

    $http.post('index.php/login/submitContactForm_api', {contact_name:$scope.contact.contact_name,contact_email:$scope.contact.contact_email,contact_message:$scope.contact.contact_message})
    .then(function(response) {
      if ( !response) {
        console.log("no response from server side");
      }else{
           if(response.data)//response.data.status=="failure"
           {    

            if(response.data.status==0){
              toaster.pop('error','Contact Form',response.data.message);

              //alert(response.data.message);
            }else{
             toaster.pop('success','Contact Form',response.data.message);

             // alert(response.data.message);
             $scope.contact={};
           }

         }
       }
     });


  }
}

function registerController($scope,$http,$location,$rootScope,toaster,$cookieStore)
{

  $rootScope.logged = $rootScope.logged;
  $rootScope.imageClass = 'home';
  $scope.user={};
  $rootScope.personalProfile={};
  $scope.user={
    user_username:'',
    user_password:'',
    user_email:'',
    user_mobile : '',
    user_address : '',
    user_type : ''

  }

  $scope.checkEmail=function(){
            // alert("sdf"+$scope.user.user_email);
            if($scope.user.user_email==''){
              return;
            }
            
            $http.post('index.php/login/check_email_exist_api', {user_email:$scope.user.user_email})
            .then(function(response) {
              if ( !response) {
                console.log("no response from server side");
              }else{
               if(response.data)
               {   
                if(response.data.status==0){
                  toaster.pop('error','Register','Email already exist.');

  //alert("Email already exist.");
}
}
}
});
          }






          $scope.updateProfile=function(){

            if($scope.personalProfile.user_username=='' || $scope.personalProfile.user_email=='' || $scope.personalProfile.user_mobile=='' || $scope.personalProfile.user_address=='' )
            {
              toaster.pop('error','Profile','Field is required.');

              return false;
            }

            var logged_user_id=$cookieStore.get('logged_user_id');

            $http.post('index.php/login/updateProfile_api', {user_id:logged_user_id ,user_username:$scope.personalProfile.user_username,user_email:$scope.personalProfile.user_email,user_mobile:$scope.personalProfile.user_mobile,user_address:$scope.personalProfile.user_address})
            .then(function(response) {
              if ( !response) {
                console.log("no response from server side");
              }else{
    //alert(JSON.stringify(response));
   if(response.data)//response.data.status=="failure"
   {    

    if(response.data.status==0){
      toaster.pop('error','Profile',response.data.message);
      //alert(response.data.message);
    }else{

       var logged_user_id=$cookieStore.get('logged_user_id');

   $http.post('index.php/login/getProfile',{user_id:logged_user_id})
   .then(function(response) {
    //alert(JSON.stringify(response));

    if (response) { 
      $rootScope.personalProfile=response.data.result[0];
    //console.log("$rootScope.personalProfile==="+JSON.stringify($rootScope.personalProfile));
  }else{
    console.log("no response");
  }
})

      //alert(response.data.message);
      toaster.pop('success','Profile',response.data.message);

      
    }

  }
}
});


          }

          $scope.register=function(){

            if($scope.user.user_username=='' || $scope.user.user_password=='' || $scope.user.user_email=='' || $scope.user.user_mobile=='' || $scope.user.user_address=='' || $scope.user.user_type=='')
            {
              toaster.pop('error','Register','Field is required.');

              return false;
            }


            $http.post('index.php/login/register_api', {user_username:$scope.user.user_username,user_password:$scope.user.user_password,user_email:$scope.user.user_email,user_mobile:$scope.user.user_mobile,user_address:$scope.user.user_address,user_type:$scope.user.user_type})
            .then(function(response) {
              if ( !response) {
                console.log("no response from server side");
              }else{
   if(response.data)//response.data.status=="failure"
   {    

     if(response.data.status==0){
      toaster.pop('error','Register',response.data.message);
   		//alert(response.data.message);
   	}else{

   		//alert(response.data.message);
      toaster.pop('success','Register',response.data.message);

      $scope.user={};
    }

  }
}
});


          }




        }


        function loginController($scope,$http,$rootScope,$cookieStore,$location,toaster)
        {
        	$scope.loginuser={};

        	$scope.loginuser={
        		user_email:'',
        		user_password:'',
        	}
          $scope.login=function(){
            if($scope.loginuser.user_email=='' || $scope.loginuser.user_email==undefined || $scope.loginuser.user_password=='' || $scope.loginuser.user_password==undefined )
            { 
            	return false;
            }

            $http.post('index.php/login/login_api', {user_email:$scope.loginuser.user_email,user_password:$scope.loginuser.user_password})
            .then(function(response) {
              if ( !response) {
                console.log("no response from server side");
              }else{
   if(response.data)//response.data.status=="failure"
   {    

    //alert(JSON.stringify(response.data));
 //   alert(response.data.data[0]['online_status']);
 if(response.data.status==1){
  $rootScope.show_post =1;
  toaster.pop('success','Login',response.data.message);

   		//alert(response.data.message);
   		//$scope.logged=1;
      $rootScope.imageClass = '';
      $rootScope.logged=true;
      console.log("response.data.data[0]  on login=="+JSON.stringify(response.data.data[0]));
      $cookieStore.put('is_logged',1);
      $cookieStore.put('logged_user_type',response.data.data[0]['user_type']);
      $cookieStore.put('logged_user_id',response.data.data[0]['user_id']);
      $cookieStore.put('logged_username',response.data.data[0]['user_username']);

      $cookieStore.put('logged_user_online_status',response.data.data[0]['online_status']);

      $rootScope.logged_user_online_status=$cookieStore.get('logged_user_online_status');

      if(response.data.data[0]['user_profileimg']==''){
        console.log("no image set of this user");
        $cookieStore.put('logged_user_profileimg','users.png');


      }else{
        $cookieStore.put('logged_user_profileimg',response.data.data[0]['user_profileimg']);
        console.log("image set of this user");
        
      }

      $rootScope.logged_user_profileimg=$cookieStore.get('logged_user_profileimg');

      $rootScope.logged_username=$cookieStore.get('logged_username');
      var logged_user_type=$cookieStore.get('logged_user_type');
      $rootScope.RSlogged_user_type = logged_user_type;

      $http.get('index.php/login/getPosts')
      .then(function(response) {
        if (response) { 
          $rootScope.posts=response.data.result;
          $rootScope.post = {};
        }else{
          console.log("no response");
        }
      })

      $scope.loginuser={};

      $http.post('index.php/login/getAppointment',{user_id:response.data.data[0]['user_id'],user_type:response.data.data[0]['user_type']})
      .then(function(response) {
        if (response) { 

          $rootScope.appointments=response.data.result;
        }else{
          console.log("no response");
        }
      })

      console.log("call 597 line============================");


      $http.post('index.php/login/getReports',{user_id:response.data.data[0]['user_id'],user_type:response.data.data[0]['user_type']})
      .then(function(response) {
       console.log("response of getReports line no 984=="+JSON.stringify(response));

       if (response) { 
        $rootScope.reports=response.data.result;
      }else{
        console.log("no response");
      }
    })

       var logged_user_type1=response.data.data[0]['user_type'];
      $http.post('index.php/login/getPrescription',{user_id:response.data.data[0]['user_id'],user_type:response.data.data[0]['user_type']})
      .then(function(response) {

        $rootScope.logged_user_type = logged_user_type1;

        console.log("response of getPrescription line no 997=="+JSON.stringify(response));

        if (response) { 
         $rootScope.prescriptions=response.data.result;
       }else{
        console.log("no response");
      }
    })

      $location.path('home');
    }else{

     toaster.pop('error','Login',response.data.message);

     $rootScope.logged=false;
     $rootScope.imageClass = 'home';
   }
   //console.log(JSON.stringify(response.data));
 }
}
});


}
}

