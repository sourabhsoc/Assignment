<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemberHome.aspx.cs" Inherits="FoodDeliveryApp.MemberHome" %>

<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent" Runat="Server">
 <div class="jumbotron">
        <h1 id="userName" runat="server">Welcome Member!! </h1>
 
         <label> Add New Product:</label>
    <table border="1" style="margin: 2px">
        <tr>
            <td style="width: 150px;"><b>Product Name</b><br />
                <asp:TextBox ID="txtName" runat="server" Width="140" />
            </td>
            <td style="width: 150px;"><b>Product Detail</b><br />
                <asp:TextBox ID="txtDetail" runat="server" Width="140" />
            </td>
            <td style="width: 150px;"><b>Product Price</b><br />
                <asp:TextBox ID="txtPrice" runat="server" Width="140" />
            </td>
            <td style="width: 150px;"><b>Product Image</b><br />
                <asp:TextBox ID="txtImage" runat="server" Width="140" />
            </td>
            <td style="width: 100px">
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" />
            </td>
        </tr>
    </table>
      <br />
     <label> Product List:</label>
     <br />
       <asp:GridView ID="gvProducts" runat="server"  DataKeyNames="PID" AutoGenerateColumns="false" CssClass="gv" HeaderStyle-CssClass="gvHeader" FooterStyle-CssClass="gvHeader" Width="937px">
        <Columns>
            <asp:TemplateField HeaderText="ID" ItemStyle-Width="150px" Visible="true">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("PID") %>' runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Name" ItemStyle-Width="150px" ItemStyle-CssClass="Name">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("PName") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("PName") %>' runat="server" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Detail" ItemStyle-Width="150px" ItemStyle-CssClass="Email">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Detail") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("Detail") %>' runat="server" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Product Price" ItemStyle-Width="150px" ItemStyle-CssClass="Email">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Price") %>' runat="server" />
                    <asp:TextBox Text='<%# Eval("Price") %>' runat="server" Style="display: none" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Product Image" ItemStyle-Width="150px" ItemStyle-CssClass="Email">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("Image") %>' runat="server"  Style="display: none" />
                    <asp:Image ImageUrl='<%# Eval("Image") %>' runat="server" Height="50px" Width="55px" Style="display: normal"  />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%--<asp:LinkButton Text="Edit" ID="Edit" runat="server" CssClass="Edit" />
                    <asp:LinkButton Text="Update" ID="Update" runat="server" CssClass="Update" Style="display: none" />
                    <asp:LinkButton Text="Cancel" ID="Cancel" runat="server" CssClass="Cancel" Style="display: none" />--%>
                    <asp:LinkButton Text="Delete" ID="Delete" runat="server" CssClass="Delete" OnClick="Delete_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="gvItem" />
    </asp:GridView>
    </div>
  
   
   
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
</asp:Content>