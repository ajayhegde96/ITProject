<%@ Page Title="" Language="C#" MasterPageFile="~/Logout.Master" AutoEventWireup="true" CodeBehind="FacultyCoordinator.aspx.cs" Inherits="WebApp.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style type="text/css">
.floatLeft { float: left; }
</style>
    <style type="text/css">
.floatRight { float: right; }
        .rightPanel {
            position:absolute;
            top:auto;
            right:5%;
            width:45%;
        }
        .leftPanel {
            position:absolute;
            top:auto;
            left:2%;
            width:45%;
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
        <div class="leftPanel">
            <asp:Panel ID="Panel1" runat="server" CssClass="floatLeft">
                <asp:Button ID="chooseQuestionsButton" runat="server" OnClick="ChooseQuestions"  Text="Choose Questions"/>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="10" DataSourceID="SqlDataSource1" DataKeyNames="id">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="question_details" HeaderText="Question"  />
                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                        <asp:BoundField DataField="marks" HeaderText="Marks" SortExpression="marks"/>
                        <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                        <asp:BoundField DataField="faculty" HeaderText="Faculty" SortExpression="Faculty" />
                         <asp:Templatefield HeaderText="Select">
                            <itemtemplate>
                                <asp:Checkbox ID="cbSelect" runat="server" OnClick="javascript:ColorChange(this);">
                                </asp:Checkbox>
                            </itemtemplate>
                        </asp:Templatefield>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT [question_details], [type], [marks], [subject],[Faculty] FROM [Questions] WHERE (([is_selected] = @is_selected) AND ([subject] = @subject))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="is_selected" Type="Int32" />
                        <asp:SessionParameter Name="subject" SessionField="Sub" Type="String" />
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
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True"  OnPageIndexChanging="GridView2_PageIndexChanging" AutoGenerateColumns="False"  DataKeyNames="id" CellPadding="4" ForeColor="#333333" GridLines="None"  DataSourceID="SqlDataSource2">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="question_details" HeaderText="Question"  />
                        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
                        <asp:BoundField DataField="marks" HeaderText="Marks" SortExpression="marks"/>
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QuestionBankConnectionString %>" SelectCommand="SELECT  [question_details], [type], [marks] FROM [Questions] WHERE (([subject] = @subject) AND ([is_selected] = @is_selected))">
                    <SelectParameters>
                        <asp:SessionParameter Name="subject" SessionField="Sub" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="is_selected" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <br />
           </asp:Panel>
        </div>
</asp:Content>