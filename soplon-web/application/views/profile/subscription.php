<section>
  <div class="container">
    <div class="row">
      <div class="col s12">
        <h5>Mis subscripciones</h5>

        <?php
        if($subs){
          foreach ($subs as $sub) {
            // seteo de variables
            $title_page = $sub['subs']['titulo_pagina'] ? ucfirst($sub['subs']['titulo_pagina']) : '';
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

        </div>
        <?php
        }
      }else{
        echo "<br/><br/>Sin resultados.";
      }
         ?>
      </div>
    </div>
  </div>
</section>
