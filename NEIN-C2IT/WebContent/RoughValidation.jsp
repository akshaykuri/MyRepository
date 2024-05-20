<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script defer="defer" type="text/javascript"><!--
  /*Start of form validation:*/
  function validateForm(formElement) {
    //Check user name is at least 2 characters long
    if (formElement.user_name.value.length < 2)
      return focusElement(formElement.user_name,
       'Please enter a name that is at least 2 characters long.');
    //Check password is at least 5 characters long
    if (formElement.pass.value.length < 5)
      return focusElement(formElement.pass,
       'Please enter a password that is at least 5 characters long.');
    //Check for valid e-mail address
    if (validEmail(formElement.email.value) == false)
      return focusElement(formElement.email,
       'Please enter a valid e-mail address.');
    //Make sure a location is selected
    if (formElement.location.selectedIndex == 0)
      return focusElement(formElement.location,
       'Please select your country.');
    //Make sure a location is selected
    if (countSelectedOptions(formElement.interests) < 2)
      return focusElement(formElement.interests,
       'Please select at least 2 of your interests.');
    //Make sure we have an action
    if (countSelected(formElement, 'radio', 'action') == 0) {
      alert('Please choose the action for this submission.');
      return false;
    }
    //Make sure there is at least one of the "how did you find out about us" check boxes selected
    if (countSelected(formElement, 'checkbox', 'how') == 0) {
      alert('Please select how you found out about us.');
      return false;
    }

    //If all is OK, return true and let the form submit
    return true;
  }
  /*End of form validation.*/

  /*Below are various functions that can be
   re-used in your own validation scripts:*/
  function focusElement(element, errorMessage) {
    //Tell the user an error has been made
    alert((errorMessage.length > 0) ? errorMessage :
      'You did not enter valid data; Please try again');
    //Select the text in the input box, and focus it (if possible)
    if (element.select) element.select();
    if (element.focus) element.focus();
  
    return false;
  }
  function countSelected(formElement, inputType, inputName) {
    //If there is no input type, make it checkbox
    if (inputType == null) inputType = 'checkbox';
    var returnValue = 0;
    //Loop for all elements in this form
    for (var loopCounter = 0; loopCounter < formElement.length; loopCounter++) {
      //If this element is the wanted type
      var element = formElement.elements[loopCounter];
      if (element.type == inputType && element.checked == true) {
        //If we have the correct control name, increment the count
        if (inputName.length > 0)
          if (element.name == inputName)
            returnValue++;
        else
          returnValue++
      }
    }
    //Return the count
    return returnValue;
  }
  function countSelectedOptions(selectElement) {
    var returnValue = 0;
    //Loop for all options
    for (var loopCounter = 0; loopCounter < selectElement.options.length; loopCounter++)
      if (selectElement.options[loopCounter].selected == true)
        returnValue++;
    return returnValue;
  }
  function validEmail(email) {
    var emailRE = new RegExp(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/);
    return emailRE.test(email);
  }
  /*End of functions.*/
//--></script>
</head>
<body>
<form action="some_page.php" onsubmit="return validateForm(this);"
 onreset="return confirm('Are you sure that you want to reset this form?');">
  <fieldset><legend>Questions:</legend><table
   summary="This table holds a questionnaire about our site.">
    <caption>Questionnaire</caption>
    <colgroup><col /><col /></colgroup>
    <tr>
      <th><label for="user_name">Name</label></th>
       <td><input id="user_name" name="user_name" type="text" /></td>
    </tr>
    <tr>
      <th><label for="pass">Password</label></th>
       <td><input id="pass" name="pass" type="password" /></td>
    </tr>
    <tr>
      <th><label for=""><acronym title="Electronic">E</acronym>-mail</label></th>
       <td><input id="email" name="email" type="text" /></td>
    </tr>
    <tr>
      <th><label for="location">Location</label></th>
       <td><select id="location" name="location">
         <option>Please select your country</option>
         <option value="Europe">Europe</option>
         <option value="Africa">Africa</option>
         <option value="Asia">Asia</option>
         <option value="Americas">Americas</option>
         <option value="Other">Other</option>
       </select></td>
    </tr>
    <tr>
      <th><label for="interests">Your interests</label></th>
       <td><select id="interests" multiple="multiple" name="interests" size="5">
         <option value="music">Music</option>
         <option value="tech">technology</option>
         <option value="sci">Science</option>
         <option value="sport">Sport</option>
       </select></td>
    </tr>
    <tr>
      <th>Action</th>
       <td>
         <input id="action_email" name="action" type="radio" value="email" />
          <label for="action_email"><acronym>E</acronym>-mail to me</label>
         <input id="action_board" name="action" type="radio" value="message_board" />
          <label for="action_board">Add to message board</label><br />
       </td>
    </tr>
    <tr>
      <th>How did you hear about this site?</th>
       <td>
         <input id="how_friend" name="how" type="checkbox" value="friend" />
          <label for="how_friend">from a friend</label><br />
         <input id="how_site" name="how" type="checkbox" value="site" />
          <label for="how_site">another site</label><br />
         <input id="how_search" name="how" type="checkbox" value="search engine" />
          <label for="how_search">search engine</label><br />
         <input id="how_other" name="how" type="checkbox" value="other" />
          <label for="how_other">other</label>
       </td>
    </tr>
  </table></fieldset>
  <p><input type="submit" /><input type="reset" /></p>
</form>
</body>
</html>