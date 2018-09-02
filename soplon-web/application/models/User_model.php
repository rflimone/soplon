<?php

class User_model extends CI_Model{
    public function __construct(){
        parent::__construct();
        // load libraries
        $this->load->library(['rest_client']);
    }

    /**
    * get_user : Retorna la información del usuario según id
    *
    * @param $user_id identificador del usuario
    * @return $response  array con la información del usuario
    */
    public function get_user($user_id){

        
      $q = $this->db->select('*')
                ->where('id_usuarios', $user_id)
                ->get('usuarios');

      return $q->result_array()[0];
    }

    /**
     * update_user, actualiza la informacion de usuario 
     */
    public function update_user($data, $user_id){

        $q1 = $this->db->where('id_usuarios', $user_id)
                       ->update('usuarios', $data);

        return $q1;
    }
}
