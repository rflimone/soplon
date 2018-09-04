<?php

class Profile extends CI_Controller{
  public function __construct(){
    parent::__construct();
    $this->load->model(['user_model', 'notification_model']);
    $this->load->library(['rest_client']);
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
    $email = $this->session->userdata('email');
    $oauth_session = $this->session->userdata('oauth');
    
    $data['user_info'] = $this->user_model->get_user($user_id, $email, $oauth_session['access_token']);
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

  /**
   * save_changes_profile, guarda los cambios realizados en la cuenta de usuario
   */
  public function save_change_profile(){

    // variables del formulario
    $data = $this->input->post();
    // información de la categoria
    $user_id = $this->session->userdata('id_user');
    $oauth_session = $this->session->userdata('oauth');
    if(!$data){
      redirect(base_url(), 'profile/?error=ok');
    }

    $update = $this->user_model->update_user($data, $user_id, $oauth_session['access_token']);

    if($update){
      $get = 'success=ok';
    }else{
      $get = 'error=ok';
    }

    redirect(base_url() . 'profile/?' . $get);
  }

  /**
   * Elimina una subscripcion del usuario
   */
  public function delete_subs($id_subs){

    if(empty($id_subs)){
      redirect( base_url() .'profile/subscription');
    }

    $delete = $this->notification_model->delete_subs($id_subs);

    redirect( base_url() .'profile/subscription');
    
  }

  /**
   * Actualiza una ubscripcion
   */
  public function update_subs($param){
    $data = $this->input->post();
    echo "<pre>"; print_r($data);
  }
}
