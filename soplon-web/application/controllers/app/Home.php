<?php

class Home extends CI_controller{

  public function __construct(){
    parent::__construct();
    $this->load->model('pages_model');
    // load Pagination library
    $this->load->library('pagination');
  }

  public function categories($category, $pag = 0){

    $data = ['title_page'=> ucfirst($category). ' - Soplón', 'category' => $category];

    // init params
    $params = array();
    $limit_per_page = 10;
    $start_index = isset($_GET['pag']) ? $_GET['pag'] : $pag;
    $total_records = $this->pages_model->get_total($category);
    
    if ($total_records > 0) {
      
      // get current page records
      $data["results"] = $this->pages_model->get_pages($category, $limit_per_page, $start_index);
      
      $config = $this->custom();
      $config['base_url'] = base_url() . 'c/' . $category;
      $config['total_rows'] = $total_records;
      $config['per_page'] = $limit_per_page;
     // $config["uri_segment"] = 3;
      
      $this->pagination->initialize($config);
      
      // build paging links
      $data["links"] = $this->pagination->create_links();
    }

    $this->load->view('includes/head', $data)
               ->view('includes/nav')
               ->view('category/index', $data)
               ->view('includes/footer_view', $data);
  }

  public function custom(){
     
    // custom paging configuration
    //$config['num_links'] = 2;
    $config['use_page_numbers'] = TRUE;
    $config['reuse_query_string'] = TRUE;
      
    $config['full_tag_open'] = '<ul class="pagination">';
    $config['full_tag_close'] = '</ul>';
      
    $config['first_link'] = 'Primera página';
    $config['first_tag_open'] = '<span class="firstlink">';
    $config['first_tag_close'] = '</span>';
      
    $config['last_link'] = 'Última página';
    $config['last_tag_open'] = '<span class="lastlink">';
    $config['last_tag_close'] = '</span>';
      
    $config['next_link'] = '<i class="material-icons">chevron_right</i>';
    $config['next_tag_open'] = '<span class="nextlink">';
    $config['next_tag_close'] = '</span>';

    $config['prev_link'] = '<i class="material-icons">chevron_left</i>';
    $config['prev_tag_open'] = '<span class="prevlink">';
    $config['prev_tag_close'] = '</span>';

    $config['cur_tag_open'] = '<li class="curlink waves-effect">';
    $config['cur_tag_close'] = '</li>';

    $config['num_tag_open'] = '<li class="numlink waves-effect">';
    $config['num_tag_close'] = '</li>';
    return $config;
  }
}
