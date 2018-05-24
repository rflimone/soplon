<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';


class User extends REST_Controller {

  public function __construct(){
    // Construct the parent class
    parent::__construct();
    $this->load->model('user_model');
  }

  /**
  * product() post : crea un nuevo producto
  *
  * @param $product json con la información del nuevo production
  *
  * @return $response json con respuesta http de la acción
  */
  public function product_post(){
    return true;
  }

  /**
  * product() get: retorna la infomación de un producto
  *
  * @param $identifier var get con el identificador del producto
  *
  * @return $response json con respuesta http de la acción
  */
  public function user_get(){
    $user_id = $this->get('user_id');

    return ;

  }

  /**
  * products() post : retornar una lista de productos según parametros de filtro
  * recibidos.
  * @param @filters json con la información de filtro a realizar para el retorno
  * de productos.
  *
  * @return $response json con respuesta http de la acción
  */
  public function products_post(){
    return true;
  }

}
