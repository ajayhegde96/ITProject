<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="True" CodeBehind="Subcoord.aspx.cs" Inherits="WebApp.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="height: 300px">
        <br />
        <br />
        &nbsp;&nbsp;&nbsp; Select Subject&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true">
            </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp; Select User&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server"  EnableViewState="true" AutoPostBack="true"/>
        <br />
        <br />
        
        <br />
        <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" />
        </p>
</asp:Content>
