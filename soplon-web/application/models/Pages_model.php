<?php

class Pages_model extends CI_Model{

  public function __construct(){
    parent::__construct();
  }

  /**
  * get_pages, retorna el listado de páginas asociadas a la categoria
  *
  * @param $category strign nombre de la categoria
  * @return $response array listado de paginas encontradas
  */
  public function get_pages($category){
    $q1 = $this->db->select('*')
                   ->join('categorias c', 'c.id_categorias = p.id_categorias', 'left')
                   ->where('c.glosa_categoria', $category)
                   ->get('paginas p');

    if($q1->num_rows() > 0){
      return $q1->result_array();
    }else{
      return false;
    }
  }
}
