<?php

class Profile extends CI_Controller{
  public function __construct(){
    parent::__construct();
    $this->load->model(['user_model', 'notification_model']);
    $this->session_();
  }

  /**
  * session_(), validaciones de sesión básica.
  * si no encuentra id_user en las variables de sesion
  * redirije al usuario al home
  */
  public function session_(){
    if(!$this->session->userdata('id_user')){
      redirect(base_url(), 'refresh');
    }
  }
  public function index(){
    $data = ['title_page'=> 'Mi perfil - Soplón'];

    // información de la categoria
    $user_id = $this->session->userdata('id_user');
    $data['user_info'] = $this->user_model->get_user($user_id);
    //echo "<pre>"; print_r($data['subs']);die();
    $this->load->view('includes/head', $data)
               ->view('includes/nav')
               ->view('profile/index',$data)
               ->view('includes/footer_view', $data);
  }

  public function subscription(){
    $data = ['title_page'=> 'Mi perfil - Soplón'];

    // información de la categoria
    $user_id = $this->session->userdata('id_user');
    $data['subs'] = $this->notification_model->get_notification($user_id);
    //echo "<pre>"; print_r($data['subs']);die();
    $this->load->view('includes/head', $data)
               ->view('includes/nav')
               ->view('profile/subscription',$data)
               ->view('includes/footer_view', $data);
  }
}
