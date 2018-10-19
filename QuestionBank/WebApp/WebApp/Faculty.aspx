<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="WebApp.Faculty" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body style="height: 429px">
    <form id="form1" runat="server" >
        <div style="height: 413px">
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="View Question Paper" />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Add Question" OnClick="Button2_Click" />
            
            <br />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" style="margin-top: 0px; margin-left:585px;" Visible="false">
                Question:&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Height="50px" Width="298px" TextMode="MultiLine"></asp:TextBox>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                Type:&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" Height="23px">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Theory</asp:ListItem>
                    <asp:ListItem>MCQ</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                Marks:
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" Text="Submit" />
                
            </asp:Panel>
            <asp:Panel ID="Panel2" style="margin-right:20px; margin-top: -230px;" runat="server" Height="230px" Width="582px">
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
                <br />
                </asp:Panel>
            <br />
            <br />
            
        </div>
    </form>
    
</body>
</html>