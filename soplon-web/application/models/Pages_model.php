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
  public function get_pages($category, $limit_per_page, $start_index){
    $q1 = $this->db->select('*')
                   ->join('categorias c', 'c.id_categorias = p.id_categorias', 'left')
                   ->join('tags_paginas tp', 'tp.id_paginas = p.id_paginas', 'left')
                   ->join('tags t', 't.id_tags = tp.id_tags', 'left')
                   ->where('c.glosa_categoria', $category)
                   ->limit($limit_per_page, $start_index)
                   ->get('paginas p');

    if($q1->num_rows() > 0){
      return $q1->result_array();
    }else{
      return false;
    }
  }

  /**
   * get_total, retorna el total de registros de paginas asociadas a la categoria
   * @param string $category, nombre de la categoria
   * @return int $response, total de registros encontrados
   */
  public function get_total($category){
    $q1 = $this->db->select('*')
          ->join('categorias c', 'c.id_categorias = p.id_categorias', 'left')
          ->where('c.glosa_categoria', $category)
          ->get('paginas p');
    return $q1->num_rows();
  }
}
