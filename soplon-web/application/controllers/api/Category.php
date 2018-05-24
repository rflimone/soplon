<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Category extends REST_Controller {

  public function __construct(){
    // Construct the parent class
    parent::__construct();
    $this->load->model('category_model');

  }

  /**
  * categories() get : retorna la lista completa de todas las categories activas
  *
  * @return $response json con respuesta http de la acción
  */
  public function categories_get(){

    $response = $this->category_model->get_categories();

    if ($response)
      $this->response(http_code_response(200,$response));
    else
      $this->response(http_code_response(404));

  }

}
