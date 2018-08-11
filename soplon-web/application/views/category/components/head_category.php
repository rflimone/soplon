<?php
switch ($category) {
  case 'manga':
    $background = 'orange lighten-1';
    break;
  case 'deportes':
    $background = 'blue lighten-1';
    break;
  case 'conciertos':
    $background = 'green lighten-1';
    break;
  case 'teatro':
    $background = 'teal lighten-1';
    break;
  case 'intelectuales':
    $background = 'blue-grey darken-2';
    break;
  case 'anime':
    $background = 'red lighten-1';
    break;
  case 'familia':
    $background = 'deep-purple darken-3';
    break;
}

?>

<section class="<?= $background ?>">
  <div class="container">
    <div class="row">
      <div class="col s12 m12 l12">
        <h1 class="white-text">
          <small style="font-size: 16px; font-weight:300;">
            Categoría:<br>
          </small> <?= ucfirst($category) ?></h1>
      </div>
    </div>
  </div>
</section>
