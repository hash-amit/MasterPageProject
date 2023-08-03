<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="MasterPageProject.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <center>
        <table style="font-weight: bold;font-family: system-ui;">
            <tr>
                <td>Current Password: </td>
                <td><asp:TextBox ID="text_current_pass" runat="server" Width="210px" height="20px"></asp:TextBox></td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Label ID="lbl_old_pass" runat="server" Text="" Style="font-weight:normal; color:red;font-size: xx-small;"></asp:Label></asp:TextBox></td>
            </tr>

            <tr>
                <td>New Password: </td>
                <td><asp:TextBox ID="text_new_pass" runat="server" Width="210px" height="20px"></asp:TextBox></td>
            </tr>
            
            <tr>
                <td>Confirm Password: </td>
                <td><asp:TextBox ID="text_confirm_pass" runat="server" Width="210px" height="20px"></asp:TextBox></td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Label ID="lbl_new_pass" runat="server" Text="" Style="font-weight:normal; color:red;font-size: xx-small;"></asp:Label></asp:TextBox></td>
            </tr>

            <tr>
                <td></td>
                <td><asp:Label ID="lbl_msg" runat="server" Text="" Style="font-weight:normal; color:red;font-size: xx-small;"></asp:Label></asp:TextBox></td>
            </tr>

            <tr>
                <td></td>
                <td style="display: flex;justify-content: center;"><asp:Button ID="btn_change_pass" runat="server" style="background-color: dodgerblue;font-weight: bold;font-family: system-ui;padding: 5px 30px;border-radius: 5px;letter-spacing: 1px;border: none;" Text="Change Password" OnClick="btn_change_pass_Click" /></td>
            </tr>
        </table>
    </center>
</asp:Content>
