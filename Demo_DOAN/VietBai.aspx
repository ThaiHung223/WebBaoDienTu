<%@ Page Title="" Language="C#" MasterPageFile="~/TacGia.Master" AutoEventWireup="true" CodeBehind="VietBai.aspx.cs" Inherits="Demo_DOAN.VietBai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .custom-textbox, .custom-label {
            font-family: Arial;
            font-size: 18px;
        }

        .large-textbox {
            font-family: Arial;
            font-size: 18px;
            width: 100%;
            height: auto;
        }

        .noidung {
            margin-left: 100px;
            margin-right: 100px;
        }

            .noidung b {
                display: block;
                text-align: center;
                margin-bottom: 20px;
            }

        .bt {
            font-size: 24px;
            width: 240px;
            height: 35px;
            margin-right: 5px;
            background-color: #d41830;
            color: white;
            border: none;
            cursor: pointer;
            text-align: center;
        }

        .bt-container {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="noidung">
        <b style="font-family: Arial; font-size: 30px">SOẠN BÀI :</b><br />

        <asp:Label ID="Label3" runat="server" Text="Tác giả" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txttacgia" runat="server" CssClass="custom-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Tiêu đề" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txttieude" runat="server" TextMode="MultiLine" Columns="80" Rows="10" CssClass="large-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Nội dung" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtnd1" runat="server" TextMode="MultiLine" Columns="80" Rows="10" CssClass="large-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Ảnh" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtanh1" runat="server" CssClass="custom-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Nội dung" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtnd2" runat="server" TextMode="MultiLine" Columns="80" Rows="10" CssClass="large-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="Ảnh" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtanh2" runat="server" CssClass="custom-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label9" runat="server" Text="Nội dung" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtnd3" runat="server" TextMode="MultiLine" Columns="80" Rows="10" CssClass="large-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label10" runat="server" Text="Ảnh" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtanh3" runat="server" CssClass="custom-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label11" runat="server" Text="Nội dung" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtnd4" runat="server" TextMode="MultiLine" Columns="80" Rows="10" CssClass="large-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label12" runat="server" Text="Ảnh" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtanh4" runat="server" CssClass="custom-textbox"></asp:TextBox><br />
        <br />
        <asp:Label ID="Label13" runat="server" Text="Mã danh mục" CssClass="custom-label"></asp:Label><br />
        <asp:TextBox ID="txtmadm" runat="server" CssClass="custom-textbox"></asp:TextBox><br />
        <br />
        <div class="bt-container">
            <asp:Button ID="btndang" runat="server" CssClass="bt" Text="Đăng Bài" OnClick="btndang_Click" />
        </div>
        <br />
        <br />
    </div>
</asp:Content>
