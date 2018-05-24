<?php

class Home extends CI_controller{

  public function __construct(){
    parent::__construct();
    $this->load->model('pages_model');
  }

  public function categories($category){

    $data = ['title_page'=> ucfirst($category). ' - Soplón', 'category' => $category];

    // información de la categoria
    $data['links'] = $this->pages_model->get_pages($category);
    
    $this->load->view('includes/head', $data)
               ->view('includes/nav')
               ->view('category/index', $data)
               ->view('includes/footer_view', $data);
  }
}
