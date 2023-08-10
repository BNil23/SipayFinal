<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="garantiTestSHA1.aspx.cs" Inherits="test3.garantiTestSHA1" %>

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
            <asp:Button ID="cmdSubmit" runat="server" Text="Oluştur" />
            <br />
            <br />
            <asp:Label ID="lblResults" runat="server" />
        </div>
    </form>
</body>
</html>
