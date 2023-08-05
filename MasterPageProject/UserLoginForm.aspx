<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="UserLoginForm.aspx.cs" Inherits="MasterPageProject.UserLoginForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <table style="font-weight: bold;font-family: system-ui;">
            <tr>
                <td>Email: </td>
                <td><asp:TextBox ID="text_email" runat="server" Width="210px" height="20px"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Password: </td>
                <td><asp:TextBox ID="text_pswd" runat="server" Width="210px" height="20px"></asp:TextBox></td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Label ID="lbl_invalid_msg" runat="server" Text="" Style="font-weight:normal; color:red;font-size: xx-small;"></asp:Label></td>
            </tr>

            <tr>
                <td></td>
                <td style="display: flex;justify-content: center;"><asp:Button ID="btn_Login" runat="server" style="background-color: dodgerblue;font-weight: bold;font-family: system-ui;padding: 5px 30px;border-radius: 5px;letter-spacing: 1px;border: none;" Text="Login" OnClick="btn_Login_Click" /></td>
            </tr>

            <tr>
                <td></td>
                <td style="display: flex;justify-content: center;"><a href="UserRegistrationForm.aspx" style="font-weight: normal;text-decoration: none;">I don't have an account</a></td>
            </tr>
        </table>
    </center>
</asp:Content>
