<nav class="white">
    <div class="nav-wrapper">
      <a href="<?= base_url() ?>" class="brand-logo center">
        <img src="<?= base_url() ?>asset/images-app/logo.png" alt="" />
      </a>
      <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons black-text">menu</i></a>
      <ul id="nav-mobile" class="right hide-on-med-and-down user-nav">
          <?php
          if($this->session->userdata('nombres')){
          ?>
          <li><a  class="black-text" href="<?= base_url() ?>profile/">
            <div class="chip">
              <?php
              echo 'Hola '.$this->session->userdata('nombres')  ;
              ?>
            </div>
          </a></li>
          <li >
          <a href="<?= base_url() ?>profile/subscription" class="black-text">Mis Subscripciones</a>
          </li >
          <li >
          <a href="<?= base_url() ?>logout" class="black-text">Cerrar sesión</a>
          </li >
          <?php
        }else{
          ?>
          <li >
          <a class="btn blue waves-effect waves-light  modal-trigger" href="#loginModal">Iniciar sesión</a>
          </li>
          <li >
          <a class="btn blue-grey waves-effect waves-light" href="<?= base_url()?>register">Regístrate</a>
          </li>
          <?php } ?>

      </ul>
      <ul class="side-nav" id="mobile-demo">
        <?php
        if($this->session->userdata('nombres')){
        ?>
        <li><a  class="black-text" href="<?= base_url() ?>profile/">
          <div class="chip">
            <?php
            echo 'Hola '.$this->session->userdata('nombres')  ;
            ?>
          </div>
        </a></li>
        <li >
        <a href="<?= base_url() ?>profile/subscription" class="black-text">Mis Subscripciones</a>
        </li >
        <li >
        <a href="<?= base_url() ?>logout" class="black-text">Cerrar sesión</a>
        </li >
        <?php
      }else{
        ?>
        <li >
        <a class="btn blue waves-effect waves-light  modal-trigger" href="#loginModal">Iniciar sesión</a>
        </li>
        <li >
        <a class="btn blue-grey waves-effect waves-light" href="<?= base_url()?>register">Regístrate</a>
        </li>
        <?php } ?>
      </ul>
    </div>
  </nav>
