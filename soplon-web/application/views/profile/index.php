<section>
  <div class="container">
    <div class="row">
      <div class="col s12">
        <h5>Mis Perfil</h5>
        <hr>
        <br>
        <h5><small>Nombre: </small> <?= strtoupper($user_info['nombres'] . ' ' .$user_info['apellido_paterno'] . ' ' .$user_info['apellido_materno'] )?></h5>
        <h5><small>Email: </small> <?= strtoupper($user_info['email'])?></h5>
        <h5><small>Nro. celular: </small> <?= $user_info['celular'] ?></h5>
      </div>
    </div>
  </div>
</section>
