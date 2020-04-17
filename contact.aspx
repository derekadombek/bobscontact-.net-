<%@ Page Language="C#" Debug="true" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<!--

Original Author:Derek Dombek
Date Created:08-22-19
Version:contact layout
Date Last Modified:01-24-20
Modified by:Derek Dombek
Modification log:adjusted things for the database.
 
-->
<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "bobscontact"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC InsertVisitor @nameTextBox, @emailTextBox, @ddl, @msgTextBox, 1", conn);
            comm.Parameters.Add("@nameTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@nameTextBox"].Value = name.Text;
            comm.Parameters.Add("@emailTextBox", System.Data.SqlDbType.NChar, 50);
            comm.Parameters["@emailTextBox"].Value = email.Text;
            comm.Parameters.Add("@ddl", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@ddl"].Value = tours.SelectedValue;
            comm.Parameters.Add("@msgTextBox", System.Data.SqlDbType.NChar, 200);
            comm.Parameters["@msgTextBox"].Value = message.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                //Response.Redirect("thankyou.html");
                dbErrorMessage.Text =
                   "added the following visitor: " + name.Text;
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
<meta charset="utf-8"/>
<meta name="description" content="Enjoy the best fishing with the Best Fishing Guide in the country!"/>
<meta name="keywords" content="Fishing Guide, Fishing Tours, Marlin, Snook, Hog Fish, Mahi Mahi, Jack, Tarpon, King Fish, Stuart, Jensen Beach, South Florida"/>
<meta name="author" content="Derek Dombek"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>Contact</title>
<!--===============================================================================================-->

<!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css"/>
<!--===============================================================================================-->



<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/styles.css"/>
<link rel="stylesheet" href="css/hamburger.css"/>
<link rel="stylesheet" href="css/contact.css"/>
<link rel="stylesheet" href="css/menuAnimate.css"/>
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
<link rel="apple-touch-icon" sizes="180x180" href="images/apple-touch-icon.png"/>
<link rel="icon" type="image/png" sizes="32x32" href="images/favicon-32x32.png"/>
<link rel="icon" type="image/png" sizes="16x16" href="images/favicon-16x16.png"/>
<link rel="manifest" href="images/site.webmanifest"/>

	<link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<!--<script src="js/formsubmit.js"></script>-->

</head>

<body>
        
    <header class="topbar"> 
       <!--social media layout-->
            <div class="mediaContainer">
                    
                    
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-twitter"></a>
                </div>
        <a href="weekOneProject.html"><img src="images/bobfishinglogo.png" class="mainlogo" alt="icon logo"/></a>
<!-- below I created a div to keep the hamburger on the same bar as the desktop nav bar-->
        <div class="blue-bar">
            <nav class="hamburger-horizontal">   
            <a id="hamburger" href="#" ><img src="images/navicon.png" alt="menu image"/></a>
                <ul class="sub-menu">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="tours.html">Tours</a></li>
                    <li><a href="about.html">About Bob</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li><a href="login.php">Admin</a></li>
                </ul>
            </nav>
            <nav class="main-menu" id="animateMenu">  
                <ul >
                    <li><a href="index.html">Home</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li><a href="about.html">About Bob</a></li>
                    <li><a href="tours.html">Tours</a></li>
                    <li><a href="login.php">Admin</a></li>
                </ul>
            </nav>  
        </div>
    </header>

    <article>
            <header>
                    <h1>Contact Bob for a tour!</h1><br/>
            </header>
        </article>

        <!-- new form made with bootstrap-->
    <section id="form">
        
        <form class="contact100-form validate-form" method="post" runat="server">
            <div class="form-column">
                        
                <div class="col-md-5 mb-3">
 
                    <div class="wrap-input100 validate-input" data-validate="Name is required">
                        <!--<input id="name" class="input100" type="text" name="name" placeholder="Enter your name"/>-->
                         <%--<input type="text" name="name" id="name"/>--%>
      <asp:TextBox ID="name" runat="server" />

                    </div>
                </div>
                
                    <div class="col-md-5 mb-3">
                            
                        <div class="input-group">
                            <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                                <input id="mail" class="input100" type="text" name="email" placeholder="Enter your email" />
                                 <%--<input type="text" name="email" id="email"/>--%>
       <asp:TextBox ID="email" runat="server" />

                            </div>
                            
                            
                        </div>
                    </div>
                        
                    <div class="col-md-5 mb-3">
                                    
                                    
                        <!--<select id="tours" name="services" size="3">
                            <option value="1" >Deep Sea fishing</option>
                            <option value="2">Intercoastal fishing</option>
                            <option value="3">Spear fishing</option>
                        </select>-->
                        <asp:DropDownList ID="tours" runat="server">
                            <asp:ListItem Value="1">Deep Sea Fishing</asp:ListItem>
                            <asp:ListItem Value="2">Intercoastal Fishing</asp:ListItem>
                            <asp:ListItem Value="3">Spear Fishing</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-5 mb-4">
                        <!--<textarea name="message" class="form-control" placeholder="Drop a line!" id="message" cols="45" rows="5"></textarea>-->
                         <%--<input type="text" name="email" id="email"/>--%>
       <asp:TextBox ID="message" runat="server" />

                    </div>
                  
            </div>

               <!-- <button class="btn btn-primary" type="submit">Submit</button>-->
             <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
<br />
        <asp:Label ID="dbErrorMessage" runat="server"></asp:Label>


                <!--<button class="btn btn-primary" type="reset">Reset</button>-->
        </form>
              
              
              
    </section>    
    <div id="dropDownSelect1"></div>
    



    <footer>
        <p>
            <a href="tel:17723331777">(772) 333-1777</a><br/>
            <a href="mailto:Bobsfishing9@gmail.com">Bobsfishing@gmail.com</a><br/><br/>
            <span style="color:rgb(226, 134, 59);">2019</span> &copy; <a href="index.html" class="copyright">Bob's Fishing Tours</a>. All Rights Reserved.
        </p>
    </footer>

</body>
</html>
