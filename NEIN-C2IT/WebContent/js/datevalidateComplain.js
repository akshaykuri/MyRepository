/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function DateValidation()
{
    var d1=document.getElementsByName('idFromDate').value;
    var d2=document.getElementsByName('idToDate').value;
    if(d1==""||d2=="")
        {
            alert("Both Date fields must be entered");
            return false;
        }
else
    {
	alert("Bot "+d1);
    var x=d1.split("-");
    var y=d2.split("-");

    if (x[1] == "Jan")
    {
        x[1]="01";
    }
    if (x[1] == "Feb")
    {
        x[1]="02";
    }
    if (x[1] == "Mar")
    {
        x[1]="03";
    }
    if (x[1] == "Apr")
    {
        x[1]="04";
    }
    if (x[1] == "May")
    {
        x[1]="05";
    }
    if (x[1] == "Jun")
    {
        x[1]="06";
    }
    if (x[1] == "Jul")
    {
        x[1]="07";
    }
    if (x[1] == "Aug")
    {
        x[1]="08";
    }
    if (x[1] == "Sep")
    {
        x[1]="09";
    }
    if (x[1] == "Oct")
    {
        x[1]="10";
    }
    if (x[1] == "Nov")
    {
        x[1]="11";
    }
    if (x[1] == "Dec")
    {
        x[1]="12";
    }

    if (y[1] == "Jan")
    {
        y[1]="01";
    }
    if (y[1] == "Feb")
    {
        y[1]="02";
    }
    if (y[1] == "Mar")
    {
        y[1]="03";
    }
    if (y[1] == "Apr")
    {
        y[1]="04";
    }
    if (y[1] == "May")
    {
        y[1]="05";
    }
    if (y[1] == "Jun")
    {
        y[1]="06";
    }
    if (y[1] == "Jul")
    {
        y[1]="07";
    }
    if (y[1] == "Aug")
    {
        y[1]="08";
    }
    if (y[1] == "Sep")
    {
        y[1]="09";
    }
    if (y[1] == "Oct")
    {
        y[1]="10";
    }
    if (y[1] == "Nov")
    {
        y[1]="11";
    }
    if (y[1] == "Dec")
    {
        y[1]="12";
    }
    var today= new Date();
    var Apply_frmdate = new Date(x[2],(x[1]-1),x[0]);
    var Apply_todate = new Date(y[2],(y[1]-1),y[0]);
    var one_day=1000*60*60*24;
    msg="";
//    if ((((Apply_frmdate-today)/one_day)+1)<=0)
//    {
//        msg="From date should be greater than or equal to today's date";
//    }
//    if ((((Apply_todate-today)/one_day)+1)<=0)
//    {
//        msg= msg + "\n" + "To date should be greater than or equal to today's date";
//    }
    if ((((Apply_todate-Apply_frmdate)/one_day)+1)<=0)
    {
        msg= msg + "\n" + "To date should be greater than or equal to From date";
    }
    if(msg!="")
    {
        alert (msg);
        return(false);
    }
    else
    {
        return(true);
    }
}
}
