<?php

class Notification_model extends CI_Model{

  public function __construct(){
    parent::__construct();
  }
  /**
  * saveNotification(), inserta los datos de la nueva subcripcion y sus tipos de
  * notificaciones.
  * @param $subcription array data de la subcripcion
  * @param $notification array tipo de notificaciones para la subcripcion
  * @return $response boolean true para creacion exitosa y false para error
  */
  public function saveNotification($subscription, $notification){

    // insertamos primero la subcripcion
    $q1 = $this->db->insert('subscripciones', $subscription);

    if($q1){
      // tomamos el id de la ultima subcripcion
      $id_subcription = $this->db->insert_id();

      // iteramos los tipos de notificaciones
      $error = 0;
      foreach ($notification as $notif) {
        // añadimos el id de la subcripcion
        $notif['id_subscripciones'] = $id_subcription;

        // guardamos el registro en metodo de envio
        $q2 = $this->db->insert('metodos_envio', $notif);

        if(!$q2){
          $error++;
        }
      }
      if($error > 0){
        return false;
      }else{
        return true;
      }
    }else{
      return false;
    }
  }

  /**
  * getNotification(), retornar las subscricions y notificaciones del usuario
  *
  * @param $user_id int identificador del usuario
  * @return $response array listado con las subscripcions del usuario
  */
  public function get_notification($user_id){
    $q1 = $this->db->select('p.glosa_pagina,
                             p.titulo_pagina,
                             p.url_ultimo,
                             s.id_subscripciones
                            ')
                   ->join('paginas p', 'p.id_paginas = s.id_paginas', 'left')
                   ->where('s.id_usuarios', $user_id)
                   ->order_by('s.id_subscripciones', 'desc')
                   ->get('subscripciones s');

    if($q1->num_rows() > 0){
      $response = array();
      foreach ($q1->result_array() as $subs) {
        $q2 = $this->db->select('glosa_metodo_envio')
                       ->where('id_subscripciones', $subs['id_subscripciones'])
                       ->get('metodos_envio');
        $mtd = '';
        if($q2->num_rows() > 0){
          $mtd = $q2->result_array();
        }
        $response[] = array('subs' => $subs, 'mtd' => $mtd);
      }
      return $response;
    }else{
      return false;
    }
  }
}
