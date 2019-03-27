<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>

<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
	String merchant_key="sxWEFqgR";
	String salt="d9JKL3608x";
	String action1 ="";
	String base_url="https://secure.payu.in/_payment";
	int error=0;
	String hashString="";
	
 

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
        String email=null,amount=null,firstN=null,lastN=null,phone=null,info=null;
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
        try{
         HttpSession session1 = request.getSession();
                 Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://13.232.235.52/myfoodweb","saiyan","Boruto@Uzu4");
             if(conn==null)   {
            System.out.println("connection failed");
        }
              Statement st = conn.createStatement();
              ResultSet rs = st.executeQuery("SELECT * FROM orderlist WHERE txnid='"+txnid+"';");
              while(rs.next()){
                  email = rs.getString(11);
                  amount = rs.getString(4);
                  String[] names = rs.getString(2).split(" ");
                  firstN = names[0];
                  lastN = names[1];
                  info = rs.getString(3);
              }
              rs  =st.executeQuery("SELECT * FROM untitled WHERE Email='"+email+"';");
              while(rs.next()){
                  phone = rs.getString(9);
              }
              conn.close();
    }
    catch(Exception e){
    e.printStackTrace();
    }
        String udf2 = txnid;
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		  
%>
<html>
     <link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'>
      <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.css" type="text/css" rel="stylesheet">        <link href="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" type="text/css" rel="stylesheet">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.css" type="text/css" rel="stylesheet">
        <script src="../../ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="../../maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <style>
.form-style-10{
    width:450px;
    padding:30px;
    margin:40px auto;
    background: #FFF;
    border-radius: 10px;
    -webkit-border-radius:10px;
    -moz-border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
    -moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
    -webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
}
.form-style-10 .inner-wrap{
    padding: 30px;
    background: #F8F8F8;
    border-radius: 6px;
    margin-bottom: 15px;
}
.form-style-10 h1{
    background: #2A88AD;
    padding: 20px 30px 15px 30px;
    margin: -30px -30px 30px -30px;
    border-radius: 10px 10px 0 0;
    -webkit-border-radius: 10px 10px 0 0;
    -moz-border-radius: 10px 10px 0 0;
    color: #fff;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
    font: normal 30px 'Bitter', serif;
    -moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
    -webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
    box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
    border: 1px solid #257C9E;
}
.form-style-10 h1 > span{
    display: block;
    margin-top: 2px;
    font: 13px Arial, Helvetica, sans-serif;
}
.form-style-10 label{
    display: block;
    font: 13px Arial, Helvetica, sans-serif;
    color: #888;
    margin-bottom: 15px;
}
.form-style-10 input[type="text"],
.form-style-10 input[type="date"],
.form-style-10 input[type="datetime"],
.form-style-10 input[type="email"],
.form-style-10 input[type="number"],
.form-style-10 input[type="search"],
.form-style-10 input[type="time"],
.form-style-10 input[type="url"],
.form-style-10 input[type="password"],
.form-style-10 textarea,
.form-style-10 select {
    display: block;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    width: 100%;
    padding: 8px;
    border-radius: 6px;
    -webkit-border-radius:6px;
    -moz-border-radius:6px;
    border: 2px solid #fff;
    box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
    -moz-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
    -webkit-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
}

.form-style-10 .section{
    font: normal 20px 'Bitter', serif;
    color: #2A88AD;
    margin-bottom: 5px;
}
.form-style-10 .section span {
    background: #2A88AD;
    padding: 5px 10px 5px 10px;
    position: absolute;
    border-radius: 50%;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    border: 4px solid #fff;
    font-size: 14px;
    margin-left: -45px;
    color: #fff;
    margin-top: -3px;
}
.form-style-10 input[type="button"], 
.form-style-10 input[type="submit"]{
    background: #2A88AD;
    padding: 8px 20px 8px 20px;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    color: #fff;
    text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
    font: normal 30px 'Bitter', serif;
    -moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
    -webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
    box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
    border: 1px solid #257C9E;
    font-size: 15px;
}
.form-style-10 input[type="button"]:hover, 
.form-style-10 input[type="submit"]:hover{
    background: #2A6881;
    -moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
    -webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
    box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
}
.form-style-10 .privacy-policy{
    float: right;
    width: 250px;
    font: 12px Arial, Helvetica, sans-serif;
    color: #4D4D4D;
    margin-top: 10px;
    text-align: right;
}
</style>
<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	if (hash == '')
		return;

      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>

