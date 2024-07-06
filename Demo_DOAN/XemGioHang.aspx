<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="XemGioHang.aspx.cs" Inherits="Demo_DOAN.XemGioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .body .quangcao {
            padding: 20px 0px;
        }

            .body .quangcao .noidungqc {
                margin: 25px 5px;
            }

        .quantity-input {
            display: flex;
            align-items: center;
        }

            .quantity-input input {
                margin: 0 5px;
            }

            .quantity-input button {
                padding: 2px 8px;
                font-size: 14px;
            }

        .container {
            display: flex;
        }

        .quangcao {
            width: 180px;
        }

        .form1 {
            flex-grow: 1; /* Để form1 chiếm phần còn lại của không gian */
            margin-left: 50px;
        }

        .gridview-inline {
            align-items: center;
            justify-content: center;
        }

        .bt-thanhtoan {
            font-size: 20px;
            width: 240px;
            height: 35px;
            background-color: black;
            color: white;
            border: none;
            margin-left: auto;
            font-weight: bold;
        }

        .red-text {
            color: red;
            margin-left: 10px;
            font-weight: bold;
            font-size: 20px;
        }

        .btnMinus {
            width: 25px;
            height: 25px;
            margin-left: 5px;
            background-color: black;
            color: white;
            border: none;
            font-weight: bold;
        }

        .btnPlus {
            width: 25px;
            height: 25px;
            margin-right: 5px;
            background-color: black;
            color: white;
            border: none;
            font-weight: bold;
        }

        .soluong {
            width: 50px;
            height: 21px;
            text-align: center;
        }

        .pro-discount {
            position: relative;
            background: #fff;
            border-radius: 5px;
            margin-bottom: 20px;
            margin-top: 65px;
            padding: 12px;
            border: 1px dashed #040303;
            background: rgba(1, 86, 127, 0.02);
        }

            .pro-discount .item_discount:last-child {
                margin-bottom: 0px;
            }

            .pro-discount .item_discount {
                position: relative;
                background: #fff;
                filter: drop-shadow(0px 0px 3px rgba(0, 0, 0, 0.15));
                padding: 5px;
            }

                .pro-discount .item_discount .top_discount {
                    position: relative;
                    display: flex;
                    justify-content: space-between;
                }

                    .pro-discount .item_discount .top_discount img {
                        width: 36px;
                        height: 20px;
                        position: relative;
                        display: inline-block;
                    }

                    .pro-discount .item_discount .top_discount .code_dis {
                        margin-bottom: 0px;
                        font-weight: 700;
                        font-size: 16px;
                        line-height: 18px;
                        position: relative;
                        color: #040303;
                    }

                .pro-discount .item_discount .coupon_desc {
                    border-bottom: dotted 1px #f5f5f5;
                }

                .pro-discount .item_discount .copy_discount .code_zip {
                    margin-bottom: 0px;
                    display: inline-block;
                    font-size: 16px;
                    text-transform: uppercase;
                    font-weight: 600;
                    line-height: 24px;
                }

                .pro-discount .item_discount .copy_discount .dis_copy {
                    background: #040303;
                    color: #fff;
                    border: none;
                    padding: 0px 15px;
                    margin: 1px 0px;
                    cursor: pointer;
                    outline: none !important;
                    box-shadow: none;
                    border-radius: 5px;
                    line-height: 24px;
                    height: 24px;
                    font-size: 12px;
                    float: right;
                    display: inherit;
                }

        span.freeship-banner {
            background-color: forestgreen;
            color: white;
            padding: 5px 15px;
            border-radius: 20px;
            width: 100%;
            display: inline-block;
            font-family: sans-serif;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title></title>
    </head>
    <body>
        <div class="container">
            <div class="quangcao" style="width: 180px">
                <div class="noidungqc">
                    <img src="img/thongtin3.jpg" style="width: 100%;" />
                </div>
                <div class="noidungqc">
                    <video style="width: 100%" controls autoplay loop muted>
                        <source src="img/thongtin1.mp4">
                    </video>
                </div>
            </div>
            <div id="form1" style="margin-left: 200px;">
                <div>
                    <h3>Giỏ hàng của bạn</h3>
                    <div>
                        <span class="freeship-banner">Freeship cho đơn hàng từ 999.000vnđ</span>
                    </div>
                    <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" OnRowCommand="gvGioHang_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Thông tin sản phẩm" ItemStyle-Width="400px">
                                <ItemTemplate>
                                    <div style="display: flex; align-items: center;">
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "/img/" + Eval("HinhAnh") %>' Height="20%" Width="20%" />
                                        <asp:Label ID="lblTenHang" runat="server" Text='<%# Eval("TenHang") %>' Style="margin-left: 30px;"></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Đơn Giá" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="lblDonGia" runat="server"
                                        Text='<%# Bind("DonGia", "{0:N0}đ") %>'
                                        ForeColor="Red" Font-Bold="true"
                                        Style="display: block; text-align: center;"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Số Lượng">
                                <ItemTemplate>
                                    <div class="quantity-input">
                                        <asp:Button ID="btnDecrease" runat="server" Text="-" CssClass="btnMinus" OnClick="btnDecrease_Click" AutoPostBack="true" />
                                        <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Bind("SoLuong") %>' class="soluong"></asp:TextBox>
                                        <asp:Button ID="btnIncrease" runat="server" Text="+" CssClass="btnPlus" OnClick="btnIncrease_Click" AutoPostBack="true" />
                                        <script>
                                            function decreaseQuantity(rowId) {
                                                var quantityInput = document.getElementById('<%= gvGioHang.ClientID %>_txtSoLuong_' + rowId);
                                                var currentQuantity = parseInt(quantityInput.value);
                                                if (currentQuantity > 0) {
                                                    quantityInput.value = currentQuantity - 1;
                                                }
                                            }

                                            function increaseQuantity(rowId) {
                                                var quantityInput = document.getElementById('<%= gvGioHang.ClientID %>_txtSoLuong_' + rowId);
                                                var currentQuantity = parseInt(quantityInput.value);
                                                quantityInput.value = currentQuantity + 1;
                                            }
                                        </script>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tổng Tiền" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <asp:Label ID="lblTongTien" runat="server" Text='<%# Bind("TongTien", "{0:N0}đ") %>'
                                        ForeColor="Red" Font-Bold="true"
                                        Style="display: block; text-align: center;"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField Text="Xóa" CommandName="XoaSanPham" ButtonType="Button" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <p>Bạn có quan tâm thêm sản phẩm nào khác xin vui lòng xem thêm <a href="Default.aspx" style="color: orange;">tại đây</a></p>
                    <div style="display: flex; justify-content: flex-end;">
                        <asp:Label ID="lblTongDonHang" runat="server" Text="" CssClass="red-text"></asp:Label>
                    </div>
                    <br />
                    <div style="display: flex; justify-content: flex-end;">
                        <asp:Button ID="btnThanhToan" runat="server" Text="Thanh Toán Ngay" CssClass="bt-thanhtoan" OnClick="btnThanhToan_Click" />
                    </div>
                </div>
            </div>
            <div id="khuyenmai" style="margin-left: 40px;">
                <fieldset class="pro-discount">
                    <legend>
                        <img alt="MÃ GIẢM GIÁ" src="//bizweb.dktcdn.net/100/462/587/themes/880841/assets/code_dis.gif?1713177410075">
                        <b>MÃ GIẢM GIÁ</b>
                    </legend>
                    <div class="item_discount">
                        <div class="top_discount">
                            <div class="item-name">
                                <p style="margin: 0 0 15px 0;" class="code_dis">
                                    FREESHIP
                                </p>
                            </div>
                            <img width="36" height="20" src="//bizweb.dktcdn.net/100/462/587/themes/880841/assets/coupon3_value_img.png?1713177410075" alt="FREESHIP" />
                        </div>
                        <div class="coupon_desc">
                            <b>Freeship</b> cho đơn hàng <b>từ 999k</b>
                        </div>
                        <div class="copy_discount">
                            <p style="margin: 0 0 15px 0; background-color: grey;" class="code_zip">
                                POLOFREESHIP
                            </p>
                            <button class="btn dis_copy" data-copy="POLOFREESHIP">
                                <span>Copy</span>
                            </button>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </body>
    </html>
</asp:Content>
