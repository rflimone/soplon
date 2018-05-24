<?php

class Login extends CI_Controller{

  public function __construct(){
    parent::__construct();
  }

  public function login(){
    $login = $this->input->post();

    $q = $this->db->select('*')
                  ->where('email' , $login['email'])
                  ->where('password', md5($login['password']))
                  ->get('usuarios');

    if($q->num_rows() > 0){

      $this->session->set_userdata('id_user', $q->row()->id_usuarios);
      $this->session->set_userdata('nombres', $q->row()->nombres);
      $this->session->set_userdata('email', $q->row()->email);

      echo json_encode(array('status'=>'ok'));
    }else{
      echo json_encode(array('status'=>'error'));
    }
  }

  public function logout(){

    $this->session->sess_destroy();
    redirect(base_url());

  }
}
?>
