<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="garantiTest3DPayResult.aspx.cs" Inherits="test3.garantiTest3DPayResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://yucelen.asistcrm.com/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="https://yucelen.asistcrm.com/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
    <style>
        .txtmdResult, .txtResults {
            font-family: Inter, Helvetica, "sans-serif";
        }

        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="ejiWZhwmD753Wz9bG65YJFkaNUuAsqcImtOqZ/nbOhV+VC2QNVynQl93TpYNYDBqKhKU2KjNzsSFhcKdhx41U0r/KwP5BzCouCjhM8NXdzY=" />
        </div>

        <div>

            <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="2E6BB3AA" />
        </div>
        <div>
            <script>var defaultThemeMode = "light"; var themeMode; if (document.documentElement) { if (document.documentElement.hasAttribute("data-theme-mode")) { themeMode = document.documentElement.getAttribute("data-theme-mode"); } else { if (localStorage.getItem("data-theme") !== null) { themeMode = localStorage.getItem("data-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-theme", themeMode); }</script>
            <!--end::Theme mode setup on page load-->
            <!--begin::Main-->
            <!--begin::Root-->
            <div class="d-flex flex-column flex-root">
                        <div id="#kt_app_body_content" style="position:fixed; background-color: #D5D9E2; font-family: Arial,Helvetica,sans-serif; line-height: 1.5; min-height: 100%; font-weight: normal; font-size: 15px; color: #2F3044; margin: 0; padding: 0; width: 100%;">
                            <div style="background-color: #ffffff; padding: 45px 0 34px 0; border-radius: 24px; margin: 40px auto; margin-top:250px; max-width: 600px;">
                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" height="auto" style="border-collapse: collapse">
                                    <tbody>
                                        <tr>
                                            <td align="center" valign="center" style="text-align: center; padding-bottom: 10px">
                                                <!--begin:Email content-->
                                                <div style="text-align: center; margin: 0 60px 34px 60px">
                                                    <!--begin:Logo-->
                                                    <div style="margin-bottom: 10px">
                                                        <a href="#" rel="noopener" target="_blank">
                                                            <img alt="Logo" src="https://healthcenter.asistcrm.com/works/Clinic/murat_aktas_antet_ust2.JPG" style="width: 100%; margin-left: 20px" />
                                                        </a>
                                                    </div>


                                                    <!--end:Logo-->
                                                    <!--begin:Text-->
                                                    <div style="font-size: 14px; font-weight: 500; margin-bottom: 42px; font-family: Arial,Helvetica,sans-serif">
                                                        <%--<asp:TextBox ID="txtmdResult" runat="server" BorderStyle="None"></asp:TextBox>--%>
                                                        <br />
                                                        <asp:Label ID="txtResultMd" runat="server"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="txtSonuc" runat="server" Font-Bold="true"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="txtMesaj" runat="server" Font-Italic="true"></asp:Label>
                                                        <%--<p style="margin-bottom: 9px; color: #181C32; font-size: 22px; font-weight: 500">Payment Details</p>
                                                    <p style="margin-bottom: 9px; color: #181C32; font-size: 22px; font-weight: 700">Payment Error!</p>--%>
                                                    </div>
                                                    <!--end:Text-->

                                                    <!--begin:Action-->
                                                    <!--begin:Action-->
                                                </div>
                                                <!--end:Email content-->
                                            </td>
                                        </tr>
                                        <tr>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--end::Email template-->
                    </div>
                    <!--end::Body-->
                </div>
                <!--end::Wrapper-->
            </div>
            <!--end::Root-->
            <!--end::Main-->
            <!--begin::Javascript-->
            <script>var hostUrl = "assets/";</script>
            <!--begin::Global Javascript Bundle(mandatory for all pages)-->
            <script src="assets/plugins/global/plugins.bundle.js"></script>
            <script src="assets/js/scripts.bundle.js"></script>
            <!--end::Global Javascript Bundle-->
            <!--end::Javascript-->
        </div>
        <%--<asp:TextBox ID="txtResults" TextMode="MultiLine" Width="100%" Height="300" runat="server" />--%>
    </form>
</body>
</html>
