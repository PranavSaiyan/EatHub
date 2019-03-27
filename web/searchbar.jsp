<%-- 
    Document   : searchbar
    Created on : Jan 24, 2018, 9:42:23 AM
    Author     : Pranav
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <script>
function sendSearchhandler(x)
{
    var value_s  = document.getElementById('search_bar').value;
//alert(value_s);    
var url="search_ajax.jsp?val="+value_s;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getSearchInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getSearchInfo(){
if(request.readyState===4){
var val=request.responseText;
document.getElementById('search_result').innerHTML=val;
}
}
        </script>
    <body>
               <form>
                    Search Here :    <input type="text" id="search_bar" class="search_bar" onkeydown="sendSearchhandler()"/>
            </form>
        <div id="search_result" style="z-index:100">
                            
                        </div>
    </body>
</html>
