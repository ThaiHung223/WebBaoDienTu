<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DangNhapAd.aspx.cs" Inherits="Demo_DOAN.DangNhapAd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .login{
            position:relative;
        }
        .login1{
            position:absolute;
            background-color: rgba(0,0,0,0.3);
            margin-top: -580px;
            margin-left: 450px;
            padding-top: 100px;
            padding-left:120px;
            width:450px;
            height:350px;
            border-radius:20px;
        }
        .form{
            position:absolute;
            font-size:20px;
            width:300px;
            height:300px;
            margin-left:20px;
            margin-top:-20px;
        }
        .title{
            margin-top:-10px;
            font-size:25px;
            padding-bottom:20px;
        }
        .button{
            margin:20px;
        }
    </style>
    <div class="login">
        <img src="img/background_login.jpeg" style="width:1505px; height:700px;"  />
        <div class="login1">
            <asp:Login ID="Login1" runat="server" CssClass="form" ForeColor="#666666" LoginButtonText="ĐĂNG NHẬP" PasswordLabelText="Mật Khẩu:" RememberMeText="Lưu thông tin tài khoản" TitleText="ĐĂNG NHẬP VỚI TƯ CÁCH ADMIN" UserNameLabelText="Tên Đăng Nhập:" BackColor="#E3EAEB" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" TextLayout="TextOnTop" OnAuthenticate="Login1_Authenticate">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <LoginButtonStyle CssClass="button" BackColor="Crimson" ForeColor="White" Height="30px" Width="180px" />
                <TextBoxStyle BorderColor="Aquamarine" Font-Size="20px" />
                <TitleTextStyle CssClass="title" Font-Bold="True" ForeColor="#006666"  />
            </asp:Login>
        </div>
    </div>
</asp:Content>
