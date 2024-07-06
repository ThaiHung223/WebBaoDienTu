<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LienHe.aspx.cs" Inherits="Demo_DOAN.LienHe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .content{
            width:1000px;
            margin: 40px 40px;
            margin-left:150px;

        }

    </style>

    <div class="content">
    <h2 style="margin-left:300px;">THÔNG TIN LIÊN HỆ</h2>
    <p>Dịch vụ hỗ trợ của DTU News luôn lắng nghe và tiếp thu những ý kiến đóng góp của quý độc giả. Chỉ cần liên hệ, chúng tôi sẵn sàng hỗ trợ :</p>
    <h3>Địa điểm tòa soạn : </h3>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2855.431423551432!2d108.20749375056734!3d16.06028127260758!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219b416e135cd%3A0x401b57932be120d9!2zMjIwIFBoYW4gVGhhbmgsIFRo4bqhYyBHacOhbiwgVGhhbmggS2jDqiwgxJDDoCBO4bq1bmcgNTUwMDAwLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1713282438118!5m2!1svi!2s" width="500" height="280" 
                                style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    <h3>Đường dây nóng hỗ trợ khách hàng :</h3>
    <table>
        <tr>
            <td><img style="width:40px;" src="img/phone1.png"/></td>
            <td><b> Đường dây nóng :</b> 0949.542.183 </td>
        </tr>
    </table>
    </div>

</asp:Content>
