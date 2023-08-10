<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="akbankTest3D.aspx.cs" Inherits="test3.akbankTest3D" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>3D Model</title>
    <meta charset="utf-8" />
    <meta name="description" content="asistCRM" />
    <meta name="keywords" content="asistCRM" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="article" />
    <meta property="og:title" content="asistCRM" />
    <meta property="og:url" content="asistCRM" />
    <meta property="og:site_name" content="asistCRM" />
    <link rel="icon" href="works/favicon.ico" type="image/x-icon" />
    <!--begin::Fonts(mandatory for all pages)-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:300,400,500,600,700" />
    <!--end::Fonts-->
    <!--begin::Global Stylesheets Bundle(mandatory for all pages)-->
    <link href="https://yucelen.asistcrm.com/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css" />
    <link href="https://yucelen.asistcrm.com/assets/css/style.bundle.css" rel="stylesheet" type="text/css" />
    <!--end::Global Stylesheets Bundle-->
</head>
<body id="kt_body" class="app-blank">
    <form id="form2" runat="server" method="post" action="https://testvpos.asseco-see.com.tr/fim/est3Dgate">

        <%
            //  AŞAĞIDA 3D SECURE İŞLEMİ İÇİN GEREKLİ ALANLAR VE KULLANIMLARI İLE ASP.NET KOD ÖRNEĞİ VERİLMİŞTİR. GİRİLEN DEĞERLER TEST AMAÇLI GİRİLMİŞTİR.
            //  3D MODEL ÜZERİNE DÜZENLENMİŞ KOD ÖRNEĞİDİR. İŞ YERLERİ KENDİ DEĞERLERİYLE DEĞİŞKENLERİ TANIMLAMALIDIR. 
            //  İŞ YERLERİNE REFERANS AMAÇLI OLUŞTURULMUŞTUR.


            /********************         GEREKLİ PARAMETRELER            ******************/

            String clientId = "100100000";  //Banka tarafından mağazaya verilen iş yeri numarası
            String currency = "949";
            String amount = "9.95";         //İşlem tutarı
            String oid = "testyeni";                //Sipariş numarası 
            String okUrl = "https://localhost:44390/odemesayfasi3dmodel.aspx";    //İşlem başarılıysa dönülecek işyeri sayfası  (3D işleminin sonucu ödeme işleminin değil)
            String failUrl = "https://localhost:44390/odemesayfasi3dmodel.aspx";  //İşlem başarısızsa dönülecek işyeri sayfası  (3D işleminin sonucu ödeme işleminin değil)
            String rnd = DateTime.Now.ToString();        //Güvenlik ve kontrol amaçlı tarih yada sürekli değişen bir değer


            String storekey = "123456";                    //işyeri anahtarı
            String storetype = "3d";
            String hashstr = clientId + oid + amount + okUrl + failUrl + rnd + storekey;
            System.Security.Cryptography.SHA1 sha = new System.Security.Cryptography.SHA1CryptoServiceProvider();
            byte[] hashbytes = System.Text.Encoding.GetEncoding("ISO-8859-9").GetBytes(hashstr);
            byte[] inputbytes = sha.ComputeHash(hashbytes);

            String hash = Convert.ToBase64String(inputbytes);   //Günvelik amaçlı oluşturulan hash

            /******************          GEREKLİ PARAMETRELER             *********************/

            /***************       ISTEĞE BAĞLI ALANLAR    *********************************/
            String description = ""; //Açıklama
            String xid = "";    //İşlem takip numarası 3D için XID i mağaza üretirse o kullanir, yoksa sistem üretiyor. (3D secure işlemleri için işlem takip numarası 20 bytelik bilgi 28 karaktere base64 olarak kodlanmalı, geçersiz yada boş ise sistem tarafından üretilir.)
            String lang = "";     //gösterim dili boş ise Türkçe (tr), İngilizce için (en)
            String email = "";    //email adresi
            String userid = "";   //Kullanıcı takibi için id
            /***************       ISTEĞE BAĞLI ALANLAR     ********************************/
        %>



        <div>
            <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="cQOFq7tZ1UzFtYXZH3aY+PtfcCjrgTzuopglzcDvKhEIITZo1GvpLWUxOv+Qj+2cdKHtXLUczhYSXYmwS/RBBysFK1/OE2kfYZPT7JwjkME=" />
        </div>

        <div>

            <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="8B1BB15A" />
            <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="2nUJESW82jTx8X8Dd1GF15UXBw0k7mfxtbvF32u2gQFhXAzMb88PrkgbjCQweIiKgCUqyeE39ye5nwjQbgB3V+8wOPbfHPtizr0OjADLfUJaXgyDJK8F8cYqZdicaKYW" />
        </div>
        <!--begin::Theme mode setup on page load-->
        <script>var defaultThemeMode = "light"; var themeMode; if (document.documentElement) { if (document.documentElement.hasAttribute("data-theme-mode")) { themeMode = document.documentElement.getAttribute("data-theme-mode"); } else { if (localStorage.getItem("data-theme") !== null) { themeMode = localStorage.getItem("data-theme"); } else { themeMode = defaultThemeMode; } } if (themeMode === "system") { themeMode = window.matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light"; } document.documentElement.setAttribute("data-theme", themeMode); }</script>
        <!--end::Theme mode setup on page load-->
        <!--begin::Main-->
        <!--begin::Root-->
        <input type="hidden" name="hidClick" id="hidClick" value="0" />
        <div class="d-flex flex-column flex-root">
            <!--begin::Wrapper-->
            <div class="d-flex flex-column flex-column-fluid">
                <!--begin::Body-->
                <div class="scroll-y flex-column-fluid px-10 py-10" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-height="auto" data-kt-scroll-dependencies="#kt_app_header_nav" data-kt-scroll-offset="5px" data-kt-scroll-save-state="true" style="background-color: #D5D9E2; --kt-scrollbar-color: #d9d0cc; --kt-scrollbar-hover-color: #d9d0cc">
                    <!--begin::Email template-->
                    <style>
                        html, body {
                            padding: 0;
                            margin: 0;
                            font-family: Inter, Helvetica, "sans-serif";
                        }

                        a:hover {
                            color: #009ef7;
                        }
                    </style>
                    <div class="container-xxl" id="kt_content_container">
                        <!--begin::Invoice 2 main-->
                        <div class="card">
                            <!--begin::Body-->
                            <div class="card-body p-lg-20">
                                <!--begin::Layout-->
                                <div class="d-flex flex-column flex-xl-row">
                                    <!--begin::Content-->
                                    <div class="flex-lg-row-fluid me-xl-18 mb-10 mb-xl-0">
                                        <!--begin::Invoice 2 content-->
                                        <div class="mt-n1">
                                            <!--begin::Top-->
                                            <div class="d-flex flex-stack pb-10">
                                                <!--begin::Logo-->
                                                <a href="https://www.yucelenhastanesi.com">
                                                    <img alt="Logo" src="https://yucelen.asistcrm.com/imgstore/antet.jpg" style="width: 100%; margin-left:50px" />
                                                </a>
                                                <!--end::Logo-->
                                            </div>
                                            <!--end::Top-->
                                            <!--begin::Wrapper-->
                                            <div class="m-0">
                                                <!--begin::Label-->
                                                <div class="fw-bold fs-3 text-gray-800 mb-8">Invoice #34814</div>
                                                <!--end::Label-->
                                                <!--begin::Row-->
                                                <div class="row g-5 mb-11">
                                                    <!--end::Col-->
                                                    <div class="col-sm-6">
                                                        <!--end::Label-->
                                                        <div class="fw-semibold fs-7 text-gray-600 mb-1">Issue Date:</div>
                                                        <!--end::Label-->
                                                        <!--end::Col-->
                                                        <div class="fw-bold fs-6 text-gray-800">6.02.2023</div>
                                                        <!--end::Col-->
                                                    </div>
                                                    <!--end::Col-->
                                                    <!--end::Col-->
                                                    <div class="col-sm-6">
                                                        <!--end::Label-->
                                                        <div class="fw-semibold fs-7 text-gray-600 mb-1">Due Date:</div>
                                                        <!--end::Label-->
                                                        <!--end::Info-->
                                                        <div class="fw-bold fs-6 text-gray-800 d-flex align-items-center flex-wrap">
                                                            <span class="pe-2">13.02.2023</span>
                                                            <span class="fs-7 text-danger d-flex align-items-center">
                                                                <span class="bullet bullet-dot bg-danger me-2"></span>Due in -7</span>
                                                        </div>
                                                        <!--end::Info-->
                                                    </div>
                                                    <!--end::Col-->
                                                </div>
                                                <!--end::Row-->
                                                <!--begin::Row-->
                                                <div class="row g-5 mb-12">
                                                    <!--end::Col-->
                                                    <div class="col-sm-6">
                                                        <!--end::Label-->
                                                        <div class="fw-semibold fs-7 text-gray-600 mb-1">Issue For:</div>
                                                        <!--end::Label-->
                                                        <!--end::Text-->
                                                        <div class="fw-bold fs-6 text-gray-800">Funke  Funke</div>
                                                        <!--end::Text-->
                                                        <!--end::Description-->
                                                        <div class="fw-semibold fs-7 text-gray-600">
                                                            8692 Wild Rose Drive 
															<br />
                                                            Livonia, MI 48150
                                                        </div>
                                                        <!--end::Description-->
                                                    </div>
                                                    <!--end::Col-->
                                                    <!--end::Col-->
                                                    <div class="col-sm-6">
                                                        <!--end::Label-->
                                                        <div class="fw-semibold fs-7 text-gray-600 mb-1">Issued By:</div>
                                                        <!--end::Label-->
                                                        <!--end::Text-->
                                                        <div class="fw-bold fs-6 text-gray-800">Yücelen Hastanesi</div>
                                                        <!--end::Text-->
                                                        <!--end::Description-->
                                                        <div class="fw-semibold fs-7 text-gray-600">

                                                            <br />
                                                             Marmaris Bulvarı Kötekli Mahallesi 65 Sokak 22/C-1 48000 Menteşe / MUĞLA TR
                                                        </div>
                                                        <!--end::Description-->
                                                    </div>
                                                    <!--end::Col-->
                                                </div>
                                                <!--end::Row-->
                                                <!--begin::Content-->
                                                <div class="flex-grow-1">
                                                    <!--begin::Table-->
                                                    <div class="table-responsive border-bottom mb-9">
                                                        <table class="table mb-3">
                                                            <thead>
                                                                <tr class="border-bottom fs-6 fw-bold text-muted">
                                                                    <th class="min-w-175px pb-2">Description</th>
                                                                    <th class="min-w-100px text-end pb-2">Amount</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr class="fw-bold text-gray-700 fs-5 text-end">
                                                                    <td class="d-flex align-items-center pt-6">
                                                                        <i class="fa fa-genderless text-danger fs-2 me-2"></i>Dental Implant

                                                                    </td>
                                                                    <td class="pt-6 text-dark fw-bolder">€ 1</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <!--end::Table-->
                                                    <!--begin::Container-->
                                                    <div class="d-flex justify-content-end">
                                                        <!--begin::Section-->
                                                        <div class="mw-300px">
                                                            <!--begin::Item-->
                                                            <div class="d-flex flex-stack mb-3">
                                                                <!--begin::Accountname-->
                                                                <div class="fw-semibold pe-10 text-gray-600 fs-7">Subtotal:</div>
                                                                <!--end::Accountname-->
                                                                <!--begin::Label-->
                                                                <div class="text-end fw-bold fs-6 text-gray-800">€ 1</div>
                                                                <!--end::Label-->
                                                            </div>
                                                            <!--end::Item-->
                                                            <!--begin::Item-->
                                                            <div class="d-flex flex-stack mb-3">
                                                                <!--begin::Accountname-->
                                                                <div class="fw-semibold pe-10 text-gray-600 fs-7">VAT 0 %</div>
                                                                <!--end::Accountname-->
                                                                <!--begin::Label-->
                                                                <div class="text-end fw-bold fs-6 text-gray-800">0</div>
                                                                <!--end::Label-->
                                                            </div>
                                                            <!--end::Item-->
                                                            <!--begin::Item-->
                                                            <div class="d-flex flex-stack mb-3">
                                                                <!--begin::Accountnumber-->
                                                                <div class="fw-semibold pe-10 text-gray-600 fs-7">Subtotal + VAT</div>
                                                                <!--end::Accountnumber-->
                                                                <!--begin::Number-->
                                                                <div class="text-end fw-bold fs-6 text-gray-800">€ 1</div>
                                                                <!--end::Number-->
                                                            </div>
                                                            <!--end::Item-->
                                                            <!--begin::Item-->
                                                            <div class="d-flex flex-stack">
                                                                <!--begin::Code-->
                                                                <div class="fw-semibold pe-10 text-gray-600 fs-7">Total</div>
                                                                <!--end::Code-->
                                                                <!--begin::Label-->
                                                                <div class="text-end fw-bold fs-6 text-gray-800">€ 1</div>
                                                                <!--end::Label-->
                                                            </div>
                                                            <!--end::Item-->
                                                        </div>
                                                        <!--end::Section-->
                                                    </div>
                                                    <!--end::Container-->
                                                </div>
                                                <!--end::Content-->
                                            </div>
                                            <!--end::Wrapper-->
                                        </div>
                                        <!--end::Invoice 2 content-->
                                    </div>
                                    <!--end::Content-->
                                    <!--begin::Sidebar-->
                                    <div class="mb-16">
                                        <!--begin::Invoice 2 sidebar-->

                                        <div class="card card-flush shadow-sm">
                                            <div class="card-header">
                                                <!--begin::Title-->
                                                <h6 class="card-title" style="margin-top:30px; margin-bottom:20px;">PAYMENT DETAILS</h6>
                                                <!--end::Title-->
                                                <!--begin::Labels-->
                                                <div class="mb-8">
                                                    <span class="badge badge-light-success me-2">Approved</span>
                                                    <span class="badge badge-light-warning">Pending Payment</span>
                                                </div>

                                                <!--begin::Col-->
                                                <div class="col-6">
                                                    <select name="secure3dsecuritylevel" id="secure3dsecuritylevel" class="form-select form-select-solid" data-control="select2" data-hide-search="true" data-placeholder="3D">
                                                        <%--<option value="3D">3D</option>--%>
                                                        <option value="1">Visa</option>
                                                        <option value="2">MasterCard</option>
                                                    </select>
                                                </div>
                                                <!--end::Col-->
                                            </div>
                                            <div class="card-body py-5">
                                                <div id="kt_modal_new_card_form" class="form">
                                                    <!--begin::Input group-->
                                                    <div class="d-flex flex-column mb-7 fv-row">
                                                        <!--begin::Label-->
                                                        <label class="d-flex align-items-center fs-6 fw-semibold form-label mb-2">
                                                            <span class="required">Name On Card</span>
                                                            <i class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="Specify a card holder's name"></i>
                                                        </label>
                                                        <!--end::Label-->
                                                        <input type="text" class="form-control form-control-solid" placeholder="" name="card_name" value="" />
                                                    </div>
                                                    <!--end::Input group-->
                                                    <!--begin::Input group-->
                                                    <div class="d-flex flex-column mb-7 fv-row">
                                                        <!--begin::Label-->
                                                        <%--<asp:TextBox ID="cardnumber" runat="server" class="required fs-6 fw-semibold form-label mb-2" />--%>
                                                        <label class="required fs-6 fw-semibold form-label mb-2">Card Number</label>
                                                        <!--end::Label-->
                                                        <!--begin::Input wrapper-->
                                                        <div class="position-relative">
                                                            <!--begin::Input-->
                                                            <%--<input type="text" class="form-control form-control-solid" id="cardnumber" placeholder="XXXX XXXX XXXX XXXX" name="pan" value="" />--%>
                                                            <asp:TextBox class="form-control form-control-solid" ID="pan" runat="server"></asp:TextBox>

                                                            <!--end::Input-->
                                                            <!--begin::Card logos-->
                                                            <div class="position-absolute translate-middle-y top-50 end-0 me-5">
                                                                <img src="https://yucelen.asistcrm.com/assets/media/svg/card-logos/visa.svg" alt="" class="h-25px" />
                                                                <img src="https://yucelen.asistcrm.com/assets/media/svg/card-logos/mastercard.svg" alt="" class="h-25px" />
                                                            </div>
                                                            <!--end::Card logos-->
                                                        </div>
                                                        <!--end::Input wrapper-->
                                                    </div>
                                                    <!--end::Input group-->
                                                    <!--begin::Input group-->
                                                    <div class="row mb-10">
                                                        <!--begin::Col-->
                                                        <div class="col-md-8 fv-row">
                                                            <!--begin::Label-->
                                                            <!--end::Label-->
                                                            <!--begin::Row-->
                                                            <div class="row fv-row">
                                                                <!--begin::Col-->
                                                                <div class="col-md-6 fv-row">
                                                                    <!--begin::Label-->
                                                                    <label class="d-flex align-items-center fs-6 fw-semibold form-label mb-2">
                                                                        <span class="required">MONTH</span>
                                                                        <%--<asp:TextBox ID="cardcvv2" class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="Enter a card CVV code" runat="server" />--%>
                                                                        <%--<i class="fas fa-exclamation-circle ms-2 fs-7" id="cvv2" data-bs-toggle="tooltip" title="Enter a card CVV code"></i>--%>
                                                                    </label>
                                                                    <!--end::Label-->
                                                                    <!--begin::Input wrapper-->
                                                                    <div class="position-relative">
                                                                        <!--begin::Input-->
                                                                        <%--<input type="text" class="form-control form-control-solid" id="cardcvv2" minlength="3" maxlength="4" value="" placeholder="CVV" name="card_cvv" />--%>
                                                                        <asp:TextBox class="form-control form-control-solid" ID="Ecom_Payment_Card_ExpDate_Month" runat="server"></asp:TextBox>
                                                                        <!--end::Input-->
                                                                    </div>
                                                                    <!--end::Input wrapper-->
                                                                </div>
                                                                <!--end::Col-->
                                                                <!--begin::Col-->
                                                                <div class="col-md-6 fv-row">
                                                                    <!--begin::Label-->
                                                                    <label class="d-flex align-items-center fs-6 fw-semibold form-label mb-2">
                                                                        <span class="required">YEAR</span>
                                                                        <%--<asp:TextBox ID="cardcvv2" class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="Enter a card CVV code" runat="server" />--%>
                                                                        <%--<i class="fas fa-exclamation-circle ms-2 fs-7" id="cvv2" data-bs-toggle="tooltip" title="Enter a card CVV code"></i>--%>
                                                                    </label>
                                                                    <!--end::Label-->
                                                                    <!--begin::Input wrapper-->
                                                                    <div class="position-relative">
                                                                        <!--begin::Input-->
                                                                        <%--<input type="text" class="form-control form-control-solid" id="cardcvv2" minlength="3" maxlength="4" value="" placeholder="CVV" name="card_cvv" />--%>
                                                                        <asp:TextBox class="form-control form-control-solid" ID="Ecom_Payment_Card_ExpDate_Year" runat="server"></asp:TextBox>
                                                                        <!--end::Input-->
                                                                    </div>
                                                                    <!--end::Input wrapper-->
                                                                </div>
                                                                <!--end::Col-->
                                                            </div>
                                                            <!--end::Row-->
                                                        </div>
                                                        <!--end::Col-->
                                                        <!--begin::Col-->
                                                        <div class="col-md-4 fv-row">
                                                            <!--begin::Label-->
                                                            <label class="d-flex align-items-center fs-6 fw-semibold form-label mb-2">
                                                                <span class="required">CVV</span>
                                                                <%--<asp:TextBox ID="cardcvv2" class="fas fa-exclamation-circle ms-2 fs-7" data-bs-toggle="tooltip" title="Enter a card CVV code" runat="server" />--%>
                                                                <%--<i class="fas fa-exclamation-circle ms-2 fs-7" id="cvv2" data-bs-toggle="tooltip" title="Enter a card CVV code"></i>--%>
                                                            </label>
                                                            <!--end::Label-->
                                                            <!--begin::Input wrapper-->
                                                            <div class="position-relative">
                                                                <!--begin::Input-->
                                                                <%--<input type="text" class="form-control form-control-solid" id="cardcvv2" minlength="3" maxlength="4" value="" placeholder="CVV" name="card_cvv" />--%>
                                                                <asp:TextBox class="form-control form-control-solid" ID="cv2" runat="server"></asp:TextBox>
                                                                <!--end::Input-->
                                                                <!--begin::CVV icon-->
                                                                <div class="position-absolute translate-middle-y top-50 end-0 me-3">
                                                                    <!--begin::Svg Icon | path: icons/duotune/finance/fin002.svg-->
                                                                    <span class="svg-icon svg-icon-2hx">
                                                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                            <path d="M22 7H2V11H22V7Z" fill="currentColor" />
                                                                            <path opacity="0.3" d="M21 19H3C2.4 19 2 18.6 2 18V6C2 5.4 2.4 5 3 5H21C21.6 5 22 5.4 22 6V18C22 18.6 21.6 19 21 19ZM14 14C14 13.4 13.6 13 13 13H5C4.4 13 4 13.4 4 14C4 14.6 4.4 15 5 15H13C13.6 15 14 14.6 14 14ZM16 15.5C16 16.3 16.7 17 17.5 17H18.5C19.3 17 20 16.3 20 15.5C20 14.7 19.3 14 18.5 14H17.5C16.7 14 16 14.7 16 15.5Z" fill="currentColor" />
                                                                        </svg>
                                                                    </span>
                                                                    <!--end::Svg Icon-->
                                                                </div>
                                                                <!--end::CVV icon-->
                                                            </div>
                                                            <!--end::Input wrapper-->
                                                        </div>
                                                        <!--end::Col-->
                                                    </div>
                                                    <!--end::Input group-->
                                                    <!--begin::Actions-->
                                                    <div class="text-center pt-5">
                                                        <button type="reset" id="kt_modal_new_card_cancel" class="btn btn-light me-3">Discard</button>
                                                        <button type="submit" id="kt_modal_new_card_submit" class="btn btn-primary">
                                                            <span class="indicator-label">Submit</span>
                                                            <span class="indicator-progress">Please wait...
									                            Please wait...
									                        Please wait...
									                        <span class="spinner-border spinner-border-sm align-middle ms-2"></span></span>

                                                        </button>

                                                        <br />
                                                        <br />
                                                        <br />
                                                        <img src="https://yucelen.asistcrm.com/assets/media/svg/card-logos/mastercard.svg" />
                                                        <img src="https://yucelen.asistcrm.com/assets/media/svg/card-logos/visa.svg" />
                                                        <img src="https://yucelen.asistcrm.com/assets/media/svg/card-logos/3d-secure.svg" height="44" />
                                                        <img src="https://yucelen.asistcrm.com/assets/media/svg/card-logos/SSL-Secured.svg" height="54" />
                                                        <br />
                                                        <br />
                                                         Marmaris Bulvarı Kötekli Mahallesi 65 Sokak 22/C-1 48000 Menteşe / MUĞLA TR
                                                         <br />
                                                        <h5>+90 444 80 40</h5>
                                                        <br />
                                                        <a href="https://www.eng.yucelenhastanesi.com/yucelen-hastanesi-kvkk" target="_blank">Privacy Policy</a> &nbsp | &nbsp  
                                                        <a href="https://www.eng.yucelenhastanesi.com/uluslararası-hastalar" target="_blank">​International Patients</a>
                                                    </div>
                                                    <!--end::Actions-->
                                                </div>
                                                <!--end::CreditCard-->
                                            </div>
                                        </div>
                                        <!--end::Invoice 2 sidebar-->
                                    </div>
                                    <!--end::Sidebar-->
                                </div>
                                <!--end::Layout-->
                            </div>
                            <!--end::Body-->
                        </div>
                        <!--end::Invoice 2 main-->
                    </div>
                    <!--end::Email template-->
                </div>
                <!--end::Body-->
            </div>
            <!--end::Wrapper-->
        </div>


        <input type="hidden" name="clientid" value="<%=clientId%>" />
        <input type="hidden" name="amount" value="<%=amount%>" />
        <input type="hidden" name="currency" value="<%=currency%>" />
        <input type="hidden" name="oid" value="<%=oid%>" />
        <input type="hidden" name="okUrl" value="<%=okUrl%>" />
        <input type="hidden" name="failUrl" value="<%=failUrl%>" />
        <input type="hidden" name="rnd" value="<%=rnd%>" />
        <input type="hidden" name="hash" value="<%=hash%>" />

        <input type="hidden" name="storetype" value="3d" />
        <input type="hidden" name="lang" value="tr" />
    </form>
    <br />
    <b>Kullanılan Hidden Parametreler</b>
    <br />
    &lt;input type="hidden" name="clientid" value=""&gt;<br />
    &lt;input type="hidden" name="amount" value=""&gt;<br />
    &lt;input type="hidden" name="oid" value=""&gt;
        <br />
    &lt;input type="hidden" name="okUrl" value=""&gt;<br />
    &lt;input type="hidden" name="failUrl" value=""&gt;<br />
    &lt;input type="hidden" name="rnd" value="" &gt;<br />
    &lt;input type="hidden" name="hash" value="" &gt;<br />
    &lt;input type="hidden" name="storetype" value="" &gt;
        <br />
    &lt;input type="hidden" name="lang" value=""&gt;<br />
</body>
</html>
<%--<center>
        <form method="post" action="https://entegrasyon.asseco-see.com.tr/fim/est3Dgate">
            <table>
                <tr>
                    <td>Kredi Kart Numarası:</td>
                    <td>
                        <input type="text" name="pan" size="20" />
                </tr>

                <tr>
                    <td>Güvenlik Kodu:</td>
                    <td>
                        <input type="text" name="cv2" size="4" value="" /></td>
                </tr>

                <tr>
                    <td>Son Kullanma Yılı:</td>
                    <td>
                        <input type="text" name="Ecom_Payment_Card_ExpDate_Year" value="" /></td>
                </tr>

                <tr>
                    <td>Son Kullanma Ayı:</td>
                    <td>
                        <input type="text" name="Ecom_Payment_Card_ExpDate_Month" value="" /></td>
                </tr>

                <tr>
                    <td>Visa/MC secimi</td>
                    <td>
                        <select name="cardType">
                            <option value="1">Visa</option>
                            <option value="2">MasterCard</option>
                        </select>
                </tr>

                <tr>
                    <td align="center" colspan="2">
                        <input type="submit" value="Ödemeyi Tamamla" />
                    </td>
                </tr>

            </table>
            <input type="hidden" name="clientid" value="<%=clientId%>">
            <input type="hidden" name="amount" value="<%=amount%>">
            <input type="hidden" name="currency" value="<%=currency%>">
            <input type="hidden" name="oid" value="<%=oid%>">
            <input type="hidden" name="okUrl" value="<%=okUrl%>">
            <input type="hidden" name="failUrl" value="<%=failUrl%>">
            <input type="hidden" name="rnd" value="<%=rnd%>">
            <input type="hidden" name="hash" value="<%=hash%>">

            <input type="hidden" name="storetype" value="3d">
            <input type="hidden" name="lang" value="tr">
        </form>
        <br />
        <b>Kullanılan Hidden Parametreler</b>
        <br />
        &lt;input type="hidden" name="clientid" value=""&gt;<br />
        &lt;input type="hidden" name="amount" value=""&gt;<br />
        &lt;input type="hidden" name="oid" value=""&gt;
        <br />
        &lt;input type="hidden" name="okUrl" value=""&gt;<br />
        &lt;input type="hidden" name="failUrl" value=""&gt;<br />
        &lt;input type="hidden" name="rnd" value="" &gt;<br />
        &lt;input type="hidden" name="hash" value="" &gt;<br />
        &lt;input type="hidden" name="storetype" value="" &gt;
        <br />
        &lt;input type="hidden" name="lang" value=""&gt;<br />
    </center>--%>