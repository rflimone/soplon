<section>
  <div class="container">
    <div class="row">
    <?php
    $msj = false;
    if(isset($_GET['success'])){
      $msj = "Información actualizada";
      $class = "teal";
    }

    if(isset($_GET['error'])){
      $msj = "Error al actualizar";
      $class = "red";
    }

    if($msj){

      ?>
      <div class="row">
        <div class="col s12 center"> <h5 class="<?= $class ?> white-text"><?= $msj ?></h5> </div>
      </div>
      <?php
    }
    ?>
      <div class="col s3">&nbsp;</div>
      <div class="col s6">
        <h4>Mi Perfil</h4>
        <div class="row">
          <form class="col s12" action="<?= base_url() ?>app/profile/save_change_profile" method="post">
            <div class="row">
              <div class="input-field col s12">
                <input id="first_name" name="nombres" type="text" class="validate" value="<?= strtoupper($user_info['nombres']) ?>">
                <label for="first_name">Nombre</label>
              </div>
              <div class="input-field col s6">
                <input id="last_name_1" name="apellido_paterno" type="text" class="validate" value="<?= strtoupper($user_info['apellido_paterno']) ?>">
                <label for="last_name">Apellido paterno</label>
              </div>
              <div class="input-field col s6">
                <input id="last_name_2" name="apellido_materno" type="text" class="validate" value="<?= strtoupper($user_info['apellido_materno']) ?>">
                <label for="last_name">Apellido materno</label>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12">
                <input id="celular" name="celular" type="text" class="validate" value="<?= $user_info['celular'] ?>">
                <label for="password">Nro Celular</label>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12">
                <input id="email" name="email" type="email" class="validate" value="<?= strtoupper($user_info['email']) ?>">
                <label for="email">Email</label>
              </div>
            </div>
            <div class="row">
              <div class="input-field col s12">
                <input id="save_profile" type="submit" class="btn waves-block" value="Guardar cambios">
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="col s3">&nbsp;</div>
    </div>
  </div>
</section>
