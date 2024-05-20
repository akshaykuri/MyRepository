<%--
    Document   : ClientInwardsRentalAutoSuggest
    Created on : May 29, 2009, 3:05:08 PM
    Author     : siddhi8
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="content-type" content="application/xhtml+xml; charset=utf-8" />
        <meta name="4SPL" content="MulteeProeIndia"/>
        <title>Invoice Outwards Report AutoSuggest</title>
        <link rel="stylesheet" type="text/css" href="CSS/Form.css" title="style" />
        <style type="text/css">

            .popupItem {
                background: #FFFAFA;
                color: #000000;
                text-decoration: none;
                font-size: 1.2em;
            }

            .popupItem:hover {
                background: #7A8AFF;
                color: #FFFAFA;
            }

            .popupRow {
                background: #FFFAFA;
            }

        </style>

        <script type="text/javascript">

            var isIE;
            var completeTable;
            var completeField;
            var autorow;
            var req;


            function getElementY(element){
                var targetTop = 0;
                if (element.offsetParent) {
                    while (element.offsetParent) {
                        targetTop += element.offsetTop;
                        element = element.offsetParent;
                    }
                } else if (element.y) {
                    targetTop += element.y;
                }
                return targetTop;
            }

            function init() {
                completeField = document.getElementById("complete-field");
                var menu = document.getElementById("auto-row");
                autorow = document.getElementById("menu-popup");
                autorow.style.top = getElementY(menu) + "px";
                completeTable = document.getElementById("completeTable");
                completeTable.setAttribute("bordercolor", "white");
            }

            function initRequest(url) {
                if (window.XMLHttpRequest) {
                    return new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    isIE = true;
                    return new ActiveXObject("Microsoft.XMLHTTP");
                }
            }


            function doCompletion() {
                if (completeField.value == "") {
                    clearTable();
                } else {
                    var url = "clientInwardsRentalAutoSuggest?action=complete&id=" + escape(completeField.value);
                    var req = initRequest(url);
                    req.onreadystatechange = function() {
                        //            alert(req.readyState);
                        if (req.readyState == 4) {
                            if (req.status == 200) {
                                parseMessages(req.responseXML);
                            } else if (req.status == 204){
                                clearTable();
                            }
                        }
                    };
                    req.open("GET", url, true);
                    req.send(null);
                }
            }

            function parseMessages(responseXML) {
                clearTable();
                var outreports = responseXML.getElementsByTagName("outreports")[0];
                if (outreports.childNodes.length > 0) {
                    completeTable.setAttribute("bordercolor", "black");
                    completeTable.setAttribute("border", "1");
                } else {
                    clearTable();
                }

                for (loop = 0; loop < outreports.childNodes.length; loop++) {
                    var outreport = outreports.childNodes[loop];
                    var invoiceNo = outreport.getElementsByTagName("invoiceNo")[0];
                    var clientName = outreport.getElementsByTagName("clientName")[0];
                    var invtrnMid = outreport.getElementsByTagName("invtrnMid")[0];
                    appendoutreport(invoiceNo.childNodes[0].nodeValue,clientName.childNodes[0].nodeValue, invtrnMid.childNodes[0].nodeValue);
                }
            }

            function clearTable() {
                if (completeTable) {
                    completeTable.setAttribute("bordercolor", "white");
                    completeTable.setAttribute("border", "0");
                    completeTable.style.visible = false;
                    for (loop = completeTable.childNodes.length -1; loop >= 0 ; loop--) {
                        completeTable.removeChild(completeTable.childNodes[loop]);
                    }
                }
            }

            function appendoutreport(invoiceNo,clientName,invtrnMid) {
                //var taxDescriptionCell;
                // var taxPercentageCell;
                var row;
                var nameCell;
                if (isIE) {
                    row = completeTable.insertRow(completeTable.rows.length);
                    nameCell = row.insertCell(0);
                } else {
                    row = document.createElement("tr");
                    nameCell = document.createElement("td");
                    row.appendChild(nameCell);
                    completeTable.appendChild(row);
                }
                row.className = "popupRow";
                nameCell.setAttribute("bgcolor", "#FFFAFA");


                var linkElement = document.createElement("a");
                linkElement.className = "popupItem";
                linkElement.setAttribute("href", "clientInwardsRentalAutoSuggest?action=lookup&id=" + invtrnMid);
                linkElement.appendChild(document.createTextNode(invoiceNo + " " + clientName));
                nameCell.appendChild(linkElement);
            }
        </script>

    </head>
    <body onload="init()">
      
      
        <div class="mywindow">
            <div id="stylized" class="myform" style="width:40%">
                <form name="autofillform" action="clientInwardsRentalAutoSuggest" method="get">
                    <input type="hidden" name="action" value="lookupbyname"/>
                    <table border="0" cellpadding="5" cellspacing="0" style="border:none;">
                        <tr style="background-color: #ebf4fb;">
                            <td><label  style="width:7em">Client Name:</label></td>
                            <td>
                                <input    type="text"
                                          size="20"
                                          clientInwardsRentalAutoSuggest="off"
                                          id="complete-field"
                                          name="id"
                                          onkeyup="doCompletion();" />
                            </td>
                            <td align="left">
                                <input id="submit_btn" type="submit" value="Lookup" style="height:1.8em" />
                            </td>
                        </tr>
                        <tr style="background-color: #ebf4fb;"><td id="auto-row" colspan="2">&nbsp;</td></tr>
                    </table>
                </form>
                <div style="position: absolute; top:170px;left:410px" id="menu-popup">
                    <table id="completeTable" border="1" bordercolor="black" cellpadding="0" cellspacing="0" />
                </div>
            </div>
        </div>
    </body>
</html>
