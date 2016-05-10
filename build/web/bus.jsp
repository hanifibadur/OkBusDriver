<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<!--  Head  -->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
  <title>Bus</title>
  <!--  CSS  -->
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/supirbus.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/nav.css" type="text/css" rel="stylesheet" media="screen,projection"/>
	<link href="css/mdi/icons.css" rel="stylesheet" media="screen,projection">
  <!--  End of CSS  -->
</head>
<!--  End of Head  -->
<!--  Body  -->
<body>
  <%
      String id = session.getAttribute("id").toString();
      String nama = session.getAttribute("nama").toString();
  %>
  <!--  Navbar  -->
  <div ng-app='app'>
    <div class='top-menu' ng-class='{ "scrolled" : scrolled }' scroll-class=''>
      <nav class="light-blue" role="navigation">
        <div class="nav-wrapper container">
          <a href="#" class="brand-logo white-text center"><img src="img/okbus_logo_navbar.png"></a>
    			<a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    			<ul class="left hide-on-med-and-down white-text">
            <li class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Dashboard">
              <a href="dashboard.jsp">
                <i class="material-icons">dashboard</i>
              </a>
            </li>
            <li class="current tooltipped" data-position="bottom" data-delay="50" data-tooltip="Bus">
              <a href="!#">
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
    <div class="judul">
      <h3 class="light-blue-text center">Daftar Bus</h3>
    </div>
    <table class="highlight">
        <thead>
          <tr>
            <th>Id</th>
            <th>Nama</th>
            <th>Tipe</th>
            <th>Kapasitas</th>
            <th>Fasilitas</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>3</td>
            <td>Oka-san no Doa</td>
            <td>B3210</td>
            <td>50</td>
            <td>WC, Warkop, TV, DVD</td>
            <td>
              <a class="btn-floating waves-effect waves-light red tooltipped"
              data-position="top" data-delay="50" data-tooltip="Hapus">
                <i class="material-icons">delete</i>
              </a>
              <a class="btn-floating waves-effect waves-light yellow darken-2 tooltipped"
              data-position="top" data-delay="50" data-tooltip="Edit">
                <i class="material-icons">create</i>
              </a>
              <a class="btn-floating waves-effect waves-light green tooltipped"
              data-position="top" data-delay="50" data-tooltip="Jadwal">
                <i class="material-icons">date_range</i>
              </a>
            </td>
          </tr>
          <tr>
            <td>3</td>
            <td>Oka-san no Doa</td>
            <td>B3210</td>
            <td>50</td>
            <td>WC, Warkop, TV, DVD</td>
            <td>
              <a class="btn-floating waves-effect waves-light red tooltipped"
              data-position="top" data-delay="50" data-tooltip="Hapus">
                <i class="material-icons">delete</i>
              </a>
              <a class="btn-floating waves-effect waves-light yellow darken-2 tooltipped"
              data-position="top" data-delay="50" data-tooltip="Edit">
                <i class="material-icons">create</i>
              </a>
              <a class="btn-floating waves-effect waves-light green tooltipped"
              data-position="top" data-delay="50" data-tooltip="Jadwal">
                <i class="material-icons">date_range</i>
              </a>
            </td>
          </tr>
          <tr>
            <td>3</td>
            <td>Oka-san no Doa</td>
            <td>B3210</td>
            <td>50</td>
            <td>WC, Warkop, TV, DVD</td>
            <td>
              <a class="btn-floating waves-effect waves-light red tooltipped"
              data-position="top" data-delay="50" data-tooltip="Hapus">
                <i class="material-icons">delete</i>
              </a>
              <a class="btn-floating waves-effect waves-light yellow darken-2 tooltipped"
              data-position="top" data-delay="50" data-tooltip="Edit">
                <i class="material-icons">create</i>
              </a>
              <a class="btn-floating waves-effect waves-light green tooltipped"
              data-position="top" data-delay="50" data-tooltip="Jadwal">
                <i class="material-icons">date_range</i>
              </a>
            </td>
          </tr>
        </tbody>
      </table>
      <!--  Pagination Row  -->
      <div class="row">
        <div class="col s12 center-block">
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
  <!--  End of Container  -->
  <!--  Floating Button  -->
  <div class="fixed-action-btn tooltipped" data-position="left" data-delay="50" data-tooltip="Tambah Bus">
    <a class="btn-floating btn-large light-blue waves-effect waves-light">
      <i class="material-icons large">add</i>
    </a>
  </div>
  <!--  End of Floating Button  -->
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
