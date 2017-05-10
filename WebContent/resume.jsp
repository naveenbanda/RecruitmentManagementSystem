<%@ include file="headerAfterLogin.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Resume Upload</title>
</head>
<body>
<div id="Resume">
    <center>
        <h1>Upload Resume</h1>
        <form method="post" action="resumeMessage.jsp" enctype="multipart/form-data">
            <table border="0">
               
                <tr>
                    <td>Browse File : </td>
                    <td><input type="file" name="resume"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Save">
                    </td>
                </tr>
                
            </table>
        </form>
    </center>
   </div>
</body>
</html>