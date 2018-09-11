<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

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
                                    <li><a id="addinfoLink" href="AddInfo.aspx" runat="server" visible="false">Add Information</a></li>
                                    <li visible="false" id="addUser" runat="server"><a href="UserRegistration.aspx">Add User</a></li>
                                    <li class="active"><a href="About.aspx">About</a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li id="loginLink" runat="server" visible="true">
                                        <a href="Login.aspx">Login</a>
                                    </li>
                                    <li id="logoutLink" runat="server" visible="false">
                                        <asp:LinkButton ID="logoutLB" OnClick="logoutLB_Click" runat="server">Logout</asp:LinkButton>
                                    </li>
                                    <li>
                                        <a id="user" href="#" runat="server"></a>
                                    </li>
                                </ul>
                            </div>
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
        <div class="container aboutbody">
            <div class="row">
                <div class="col-md-12 fixabout" style="border: 2px solid;">
                    <h2 class="left_title">About SESIP</h2>
                    <p class="about_content" style="text-align: justify;">Bangladesh has achieved significant economic growth with impressive progress in human development indicators in the past decades. This achievement and pace of development need to be further intensified and streamlined in a planned manner to meet the target of achieving the status of middle income country by 2021 as set forth in Vision 2021. In order to build up an efficient system of more dynamic economy by 2021, it is imperative to reduce the poverty rate, where investing in the right type of education is the key to reduce poverty. A more relevant secondary education system can serve the nation by providing semi-skilled, skilled and vocationally trained workers who can serve the fast growing domestic market as well as emerging niche markets at home and abroad and thereby help the nation to attain the targets of achieving the status of middle income country in stipulated time.</p>
                    <p class="about_content" style="text-align: justify;">The Secondary Education Sector Investment Program (2013-2023) in Bangladesh is designed with the assistance of ADB to achieve a more relevant secondary education in terms of quality, efficiency and equity through developing the secondary education sector as a whole. The program is prepared to facilitate the implementation guidelines and directives regarding secondary education as set forth in the National Education Policy 2010 as well as in achieving the targets predetermined in Vision 2021. It will make secondary education more relevant to job market by promoting efficient management, education quality and retention of students at secondary level.</p>
                    <p class="about_content" style="text-align: justify;">This program is undertaken as a follow-up initiative of previous ADB assisted programs i.e. SEDP, SESDP, SESIP &amp; TQI to ensure the continuity of various reforms in the field of curriculum , teachers’ capacity, examination &amp; assessment , ICT based pedagogy, decentralized management, EMIS, planning , management &amp; coordination including infrastructure improvement etc.</p>
                    <p class="about_content" style="text-align: justify;">The Ministry of Education (MoE) is the executing agency of SESIP whereas the Directorate of Secondary and Higher Education (DSHE) acts as the implementing agency. The other co-implementing agencies involved in implementation include National Academy for Education Management (NAEM), Boards of Intermediate and Secondary Education (BISE), National Curriculum and Textbook Board (NCTB) , Education Engineering Department (EED) , Directorate of Inspection and Audit (DIA), Non-Government Teachers’ Registration &amp; Certification Authority (NTRCA) ,  Bangladesh Bureau of Educational Information and Statistics (BANBEIS) including Bangladesh Madrasha Education Board (BMEB). The location of the program is all over Bangladesh.</p>
                    <p class="about_content" style="text-align: justify;">The highest level of oversight of the program lays on the Inter-Ministerial Sector Program Steering Committee (SPSC) lead by the Secretary, MoE with DG, DSHE as the Member Secretary. The Sector Program Implementation Committee (SPIC) headed by DG, DSHE acts as the second level implementation and supervision committee. The third level of facilitation is a Sector Program Support Unit (SPSU) comprising of management team lead by Program Director (Ex-officio DG, DSHE) supported by JPD with designated officials and staff including technical assistance team.</p>
                    <p class="about_content" style="text-align: justify;">Using a Multi-trench Financing Facility (MFF) mode, SESIP will support secondary education in Bangladesh over 10 years in three tranches overlapped; the program is designed in line with the Sector-Wide Approach (SWAp) roadmap that aims at strengthening regular functions of MoE and DSHE by keeping uniformity in managing the huge number of scattered projects &amp; programs and thereby minimizing the resource misuse.</p>
                    <p class="about_content">The total revised program financing is $ 185,000,000 from ADB and $ 2949 million from GoB involving Trench I &amp; II.</p>
                </div>

                <div class="col-xs-12">
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

