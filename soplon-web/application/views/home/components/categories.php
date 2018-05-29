<?php
if($this->session->userdata('register')){
  ?>
  <section>
    <div class="container center">
      <h5><?= $this->session->userdata('register') ?></h5>
    </div>
  </section>
  <?php
}
?>
<section class="categories-bg">
  <div class="container">
    <div class="row">
      <div class="col s12 m12 l12 center">
        <h1 class="black-text title-large">Notificaciones de Entretención</h1>
        <br>
        <h3 class="black-text title-medium">Con Soplón, recibe tus intereses de entretención en el momento que ocurran!</h3>
        <h3 class="black-text title-medium">Directo a tu email o celular.</h3>
        <br>
        <br>
        <a href="#categories" class="btn btn-flat orange white-text">
          Revisar categorias</a>
      </div>
      <div class="col s12 m3 l3">
    </div>
  </div>
</section>
<section class="categories2-bg" id="categories">
  <div class="container">
    <div class="row">
      <div class="col s12 m12 l12 center">
        <h1 class="black-text title-large">Categorias destacadas</h1>
        <br>
      </div>
      <div class="col s12 m12 l12">
        <div class="row">
          <div class="col s12 m6 l3">
            <div class="card orange lighten-1">
              <div class="card-content white-text center">
                <span class="card-title center">Mangas</span>
                <p>Recibe las últimas actualizaciones de los mejores mangas, en tiempo real!</p>
              </div>
              <div class="card-action center">
                <a href="<?= base_url() ?>c/manga" class="white-text">Revisar</a>
              </div>
            </div>
          </div>
          <div class="col s12 m6 l3">
            <div class="card blue lighten-1">
              <div class="card-content white-text center">
                <span class="card-title center">Deportes</span>
                <p>Encuentra entradas a deportes, en el momento que comience su venta!</p>
              </div>
              <div class="card-action center">
                <a href="<?= base_url() ?>c/deportes" class="white-text">Revisar</a>
              </div>
            </div>
          </div>
          <div class="col s12 m6 l3">
            <div class="card green lighten-1">
              <div class="card-content white-text center">
                <span class="card-title center">Música</span>
                <p>Entérate de los últimos eventos musicales, conciertos o eventos!</p>
              </div>
              <div class="card-action center">
                <a href="<?= base_url() ?>c/musica" class="white-text">Revisar</a>
              </div>
            </div>
          </div>
          <div class="col s12 m6 l3">
            <div class="card teal lighten-1">
              <div class="card-content white-text center">
                <span class="card-title center">Teatro</span>
                <p>Prepárate y asiste a las funciones destacadas!</p>
              </div>
              <div class="card-action center">
                <a href="<?= base_url() ?>c/teatro" class="white-text">Revisar</a>
              </div>
            </div>
          </div>
          <div class="col s12 m6 l3">
            <div class="card blue-grey darken-2">
              <div class="card-content white-text center">
                <span class="card-title center">Intelectuales</span>
                <p>Acude a lo último en eventos, libros y seminarios!</p>
              </div>
              <div class="card-action center">
                <a href="<?= base_url() ?>c/intelectuales" class="white-text">Revisar</a>
              </div>
            </div>
          </div>
          <div class="col s12 m6 l3">
            <div class="card red lighten-1">
              <div class="card-content white-text center">
                <span class="card-title center">Animé</span>
                <p>Mira los animé que todos están mirando, sin importar de donde!</p>
              </div>
              <div class="card-action center">
                <a href="<?= base_url() ?>c/anime" class="white-text">Revisar</a>
              </div>
            </div>
          </div>
          <div class="col s12 m6 l3">
            <div class="card deep-purple darken-3">
              <div class="card-content white-text center">
                <span class="card-title center">Familia</span>
                <p>Obtén entradas para eventos familiares!</p>
              </div>
              <div class="card-action center">
                <a href="<?= base_url() ?>c/familia" class="white-text">Revisar</a>
              </div>
            </div>
          </div>
        </div>
      </div>
  </div>
</section>
