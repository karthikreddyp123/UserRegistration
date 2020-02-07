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
    public partial class UserRegistrationForm : System.Web.UI.Page
    {
        SqlConnection objSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (objSqlConnection.State == ConnectionState.Closed)
            {
                objSqlConnection.Open();
            }
            if (!IsPostBack)
            {
                ddlState.Items.Insert(0, new ListItem("--Select State--", "0"));
                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
                BindCountries();
                Bind_CheckList();
            }
        }
        protected void BindCountries()
        {
            try
            {
                SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select * from Country", objSqlConnection);
                DataSet objDataSet = new DataSet();
                objSQLAdapter.Fill(objDataSet);
                ddlCountry.DataSource = objDataSet;
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("--Select Country--", "0"));
            }
            catch (Exception ex)
            {
                Response.Write("Exception in Binding Country Dropdownlist : " + ex.Message.ToString());
            }
            finally
            {
                objSqlConnection.Close();
            }
        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
                SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select * from State where CountryID=" + CountryId, objSqlConnection);
                DataSet objDataSet = new DataSet();
                objSQLAdapter.Fill(objDataSet);
                ddlState.DataSource = objDataSet;
                ddlState.DataTextField = "StateName";
                ddlState.DataValueField = "StateID";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("--Select State--", "0"));
                if (ddlState.SelectedValue == "0")
                {
                    ddlCity.Items.Clear();
                    ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
                }
            }
            catch (Exception ex)
            {
                Response.Write("Exception in Binding State Dropdownlist: " + ex.Message.ToString());
            }
            finally
            {
                objSqlConnection.Close();
            }
        }
        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int StateId = Convert.ToInt32(ddlState.SelectedValue);
                SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select * from City where StateID=" + StateId, objSqlConnection);
                DataSet objDataSet = new DataSet();
                objSQLAdapter.Fill(objDataSet);
                ddlCity.DataSource = objDataSet;
                ddlCity.DataTextField = "CityName";
                ddlCity.DataValueField = "CityID";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
            catch (Exception ex)
            {
                Response.Write("Exception in Binding City Dropdownlist: " + ex.Message.ToString());
            }
            finally
            {
                objSqlConnection.Close();
            }
        }
        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            String DOB=  Calendar.SelectedDate.ToShortDateString();
            
        }
        protected void Bind_CheckList() // Method for Binding The Checkbox List  
        {
            List<string> listContents = new List<string>();// Create a List of String Elements  
            listContents.Add("Java");
            listContents.Add(".NET");

            StreamCheckBox.DataSource = listContents;//Set Datasource to CheckBox List  
            StreamCheckBox.DataBind(); // Bind the checkboxList with String List.  

        }

        protected void Button_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand command;
                SqlDataAdapter adapter = new SqlDataAdapter();
                String sql = "";
                String str = "";
                for (int i = 0; i <= StreamCheckBox.Items.Count - 1; i++)
                {
                    if (StreamCheckBox.Items[i].Selected)
                    {
                        if (str == "")
                        {
                            str = StreamCheckBox.Items[i].Text;
                        }
                        else
                        {
                            str += " " + StreamCheckBox.Items[i].Text;
                        }
                    }
                }
                sql = "Insert into Users(FirstName,LastName,EmaiID,Location,Stream,DOB) values('" + FirstNameTextBox.Text + "','" + LastNameTextBox.Text + "','"+ EmailTextBox.Text + "','"+ ddlCity.SelectedItem+" "+ddlState.SelectedItem+" "+ddlCountry.SelectedItem+ "','"+ str + "','"+ Calendar.SelectedDate.ToShortDateString()+"')";
                command = new SqlCommand(sql, objSqlConnection);
                adapter.InsertCommand = new SqlCommand(sql, objSqlConnection);
                adapter.InsertCommand.ExecuteNonQuery();
                command.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write("Exception in insering Data: " + ex.Message.ToString());
            }
            finally
            {
                objSqlConnection.Close();
            }

        }
    }
}