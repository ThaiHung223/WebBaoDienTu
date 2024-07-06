<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="Demo_DOAN.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .dangky {
            position: relative;
        }
        .dangky1 {
            position: absolute;
            background-color: rgba(0, 0, 0, 0.3);
            margin-top: -580px;
            margin-left: 450px;
            padding-top: 50px;
            padding-left: 50px;
            width: 450px;
            height: 450px;
            border-radius: 20px;
        }
        .form {
            position: absolute;
            font-size: 20px;
            width: 300px;
            height: 350px;
            margin-left: 20px;
            margin-top: -20px;
        }
        .title {
            margin-top: -10px;
            font-size: 25px;
            padding-bottom: 20px;
        }
        .button {
            margin: 20px;
        }
        .dangky-footer {
            margin-top: 20px;
        }
    </style>
    <div class="dangky">
        <img src="img/background_login.jpeg" style="width:1505px; height:700px;" />
        <div class="dangky1">
            <div class="form">
                <h2 class="title">ĐĂNG KÝ</h2>
                <table>
                    <tr>
                        <td>Tên Đăng Nhập:</td>
                        <td><asp:TextBox ID="txtUsername" runat="server" CssClass="textbox" /></td>
                    </tr>
                    <tr>
                        <td>Mật Khẩu:</td>
                        <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="textbox" /></td>
                    </tr>
                    <tr>
                        <td>Nhập Lại Mật Khẩu:</td>
                        <td><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="textbox" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnRegister" runat="server" CssClass="button" Text="ĐĂNG KÝ" OnClick="btnRegister_Click" BackColor="Crimson" ForeColor="White" Width="180px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
