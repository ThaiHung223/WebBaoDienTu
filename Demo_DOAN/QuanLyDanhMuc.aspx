<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QuanLyDanhMuc.aspx.cs" Inherits="Demo_DOAN.QuanLyDanhMuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        .wp_content {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .menu_content {
            background-color: white;
            color: #717171;
            height: 100px;
            display: flex;
            flex-wrap: wrap;
            width: 100%;
        }

        .link_menu {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            width: 100%;
            white-space: nowrap;
            overflow-x: auto;
        }

            .link_menu .link {
                text-decoration: none;
                list-style: none;
                color: black;
                font-size: 18px;
                margin: 0 10px;
            }

                .link_menu .link:hover {
                    background: #f4a815;
                    font-size: 130%;
                    border-radius: 5px;
                    color: white;
                }

        .tieude {
            font-family: 'Noto Sans', sans-serif;
            font-weight: bold;
            font-size: 20px;
            text-decoration: none;
            color: #2a2a2a;
            cursor: pointer;
        }

            .tieude:hover {
                color: #f4a815;
            }

        .link {
            font-family: 'Noto Sans', sans-serif;
            font-weight: bold;
            font-size: 14px;
            text-decoration: none;
            color: #2a2a2a;
            cursor: pointer;
        }

        .content {
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
        }

            .content table {
                width: 100%;
                table-layout: fixed;
                border-collapse: separate;
                border-spacing: 10px;
            }

            .content td {
                padding: 10px;
                box-sizing: border-box;
            }

                .content td:not(.cot) {
                    border: 1px solid #cccccc;
                }


            .content .cot {
                width: 30%;
                text-align: left;
            }

            .content .tieude {
                display: block;
                max-width: 400px;
                word-wrap: break-word;
            }

        .item_template {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

            .item_template img {
                width: 100%;
                height: auto;
                margin-bottom: 10px;
            }

        .tieude {
            font-family: 'Noto Sans', sans-serif;
            font-weight: bold;
            font-size: 20px;
            text-decoration: none;
            color: #2a2a2a;
            cursor: pointer;
            display: block;
            max-width: 400px;
            word-wrap: break-word;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .bt {
            font-size: 18px;
            width: 80px;
            height: 35px;
            margin-right: 5px;
            background-color: #d41830;
            color: white;
            border: none;
            cursor: pointer;
        }

            .bt:disabled {
                background-color: #cccccc;
            }

        .bt2 {
            font-size: 12px;
            width: 60px;
            height: 25px;
            margin-right: 5px;
            background-color: #d41830;
            color: white;
            border: none;
            cursor: pointer;
        }

        .button-container {
            display: inline-block;
            text-align: center;
            margin-top: 5px;
        }
    </style>
    <div class="body">
        <script src="index.js"></script>
        <div class="wp_content">
            <div class="content">
                <table>
                    <tr>
                        <td class="cot">
                            <b style="font-size: 20px; font-family: Arial;">DANH MỤC :</b>
                            <asp:DataList ID="dl_danhmuc" runat="server" RepeatColumns="3" OnItemCommand="dl_danhmuc_ItemCommand">
                                <ItemTemplate>
                                    <div class="item_template">
                                        <asp:LinkButton CssClass="tieude" ID="LinkButton2" runat="server" CommandArgument='<%# Eval("MADANHMUC") %>' Text='<%# Eval("TENDANHMUC") %>' ></asp:LinkButton>
                                        <br />
                                        <br />
                                        <asp:Button ID="btnxoa" runat="server" Text="Xóa" CssClass="bt2" CommandName="Delete" CommandArgument='<%# Eval("MADANHMUC") %>' />
                                    </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
