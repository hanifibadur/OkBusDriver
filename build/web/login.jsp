<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!--  Head  -->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
    <title>Login</title>
    <!--  CSS  -->
    <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/login.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  	<link href="css/mdi/icons.css" rel="stylesheet" media="screen,projection">
    <!--  End of CSS  -->
  </head>
  <!--  End of Head  -->
  <!--  Body  -->
  <body>
    <div class="container">
      <form action="login_process.jsp">
        <div class="login-panel">
          <div class="login-panel-logo">
            <img src="img/okbus_logo.png" alt="">
          </div>
          <div class="login-panel-content">
            <div class="login-panel-header">
              Silahkan Masuk
            </div>
            <div class="login-panel-form">
              <div class="container">
                <div class="row">
                  <div class="input-field col s12">
                    <input type="text" placeholder="username" name="username">
                  </div>
                </div>
                <div class="row">
                  <div class="input-field col s12">
                    <input type="password" placeholder="password" name="password">
                  </div>
                </div>
              </div>
            </div>
            <div class="login-panel-footer">
              <button class="btn waves-effect waves-light light-blue center-align" type="submit" name="action">
                Masuk
              </button>
              <br>
              <a class="modal-trigger" href="#modal1">Belum Punya Akun?</a>
            </div>
          </div>
        </div>
      </form>
    </div>
    <!-- Modal Structure -->
    <div id="modal1" class="modal">
      <div class="modal-content">
        <h4 class="light-blue-text">Akun Baru</h4>
        <form action="">
          <div class="row">
            <div class="input-field col s12 m6">
              <label>Nama</label>
              <input type="text" placeholder="..." name="" required>
            </div>
            <div class="input-field col s12 m6">
              <label>Username</label>
              <input type="text" placeholder="..." name="" required>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12 m6">
              <label>Email</label>
              <input type="text" placeholder="..." name="" required>
            </div>
            <div class="input-field col s12 m6">
              <label>Password</label>
              <input type="text" placeholder="..." name="" required>
            </div>
          </div>
            <div class="row">
              <button class="btn waves-effect waves-light light-blue center-align" type="submit" name="action">
                Daftar
              </button>
            </div>
        </form>
      </div>
    </div>
    <!--  Load Scripts  -->
    <script src="js/jquery.min.js"></script>
    <script src="js/materialize.js"></script>
    <script src="js/okbus.js"></script>
  	<!--  End of Load Scripts  -->
  </body>
  <!--  End of Body  -->
</html>
