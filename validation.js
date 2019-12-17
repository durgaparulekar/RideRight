function validation()
{
     
  if( document.StudentRegistration.firstname.value == "" )
   {
     alert( "Please provide your Name!" );
     document.StudentRegistration.firstname.focus() ;
     return false;
   }
   
   var letters = /^[A-Za-z]+$/; 
    if(!(document.StudentRegistration.firstname.value.match(letters))  )
     {  
    alert('FirstName must have alphabet characters only');  
    document.StudentRegistration.firstname.focus();  
    return false;  
    }
           
   if( document.StudentRegistration.lastname.value == "" )
   {
     alert( "Please provide your Last Name!" );
     document.StudentRegistration.lastname.focus() ;
     return false;
   }
   var letters = /^[A-Za-z]+$/; 
    if(!(document.StudentRegistration.lastname.value.match(letters))  )
     {  
    alert('LastName must have alphabet characters only');  
    document.StudentRegistration.lastname.focus();  
    return false;  
    }
  if(document.StudentRegistration.emailid.value == "" )
   {
     alert( "Please provide your Email ID!" );
     document.StudentRegistration.emailid.focus() ;
     return false;
   }
   var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
if(!(document.StudentRegistration.emailid.value.match(mailformat)) )
    {
    alert("You have entered an invalid email address!");  
document.StudentRegistration.emailid.focus() ; 
return false;  
    }
    
    if(document.StudentRegistration.pass.value =="" )
   {
     alert( "Please provide your password!" );
     document.StudentRegistration.pass.focus() ;
     return false;
   }
   
   if(document.StudentRegistration.pass.value.length<6)
   {  
  alert("Password must be at least 6 characters long.");  
  return false;  
  }  
/*  var letters = /^[0-9a-zA-Z]+$/;  
if(document.StudentRegistration.pass.value.match(letters))  
{  
   alert('Password must have alphanumeric characters.(Include special characters(@,%),numbers and characters.Example,he_10)');  
document.StudentRegistration.pass.focus() ;  
return false;  
    }
    */
  if( document.StudentRegistration.cpassword.value =="" )
   {
     alert( "Please provide your confirm password!" );
     document.StudentRegistration.cpassword.focus() ;
     return false;
   }
    var pass = document.StudentRegistration.pass.value;
        var cpassword = document.StudentRegistration.cpassword.value;
        if (pass != cpassword) {
            alert("Passwords do not match.");
            return false;
        }
   
 
   var age=document.StudentRegistration.age.value;  
        if (isNaN(age)||age<16||age>50){ 
            alert( "Invalid age !" );
          document.StudentRegistration.age.focus() ;
            return false;  
            }
           
      if( document.StudentRegistration.mobileno.value.length != 10 )
   {
     alert( "Please provide a valid Mobile No " );
     document.StudentRegistration.mobileno.focus() ;
     return false;
   }
    
    
   if( document.StudentRegistration.age.value<16 )
   {
     alert( "You are not eligible !" );
     document.StudentRegistration.age.focus() ;
     return false;
   } 
 
 if(document.StudentRegistration.department.value == "default")  
{  
alert('Select your course from the list');  
document.StudentRegistration.department.focus() ; 
return false;  
}
if(document.StudentRegistration.year.value == "default")  
{  
alert('Select your year from the list');  
document.StudentRegistration.year.focus() ; 
return false;  
}
if(document.StudentRegistration.course.value == "default")  
{  
alert('Select your class from the list');  
document.StudentRegistration.course.focus() ; 
return false;  
}

}
