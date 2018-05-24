<?php

class Register extends CI_Controller{

  public function __construct(){
    parent::__construct();
    $this->session_();
    $this->load->model('register_model');
  }

  /**
  * session_(), validaciones de sesión básica.
  * si  encuentra id_user en las variables de sesion
  * redirije al usuario al home ya que no puede registrarse si esta logueado
  */
  public function session_(){
    if($this->session->userdata('id_user')){
      redirect(base_url(), 'refresh');
    }
  }

  public function index(){
    $data = ['title_page'=> 'Regístrate- Soplón'];

    //echo "<pre>"; print_r($data['subs']);die();
    $this->load->view('includes/head', $data)
               ->view('includes/nav')
               ->view('register/index')
               ->view('includes/footer_view', $data);
  }

  public function newUser(){

    $user = array(
      'nombres' => $this->input->post('first_name'),
      'apellido_paterno' => $this->input->post('last_name'),
      'apellido_materno' => $this->input->post('last_name2'),
      'email' => $this->input->post('email'),
      'celular' => $this->input->post('number_phone'),
      'activo' => 1,
      'password' => md5($this->input->post('password'))
    );
    $save = $this->register_model->saveUser($user);

    if($save){
      $this->session->set_flashdata('register', 'Registro exitoso, ya puedes ingresar.');
    }else{
      $this->session->set_flashdata('register', 'Ocurrió un error al regístrarte, intenta nuevamente.');
    }

    redirect(base_url(), 'refresh');
  }
}
