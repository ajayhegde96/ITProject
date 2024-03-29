﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true;");
       static string name = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["Sid"] == null)
                Response.Redirect("Login.aspx");
            //if (!IsPostBack)
            //{
            //    GridView1.DataBind();
            //}
            string user = Request.QueryString["Username"];
            Label l1 = Master.FindControl("Welcome") as Label;
            l1.Text = "Welcome " + user;
            Button logout = Master.FindControl("Button0") as Button;
            logout.Click += new EventHandler(Logout_Onclick);
            if(!IsPostBack)
                ViewState["old"] = "";
        }

        private void Logout_Onclick(object sender, EventArgs e)
        {
            Session["Sid"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection("Data Source=(localdb)\\MSSQLlocalDB;Initial Catalog=QuestionBank;Integrated Security=True;Pooling=False;MultipleActiveResultSets=true;");
            string sql = "Select *from [User] where Username ='" + TextBox1.Text + "' and Password ='" + TextBox2.Text + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = System.Data.CommandType.Text;
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                //string role = reader["Role"].ToString();
                //Response.Redirect(string.Format("{0}.aspx", role));
                Label1.Text = "User Already Exists";
            }
            else
            {
                string sql1 = "insert into [User](UserName,Password,Subject,Role) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + DropDownList2.SelectedValue + "','" + DropDownList1.SelectedValue + "')";
                cmd = new SqlCommand(sql1, con);
                cmd.CommandType = System.Data.CommandType.Text;
                try
                {
                    cmd.ExecuteNonQuery();
                    Label1.Text = "Data inserted successfully";
                }
                catch (Exception ex)
                {
                    Label1.Text = ex.Message;
                }
                finally
                {
                    con.Close();
                }
            }
            TextBox1.Text = TextBox2.Text = TextBox3.Text = "";
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            if (Panel1.Visible)
                TextBox1.Text = TextBox2.Text = Label1.Text = "";
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            con.Open();
            string user = DropDownList3.SelectedItem.Text;

            string sql = "Delete from [User] where Username='" + user + "'";
            string coord = "Update [Subjects] set Coordinator = NULL where Coordinator='" + user + "'";
            try
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand(coord, con);
                cmd.ExecuteNonQuery();
                Label2.Text = "User Successfully Deleted " + user;

            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
            Response.Redirect(Request.FilePath);
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            string sql = "Update [User] set role='FacultyCoordinator' where Username ='" + DropDownList5.SelectedValue + "'";
            string sqll = "Update [Subjects] set Coordinator ='" + DropDownList5.SelectedValue + "' where Subject='" + DropDownList4.SelectedValue + "'";
            string revert = "Update [User] set Role='Faculty' where Username='" + name + "'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand(sqll, con);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand(revert, con);
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                Label3.Text = DropDownList5.SelectedValue + " Assigned as Faculty Coordinator for " + DropDownList4.SelectedValue;
            }
            catch (Exception E)
            {
                Label1.Text = E.Message.ToString();
            }
            finally
            {
                con.Close();
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = Panel3.Visible=Panel4.Visible=false;
            
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = Panel3.Visible = Panel4.Visible = false;
           
        }

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            int datacount = dv.Count;
            if (datacount > 0)
            {
               // GridView1.DataSource = SqlDataSource3;
                GridView1.Visible = true;
               // GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('No Question Paper Found');</script>");
                GridView1.DataSource = null;
                GridView1.Visible = false;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            Panel1.Visible = Panel2.Visible = Panel4.Visible = false;
            DropDownList4.Items.Clear();
            string sql1 = "select distinct Subject from [Subjects]";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql1, con);
                cmd.CommandType = System.Data.CommandType.Text;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    
                    DropDownList4.Items.Add(reader[0].ToString());
                }
                con.Close();
            }
            catch (Exception E)
            {
                Label3.Text = E.Message.ToString();
            }
            finally
            {
                con.Close();
            }
        }
        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string sql2 = "select * from [User] where Subject='" + DropDownList4.SelectedItem.Text + "' and Role!='FacultyCoordinator'";
            Label3.Text += DropDownList4.SelectedItem.Text+" ";
            DropDownList5.Items.Clear();
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql2, con);
                cmd.CommandType = System.Data.CommandType.Text;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DropDownList5.Items.Add(reader["Username"].ToString());
                }
                Label3.Text += " haha ";
                string cor = "select * from [Subjects] where Subject='" + DropDownList4.SelectedItem.Text + "'";
                
                cmd = new SqlCommand(cor, con);
                cmd.CommandType = System.Data.CommandType.Text;
                reader = cmd.ExecuteReader();
                
                DataTable dt = new DataTable();
                dt.Load(reader);
                if(dt.Rows[0]["Coordinator"].ToString()=="")
                {
                    Label3.Text = "No Coordinator exists for the subject";
                }
                else
                {
                    Label3.Text = "This subject has " + dt.Rows[0]["Coordinator"] + " as Coordinator";
                    name = dt.Rows[0]["Coordinator"].ToString();
                    ViewState["old"]= dt.Rows[0]["Coordinator"].ToString();
                }
                
                con.Close();
            }
            catch (Exception E)
            {
                Label3.Text += E.Message.ToString();
            }
            finally
            {
                con.Close();
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel4.Visible = true;
            Panel1.Visible = Panel2.Visible = Panel3.Visible = false;
            DropDownList3.Items.Clear();
           
                string sql = "Select * from [User] where Username !='Admin'";
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.CommandType = System.Data.CommandType.Text;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    DropDownList3.Items.Add(reader[1].ToString());
                }
                con.Close();
           
        }

        

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
    }
}