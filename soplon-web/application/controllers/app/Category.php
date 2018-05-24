<?php

class Category extends CI_Controller{

  public function __construct(){
    parent::__construct();
    $this->load->model('category_model');
    $this->verify_session();
  }

  private function verify_session(){
    if(!$this->session->userdata('email')){
      redirect(base_url('login'));
    }
  }

  public function index(){
    $data = array('title_page' => 'Categorias', 'active' => 'category');
    $data['category_list'] = $this->category_model->get_categories();
    // cargas de vistas
    $this->load->view('includes/head', $data)
               ->view('includes/nav_view', $data)
               ->view('category/categories_list_view', $data)
               ->view('includes/footer_view');
  }

  /**
  * new : vista formulario nueva categoria
  */
  public function new_category(){
    $data = array('title_page' => 'Nueva categoria', 'active' => 'category');

    // cargas de vistas
    $this->load->view('includes/head', $data)
               ->view('includes/nav_view', $data)
               ->view('category/category_new_view', $data)
               ->view('includes/footer_view');
  }

  public function create_category(){
    $category = $this->input->post();

    $response = $this->category_model->post_category($category);

    if($response)
      echo json_encode(array('status' => 'ok'));
    else{
      echo json_encode(array('status' => 'error'));
    }
  }

  /**
  * new : vista formulario nueva categoria
  */
  public function edit_category($category_id){
    $data = array(
      'title_page' => 'Editar categoria ID#'. $category_id ,
      'active' => 'category',
      'category_id' => $category_id
    );
    $data['category'] = $this->category_model->get_category($category_id);

    // cargas de vistas
    $this->load->view('includes/head', $data)
               ->view('includes/nav_view', $data)
               ->view('category/category_edit_view', $data)
               ->view('includes/footer_view');
  }

  public function update_category($category_id){
    $category = $this->input->post();

    $response = $this->category_model->update_category($category,$category_id);

    if($response)
      echo json_encode(array('status' => 'ok'));
    else{
      echo json_encode(array('status' => 'error'));
    }
  }

}

?>
