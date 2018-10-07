<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubjectCoordinator.aspx.cs" Inherits="WebApp.SubjectCoordinator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True" />
                <asp:BoundField DataField="question_details" HeaderText="question_details" SortExpression="question_details" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                 <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT [id], [question_details], [type], [marks], [subject] FROM [question_bank] WHERE ([is_selected] &lt;&gt; @is_selected)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="is_selected" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <p>
            <asp:Button ID="generatePaperButton" runat="server" OnClick="GenerateQuestionPaper" Text="Generate Question Paper" />
        </p>
    </form>
</body>
</html>
