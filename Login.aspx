<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <%-- Responsive meta tags --%>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <%-- Bootstrap Core CSS and Themes References --%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

    <title>আইএলসি নেটওয়ার্ক মনিটরিং</title>


    <%-- Custom css for centering table --%>
    <style>
        tr, th {
            text-align: center;
        }
    </style>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

    <%-- Custom CSS File --%>
    <link href="css/footerStyle.css" rel="stylesheet" />

    <%-- Animation CSS --%>
    <link href="css/animate.css" rel="stylesheet" />

    <%-- CSS for login form --%>
    <link href="css/login.css" rel="stylesheet" />
    <style>
        body {
            background-color: #ccffe6;
        }
    </style>
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
        <header class="headerfix">
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
                                    <li><a id="userHomeLink" href="UserHome.aspx" runat="server" visible="false">User Home<span class="sr-only">(current)</span></a></li>
                                    <li><a id="addinfoLink" href="AddInfo.aspx" runat="server" visible="false">Add Information<span class="sr-only">(current)</span></a></li>
                                    <li><a href="About.aspx">About</a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="active">
                                        <a href="Login.aspx">Login</a>
                                    </li>
                                    <li>
                                        <a id="user" href="#" runat="server"></a>
                                    </li>
                                </ul>
                            </div>
                            <!-- /.navbar-collapse -->
                        </nav>
                    </div>
                    <!-- /.container-fluid -->

                    <p id="date" align="right"></p>
                    <script>
                        var d = new Date();
                        document.getElementById("date").innerHTML = d;
                    </script>
                </div>
            </div>


        </header>
        <div class="container">
            <div class="row">
                <div class="wrapper">
                    <div class="form-signin fixlogin headerlogin">
                        <h2 class="form-signin-heading">লগইন করুন</h2> 
                    </div>
                    <div class="form-signin fixlogin">
                        <input type="text" class="form-control" id="usernameTB" name="username" placeholder="ইউজার নেম" required="" autofocus="" runat="server" />
                        <br />
                        <input type="password" class="form-control" id="passwordTB" name="password" placeholder="পাসওয়ার্ড" required="" runat="server" />
                        <br />
                        <asp:Button ID="submitBTN" class="btn btn-lg btn-primary btn-block" runat="server" Text="লগইন" OnClick="submitBTN_Click" />
                    </div>
                </div>
            </div>
        </div>

        <footer class="footerrfix">
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
