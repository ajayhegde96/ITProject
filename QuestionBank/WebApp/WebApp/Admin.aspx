<%@ Page Title="" Language="C#" MasterPageFile="~/Logout.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApp.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     &nbsp;&nbsp;&nbsp;
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;       <asp:Button ID="Button1" runat="server" Text="Create New Login" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Delete User" />
                <br />
                <br />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="View Ques Paper" OnClick="Button2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Assign Sub Coord" OnClick="Button3_Click" />
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <br />
        &nbsp;&nbsp;&nbsp; Username&nbsp;
        
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Valid data"></asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp; Password&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Valid data"></asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp; Subject&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Subject" DataValueField="Subject" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT DISTINCT [Subject] FROM [Subjects]"></asp:SqlDataSource>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp; Role&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem>Admin</asp:ListItem>
            <asp:ListItem>Faculty</asp:ListItem>
            <asp:ListItem>FacultyCoordinator</asp:ListItem>
        </asp:DropDownList>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
         &nbsp;&nbsp;&nbsp;<asp:Button ID="Button5" runat="server" Text="Submit" OnClick="Button5_Click" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button6" runat="server" Text="Reset" OnClick="Button6_Click" />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="false">
       
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Visible="false">
        <br />
        &nbsp;&nbsp;&nbsp; Select Subject&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList4" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true">
            </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp; Select User&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList5" runat="server"  EnableViewState="true" AutoPostBack="true"/>
        <br />
        <br />
        
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button8" runat="server" Text="Submit" OnClick="Button8_Click" />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" />
    </asp:Panel>
    <asp:Panel ID="Panel4" runat="server" Visible="false">
         Select User To Delete&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server"  EnableViewState="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="true">
        </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button7" runat="server" Text="Submit" OnClick="Button7_Click" /><%--OnClientClick="javascript:return(window.confirm('User Deleted'))"/>--%>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
    </asp:Panel>
</asp:Content>
