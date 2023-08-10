<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="garanti3DResult.aspx.cs" Inherits="test3.garanti3DResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <b>3D Secure Gelen Yanıt</b> <i>(only mdStatus)</i>
            <br />
            <asp:TextBox ID="txtmdResult" TextMode="MultiLine" Width="100%" runat="server" />
            <br />
            <br />
            <b>3D Secure Gelen Yanıt</b> <i>(all responses)</i>
            <br />
            <asp:TextBox ID="txtResults" TextMode="MultiLine" Width="100%" Height="300" runat="server" />
            <br />
            <br />
            <b>Provizyona Giden stek</b>
            <br />
            <asp:TextBox ID="txtProvRequest" TextMode="MultiLine" Width="100%" runat="server" />
            <br />
            <br />
            <b>Provizyondan Gelen Yanıt</b>
            <br />
            <asp:TextBox ID="txtProvResults" TextMode="MultiLine" Width="100%" runat="server" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
