<?php

  /**
  * code_kaboom : genera un codigo aleatorio unico para identificar un producto
  *
  */
 function code_kaboom($length=10,$uc=TRUE,$n=TRUE,$sc=FALSE){
    $source = 'abcdefghijklmnopqrstuvwxyz';
            if($uc==1) $source .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
            if($n==1) $source .= '1234567890';
            if($sc==1) $source .= '|@#~$%()=^*+[]{}-_';
            if($length>0){
                    $keys = "";
                    $source = str_split($source,1);
                    for($i=1; $i<=$length; $i++){
                            mt_srand((double)microtime() * 1000000);
                            $num = mt_rand(1,count($source));
                            $keys .= $source[$num-1];
                    }
            }
        return $keys;
  }

  /**
  * slug : genera un url amigable con el nombre del producto mas su codigo kaboom
  * @param $name nombre del producto
  * @param $code_kaboom codigo interno del producto
  * @return $slug string de url amigable
  */
  function slug($name, $code_kaboom =''){
    $string = $name;
    $characters = array(
            "Á" => "A", "Ç" => "c", "É" => "e", "Í" => "i", "Ñ" => "n", "Ó" => "o", "Ú" => "u",
            "á" => "a", "ç" => "c", "é" => "e", "í" => "i", "ñ" => "n", "ó" => "o", "ú" => "u",
            "à" => "a", "è" => "e", "ì" => "i", "ò" => "o", "ù" => "u"
    );
    $string = strtr($string, $characters);
    $string = strtolower(trim($string));
    $string = preg_replace("/[^a-z0-9-]/", "-", $string);
    $string = preg_replace("/-+/", "-", $string);
    if(substr($string, strlen($string) - 1, strlen($string)) === "-") {
            $string = substr($string, 0, strlen($string) - 1);
    }

    if(!empty($code_kaboom)){
      $response = $string . '-' . $code_kaboom;
    }else{
      $response = $string;
    }

    return $response;
  }

?>