<body onload="submitPayuForm();">
    <div class="row">
        <div class="col-md-6 col-sm-6"> <img src="images/carrello-800600.gif" style="margin-top:30%;"/></div>
        <div class="col-md-6 col-sm-6"><div class="form-style-10">
<h1>Checkout<span>Please Click Next , if you are wanna pay for your order !</span></h1>
<form action="<%= action1 %>" method="post" name="payuForm" >
    <input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      <input type="hidden" name="udf2" value="<%= txnid %>" />
      <input type="hidden" name="service_provider" value="payu_paisa" />
      <input type="hidden" name="surl" value="https://cueathub.com/FoodCorner/success.jsp?txnid=<% out.print(txnid); %>" size="64" />
      <input type="hidden" name="furl" value="https://cueathub.com/FoodCorner/failure.jsp" size="64" />
      <input  type="hidden" name="curl" value="https://cueathub.com/FoodCorner/failure.jsp" />
      <input  type="hidden" name="address2" value="<%= (empty(params.get("address2"))) ? "" : params.get("address2") %>" />
      <input  type="hidden" name="address1" value="<%= (empty(params.get("address1"))) ? "" : params.get("address1") %>" />
      <input  type="hidden" name="city" value="<%= (empty(params.get("city"))) ? "" : params.get("city") %>" />
      <input  type="hidden" name="country" value="<%= (empty(params.get("country"))) ? "" : params.get("country") %>" />
      <input  type="hidden" name="state" value="<%= (empty(params.get("state"))) ? "" : params.get("state") %>" />
      <input  type="hidden" name="zipcode" value="<%= (empty(params.get("zipcode"))) ? "" : params.get("zipcode") %>" />
      <input  type="hidden" name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" />
      <input  type="hidden" name="udf3" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3") %>" />
      <input  type="hidden" name="udf4" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4") %>" />
      <input  type="hidden" name="udf5" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" />
      <input  type="hidden" name="pg" value="<%= (empty(params.get("pg"))) ? "" : params.get("pg") %>" />
    <div class="section"><span>1</span>User Name</div>
    <div class="inner-wrap">
        <label>First Name <input type="text" name="firstname" id="firstname" value="<%= firstN %> " readonly="readonly"/></label>
        <label>Last Name <input type="text"name="lastname" id="lastname" value="<%= lastN %>" readonly="readonly"/></label>
    </div>

    <div class="section"><span>2</span>Email &amp; Phone</div>
    <div class="inner-wrap">
        <label>Email Address <input type="email" name="email" id="email" value="<%= email %>" readonly="readonly"/></label>
        <label>Phone Number <input type="text" name="phone" value="<%= phone %>" readonly="readonly"/></label>
    </div>

    <div class="section"><span>3</span>Order Details</div>
        <div class="inner-wrap">
            <label>Price (in Rs.) <input type="text" name="amount" value="<%= amount %>" readonly="readonly"/></label>
            <label>Info. <input type="text" name="productinfo" value="<%=info %>" size="64" contenteditable="false"/></label>
    </div>
    <div class="button-section">
     <%   if(empty(hash)){ %>
     <input type="submit" name="Submit" value="Next" />
     <% } %>
     <span class="privacy-policy">
     <input type="checkbox" name="field7">You agree to our Terms and Policy. 
     </span>
    </div>
</form>
</div>
        </div>
    </div>
       

</body>
</html>