/**
 For all form Approval Color chances.
 * 
 */
function checkForm() {

	var cols = document.getElementById('tableData').getElementsByTagName('td'),
	colslen = cols.length, i = -1, color = checkForm.colors, val;
	
	while(++i < colslen){
		val = cols[i].innerHTML;
		//alert("VAL : "+val);
		//original
		//cols[i].style.backgroundColor = val <= 0? color.red : val < 8? color.yellow : color.green;
		cols[i].style.backgroundColor = val == "Not Approved" ? color.redd : val == "NOT APPROVED" ? color.redd : val == "Initiator" ? color.blue : val =="Approved"? color.yellow : val == "Pending"? color.red : val == "Not Approved" ;
		
	  }
}
checkForm.colors = {
	green: "#7fff00",
	yellow: "lightgreen",
	red: "#FF6600",
	blue: "#0066FF",
	redd: "#FF0000"
}