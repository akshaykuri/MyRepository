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
	    if (countSelected(formElement, 'checkbox', 'how') == 0) {
	        alert('Please select how you found out about us.');
	        return false;
	      }
      //If all is OK, return true and let the form submit
      return true;
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
 </script>
</head>
<body>
<form name="formElement" action="some_page.php" onsubmit="return validateForm(this);"
 onreset="return confirm('Are you sure that you want to reset this form?');">
<table>
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
</table>
<p><input type="submit" /><input type="reset" /></p>
</form>
</body>
</html>