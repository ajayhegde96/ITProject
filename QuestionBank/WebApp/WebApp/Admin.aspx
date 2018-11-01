<%@ Page Title="" Language="C#" MasterPageFile="~/Logout.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApp.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     &nbsp;&nbsp;&nbsp;
    <br />
    <br />
    &nbsp;&nbsp;&nbsp;       <asp:Button ID="Button1" runat="server" Text="Create New Login" OnClick="Button1_Click"  CausesValidation="false"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Delete User"  CausesValidation="false" />
                <br />
                <br />
                &nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="View Ques Paper" OnClick="Button2_Click"  CausesValidation="false"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Assign Sub Coord" OnClick="Button3_Click"  CausesValidation="false"/>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="username" runat="server" Text="UserName"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Valid data"></asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Label ID="password" runat="server" Text="Password"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="req2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter Valid data"></asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="rpassword" runat="server" Text="Re-enter Password"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;&nbsp;
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match!" ControlToValidate="TextBox2" ControlToCompare="TextBox3"></asp:CompareValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="req3" runat="server" ErrorMessage="Enter Valid Data" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Label ID="subject" runat="server" Text="Subject"></asp:Label>
        &nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server"  DataSourceID="SqlDataSource1" DataTextField="Subject" DataValueField="Subject" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT DISTINCT [Subject] FROM [Subjects]"></asp:SqlDataSource>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="role" runat="server" Text="Role"></asp:Label>
        &nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
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
        <br />
        &nbsp;<asp:Label ID="Label4" runat="server" Text="Subject"></asp:Label>
        &nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="Subject" DataValueField="Subject" OnSelectedIndexChanged="DropDownList6_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT [Subject] FROM [Subjects]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"  Visible="False" DataSourceID="SqlDataSource3" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="marks" HeaderText="Marks" SortExpression="marks" />
            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
            <asp:BoundField DataField="question_details" HeaderText="Question" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT [marks], [type], [question_details] FROM [Questions] WHERE (([is_selected] = @is_selected) AND ([subject] = @subject))">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="is_selected" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList6" Name="subject" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br/>
    <br />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Visible="false">
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="ssubject" runat="server" Text="Select Subject"></asp:Label>
        &nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList4" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" EnableViewState="true" AutoPostBack="true">
            </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="suser" runat="server" Text="Select User"></asp:Label>
        &nbsp;
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
         &nbsp;
         <asp:Label ID="sdelete" runat="server" Text="Select User To Delete"></asp:Label>
         &nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList3" runat="server"  EnableViewState="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button7" runat="server" Text="Submit" OnClick="Button7_Click" OnClientClick="javascript:return(window.confirm('User Deleted'))"/>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
    </asp:Panel>
</asp:Content>
