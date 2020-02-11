<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UserRegistration.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.4.1.js"></script>
    <script src="jquery.validate.min.js"></script>
<script ="text/javascript"></script>  
</head>
<body>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    //This section we need to place our custom rule
//for the control.  
                    <%=TextBoxUserName.UniqueID %>:{
                required: true
            },   
                <%=TextBoxPassword.UniqueID %>: {
                    required: true
                },  
                },
            messages: {
                    //This section we need to place our custom
//validation message for each control.  
                      <%=TextBoxUserName.UniqueID %>:{
            required: "Name is required."
        },  
            <%=TextBoxPassword.UniqueID %>: {
                required: "Password is required."
            },
                },
            });
        });
    </script>
    <script type ="text/javascript" >                
        $(document).ready(function () {
            //custom rule to check regular expression   
            $.validator.addMethod("match", function (value, element) {
                return this.optional(element) || /^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\.[a-zA-Z.]{2,5}$/i.test(value);
            }, "Please enter a valid email address.");
            $("#form1").validate({
                rules: {

                     <%=EmailTextBox.UniqueID %>: {
                match: true
            },  
                },
            messages: {
            //This section we need to place our custom validation message for each control.  

        },  
                 
            });  
        });
    </script>  
    <script>
        <style type="text/css" >
            label.error {
                color: red;
            display:inline-flex ;
        }
</style>
    </script>
    <form id="form1" runat="server">
        <asp:Label ID="Label2" runat="server" Text="UserName"></asp:Label>
        <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox>
        <br />
         <asp:Label ID="Label3" runat="server" Text="Email:" CausesValidation="True"></asp:Label>
        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Password"></asp:Label>
        
    <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </form>
</body>
</html>
