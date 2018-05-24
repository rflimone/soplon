<?php

class Category_model extends CI_Model{
    public function __construct(){
        parent::__construct();
    }

    /**
    * get_categories: Retorna el listado de categorias activas
    *
    * @return $response  array con la información del producto
    */
    public function get_categories(){

      $q = $this->db->select('*')
                ->order_by('glosa_categoria','ASC')
                ->get('category');

      return $q->result_array();

    }

}
