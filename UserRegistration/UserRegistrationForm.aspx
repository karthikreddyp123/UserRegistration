<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistrationForm.aspx.cs" Inherits="UserRegistration.UserRegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.4.1.js"></script>
    <script src="jquery.validate.min.js"></script>
        <script type = "text/javascript">
        function ValidateCheckBox(sender, args) {
            var chkListModules = document.getElementById('<%= StreamCheckBox.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }
            args.IsValid = false;
            }
            function ValidateFirstName(sender, args) {
                var Fname = document.getElementById('FirstNameTextBox').value;
                if (Fname.length==0) {
                    args.IsValid = false;
                    return;
                }
                args.IsValid = true;
            }
            function ValidateLastName(sender, args) {
                var Fname = document.getElementById('LastNameTextBox').value;
                if (Fname.length == 0) {
                    args.IsValid = false;
                    return;
                }
                args.IsValid = true;
            }
            function ValidateEmail(sender, args) {
                var Fname = document.getElementById('EmailTextBox').value;
                if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(Fname))) {
                    args.IsValid = false;
                    return;
                }
                args.IsValid = true;
            }
            </script>
    <script>
        jQuery.noConflict();
        jQuery(document).ready(function () {
            jQuery("#form1").validate({
                    rules: {
                    //This section we need to place our custom rule
//for the control.  
                    <%=FirstNameTextBox.UniqueID %>:{
                required: true
            },   
                },
                 messages: {
                    //This section we need to place our custom
//validation message for each control.  
                      <%=FirstNameTextBox.UniqueID %>:{
                 required: "Name is required."
             },  
                },
            });
        });
    </script>
        <script>
            <style type="text/css" >
                label.error {
                    color : red;
            display:inline-flex ;
        }
</style>
    </script>
</head>
<body>
<form id="form1" runat="server">  
            <div  >  
                   <fieldset id="User Form" style="width: 60%">  
                    <legend>User Registration Form</legend>  
                    <table>  
                        <tr>  
                            <td colspan="2">  
                                <br /> </td>  
                        </tr>  
                        <tr>  
                            <td>First Name:</td>  
                            <td>
                                <asp:TextBox ID="FirstNameTextBox" runat="server"></asp:TextBox>  
                                </td> 
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ErrorMessage="*" ControlToValidate="FirstNameTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter only Characters" ControlToValidate="FirstNameTextBox" ForeColor="Red" ValidationExpression="[A-Za-z]*"></asp:RegularExpressionValidator>
                               <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Choose a Valid First Name" ClientValidationFunction = "ValidateFirstName" ForeColor="Red"></asp:CustomValidator><br /> 
                                <asp:Label ID="LabelTextBox" runat="server" ForeColor="Red"  ></asp:Label>
                            </td>

                        </tr>  
                        <tr>  
                            <td>Last Name:</td>  
                            <td>  
                                 <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                            </td>  
                             <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="*" ControlToValidate="LastNameTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter only Characters" ControlToValidate="LastNameTextBox" ForeColor="Red" ValidationExpression="[A-Za-z]*"></asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="Choose a Valid Last Name" ClientValidationFunction = "ValidateLastName" ForeColor="Red"></asp:CustomValidator><br />
                                  
                                 <asp:Label ID="LabelLastName" runat="server" Text="" ForeColor="Red"></asp:Label>
                             </td>
                        </tr>  
                        <tr>  
                             <td>Email Address:</td>  
                            <td>  
                                 <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                            </td> 
                             <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="*" ControlToValidate="EmailTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter valid Email Address" ControlToValidate="EmailTextBox" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="Choose a Valid Email Address." ClientValidationFunction = "ValidateEmail" ForeColor="Red"></asp:CustomValidator><br />
                                 
                                 <asp:Label ID="LabelEmail" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>  
                    </table> 
                       <br />
                       <fieldset id="Gender" style="width: 234px">  
                           <legend>Choose Gender</legend>  
                           <table>
                        <tr>  
                            <td colspan="2">  
                            </td>  
                        </tr>
                         <asp:RadioButtonList ID="GenderRB" runat="server">
                             <asp:ListItem Text="Male" Value="1" />
                             <asp:ListItem Text="Female" Value="2" />
                         </asp:RadioButtonList>
                               <tr>
                                   <td>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Please select Gender.<br />"
                                             ControlToValidate="GenderRB" runat="server" ForeColor="Red" Display="Dynamic" />
                                   </td>
                               </tr>

                           </table>
                           </fieldset>
                 <br />
                <fieldset id="Drop Down" style="width: 50%">  
                    <legend>Choose Location</legend>  
                    <table>  
                        <tr>  
                            <td colspan="2">  
                                <br /> </td>  
                        </tr>  
                        <tr>  
                            <td>Select Country:</td>  
                            <td>  
                                <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"> </asp:DropDownList>  
                            </td>  
                             <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ErrorMessage="Choose Country" ControlToValidate="ddlCountry" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>  
                        <tr>  
                            <td>Select State:</td>  
                            <td>  
                                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"> </asp:DropDownList>  
                            </td>  
                             <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="0" ErrorMessage="Choose State" ControlToValidate="ddlState" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>  
                        <tr>  
                             <td>Select City:</td>  
                            <td>  
                                <asp:DropDownList ID="ddlCity" runat="server" ></asp:DropDownList>  
                            </td> 
                             <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="0" ErrorMessage="Choose City" ControlToValidate="ddlCity" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>  
                    </table>  
                </fieldset >  
                       <br />
                       <fieldset id="CheckBox" style="width: 50%">  
                       Choose Stream  
                           <table>
                        <tr>  
                            <td>  
                            </td>  
                        </tr>
                              
                               <asp:CheckBoxList ID="StreamCheckBox" runat="server" ></asp:CheckBoxList>
                                <tr>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Choose a Stream" ClientValidationFunction = "ValidateCheckBox" ForeColor="Red"></asp:CustomValidator><br />
                               </tr>

                           </table>
                           </fieldset>
    <br />
    <br />
                       
    <asp:Label runat="server" Text="Select your DOB"></asp:Label>
                       <br />
    <asp:Calendar ID="Calendar" runat="server" onselectionchanged="Calendar_SelectionChanged"></asp:Calendar>
    <br />
    <asp:Button ID="Button" runat="server" Text="Submit"  OnClick="Button_Click" />
                                        </fieldset >        
            </div> 

        </form>  
</body>
</html>
