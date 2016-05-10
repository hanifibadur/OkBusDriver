<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<!--  Head  -->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <title>OK-BUS</title>
  <!--  CSS  -->
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/dashboard.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/nav.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/mdi/icons.css" rel="stylesheet" media="screen,projection">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
  <!--  End of CSS  -->
</head>
<!--  End of Head  -->
<!--  Body  -->
<body>
  <%
        String id = session.getAttribute("id").toString();
        String nama = session.getAttribute("nama").toString();
        
        String penyewa = "";
        String no_hp = "";
        String asal = "";
        String tujuan = "";
        String kapasitas = "";
        String tipe = "";
        
        String wkt_brgkt = "";
        String tgl_brgkt = "";
        String jam_brgkt = "";
        String wkt_plg = "";
        String tgl_plg = "";
        String jam_plg = "";
        
        Class.forName("com.mysql.jdbc.Driver");
    
        String url = "jdbc:mysql://localhost/okbus";
        Connection connection = DriverManager.getConnection(url, "root", "1234");
        Statement statement = connection.createStatement();
    
        String query = "SELECT m.id, m.asal, m.tujuan, m.wkt_brgkt, m.wkt_plg, m.kapasitas, m.tipe, s.nama, s.no_hp ";
        query += "FROM permintaan AS m, penyewa AS s ";
        query += "WHERE m.id_penyewa = s.id;";
        ResultSet resultSet = statement.executeQuery(query);
  %>
  <!--  Navbar  -->
  <div ng-app='app'>
    <div class='top-menu' ng-class='{ "scrolled" : scrolled }' scroll-class=''>
      <nav class="light-blue" role="navigation">
        <div class="nav-wrapper container">
          <a href="#" class="brand-logo white-text center"><img src="img/okbus_logo_navbar.png"></a>
    			<a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    			<ul class="left hide-on-med-and-down white-text">
            <li class="current tooltipped" data-position="bottom" data-delay="50" data-tooltip="Dashboard">
              <a href="#!">
                <i class="material-icons">dashboard</i>
              </a>
            </li>
            <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Bus">
              <a href="bus.jsp">
                <i class="material-icons">airport_shuttle</i>
              </a>
            </li>
            <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Supir">
              <a href="supir.jsp">
                <i class="material-icons">airline_seat_recline_extra</i>
              </a>
            </li>
          </ul>
          <ul class="right hide-on-med-and-down">
            <li><i class="fa fa-bell"></i></li>
            <!--  Dropdown Trigger  -->
            <li>
              <a class="dropdown-button" data-hover="true" data-beloworigin="true" href="#!" data-activates="dropdown1">
                <%=nama%>
                <i class="material-icons right">arrow_drop_down</i>
              </a>
            </li>
            <!--  End of Dropdown Trigger  -->
            <!--  Dropdown Structure  -->
            <ul id="dropdown1" class="dropdown-content">
              <li><a href="logout.jsp">Sign Out</a></li>
              <li class="divider"></li>
              <li><a href="#!">Setting</a></li>
            </ul>
            <!--  End of Dropdown Structure  -->
          </ul>
          <ul id="nav-mobile" class="side-nav">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Bus</a></li>
            <li><a href="#">Driver</a></li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
  <!--  End of Navbar  -->
  <!--  Container  -->
    <div class="container">
    <div class="content">
      <!--  Content Row  -->
  		<div class="row">
        <!--  ID Panel  -->
  			<div class="col s12 m4">
            <div class="id-panel">
              <div class="id-panel-cover">
                <img src="img/cover-img.png"/>
                <div class="id-panel-ava">
                  <img src="img/kuroko_96.png" alt=""/>
                </div>
              </div>
              <div class="id-panel-content">
                <h5><%=nama%></h5>
                <h6>kontak@abadijaya.co.id</h6>
              </div>
              <div class="id-panel-footer">
                <a class="waves-effect waves-light btn light-blue">
                    Edit Profile
                </a>
              </div>
            </div>
          </div>
          <!--  End of ID Panel  -->
          <!--  Permintaan Panels  -->
          <div class="col s12 m8">
            <!--  Permintaan Individual  -->
            <%
                while(resultSet.next()) {
                penyewa = resultSet.getString("nama");
                no_hp = resultSet.getString("no_hp");
                asal = resultSet.getString("asal");
                tujuan = resultSet.getString("tujuan");
                kapasitas = resultSet.getString("kapasitas");
                tipe = resultSet.getString("tipe");
                
                wkt_brgkt = resultSet.getString("wkt_brgkt");
                wkt_plg = resultSet.getString("wkt_plg");
                tgl_brgkt = wkt_brgkt.split(" ")[0];
                jam_brgkt = wkt_brgkt.split(" ")[1];
                tgl_plg = wkt_plg.split(" ")[0];
                jam_plg = wkt_plg.split(" ")[1];
            %>
            <div class="pm-panel">
              <div class="pm-panel-header">
                <img src="img/aomine_128.png">
                <h5><%=penyewa%></h5>
                <h6>(<%=no_hp%>)</h6>
              </div>
              <div class="pm-panel-content">
                <table>
                  <tr>
                    <td class="head">Tipe</td>
                    <td><%=tipe%></td>
                  </tr>
                  <tr>
                    <td class="head">Asal</td>
                    <td><%=asal%></td>
                  </tr>
                  <tr>
                    <td class="head">Tujuan</td>
                    <td><%=tujuan%></td>
                  </tr>
                  <tr>
                    <td class="head">Berangkat</td>
                    <td>
                        <i class="fa fa-calendar"></i> <%=tgl_brgkt%> &nbsp; <i class="fa fa-clock-o"></i> <%=jam_brgkt%>
                    </td>
                  </tr>
                  <tr>
                    <td class="head">Pulang</td>
                    <td>
                        <i class="fa fa-calendar"></i> <%=tgl_plg%> &nbsp; <i class="fa fa-clock-o"></i> <%=jam_plg%>
                    </td>
                  </tr>
                  <tr>
                      <td class="head">Kapasitas</td>
                      <td><%=kapasitas%> Orang</td>
                  </tr>
                </table>
              </div>
              <div class="pm-panel-footer">
                <a class="waves-effect waves-light btn light-blue">
                    Tawar
  		</a>
              </div>
            </div>
            <!--  End of Permintaan Individual  -->
            <%
                }
            %>
          </div>
          <!--  End of Permintaan Panel  -->
  		</div>
      <!--  End of Content Row  -->
      <!--  Pagination Row  -->
      <div class="row">
        <div class="col s12 l8 offset-l4">
          <ul class="pagination">
              <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
              <li class="active"><a href="#!">1</a></li>
              <li class="waves-effect"><a href="#!">2</a></li>
              <li class="waves-effect"><a href="#!">3</a></li>
              <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
          </ul>
        </div>
      </div>
      <!--  End of Pagination Row  -->
    </div>
	</div>
  <!--  Container  -->
  <!--  Load Scripts  -->
  <script src="js/jquery.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/okbus.js"></script>
  <script src="js/angular.js"></script>
  <script src="js/autohide.js"></script>
	<!--  End of Load Scripts  -->
  </body>
	<!--  End of Body  -->
</html>
