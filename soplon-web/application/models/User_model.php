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
    public function get_user($user_id, $email, $token){

        // intentamos traer la info mediante el api 
        $url_params = [
            'username' => strtolower($email)
        ];
        $user = $this->rest_client->call_resource('private/user',
                                                  'GET',
                                                  $url_params,
                                                  '',
                                                  2,
                                                  $token        
                                                  );
        
        if($user){
            return [
                'nombres' => $user['nombres'],
                'apellido_paterno' => $user['apellidoPaterno'],
                'apellido_materno' => $user['apellidoMaterno'],
                'celular' => $user['celular'],
                'email' => $user['email']
            ];
        }
        
        $q = $this->db->select('*')
                ->where('id_usuarios', $user_id)
                ->get('usuarios');

        return $q->result_array()[0];
    }

    /**
     * update_user, actualiza la informacion de usuario 
     */
    public function update_user($data, $user_id, $token){
        
        $params = [
            "idUsuarios" => $user_id,
            "nombres" => $data['nombres'],
            "apellidoPaterno" => $data['apellido_paterno'],
            "apellidoMaterno" => $data['apellido_materno'],
            "email" => $data['email'],
            "celular" => (int) $data['celular'],
            "activo" => 1,
            "password" => $this->session->userdata('pass')
        ];
        //echo "<pre>"; print_r($params);die();
        $update = $this->rest_client->call_resource('private/user', 'PUT', '', $params,1, $token);
        
        if($update){
            return true;
        }
        
        $q1 = $this->db->where('id_usuarios', $user_id)
                       ->update('usuarios', $data);

        return $q1;
    }
}
