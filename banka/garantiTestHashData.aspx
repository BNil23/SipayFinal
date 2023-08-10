<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="garantiTestHashData.aspx.cs" Inherits="test3.garantiTestHashData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Terminal ID:
            <asp:TextBox ID="txtTerminalID" Text="123456" runat="server" />
            <br />
            Password:
            <asp:TextBox ID="txtPassword" Text="Abq12x46" runat="server" />
            <br />
            Order ID:
            <asp:TextBox ID="txtOrderID" Text="1" runat="server" />
            <br />
            Number:
            <asp:TextBox ID="txtCCNumber" Text="4242424242424242" runat="server" />
            <br />
            Amount:
            <asp:TextBox ID="txtAmount" Text="175,92" runat="server" />
            <br />
            <asp:Button ID="cmdSubmit" runat="server" Text="Oluştur" />
            <br />
            <br />
            <asp:Label ID="lblResult_SecurityData" runat="server" />
            <br />
            <asp:Label ID="lblResult_HashData" runat="server" />
        </div>
    </form>
</body>
</html>
