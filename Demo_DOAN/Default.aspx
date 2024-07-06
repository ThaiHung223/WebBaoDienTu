<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Demo_DOAN.Default" %>

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

        .bt:disabled{
            background-color: #cccccc;
        }
    </style>
    <div class="body">
        <script src="index.js"></script>
        <div class="wp_content">
            <div class="menu_content">
                <div class="link_menu">
                    <asp:DataList ID="dl_danhmuc" runat="server" CellPadding="4" RepeatDirection="Horizontal" ItemStyle-HorizontalAlign="Center">
                        <AlternatingItemStyle BackColor="White" />
                        <ItemTemplate>
                            <div style="display: inline-block; text-align: center; padding: 10px;">
                                <asp:LinkButton CssClass="link" ID="LinkButton1" runat="server" CommandArgument='<%# Eval("MADANHMUC") %>' Text='<%# Eval("TENDANHMUC") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                            </div>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataList>
                </div>
            </div>
            <div class="content">
                <table>
                    <tr>
                        <td class="cot">
                            <asp:DataList ID="dl_baodt" runat="server" RepeatColumns="3">
                                <ItemTemplate>
                                    <div class="item_template">
                                        <asp:ImageButton ID="ImageButton1" Width="400px" runat="server" CommandArgument='<%# Eval("MABAO") %>' ImageUrl='<%# "img/" + Eval("HINHANH") %>' OnClick="ImageButton1_Click" />
                                        <br />
                                        <asp:LinkButton CssClass="tieude" ID="LinkButton2" runat="server" CommandArgument='<%# Eval("MABAO") %>' Text='<%# Eval("TIEUDE") %>' OnClick="LinkButton2_Click1"></asp:LinkButton>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
                <div class="pagination">
                    <asp:Button ID="btnPrevious" runat="server" Text="Previous" CssClass="bt" OnClick="btnPrevious_Click" />
                    <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="bt" OnClick="btnNext_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
