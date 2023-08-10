<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="garantiTestSatis.aspx.cs" Inherits="test3.garantiTest2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Terminal ID:
            <asp:TextBox ID="txtTerminalID" runat="server" />
            <br />
            Password:
            <asp:TextBox ID="txtPassword" runat="server" />
            <br />
            User ID:
            <asp:TextBox ID="txtUserID" runat="server" />
            <br />
            Merchant ID:
            <asp:TextBox ID="txtMerchantID" runat="server" />
            <br />
            Order ID:
            <asp:TextBox ID="txtOrderID" runat="server" />
            <br />
            Customer Name:
            <asp:TextBox ID="txtCustomerName" runat="server" />
            <br />
            Customer Email:
            <asp:TextBox ID="txtCustomerEmail" runat="server" />
            <br />
            Number:
            <asp:TextBox ID="txtCCNumber" runat="server" />
            <br />
            Expire Date:
            <asp:TextBox ID="txtExpDate" runat="server" />
            <br />
            CVV2:
            <asp:TextBox ID="txtCVV2" runat="server" />
            <br />
            Amount:
            <asp:TextBox ID="txtAmount" runat="server" />
            <br />
            <asp:Button ID="cmdSubmit" runat="server" Text="Oluştur" />
            <br />
            <asp:Label ID="lblResults" runat="server" />
        </div>
    </form>
</body>
</html>
