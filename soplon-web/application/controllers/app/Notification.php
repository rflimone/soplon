<?php

class Notification extends CI_Controller{

  public function __construct(){
    parent::__construct();
    // cargamos los modelos
    $this->load->model(['notification_model']);
  }
  public function index(){

    $id_page = $this->input->post('id_page');
    $id_user = $this->session->userdata('id_user');
    $emailNoti = $this->input->post('email') == 'on' ? true : false;
    $smsNoti = $this->input->post('sms') == 'on' ? true : false;
    $pushNoti = $this->input->post('push') == 'on' ? true : false;
    $id_tag = $this->input->post('id_tag');
    //guardamos el registro
    $subscription = array(
      'id_usuarios' => $id_user,
      'id_paginas' => $id_page,
      'id_tags' => $id_tag
    );
    $notification = array();

    if($emailNoti){
      array_push($notification, ['glosa_metodo_envio' => 'email', 'id_usuarios' => $id_user]);
    }
    if($smsNoti){
      array_push($notification, ['glosa_metodo_envio' => 'sms', 'id_usuarios' => $id_user]);
    }
    if($pushNoti){
      array_push($notification, ['glosa_metodo_envio' => 'push', 'id_usuarios' => $id_user]);
    }

    $save = $this->notification_model->saveNotification($subscription, $notification);

    if($save){
      redirect(base_url().'profile/subscription');
    }
  }

}
