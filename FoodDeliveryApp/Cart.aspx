<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FoodDeliveryApp.Cart" %>

<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="text-align:right;margin-top:5px" >
         <asp:Button ID="btnMenu" runat="server" CssClass="btn btn-primary btn-lg" Font-Bold="True" 
                                                        Font-Size="10pt" Height="40px" Text="My Home"
                                                       />
        <asp:Button ID="btnOrders" runat="server" CssClass="btn btn-primary btn-lg" Font-Bold="True" 
                                                        Font-Size="10pt" Height="40px" Text="Orders"
                                                       />
         <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-primary btn-lg" Font-Bold="True" 
                                                        Font-Size="10pt" Height="40px" Text="Logout"  
                       style="align-self:end"                                />
    </div>
 <div class="jumbotron">
        
      <br />
     <label> My Cart:</label>
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
                    <asp:LinkButton Text="Delete" ID="Delete" runat="server" CssClass="Delete"  />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle CssClass="gvItem" />
    </asp:GridView>
    </div>

</asp:Content>