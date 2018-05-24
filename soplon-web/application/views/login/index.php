<!-- Modal Structure -->
  <div id="loginModal" class="modal">
    <div class="modal-content">
      <div class="row">
        <div class="col s12 m12 l12 center">
          <h4>Bienvenido a Soplón</h4>
          <br><br>
        </div>
        <div class="col s12 m3 l3">&nbsp;</div>
        <div class="col s12 m6 l6">
          <div class="row">
          <div class="input-field col s12">
            <input placeholder="Ingresa tu email" id="email" type="text" class="validate">
            <label for="first_name">Email</label>
          </div>
          <div class="input-field col s12">
            <input placeholder="Ingresa tu contraseña" id="password" type="password" class="validate">
            <label for="last_name">Contraseña</label>
          </div>
          <div class="input-field col s12">
            <a href="javascript:login();" class="btn blue lighting-1 waves-block">Ingresar</a>
          </div>
        </div>
        </div>
        <div class="col s12 m3 l3">&nbsp;</div>
      </div>
    </div>
    <div class="modal-footer">
      <a  class="modal-close waves-effect waves-green btn-flat">cancelar</a>
    </div>
  </div>

  <script type="text/javascript">
  function login(){
    if(!$("#email").val()){
       Materialize.toast('El campo usuario es obligatorio', 3000);
      return false;
    }
    if(!$("#password").val()){
      Materialize.toast('El campo contraseña es obligatorio', 3000);
      return false;
    }

    $.ajax({
      url : '<?= base_url() ?>/verify/account',
      type: 'post',
      dataType: 'json',
      data: {
        email : $("#email").val(),
        password: $("#password").val()
      },
      success: function(response){
        if(response.status === 'ok'){
          location.reload();
        }else{
          Materialize.toast('El email o la contraseña no coincide.', 3000);
        }
      }
    });
  }
  </script>
