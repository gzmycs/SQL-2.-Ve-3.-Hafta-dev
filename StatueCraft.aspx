using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VeriT
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }

        private void LoadRecord()
        {
            string conString = "Data Source=LAPTOP-TB9PK466\\SQLEXPRESS;Initial Catalog=VeriT;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand comm = new SqlCommand("SELECT * FROM Kullanici", con);
                SqlDataAdapter da = new SqlDataAdapter(comm);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TB9PK466\\SQLEXPRESS;Initial Catalog=VeriT;Integrated Security=True");
            con.Open();

            string email = TextBox6.Text;
            try
            {
                var mailAddress = new System.Net.Mail.MailAddress(email);

                SqlCommand comm = new SqlCommand("Insert into Kullanici values('"
                    + int.Parse(TextBox4.Text) + "','"
                    + TextBox5.Text + "','"
                    + email + "','"
                    + TextBox7.Text + "','"
                    + TextBox8.Text + "','"
                    + TextBox9.Text + "')", con);
                comm.ExecuteNonQuery();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Inserted');", true);
            }
            catch (FormatException)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid email address.');", true);
            }
            finally
            {
                con.Close();
                LoadRecord();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=LAPTOP-TB9PK466\\SQLEXPRESS;Initial Catalog=VeriT;Integrated Security=True"))
            {
                con.Open();
                int id;
                if (!int.TryParse(TextBox4.Text, out id))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid ID format.');", true);
                    return;
                }
                SqlCommand comm = new SqlCommand("UPDATE Kullanici SET ad_soyad = '" + TextBox5.Text + "', e_posta = '" + TextBox6.Text + "', telefon = '" + TextBox7.Text + "', kayit_tarihi = '" + TextBox8.Text + "', sifre_hash = '" + TextBox9.Text + "' WHERE kullanici_id = " + id, con);
                comm.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Updated');", true);
                LoadRecord();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=LAPTOP-TB9PK466\\SQLEXPRESS;Initial Catalog=VeriT;Integrated Security=True"))
            {
                con.Open();
                int id;
                if (!int.TryParse(TextBox4.Text, out id))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid ID format.');", true);
                    return;
                }

                SqlCommand comm = new SqlCommand("DELETE FROM Kullanici WHERE kullanici_id = " + id, con);
                comm.ExecuteNonQuery();
                con.Close();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Deleted');", true);
                LoadRecord();
            }
        }
    }
}
