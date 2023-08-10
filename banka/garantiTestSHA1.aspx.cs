﻿using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace test3
{
    public partial class garantiTestSHA1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
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
        protected void cmdSubmit_Click(object sender, EventArgs e)
        {
            string strTerminalID = txtTerminalID.Text;
            string _strTerminalID = "0" + txtTerminalID.Text; //Başına 0 eklenerek 9 digite tamamlanmalıdır. 
            string strProvisionPassword = txtPassword.Text; //Terminal UserID şifresi 
            string SecurityData = GetSHA1(strProvisionPassword + _strTerminalID).ToUpper();
            lblResults.Text = "Security Data : " + SecurityData;
        }
    }
}