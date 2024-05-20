// Validating Empty Field
function check_empty() {
if (document.getElementById('name').value == "" || document.getElementById('email').value == "" || document.getElementById('msg').value == "") {
alert("Fill All Fields !");
} else {
document.getElementById('form').submit();
alert("Form Submitted Successfully...");
}
}
//Function To Display Popup
function div_show() {
document.getElementById('abc').style.display = "block";
}
//Function To Check Target Element
function check(e) {
var target = (e && e.target) || (event && event.srcElement);
var obj = document.getElementById('abc');
var obj2 = document.getElementById('popup');
checkParent(target) ? obj.style.display = 'none' : null;
target == obj2 ? obj.style.display = 'block' : null;
}
//Function To Check Parent Node And Return Result Accordingly
function checkParent(t) {
while (t.parentNode) {
if (t == document.getElementById('abc')) {
return false
} else if (t == document.getElementById('close')) {
return true
}
t = t.parentNode
}
return true
}
