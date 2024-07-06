<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ChiTiet.aspx.cs" Inherits="Demo_DOAN.ChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .label {
            width: 10px;
            margin-left: 0;
        }

        .body {
            position: relative;
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
        }

        .tieude, .noidung {
            margin-left: 50px;
            margin-right: 50px;
            max-width: 800px;
            width: 100%;
        }

        .demuc {
            display: flex;
            justify-content: flex-end;
            padding-right: 50px;
        }

            .demuc .date-label {
                font-size: 15px;
                color: gray;
                font-style: italic;
            }

        .noidung {
            font-family: Arial;
            font-size: 16px;
            color: #505050;
            line-height: 1.75rem;
        }

            .noidung .indent {
                padding-left: 2em;
            }
    </style>
    <div class="demuc">
        <asp:DataList ID="dl_chitiet" runat="server">
            <ItemTemplate>
                <div class="date-label">
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("NGAYSOAN", "{0:dddd, dd/MM/yyyy}") %>'></asp:Label><br />
                    <b style="font-size: 18px;">Tác Giả : </b>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("TACGIA") %>' Style="font-size: 18px; font-weight: bold"></asp:Label>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>

    <div class="body" style="width: 100%;">
        <div class="tieude" style="width: 100%;">
            <asp:DataList ID="dl_chitiet1" runat="server">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TIEUDE") %>' Style="font-size: 30px; font-weight: bold"></asp:Label>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="noidung" style="width: 100%;">
            <asp:DataList ID="dl_chitiet2" runat="server" OnItemDataBound="dl_chitiet2_ItemDataBound">
                <ItemTemplate>
                    <br />
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/img/"+Eval("HINHANH") %>' Height="100%" Width="100%" /><br />
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" CssClass="indent" Text='<%# Eval("NOIDUNG") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# "~/img/"+Eval("HINHANH2") %>' Height="100%" Width="100%" /><br />
                    <br />
                    <asp:Label ID="Label3" runat="server" CssClass="indent" Text='<%# Eval("NOIDUNG2") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Image ID="Image3" runat="server" ImageUrl='<%# "~/img/"+Eval("HINHANH3") %>' Height="100%" Width="100%" /><br />
                    <br />
                    <asp:Label ID="Label5" runat="server" CssClass="indent" Text='<%# Eval("NOIDUNG3") %>'></asp:Label>
                    <br />
                    <br />
                    <asp:Image ID="Image4" runat="server" ImageUrl='<%# "~/img/"+Eval("HINHANH4") %>' Height="100%" Width="100%" /><br />
                    <br />
                    <asp:Label ID="Label6" runat="server" CssClass="indent" Text='<%# Eval("NOIDUNG4") %>'></asp:Label>
                    <br />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>


    </div>
</asp:Content>
