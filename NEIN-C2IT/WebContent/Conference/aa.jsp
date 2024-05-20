<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
   <head>  
   
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>


        <script>
            $(function() {
                $(".dpick").datepicker({
         	       changeMonth:true,
        	       changeYear:true,
        	       yearRange:"-50:+50",
        	       minDate: 0,
        	       dateFormat:"yy-mm-dd" });
            });
        </script>

        <!-- /for date picker -->

    </head>
    <body>
    
        <div id="onBookingDiv">
            <label id="Paylbl0">Date 1: </label>
            <input type="text"  style="width: 30%;" class="dpick" id="dpick0" > 
            <button type="button" onclick="AddNew()">Add New</button>
        </div>
      
        <!-- this div is used to correctly place the cloned div -->

        <div id="placeDiv" style="display: none">
            <label>Date : </label>
            <input type="text"  style="width: 30%;" class="dpick"> 
           
        </div>

        <!-- /this div is used to correctly place the cloned div -->

        <!-- this div is used to make the clone -->

       <div id="makeCloneID" class="makeCloneClass" style="display:none;">
        <label class="lbl">Date : </label>
        <input type="text" class="dontUseDPickClass" style="width: 30%;"> 
       
    </div>

        <!-- /this div is used to make the clone -->


        <script>
            var i = 1;
            function AddNew() {
                var cloned = $('#makeCloneID').clone(true);
                cloned.css({"display": 'block'});

                var noOfDivs = $('.makeCloneClass').length + 2;

                cloned.attr('id', 'Pay' + noOfDivs + 'Div');
                cloned.find('label').attr('id', 'PayLbl' + noOfDivs);
                cloned.find('input[type="text"]').attr('id', 'dpick'+ noOfDivs);
                   
                cloned.find('.lbl').html("Date "+ ++i + ':');


                cloned.insertBefore("#placeDiv");

                //Init the datepicker:
                $('#dpick'+ noOfDivs).datepicker({
         	       changeMonth:true,
        	       changeYear:true,
        	       yearRange:"-50:+50",
        	       minDate: 0,
        	       dateFormat:"yy-mm-dd" });    
            }
        </script>


    </body>
</html>