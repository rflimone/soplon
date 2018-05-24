<section>
  <div class="container">
    <div class="row">
      <div class="col s12">
        <h5>Regístrate</h5>
        <div class="row">
            <form class="col s12" id="formRegister" action="<?= base_url() ?>register/new" method="post">
              <div class="row">
                <div class="input-field col s6">
                  <input placeholder id="first_name" name="first_name" type="text" class="validate">
                  <label for="first_name">Nombres</label>
                </div>
                <div class="input-field col s6">
                  <input placeholder id="last_name" name="last_name" type="text" class="validate">
                  <label for="last_name">Apellido Paterno</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s6">
                  <input placeholder="" id="last_name2" name="last_name2" type="text" class="validate">
                  <label for="first_name">Apellido Materno</label>
                </div>
                <div class="input-field col s6">
                  <input placeholder id="number_phone" name="number_phone" type="text" class="validate">
                  <label for="last_name">Nro. telefono</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s12">
                  <input placeholder id="password" name="password" type="password" class="validate">
                  <label for="password">Password</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s12">
                  <input placeholder id="email" name="email" type="email" class="validate">
                  <label for="email">Email</label>
                </div>
              </div>
              <div class="row">
                <div class="col s12">
                  <a href="javascript:validateFormRegister();" class="btn blue">Registrarme</a>

                </div>
              </div>
            </form>
          </div>
      </div>
    </div>
  </div>
</section>

<script type="text/javascript">
  function validateFormRegister(){
    //calidamos campos
    if(!$("#first_name").val()){
      Materialize.toast('El nombre es obligatorio', 3000);
      $("#first_name").focus()
      return false;
    }
    if(!$("#last_name").val()){
      Materialize.toast('El Apellido paterno es obligatorio', 3000);
      $("#last_name").focus()
      return false;
    }
    if(!$("#last_name2").val()){
      Materialize.toast('El Apellido materno es obligatorio', 3000);
      $("#last_name2").focus()
      return false;
    }
    if(!$("#number_phone").val()){
      Materialize.toast('El nro. telefonico es obligatorio', 3000);
      $("#number_phone").focus()
      return false;
    }
    if(!$("#password").val()){
      Materialize.toast('La contraseña es obligatoria', 3000);
      $("#password").focus()
      return false;
    }
    if(!$("#email").val()){
      Materialize.toast('El email es obligatorio', 3000);
      $("#email").focus()
      return false;
    }

    $("#formRegister").submit();
  }
</script>
