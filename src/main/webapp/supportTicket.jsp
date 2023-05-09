<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="PageStructure/style.css">
<%@include file="PageStructure/topPage.jsp" %>






<title>About Us</title>
</head>

<body>

<div id="supportMan">


<% 
if (request.getMethod().equals("GET")) {
    String email_to = "support@provisio.com";
    String email_subject = "New support ticket generated";
    
    String fname = request.getParameter("fname");
    System.out.println(fname);
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String issue = request.getParameter("issue");
    String description = request.getParameter("description");
    
    out.println("First Name: " + fname + "<br />");
    out.println("Last Name: " + lname + "<br />");
    out.println("Email: " + email + "<br />");
    out.println("<h2> Ticket </h2> <br />");
    out.println("<B>We will send an email regarding the issue listed: </B><br />");
    out.println("Issue: " + issue + "<br />");
    out.println("Description: " + description + "<br /> <br />");
    out.println("Thank you for submitting your support ticket. We will reach out to you as soon as possible!");
    
    /*
    $email_message = "Form details below: \n\n";
    
    function clean_string($string) {
        $bad = array("content-type", "bcc:", "to:", "cc:", "href");
        return str_replace($bad, "", $string);
    }*/
    
    
    /*
    $email_message .= "First Name: " . clean_string($fname) . "\n";
    $email_message .= "Last Name: " . clean_string($lname) . "\n";
    $email_message .= "Email: " . clean_string($email) . "\n";
    $email_message .= "Issue Type: " . clean_string($issue) . "\n";
    $email_message .= "Description: " . clean_string($description) . "\n";

    //email headers
    $headers = 'From: ' . $email . "\r\n" . 'Reply-To: ' . $email . "\r\n" . 'X-Mailer: PHP/' . phpversion();
    @mail($email_to, $email_subject, $email_message, $headers);*/
%>

	<!-- Thank you for submitting your support ticket. We will reach out to you as soon as possible! -->

<% 
}
%>

</div>
</body>


</html>