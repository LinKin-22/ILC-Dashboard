<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateInfo.aspx.cs" Inherits="UpdateInfo" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <%-- Responsive meta tags --%>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" />

    <title>আইএলসি নেটওয়ার্ক মনিটরিং</title>
   
    <%-- Custom css for centering table --%>
    <style>
        tr, th {
            text-align: center;
        }
    </style>

    <%-- Custom CSS File --%>
    <link rel="stylesheet" type="text/css" href="css/style.css" />

</head>

<body>
    <form id="form1" runat="server">
        <header>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 headernav">

                        <nav class="navbar navbar-default">
                            <div class="container-fluid">
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
                                        <li class="active"><a href="#">Home<span class="sr-only">(current)</span></a></li>
                                        <li><a href="#">About</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin<span class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">ILC Information</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">SESIP</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">Others</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li><a href="#">Contact</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Log-In<span class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">ILC Information</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">SESIP</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.navbar-collapse -->
                            </div>
                            <!-- /.container-fluid -->
                        </nav>

                        <p id="date" align="right"></p>
                        <script>
                            var d = new Date();
                            document.getElementById("date").innerHTML = d;
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
                    <h2 style="text-align: center;">স্কুলের তথ্য হালনাগাদ</h2>
                    <p></p>
                </div>
            </div>
        </div>

     <div class="container fullbody">
		<div class="row">

			<div class="col-xs-12 table-responsive">
			  <table border="2" class="table">
			    <tr class="success table-tr">
			    	<th rowspan="2">স্কুল আইডি</th>
			    	<th>
                        <asp:TextBox ID="searchSchoolIDTB" runat="server" Width="150px"></asp:TextBox>
			    	</th>
			    </tr>
                <tr class="success table-tr">
			    	<th>
                        <asp:Button ID="searchBTN" runat="server" Text="খুঁজুন" OnClick="searchBTN_Click" />
			    	</th>
			    </tr>
			  </table>

			</div>
		</div>
	</div>
     <div class="container fullbody">
		<div class="row">

			<div class="col-xs-12 table-responsive">
			  <table id="schooldetails" border="2" class="table" runat="server" Visible="False">
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
                        <asp:Button ID="updateBTN" runat="server" Text="আপডেট করুন" OnClick="updateBTN_Click" />
                    </td>
                </tr>
			  </table>

			</div>
		</div>
	</div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
