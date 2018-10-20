<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="WebApp.Faculty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body style="height: 429px">
    <form id="form1" runat="server" >
        <div style="height: 506px">
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Add Question" OnClick="Button2_Click" />
            
            <br />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" style="margin-top: -5px; margin-left:595px;" Visible="false" >
                Question:&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="50px" Width="298px" TextMode="MultiLine" EnableViewState="false"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                Type:&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" Height="23px" EnableViewState="false">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Theory</asp:ListItem>
                    <asp:ListItem>MCQ</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Marks:
                <asp:TextBox ID="TextBox2" runat="server" EnableViewState="false"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Submit" OnClick="Button3_Click" />
                
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server"></asp:Label>
                
            </asp:Panel>
            <asp:Panel ID="Panel2" style="margin-right:20px; margin-top: -235px;" runat="server" Height="235px" Width="541px" >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" >
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="question_details" HeaderText="question_details" SortExpression="question_details" />
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                        <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT DISTINCT [id], [question_details], [type], [marks] FROM [Questions] WHERE ([subject] = @subject)">
                    <SelectParameters>
                        <asp:SessionParameter Name="subject" SessionField="Sub" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                </asp:Panel>
            <br />
            <br />
            
        </div>
    </form>
    
</body>
</html>