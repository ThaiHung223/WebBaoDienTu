<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GioiThieu.aspx.cs" Inherits="Demo_DOAN.GioiThieu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>

        .demuc{
            background-color:#eaeaea;
            color: #7a7777;
            min-height: 30px;
        }
        .demuc #danhmuc{
            margin-left: 20px;
        }
        .demuc tr td{
            padding:5px 5px;
            text-align :center;
        }
        .new{
            position: absolute;
            margin-top: -1650px;
            margin-left: 150px;
            width: 1200px;
            font-size: 15px;
            background-color: white;
        }
    </style>
    
    <div class="demuc">
        <table id="danhmuc">
            <tr>
                <td>DTU News </td>
                <td>/Giới thiệu về tòa soạn</td>
            </tr>
        </table>
    </div>
    <div class="body">
        <div class="new">
            <h1 style="text-align:center;">GIỚI THIỆU VỀ DTU News</h1>
            <img style="width:700px; margin-left:230px;" src="img/background_gioithieu.jpg"/>
            <h2 style="padding-left:40px;">TẦM NHÌN</h2>
            <h2 style="padding-left:40px;">GIÁ TRỊ CỐT LÕI</h2>
            <img style="width:950px; margin-left:100px;" src="img/giatricotloi.jpg" />
        </div>
   </div>
</asp:Content>
