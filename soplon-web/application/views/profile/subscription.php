<section>
  <div class="container">
    <div class="row">

      <div class="col s3">&nbsp;</div>
      <div class="col s6">
        <h5>Mis Subscripciones</h5>

        <?php
        if($subs){
          foreach ($subs as $sub) {
            // seteo de variables
            $title_page = $sub['subs']['glosa_tag'] ? ucfirst($sub['subs']['glosa_tag'])  : ucfirst($sub['subs']['titulo_pagina']);
            $uri_page = $sub['subs']['url_ultimo'] ? $sub['subs']['url_ultimo'] : '#';
            $glosa_page = $sub['subs']['glosa_pagina'] ? ucfirst($sub['subs']['glosa_pagina']) : 'Descripción no disponible';
        ?>
        <div class="card-panel white lighten-2">
          <b><?= $title_page ?></b><br>
          <?= $glosa_page ?>
          <br>
          <h6>Notificaciones asociadas.</h6>
          <?php
          foreach ($sub['mtd'] as $mtd) {
            echo '<b> -'.$mtd['glosa_metodo_envio'].'</b><br/>';
          }
          ?>
          <hr>
          <a class="btn blue waves-effect waves-light" href="<?= $uri_page ?>" target="_blank">Visitar página</a>
          <a class="btn teal waves-effect waves-light hide" href="<?= $uri_page ?>" target="_blank">Modificar</a>
          <a class="btn red waves-effect waves-light" href="<?= base_url() . 'app/profile/delete_subs/' . $sub['subs']['id_subscripciones'] ?>" target="_blank">Eliminar</a>

        </div>
        <?php
        }
      }else{
        echo "<br/><br/>Sin resultados.";
      }
         ?>
      </div>
      <div class="col s3">&nbsp;</div>
    </div>
  </div>
</section>
