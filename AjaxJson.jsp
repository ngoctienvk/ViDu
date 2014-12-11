<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
         <script language="javascript">                             
         //array data object of file json         
         // read data from file json       
        //Load data  
        var Arr = [];
        var Arr2 = [];
               $(document).ready(function(){
                         $.ajax({
                            url : 'Data.json',
                            type : 'get',
                             dataType : 'json',
                             success : function (result){  
                             Arr = result;  
                             Arr2 = result;  
                               }      
                           });
                       }); 
     
               $(document).ready(function(){
            	   $("#loadds").click(function(){
            		   for(var i = 0; i < Arr.employees.length ; i++) 
            			{
                           $('table').append(
                       		 '<tr id="row'+i+'">'+'<td id="s'+i+'">'+i+'</td>'+
                                '<td>'+Arr.employees[i].MSNV+'</td>'+
                                '<td>'+Arr.employees[i].Ten+'</td>'+
                                '<td>'+Arr.employees[i].Lop+'</td>'+
                                '<td>'+Arr.employees[i].Diachi+'</td>'+
                                '<td>'+Arr.employees[i].ThanhPho+'</td>'+
                                '<td>'+                      
                                '<input type="checkbox" id="'+i+'" onclick="return selectID(this)">'+
                                '</td>'+
                                '</tr>'
                              );                                                                      
                       };
            	   });
               });
               
                //array of id then delete    
                var flag = [];
                function selectID(e)
                {
                	flag.push(e.id); 
             	
                }
                
                // function delete id of data   
                function Delete()
                {
                	            	
                		if(flag === "")
                			{
                			  alert("Ban chua chon doi tuong de delete");
                			}
                		else
                			{
                			   
                				 for(var i = 0; i < flag.length ; i++)
                					 {              					                                                        					   
                					   $('tr').remove("#row"+flag[i]);
                                       for(var j = parseInt(flag[i]) + 1; j <= 10 ; j++)
                                          {
                                    	         if(j >= 10)
                                    	        	 { break; }
                                    	         else
                                    	        {
                                                 document.getElementById("s"+j).innerHTML = j - (i + 1);
                                    	        }
                                          } 
                                        if(i >= 1)
                                        {
                                          //do mang moi lan delete thì reset lai mang vị trí cua nó bị thay đổi ví dụ:
                                          // s[0] = 2;
                                          // s[1] = 3;
                                          // s[2] = 3; nếu delete vị trí naỳ thì s[3]= 4 sẽ đổi vị trí thanh s[2] = 4;  
                                          // s[3] = 4;
                                           
                             			  Arr.employees.splice(flag[i] - i,1); 
                                          
                                        }
                                        else
                                        {
                                          Arr.employees.splice(flag[i],1);
                                        }
                                      
                					 }   
                				           				   
                				     flag = [];                                 		             			 
                			}
                	
                };
                
                // function insert data   
                function Insert()
                {
                	$(document).ready(function(){
                		 
                	  $.each(Arr.employees,function(i,s){
                		
                		 $('table').append(
                        		 '<tr id="'+i+'">'+'<td class="s'+i+'">'+i+'</td>'+
                                 '<td>'+Arr.employees[i].MSNV+'</td>'+
                                 '<td>'+Arr.employees[i].Ten+'</td>'+
                                 '<td>'+Arr.employees[i].Lop+'</td>'+
                                 '<td>'+Arr.employees[i].Diachi+'</td>'+
                                 '<td>'+Arr.employees[i].ThanhPho+'</td>'+
                                 '<td>'+                      
                                 '<input type="checkbox" id="'+i+'" onclick="return selectID(this)">'+
                                 '</td>'+
                                 '</tr>'
                                 );                                     
                      
                        });               					   				
                	});
                };
             
        </script>
       
    <body>
        <p> DS Nhan vien </p>
        <button id="loadds"></button>
       <table cellspacing="0" border="1" width="100%">
       
          <tr>
              <td width="30%"><b>STT</b></td>
              <td width="30%"><b>MSNV</b></td>
              <td width="30%"><b>Tên</b></td>
              <td width="30%"><b>Lớp</b></td>
              <td width="30%"><b>DiaChi</b></td>
              <td width="30%"><b>Thanh pho</b></td>
              <td width="30%"><b></b></td>
          </tr> 
          
       
       </table>
        <br>
        <button onclick="Delete()">Delete</button>
        <button onclick="Insert()">Insert</button>
        
        <input>
        <input>
        <input>
        <input>
        <input>
              
        
    </body>
</html>