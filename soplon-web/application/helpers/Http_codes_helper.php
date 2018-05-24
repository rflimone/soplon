<?php
  /*
  *
  *
  *
  */
  function http_code_response($code, $data ='') {

    switch ($code) {
      case 400: $status = 'error'; $message = 'Hay un problema con tu request';break;
      case 401: $status = 'error'; $message = 'Tu api key es incorrecta';break;
      case 403: $status = 'error'; $message = 'No tienes permiso para ver esta página ';break;
      case 404: $status = 'error'; $message = 'El recurso especificado no fue encontrado';break;
      case 405: $status = 'error'; $message = 'Trataste de ingresar a un recurso con un método inválido';break;
      case 406: $status = 'error'; $message = 'Solicistaste un formato que no es json';break;
      case 410: $status = 'error'; $message = 'El recurso solicitado fue removido de nuestros servidores';break;
      case 500: $status = 'error'; $message = 'Tuvimos un problema con nuestro servidor. Inténtalo nuevamente mas tarde';break;
      case 503: $status = 'error'; $message = 'Estamos offline por mantenimiento. Inténtalo nuevamente mas tarde';break;
      case 200: $status = 'ok'; $message = 'Ok, petición correcta.😗';break;
      case 201: $status = 'ok'; $message = 'La petición ha sido completada y ha resultado en la creación de un nuevo recurso';break;
      default:$status = 'Pending'; $message = 'Contactar con nuestro equipo';break;
    }

    $response = array(
      'status'  => $status,
      'message' => $message,
      'code'    => $code
    );

    if(!empty($data)){
      $response['data'] = $data;
    }

    return $response;
  }



?>
