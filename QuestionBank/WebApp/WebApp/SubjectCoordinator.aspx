﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubjectCoordinator.aspx.cs" Inherits="WebApp.SubjectCoordinator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
.floatLeft { float: left; }
</style>
    <style type="text/css">
.floatRight { float: right; }
        .rightPanel {
            position:absolute;
            top:auto;
            right:40%;
            width:34%;
        }
        .leftPanel {
            position:absolute;
            top:auto;
            left:10px;
            width:33%;
        }

</style>

    <script type="text/javascript">
         function ColorChange(chkbox) {
             var IsChecked = chkbox.checked;
             if (IsChecked) {
                 chkbox.parentElement.parentElement.style.backgroundColor = '#228b22';
                 chkbox.parentElement.parentElement.style.color = 'white';
             } else {
                 chkbox.parentElement.parentElement.style.backgroundColor = 'white';
                 chkbox.parentElement.parentElement.style.color = 'black';
             }

         }
        
    </script>
</head>
<body style="width: 615px">
    <form id="form1" runat="server">
        <div class="leftPanel">
            <asp:Panel ID="Panel1" runat="server" CssClass="floatLeft">
                <asp:Button ID="chooseQuestionsButton" runat="server" OnClick="ChooseQuestions"  Text="Choose Questions"/>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True" />
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                        <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                        <asp:BoundField DataField="question_details" HeaderText="Question"/>
                        <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject"/>
                        <asp:Templatefield HeaderText="Select">
                            <itemtemplate>
                                <asp:Checkbox ID="cbSelect" runat="server" OnClick="javascript:ColorChange(this);">
                                </asp:Checkbox>
                            </itemtemplate>
                        </asp:Templatefield>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT [id], [question_details], [type], [marks], [subject] FROM [Questions] WHERE ([is_selected] = @is_selected)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="is_selected" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <asp:Button ID="generatePaperButton" runat="server" OnClick="GenerateQuestionPaper" Text="Generate Question Paper" />
                <br />

            </asp:Panel>
        </div>


        <div class="rightPanel">
            <asp:Panel ID="Panel2" runat="server" CssClass="floatRight">
                 <asp:Button ID="viewPaperButton" runat="server" OnClick="ViewQuestionPaper"  Text="View Final Question Paper"/>
                <br />
                <br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"  DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" ReadOnly="True" />
                        <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                        <asp:BoundField DataField="marks" HeaderText="marks" SortExpression="marks" />
                        <asp:BoundField DataField="question_details" HeaderText="Question"/>
                        <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject"/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT [id], [question_details], [type], [marks], [subject] FROM [Questions] WHERE ([is_selected] = @is_selected)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="is_selected" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" OnClick="GenerateQuestionPaper" Text="Generate Question Paper" />
           </asp:Panel>
        </div>
    </form>
</body>
</html>
