<?php

class Register_model extends CI_Model{

  public function __construct(){
    parent::__construct();
  }

  public function saveUser($user){

    $q1 = $this->db->insert('usuarios', $user);

    if($q1){
      return true;
    }else{
      return false;
    }
  }
}
