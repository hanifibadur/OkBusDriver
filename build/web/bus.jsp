<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
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
        <link href="css/fa/css/font-awesome.css" rel="stylesheet" media="screen,projection">
        <!--  End of CSS  -->
    </head>
    <!--  End of Head  -->
<!--  Body  -->
    <body>
    <%
        String id_po;
        String nama_po;
        if ((session.getAttribute("id_po") == null) || (session.getAttribute("id_po") == "")) {
          response.sendRedirect("index.jsp");
        }

        else {
            id_po = session.getAttribute("id_po").toString();
            nama_po = session.getAttribute("nama_po").toString();
            
            int halaman = 0;
                
            if (request.getParameter("halaman") == null) {
                halaman = 0;
            }

            else {
                halaman = Integer.parseInt(request.getParameter("halaman"));
            }

            int limit = 4;
            int current = (limit * halaman);
            
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost/okbus";
            Connection connection = DriverManager.getConnection(url, "root", "1234");

            Statement statement = connection.createStatement();
            String query = "SELECT * FROM bus INNER JOIN tipe ON bus.id_tipe = tipe.id_tipe WHERE id_po = " + id_po + " ORDER BY bus.id_bus DESC;";
            ResultSet resultSet = statement.executeQuery(query);

            Statement statementTipe = connection.createStatement();
            String queryTipe = "SELECT * FROM tipe;";
            ResultSet resultSetTipe = statementTipe.executeQuery(queryTipe);
            
            resultSet.last();
            int rows = resultSet.getRow();
            int jml_halaman = (int) Math.ceil((double)rows/limit);
            if(current == 0) {
                resultSet.beforeFirst();
            }

            else {
                resultSet.absolute(current);
            }
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
                                    <%=nama_po%> <i class="material-icons right">arrow_drop_down</i>
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
            <table class="highlight bordered">
                <thead>
                    <tr>
                        <th>Id Bus</th>
                        <th>Nama</th>
                        <th>Tipe</th>
                        <th>Fasilitas</th>
                        <th>Kapasitas</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int bus_int = 0;
                        String bus_str = "bus";
                        String bus_idx = "";
                        
                        int c = 0;
                        
                        while(resultSet.next() && c < limit) {
                            c++;
                            bus_idx = bus_str + bus_int;
                    %>
                    <tr>
                        <td><%=resultSet.getString("id_bus")%></td>
                        <td><%=resultSet.getString("nama_tipe")%></td>
                        <td><%=resultSet.getString("tipe_tipe")%></td>
                        <td><%=resultSet.getString("fasilitas_tipe")%></td>
                        <td><%=resultSet.getString("kapasitas_tipe")%></td>
                        <td>
                            <form id="<%=bus_idx%>" method="post" action="DeleteBus">
                                <input type="hidden" name ="id_bus" value="<%=resultSet.getString("id_bus")%>">
                                <a class="btn-floating waves-effect waves-light red tooltipped" data-position="top" data-delay="50" data-tooltip="Hapus" href="javascript:{}" onclick="document.getElementById('<%=bus_idx%>').submit();">
                                    <i class="material-icons">delete</i>
                                </a>
                            </form>
                        </td>
                        <td>
                            <a class="btn-floating waves-effect waves-light green tooltipped" data-position="top" data-delay="50" data-tooltip="Jadwal">
                                <i class="material-icons">date_range</i>
                            </a>
                        </td>
                    </tr>
                    <%
                            bus_int++;
                        }
                    %>
                </tbody>
            </table>
            <!--  Pagination Row  -->
            <div class="row">
                <div class="col s12 center-block">
                    <ul class="pagination">
                        <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
                        <%
                            for(int i = 0; i < jml_halaman; i++) {
                                if(halaman == i) {
                                    out.print("<li class='active'><a href='bus.jsp?halaman=" + i + "'>" + i + "</a></li>");
                                }
                                
                                else {
                                    out.print("<li class='waves-effect'><a href='bus.jsp?halaman=" + i + "'>" + i + "</a></li>");
                                }
                            }
                        %>
                        <!-- <li class="active"><a href="#!">1</a></li> -->
                        <li class="disabled"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                    </ul>
                </div>
            </div>
            <!--  End of Pagination Row  -->
        </div>
        <!--  End of Container  -->
        <!--  Floating Button  -->
        <div class="fixed-action-btn tooltipped" data-position="left" data-delay="50" data-tooltip="Tambah Bus">
            <a class="btn-floating btn-large light-blue waves-effect waves-light modal-trigger" href="#modal-add-bus">
                <i class="material-icons large">add</i>
            </a>
        </div>
        <!--  End of Floating Button  -->
        <!--  Modal Content  -->
        <div id="modal-add-bus" class="modal modal-fixed-footer">
            <form action="AddBus">
                <div class="modal-content">
                    <h5 class="light-blue-text">Tambah Bus</h5>
                    <%
                        int tipe_int = 0;
                        String tipe_str = "tipe";
                        String tipe_idx = "";
                        while(resultSetTipe.next()) {
                            tipe_idx = tipe_str + tipe_int;
                    %>
                    <p>
                        <input name="id_tipe" value="<%=resultSetTipe.getString("id_tipe")%>" type="radio" id="<%=tipe_idx%>" required/>
                        <label for="<%=tipe_idx%>"><%=resultSetTipe.getString("tipe_tipe")%> | <%=resultSetTipe.getString("fasilitas_tipe")%></label>
                    </p>
                    <%
                            tipe_int++;
                        }
                    %>
                </div>
                <div class="modal-footer">
                    <button class="btn waves-effect waves-light light-blue" type="submit">
                        Tambah
                    </button>
                </div>
            </form>
        </div>
        <!--  End of Modal Content  -->
        <!--  Load Scripts  -->
        <script src="js/jquery.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/okbus.js"></script>
        <script src="js/angular.js"></script>
        <script src="js/autohide.js"></script>
	<!--  End of Load Scripts  -->
    <%
        }
    %>
    </body>
    <!--  End of Body  -->
</html>
