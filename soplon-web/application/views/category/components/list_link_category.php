
<section>
  <div class="container">
    <div class="row">
      <div class="col s12 m7 l7">
        <br>
        <h5>Páginas destacadas.</h5>
        <br>
        <?php
        if($links){
          foreach ($links as $link) {

            // seteo de variables
            $title_page = $link['titulo_pagina'] ? ucfirst($link['titulo_pagina']) : '';
            $uri_page = $link['url_ultimo'] ? $link['url_ultimo'] : '#';
            $glosa_page = $link['glosa_pagina'] ? ucfirst($link['glosa_pagina']) : 'Descripción no disponible';

          ?>
          <div class="card-panel white lighten-2">
            <b><?= $title_page ?></b><br>
            <?= $glosa_page ?>
            <a href="<?= $uri_page ?>" target="_blank" class="text-justify">
              &nbsp; <i>ver última entrada</i>
            </a>
            <hr>
            <?php
            if($this->session->userdata('nombres')){
            ?>
            <a class="btn blue waves-effect waves-light modal-trigger" href="#notificationModal" onclick="showNotification('<?= $glosa_page ?>', '<?= $uri_page ?>', <?= $link['id_paginas'] ?>)">Notificame</a>
            <?php
          }else{
            ?>
            <a class="btn blue waves-effect waves-light  modal-trigger" href="#loginModal">Notificame</a>
            <?php } ?>
          </div>
          <?php
          }
        }else{
          echo '<h3>No se encontraron resultados.</h3>';
        }
        ?>
      </div>
      <div class="col s12 m1 l1"></div>
      <div class="col s12 m4 l4">
        <br>
        <h5>Publicidad</h5>
        <br>
        <div class="card-panel white lighten-2">

        </div>
      </div>
    </div>
  </div>
</section>
<!-- Modal Structure -->
  <div id="notificationModal" class="modal">
    <div class="modal-content">
      <form class="" action="<?= base_url() ?>notification/new" method="post">
      <div class="row">
        <div class="col s12 m12 l12 center">
          <h4>Notificame</h4>
          <br>
          <b id="glosaNotificationModal"></b><br>
          <p id="uriNotificationModal"></p>
          <p id="uriNotificationModal"></p>
          <input type="hidden" name="id_page" id="idNotificationModal" value="">
          <input type="hidden" name="id_tag" id="tagNotificationModal" value="1">
          <br>
          <p>
            <input type="checkbox" id="emailNoti" name="email" />
            <label for="emailNoti">Email</label>
          </p>
          <p>
            <input type="checkbox" id="smsNoti" name="sms" />
            <label for="smsNoti">SMS</label>
          </p>
          <p>
            <input type="checkbox" id="push" name="push" />
            <label for="push">PUSH</label>
          </p>
        </div>
        <div class="col s12 m3 l3">&nbsp;</div>
        <div class="col s12 m6 l6">
          <div class="row">
            <div class="input-field col s12">
              <input type="submit" class="btn blue lighting-1 waves-block" value="Listo" >
            </div>
          </div>
        </div>
        <div class="col s12 m3 l3">&nbsp;</div>
      </div>
    </form>
    </div>
    <div class="modal-footer">
      <a class="modal-close waves-effect waves-green btn-flat">cancelar</a>
    </div>
  </div>

  <script type="text/javascript">
  function showNotification(glosa, uri, id_page){
    $("#glosaNotificationModal").html(glosa);
    $("#uriNotificationModal").html(uri);
    $("#idNotificationModal").val(id_page);
  }

  function notification(){
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
