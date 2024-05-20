     
      var xmlHttp 
      var xmlHttp 
      function show(str){     
          if (typeof XMLHttpRequest != "undefined"){    
            xmlHttp= new XMLHttpRequest();    
              }      else if (window.ActiveXObject){    
                xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                    }      if (xmlHttp==null){   
                       alert("Browser does not support XMLHTTP Request")    
                         return;     
                          }       var url="selEmpComplainsDepart.jsp";  
                              url +="?count=" +str;   
                                 xmlHttp.onreadystatechange = stateChange2;  
                                     xmlHttp.open("GET", url, true);   
                                        xmlHttp.send(null);    
                                          }      function stateChange2(){     
                                              if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                    document.getElementById("pType").innerHTML=xmlHttp.responseText;    
                                                         } 
                                                                 
               }
                                          
                                       
            
            
     function Mail2(str){     
       if (typeof XMLHttpRequest != "undefined"){    
         xmlHttp= new XMLHttpRequest();    
           }      else if (window.ActiveXObject){    
             xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");  
                 }      if (xmlHttp==null){   
                    alert("Browser does not support XMLHTTP Request")    
                      return;     
                       }       var url="selectMailIdd.jsp";  
                           url +="?count=" +str;   
                              xmlHttp.onreadystatechange = onstateChange;  
                                  xmlHttp.open("GET", url, true);   
                                     xmlHttp.send(null);    
                                       }      function onstateChange(){     
                                           if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
                                                         document.getElementById("idMailLabel").innerHTML=xmlHttp.responseText  
                                                         document.getElementById("idMailValue").value=xmlHttp.responseText   
                                                      } 
                                                              
            } 
            