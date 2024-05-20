 function clear()
		          {
		          
		                 
		               	   var frm=document.forms[0],flds=[frm['mr_itemQuantity'],frm['mr_itemRate'],frm['mr_itemAmount']],total=0;
 							for (var z0=0;z0<flds[0].length;z0++)
 							{
 							 if (isFinite(flds[0][z0].value*1)&&isFinite(flds[1][z0].value*1))
 							 {
 							  flds[2][z0].value = clearComma(flds[2][z0].value);
  						     }
					        }          
 						    frm['totalcon'].value=(clearComma(total));
		 
			     }
		
		       function calculateDynamic()
		          {
		          
		                 
		               	   var frm=document.forms[0],flds=[frm['mr_itemQuantity'],frm['mr_itemRate'],frm['mr_itemAmount']],total=0;
 							for (var z0=0;z0<flds[0].length;z0++)
 							{
 							 if (isFinite(flds[0][z0].value*1)&&isFinite(flds[1][z0].value*1))
 							 {
 							    // flds[2][z0].value = flds[0][z0].value*flds[1][z0].value;
  							      
  							      
  							     var temp =  flds[2][z0].value = click123(flds[0][z0].value*flds[1][z0].value);
  							      
  							      temp = clearComma(temp);
  							      total+= (temp*1);
  						     }
					        }          
 						    frm['totalcon'].value=(click123(total));
		 
			     }