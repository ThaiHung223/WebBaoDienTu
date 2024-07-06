<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="Demo_DOAN.DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .login {
            position: relative;
            width: 100%; 
            height: 100%;
        }

        .login1 {
            position: absolute;
            background-color: white;
            padding: 20px;
            width: 450px;
            height: 350px;
            border-radius: 20px;
            color: darkcyan; 
            font-size: 30px;
            font-weight: bold;
            top: 50%; 
            left: 50%; 
            transform: translate(-50%, -50%); 
            text-align: center; 
            display: flex; 
            flex-direction: column; 
            justify-content: center;
            align-items: center;
        }
        
        .bt {
            font-size: 24px;
            width: 240px;
            height: 50px;
            background-color: #d41830;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
    <div class="login">
        <img src="img/background_login.jpeg" style="width: 1505px; height: 700px;" />
        <div class="login1">
            <asp:Label ID="Label1" runat="server" Text="ĐĂNG NHẬP VỚI TƯ CÁCH"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="bt" Text="Admin" OnClick="Button1_Click"/>
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="bt" Text="Tác Giả" OnClick="Button2_Click"/>
            <br />
            <a style="font-size:18px" href="">Chưa có tài khoản? đăng ký ngay</a>
        </div>
    </div>
</asp:Content>
