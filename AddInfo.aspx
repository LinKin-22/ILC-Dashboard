<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddInfo.aspx.cs" Inherits="AddInfo" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <%-- Responsive meta tags --%>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <%-- Bootstrap Core CSS and Themes References --%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"/>

    <title>আইএলসি নেটওয়ার্ক মনিটরিং</title>
   
    <%-- Custom css for centering table --%>
    <style>
        tr, th {
            text-align: center;
        }
    </style>

    <%-- Custom CSS File --%>
    <link href="css/footerStyle.css" rel="stylesheet" />

    <%-- Animation CSS --%>
    <link href="css/animate.css" rel="stylesheet" />

</head>

<body>
    <form id="form1" runat="server">
        <header>
		    <div class="container-fluid headerlogo">
			    <div class="row">
				    <div class="col-md-2">
					    <img class="govlogo animated bounceInLeft" src="img/gov_logo.png" />
				    </div>
				    <div class="col-md-8 name fix">
					    <h4>Government of the People's Republic of Bangladesh</h4>
					    <a href="http://sesip.gov.bd">SECONDARY EDUCATION SECTOR INVESTMENT PROGRAM (SESIP)</a>
					    <h4>Directorate of Secondary and Higher Education</h4>
                        <h3>Technical Support for ICT Learning Centers(ILC) Network Operations</h3>
				    </div>
				    <div class="col-md-2">
					    <img class="sesiplogo  animated bounceInRight" src="img/sesip_logo.png" />
				    </div>
			    </div>
		    </div>
	    </header>
        <header>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 headernav">

                        <nav class="navbar navbar-default">

                                <!-- Brand and toggle get grouped for better mobile display -->
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>

                                <!-- Collect the nav links, forms, and other content for toggling -->
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">
                                        <li><a href="Default.aspx">Home<span class="sr-only">(current)</span></a></li>
                                        <li><a href="UserHome.aspx">User Home<span class="sr-only">(current)</span></a></li>
                                        <li class="active" id="addInfoLink"><a href="AddInfo.aspx">Add Information</a></li>
                                        <li id="addUser" visible="false" runat="server"><a href="UserRegistration.aspx">Add User</a></li>
                                        <li><a href="About.aspx">About</a></li>
                                    </ul>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li id="logoutLink" runat="server" visible="true">
                                            <asp:LinkButton ID="logoutLB" OnClick="logoutLB_Click" runat="server">Logout</asp:LinkButton>
                                        </li>
                                        <li>
                                            <a id="user" href="#" runat="server"></a>
                                        </li>
                                    </ul>
                                </div>
                        </nav>

                        <p id="demo" align="right"></p>
                        <script>
                            var d = new Date();
                            document.getElementById("demo").innerHTML = d;
                        </script>

                    </div>
                </div>
            </div>

        </header>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                </div>

                <div style="padding-left: 16px">
                    <h2 style="text-align: center;">স্কুলের তথ্য ডেটাবেজে জমা করুন</h2>
                    <p></p>
                </div>
            </div>
        </div>
             <div class="container fullbody">
		<div class="row">

			<div class="col-xs-12 table-responsive">
			  <table border="2" class="table">
			    <tr class="success table-tr">
			    	<th>স্কুলের নাম</th>
			    	<th>
                        <asp:TextBox ID="schoolNameTB" runat="server" Width="300px"></asp:TextBox>
			    	</th>
			    </tr>
                 <tr class="table-tr">
			    	<td>স্কুল আইডি</td>
                    <td>
                        <asp:TextBox ID="schoolIDTB" runat="server" Width="150px"></asp:TextBox>
                    </td>
			    </tr>
			    <tr  class="table-tr">
			    	<td>ঠিকানা</td>
                    <td>
                        <asp:TextBox ID="addressTB" runat="server" Width="450px"></asp:TextBox>
                    </td>
			    </tr>
                <tr class="table-tr">
                    <td>হেডমাস্টার</td>
                    <td>
                        <asp:TextBox ID="headNameTB" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>ফোন</td>
                    <td>
                        <asp:TextBox ID="headPhoneTB" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>ইমেইল</td>
                    <td>
                        <asp:TextBox ID="headEmailTB" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>আইসিটি ট্রেইনার</td>
                    <td>
                        <asp:TextBox ID="trainerNameTB" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>ফোন</td>
                    <td>
                        <asp:TextBox ID="trainerPhoneTB" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>ইমেইল</td>
                    <td>
                        <asp:TextBox ID="trainerEmailTB" runat="server" Width="300px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="submitBTN" CssClass="btn btn-success" runat="server" Text="সংরক্ষন করুন" OnClick="submitBTN_Click" />
                    </td>
                </tr>
			  </table>

			</div>
		</div>
	</div>

     <footer  class="footerrfix">
		<div class="container-fluid">
			<div class="row">
				<center>
					<br />
					<hr>
					<div class="col-md-12 footer-copyright text-center text-black-50 py-3 footerheight">
					</div>
					<div class="col-md-12 footer-copyright text-center text-black-50 py-3">
						<p class="textcopyright">Copyright 2018 © Secondary Education Sector Investment Program (SESIP)</p>
					</div>
				</center>
			</div>
		</div>
	</footer>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
