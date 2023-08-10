using System;
using System.Net;
using System.Text;
using System.IO;
using System.Xml;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;


namespace test3
{
    public partial class garantiTest : System.Web.UI.Page
    {
        private static Random random = new Random();

        public static string RandomString(int length)
        {

            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            if (!Page.IsPostBack)
            {
                string strMode = "TEST";
                string strApiVersion = "v0.01";
                string strTerminalProvUserID = "PROVAUT";
                string strType = "sales";
                string strAmount = "100"; // işlem Tutarı 
                string strCurrencyCode = "949";
                string strInstallmentCount = ""; //Taksit Sayısı. Boş gönderilirse taksit yapılmaz 
                string strTerminalUserID = "SANALUSER";
                string strOrderID = RandomString(9);
                string strCustomeripaddress = "10.170.14.189";
                string strcustomeremailaddress = "emrez@garanti.com.tr";
                string strTerminalID = "*****";
                string _strTerminalID = "*****"; //Başına 0 eklenerek 9 digite tamamlanmalıdır. 
                string strTerminalMerchantID = "****"; //Üye işyeri Numarası 
                string strStoreKey = "***"; //3D Secure şifreniz 
                string strProvisionPassword = "****/"; //Terminal UserID şifresi 
                string strSuccessURL = "https://garantibbvapos.com.tr/destek/postback.aspx";
                string strErrorURL = "https://garantibbvapos.com.tr/destek/postback.aspx";
                string SecurityData = GetSHA1(strProvisionPassword + _strTerminalID).ToUpper();
                string HashData = GetSHA1(strTerminalID + strOrderID + strAmount + strSuccessURL + strErrorURL +
                strType + strInstallmentCount + strStoreKey + SecurityData).ToUpper();
                mode.Value = strMode;
                apiversion.Value = strApiVersion;
                terminalprovuserid.Value = strTerminalProvUserID;
                terminaluserid.Value = strTerminalUserID;
                terminalmerchantid.Value = strTerminalMerchantID;
                txntype.Value = strType;
                txnamount.Value = strAmount;
                txncurrencycode.Value = strCurrencyCode;
                txninstallmentcount.Value = strInstallmentCount;
                customeremailaddress.Value = strcustomeremailaddress;
                customeripaddress.Value = strCustomeripaddress;
                orderid.Value = strOrderID;
                terminalid.Value = strTerminalID;
                successurl.Value = strSuccessURL;
                errorurl.Value = strErrorURL;
                secure3dhash.Value = HashData;
            }
        }
        public string GetSHA1(string SHA1Data)
        {
            SHA1 sha = new SHA1CryptoServiceProvider();
            string HashedPassword = SHA1Data;
            byte[] hashbytes = Encoding.GetEncoding("ISO-8859-9").GetBytes(HashedPassword);
            byte[] inputbytes = sha.ComputeHash(hashbytes);
            return GetHexaDecimal(inputbytes);
        }
        public string GetHexaDecimal(byte[] bytes)
        {
            StringBuilder s = new StringBuilder();
            int length = bytes.Length;
            for (int n = 0; n <= length - 1; n++)
            {
                s.Append(String.Format("{0,2:x}", bytes[n]).Replace(" ", "0"));
            }
            return s.ToString();
        }
    }
    
}



