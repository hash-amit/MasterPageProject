<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="ListOfUsers.aspx.cs" Inherits="MasterPageProject.ListOfUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<center>
    <table>
        <tr>
            <td style="display: flex; justify-content: space-between; align-items: center;">
                <div style="text-align: left; font-family: math; color: #ff0000; display: flex; justify-content: center; align-items: center; height: 24px; width:250px; border: 1px solid black;">
                    <a style="text-decoration: none; font-family: math;" href="UserRegistrationForm.aspx">Add New User</a>
                </div>
                
                <div style="text-align: center; font-family: math; color: #ff0000; display: flex; justify-content: center; align-items: center; height: 24px; width:250px; border: 1px solid black;">
                  <asp:Label ID="lbl_search_result" runat="server" Text=""></asp:Label>
                </div>

                <span style="text-align: right;">
                    <asp:TextBox ID="text_search" runat="server" Style="height: 20px;"></asp:TextBox>
                    <asp:Button ID="btn_search" runat="server" Text="Search" Style="height: 26px;" OnClick="Btn_search_Click" />
                </span>
            </td>

        </tr>

        <tr>
            <td>
                <asp:GridView ID="gv_list_of_users" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_list_of_users_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="User ID">
                            <ItemTemplate>
                                <%#Eval("UID") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <%#Eval("USER_FIRST_NAME") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <%#Eval("USER_LAST_NAME") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <%#Eval("USER_EMAIL") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <%#Eval("GENDER") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Designation">
                            <ItemTemplate>
                                <%#Eval("DESIGNATION") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Password">
                            <ItemTemplate>
                                <%#Eval("USER_PASSWORD") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="D" CommandArgument='<%#Eval("UID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="E" CommandArgument='<%#Eval("UID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1e90ff" Font-Bold="True" ForeColor="Black" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</center>
</asp:Content>
