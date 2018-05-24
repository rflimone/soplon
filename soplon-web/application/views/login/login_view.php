<?php
 /**
 * componente de navegador
 *
 */
 $active_dashboard = $active == 'dashboard' ? 'active' : 'false';
 $active_product   = $active == 'product' ? 'active' : 'false';
 $active_category  = $active =='category' ? 'active' : 'false';

 $blue = true;
 $color_nav = $blue ? '#5c8bcc' : '#783CBD';
?>
<style media="screen">
  header,main,footer {
        padding-left: 0px !important;
  }
</style>
<header>
  <div class="fixed-announcement">
    <div class="announcement hide">
      <div class="container center">1.0 alpha has been released!</div>
    </div>
  </div>
  <nav class="top-nav " style="background-color: <?= $color_nav ?> !important;box-shadow:0 0 0 0 !important;">
    <div class="container">
      <div class="nav-wrapper">
        <a class="page-title" style="font-weight:300;">
          <?= $this->config->item('name_app') ?>
        </a>
        <ul id="nav-mobiles" class="right hide-on-med-and-down">
        <li class="white-text" style="font-weight:200; font-size:13px !important; text-align:right;">

        </li>
      </ul>
      </div>
    </div>
  </nav>
</header>
<main>

  <div class="container">
    <div class="row">
      <div class="col s12 m4 l4">&nbsp;</div>
      <div class="col s12 m4 l4">
        <br/>
        <div class="card-panel">
          <span class="grey-text text-darken-2 center">
            Acceso administración
          </span>
          <div class="row">
            <br/>
            <br/>
            <div class="input-field col s12">
              <input type="text" class="" id="username">
              <label for="email">Usuario</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <input type="password" class="validate" id="password">
              <label for="password">Contraseña</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <a href="javascript:login();"
                 class="btn btn-flat blue white-text waves-effect waves-light"
                 style="width:100%;">Entrar</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col s12 m4 l4">&nbsp;</div>
    </div>
  </div>
  <script type="text/javascript">
    function login(){
      if(!$("#username").val()){
        swal('','El campo usuario es obligatorio','warning');
        return false;
      }
      if(!$("#password").val()){
        swal('','El campo contraseña es obligatorio','warning');
        return false;
      }

      $.ajax({
        url : '<?= base_url() ?>/verify/account',
        type: 'post',
        dataType: 'json',
        data: {
          username : $("#username").val(),
          password: $("#password").val()
        },
        success: function(response){
          if(response.status === 'ok'){
            location.href = '<?= base_url() ?>dashboard';
          }else{
            swal('','El usuario o contraseña no coinciden', 'warning');
          }
        }
      });
    }
  </script>
