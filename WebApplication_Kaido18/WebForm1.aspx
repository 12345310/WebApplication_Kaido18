<%@ page language="c#" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
  <head runat="server">
    <title>
      User Information WebPart with EditorPart
    </title>
  </head>
  <body>
    <form id="form1" runat="server">
        <asp:webpartmanager id="WebPartManager1" runat="server"  />
        <asp:EditorZone ID="EditorZone1" runat="server" Height="207px">
          <ZoneTemplate>
            <asp:PropertyGridEditorPart ID="PropertyGridEditorPart1" 
              runat="server" 
              Title="Edit Custom Properties"
              OnPreRender="PropertyGridEditorPart1_PreRender" 
              OnInit="PropertyGridEditorPart1_Init" />   
          </ZoneTemplate>
        </asp:EditorZone>

      <asp:SqlDataSource
          id="SqlDataSource1"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString='<%$ ConnectionStrings:testdbConnectionString %>' SelectCommand="SELECT * FROM [Members]">
      </asp:SqlDataSource>


<script runat="server">

  protected void Page_Load(object sender, EventArgs e)
  {
    Button1.Visible = false;
    TextBox1.Visible = false;
  }

  // <snippet3>
  private static String editControlTitle;
  
  protected void Button1_Click(object sender, EventArgs e)
  {
    editControlTitle = Server.HtmlEncode(TextBox1.Text);
    PropertyGridEditorPart1.Title = editControlTitle;
  }

  protected void PropertyGridEditorPart1_Init(object sender, EventArgs e)
  {
    if (editControlTitle != null)
      PropertyGridEditorPart1.Title = editControlTitle;
  }  
  // </snippet3>


  // <snippet4>
  protected void PropertyGridEditorPart1_PreRender(object sender,
    EventArgs e)
  {
    Button1.Visible = true;
    TextBox1.Visible = true;
  }
  // </snippet4> 

</script>


        <asp:Button ID="Button1" runat="server" Text="Button" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>


    </form>
  </body>
</html>