<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="UserRegistrationForm.aspx.cs" Inherits="MasterPageProject.UserRegistrationForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="font-weight: bold; font-family: system-ui;">
            <tr> 
                <td>First Name: </td>
                <td>
                    <asp:TextBox ID="text_firstname" runat="server" Width="210px" Height="20px"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Last Name: </td>
                <td>
                    <asp:TextBox ID="text_lastname" runat="server" Width="210px" Height="20px"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Email: </td>
                <td>
                    <asp:TextBox ID="text_email" runat="server" Width="210px" Height="20px"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Gender: </td>
                <td>
                    <asp:RadioButtonList ID="rbl_gender" runat="server" RepeatColumns="3" Width="218px" Height="20px"></asp:RadioButtonList></td>
            </tr>

            <tr>
                <td>Designation: </td>
                <td>
                    <asp:DropDownList ID="ddl_designation" runat="server" Width="217px" Height="27px"></asp:DropDownList></td>
            </tr>

            <tr>
                <td>Password: </td>
                <td>
                    <asp:TextBox ID="text_pswd" runat="server" Width="210px" Height="20px"></asp:TextBox></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Label ID="show_error_msg" runat="server" Text="" Style="font-weight: lighter; font-size: 14px; color: red; display: flex; justify-content: center;"></asp:Label></td>
            </tr>

            <tr>
                <td></td>
                <td style="display: flex; justify-content: center;">
                    <asp:Button ID="btn_register" runat="server" Style="background-color: dodgerblue; font-weight: bold; font-family: system-ui; padding: 5px 30px; border-radius: 5px; letter-spacing: 1px; border: none;" Text="Register" OnClick="btn_register_Click" /></td>
            </tr>

            <tr>
                <td></td>
                <td style="display: flex; justify-content: center;"><a href="UserLoginForm.aspx" style="font-weight: normal; text-decoration: none; padding-right: 5px;">Already have an account</a></td>
            </tr>
        </table>
    </center>
</asp:Content>
