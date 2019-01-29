<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PickUp.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Pick Up</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<script type = "text/javascript" >
                    function disableBackButton()
                    {
                    window.history.forward();
                    }
setTimeout("disableBackButton()", 0);
</script>


</head>
<body onload="disableBackButton()">

 <div class="grid-block embed-responsive-16by9" style="background-image: url('/Imagenes/Login.jpg') ;background-repeat: no-repeat; background-attachment:fixed; background-size: cover; width: 100%; height: 100vh; ">     

     l
    

     <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">Iniciar sesión <i class="fas fa-sign-in-alt"></i></h5>
            <form class="form-signin" runat="server">
              <div class="form-label-group">
                    <asp:TextBox ID="txt_Usuario" class="form-control form-control-lg rounded-0" runat="server"></asp:TextBox>
                <label for="inputEmail">Usuario</label>
              </div>

              <div class="form-label-group">
             <asp:TextBox ID="txt_Password" TextMode="Password"  class="form-control form-control-lg rounded-0" runat="server"></asp:TextBox>
                <label for="inputPassword">Contraseña</label>
              </div>

         
              <button class="btn btn-lg btn-primary btn-block text-uppercase" runat="server" onserverclick="btnLogin_ServerClick" id="btnLogin" type="submit">Entrar <i class="fas fa-key"></i></button>

      
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
<div class=" text-center align-content-end align-text-bottom">
<strong> Developed By MArio Rosales Figueroa © Copyright World Transport International Ltda. All Rights Reserved 2018. </strong>

</div>
   

</div>
</body>
</html>
