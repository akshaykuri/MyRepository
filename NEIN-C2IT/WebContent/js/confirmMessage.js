/**
 * 
 */
function confirmpass()
{
    //Store the password field objects into variables ...
    var password = document.getElementById('idNew');
    var confirmpassword = document.getElementById('idConfirm');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field
    if(password.value == confirmpassword.value){
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
    	confirmpassword.style.backgroundColor = goodColor;
    	/* var img = document.createElement('img');
         //img.src = "images/images/tick.gif"; 
         confirmpassword.style =  img.src = "images/images/tick.gif"; */
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!";
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
    	confirmpassword.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!";
    }
}  
