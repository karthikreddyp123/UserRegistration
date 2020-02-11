using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserRegistration
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //SqlConnection objSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString))
            //{
            //    var UN = TextBoxUserName.Text;
            //    var PW = TextBoxPassword.Text;
            //    string qry = "select * from Login where UserName='" + UN + "'and Password='" + PW + "' ";
            //    var adpt = new SqlDataAdapter(qry, con);
            //    var dt = new DataTable();
            //    adpt.Fill(dt);
            //    if (dt.Rows.Count >= 1)
            //    {
            //        Response.Redirect("UserRegistrationForm.aspx");
            //    }
            //}
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString))
            {
                var UN = TextBoxUserName.Text;
                var PW = TextBoxPassword.Text;
                SqlCommand command;
               // string qry = "select * from Login where UserName='' delete * from 
                
                command = new SqlCommand("LoginProc", con);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.AddWithValue("UserName", UN);
                command.Parameters.AddWithValue("Password", PW);
                //
                // var adpt = new SqlDataAdapter(command, con);
                con.Open();
                SqlDataReader sqlDataReader= command.ExecuteReader();
                
                //Response.Write(count);
              //  var dt = new DataTable();
               // adpt.Fill(dt);
                if (sqlDataReader.HasRows)
                {
                    Response.Redirect("UserRegistrationForm.aspx");
                }
                else
                {
                    Response.Write("Invalid Credentials.");
                }
            }
        }
    }
}