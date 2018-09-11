<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <%-- Responsive meta tags --%>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
    <%-- To refresh the page after 900 seconds --%>
    <meta http-equiv="refresh" content="900"/>

    <%-- Bootstrap Core CSS and Themes References --%>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link href="css/bootstrap-theme.css" rel="stylesheet" />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"/>

    <title>আইএলসি নেটওয়ার্ক মনিটরিং</title>
    
    <%-- JS Map API --%>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBkZScUN1Kxcpl9CSAnHxncPbKeW2oMCq0" type="text/javascript"></script>

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
                                        <li class="active"><a href="Default.aspx">Home<span class="sr-only">(current)</span></a></li>
                                        <li><a id="userHomeLink" href="UserHome.aspx" runat="server" visible="false">User Home</a></li>
                                        <li><a id="addinfoLink" href="AddInfo.aspx" runat="server" visible="false">Add Information</a></li>
                                        <li id="addUser" visible="false" runat="server"><a href="UserRegistration.aspx">Add User</a></li>
                                        <li><a href="About.aspx">About</a></li>
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
                                <!-- /.navbar-collapse -->

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
                    <h2 align="center">ILC Dashboard on Google map</h2>
                    <p></p>
                </div>
            </div>
        </div>

        <div>
            <p hidden="hidden" id="information" runat="server"></p>
            <p hidden="hidden" id="st" runat="server"></p>
            <p hidden="hidden" id="ilcid" runat="server"></p>
            <p hidden="hidden" id="activepc" runat="server"></p>
        </div>
        <div class="container-fluid">
            <div class="row">
                <center>

				<div class="mapContainer">
				    <div id="map" style="width: auto; height: 500px; border: 2px solid;"></div>
				</div>

			</center>
            </div>
        </div>

        <script type="text/javascript">
            
            //Retrieving value from the hidden elements passed from backend
            var array = document.getElementById("information").innerHTML;
            var array2 = document.getElementById("st").innerHTML;
            var idarray = document.getElementById("ilcid").innerHTML;
            var activearray = document.getElementById("activepc").innerHTML;

            var newarray = array.split(",");
            var newarray2 = array2.split(",");
            var newidarray = idarray.split(",");
            var newactive = activearray.split(",");

            function listToMatrix(list, elementsPerSubArray) {
                var matrix = [], i, k;
                for (i = 0, k = -1; i < list.length; i++) {
                    if (i % elementsPerSubArray === 0) {
                        k++;
                        matrix[k] = [];
                    }

                    matrix[k].push(list[i]);
                }
                return matrix;
            }
            var matrix = listToMatrix(newarray, 3);
            var matrix2 = listToMatrix(newarray2, 1);
            var idmatrix = listToMatrix(newidarray, 1);
            var activematrix = listToMatrix(newactive,1);

            var ilcid = idmatrix;
            var stts = matrix2;
            var locations = matrix;
            var activepc = activematrix;

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 12,
                center: new google.maps.LatLng(23.757278, 90.3894735),
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            var infowindow = new google.maps.InfoWindow();

            var marker, i;

            for (i = 0; i <= locations.length; i++) {
                var schoolname = locations[i][0];
                if (stts[i][0] === "True") {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(Number(locations[i][1]), Number(locations[i][2])),
                        map: map,
                        title: schoolname,
                        icon: 'img/green.png'
                    });
                }

                else {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(Number(locations[i][1]), Number(locations[i][2])),
                        map: map,
                        title: schoolname,
                        icon: 'img/red.png'
                    });
                }


                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                    return function () {
                        var inactive = 21-activepc[i][0];
                        infowindow.setContent("<strong>" + locations[i][0] + "</strong><br /> সক্রিয় ল্যাপটপঃ <strong>" + activepc[i][0] + "</strong> <br /> নিষ্ক্রিয় ল্যাপটপঃ <strong>" + inactive + "</strong> <br /><a href='SchoolDetails.aspx?ID=" + ilcid[i][0] + "'>স্কুলের বিস্তারিত তথ্য</a>");
                        infowindow.open(map, marker);
                    }
                })(marker, i));
            }

        </script>


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

