using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace test3
{
    public partial class garantiTest3DPayResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string strMDStatus = Request.Form.Get("mdstatus");
                string strHostMsg = Request.Form.Get("hostmsg");
                string strReturnCode = Request.Form.Get("procreturncode");
                var strMDStatusText = "";
                if (strMDStatus.Equals("1"))
                {
                    strMDStatusText = "Tam Doğrulama";
                    if (strReturnCode.Equals("00"))
                    {
                        txtSonuc.Text = "Ödeme Başarılı";
                        txtMesaj.Text = strHostMsg;
                    }

                    else
                    {
                        txtSonuc.Text = "Ödeme Başarısız";
                        txtMesaj.Text = strHostMsg;
                    }
                }
                else if (strMDStatus.Equals("2"))
                {
                    txtSonuc.Text = "Ödeme Başarısız";
                    strMDStatusText = "Kart Sahibi veya bankası sisteme kayıtlı değil";
                    txtMesaj.Text = strHostMsg;
                }
                else if (strMDStatus.Equals("4"))
                {
                    strMDStatusText = "Kartın bankası sisteme kayıtlı değil";
                    txtSonuc.Text = "Ödeme Başarısız";
                    txtMesaj.Text = strHostMsg;
                }
                else if (strMDStatus.Equals("5"))
                {
                    strMDStatusText = "Doğrulama denemesi, kart sahibi sisteme daha sonra kayıt olmayı seçmiş";
                    txtSonuc.Text = "Ödeme Başarısız";
                    txtMesaj.Text = strHostMsg;
                }
                else if (strMDStatus.Equals("6"))
                {
                    strMDStatusText = "Doğrulama yapılamıyor";
                    txtSonuc.Text = "Ödeme Başarısız";
                    txtMesaj.Text = strHostMsg;
                }
                else if (strMDStatus.Equals("7"))
                {
                    strMDStatusText = "Sistem Hatası";
                    txtSonuc.Text = "Ödeme Başarısız";
                    txtMesaj.Text = strHostMsg;
                }
                else if (strMDStatus.Equals("8"))
                {
                    strMDStatusText = "Bilinmeyen Kart No";
                    txtSonuc.Text = "Ödeme Başarısız";
                    txtMesaj.Text = strHostMsg;
                }
                else if (strMDStatus.Equals("0"))
                {
                    strMDStatusText = "Doğrulama Başarısız, 3-D Secure imzası geçersiz.";
                    txtSonuc.Text = "Ödeme Başarısız";
                    txtMesaj.Text = strHostMsg;
                }
                txtResultMd.Text = strMDStatusText;
                IEnumerator f = Request.Form.GetEnumerator();
                while (f.MoveNext())
                {
                    string xkey = (string)f.Current;
                    string xval = Request.Form.Get(xkey);
                    //txtResults.Text = txtResults.Text + (xkey + " : " + xval + "\n");
                }
            }
        }
    }
}