<?php

class Login extends CI_Controller{

  public function __construct(){
    parent::__construct();
    $this->load->library(['rest_client']);
  }

  public function login(){
    $login = $this->input->post();

    $q = $this->db->select('*')
                  ->where('email' , $login['email'])
                  ->where('password', md5($login['password']))
                  ->get('usuarios');

    if($q->num_rows() > 0){
      /**
       * modificamos el còdigo para implementar la conexión oauth con el api
       * se debe reemplaazar esos datos con los del cliente
       */
      $oauth = $this->rest_client->oauth($q->row()->email,
                                         $login['password'],
                                         'password');
                                         
      if(!$oauth){
        // No se pudo establecer la conexión oauth
      }

      //guardamos la data en session
      $oauth_data = array(
        'access_token' => $oauth['access_token'],
        'token_type' => $oauth['token_type'],
        'refresh_token' => $oauth['refresh_token'],
        'expires_in' => $oauth['expires_in'],
        'scope' => $oauth['scope']
      );

      $this->session->set_userdata('oauth', $oauth_data);
      

      $this->session->set_userdata('id_user', $q->row()->id_usuarios);
      $this->session->set_userdata('nombres', $q->row()->nombres);
      $this->session->set_userdata('email', $q->row()->email);
      $this->session->set_userdata('pass', $q->row()->password);


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
