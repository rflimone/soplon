<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

class Pages extends REST_Controller {

  public function __construct(){
    // Construct the parent class
    parent::__construct();
    $this->load->model('pages_model');

  }

  /**
  * pages_get, retorna las url`s según una categoría
  *
  * @param category strign, nombre de la categoría
  * @return response json
  */
  public function pages_get(){

    $category = $this->get('category');

    if(!$category){
      $this->response(http_code_response(400,$response));
    }

    $response = $this->pages_model->get_pages($category);

    if($response){
      $this->response(http_code_response(200,$response));
    }else{
      $this->response(http_code_response(404,$response));
    }

  }

}
