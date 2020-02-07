<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistrationForm.aspx.cs" Inherits="UserRegistration.UserRegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                        </tr>  
                        <tr>  
                            <td>Last Name:</td>  
                            <td>  
                                 <asp:TextBox ID="LastNameTextBox" runat="server"></asp:TextBox>
                            </td>  
                        </tr>  
                        <tr>  
                             <td>Email Address:</td>  
                            <td>  
                                 <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
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
                              
                                                       <tr>  
                            <td>Male</td>  
                            <td>
                               <asp:RadioButton ID="MaleRadioButton" runat="server" GroupName="GenderRB" />
                                </td>  
                        </tr>
                                                                                      <tr>  
                            <td>Female</td>  
                            <td>
                               <asp:RadioButton ID="FemaleRadioButton" runat="server" GroupName="GenderRB" />
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
                        </tr>  
                        <tr>  
                            <td>Select State:</td>  
                            <td>  
                                <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"> </asp:DropDownList>  
                            </td>  
                        </tr>  
                        <tr>  
                             <td>Select City:</td>  
                            <td>  
                                <asp:DropDownList ID="ddlCity" runat="server" ></asp:DropDownList>  
                            </td> 
                        </tr>  
                    </table>  
                </fieldset >  
                       <br />
                       <fieldset id="CheckBox" style="width: 50%">  
                           <legend>Choose Stream</legend>  
                           <table>
                        <tr>  
                            <td colspan="2">  
                            </td>  
                        </tr>
                              
                               <asp:CheckBoxList ID="StreamCheckBox" runat="server" ></asp:CheckBoxList>

                           </table>
                           </fieldset>
    <br />
    <br />
    <asp:Calendar ID="Calendar" runat="server" onselectionchanged="Calendar_SelectionChanged"></asp:Calendar>
    <br />
    <asp:Button ID="Button" runat="server" Text="Submit"  OnClick="Button_Click" />
                                        </fieldset >        
            </div> 

        </form>  
</body>
</html>
