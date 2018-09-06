<?php
/**
 * Rest client.
 * Libreria para facilitar la conexión con API SOAP.
 * Contiene la función para autenticación y recepción de token,
 * función para preparar las llamadas de los endpoints
 * 
 * @package       Api
 * @subpackage    Libraries
 * @category      Libraries
 */

 class Rest_client{
    
    private $apiUrl = 'http://192.155.83.79:8080/';

    /**
     * __construct(), constructor vacio de la clase
     */
    public function __construct(){
        //
    }

    /**
     * Get getApiUrl
     * @return api-url - String
     */
    public function getApiUrl(){
        return $this->apiUrl;
    }
    /**
     * Set api-url
     * @return api-url - String
     */
    public function setApiUrl($apiUrl){
        return $this->apiUrl = $apiUrl;
    }


    /**
     * oauth, función para la conexión oauth 
     * @param string $username
     * @param string $password
     * @param string $grand_type
     * @return array $response
     */
    public function oauth($username, $password, $grant_type){ 

        $post = array(
            'username' => $username,
            'password' => $password,
            'grant_type' => $grant_type
        );
        
        $ch = curl_init($this->getApiUrl() .'oauth/token');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
        curl_setopt($ch, CURLOPT_POSTFIELDS,  http_build_query($post));
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        "cache-control: no-cache",
        "authorization: Basic d2ViOlNvcGxvbjEyMw==",
        "content-type: application/x-www-form-urlencoded"
        ));
        $response = curl_exec($ch);
        
        return  json_decode($response,true);
     
    }

    /**
     * call, función para realizar el llamado al recurso del api
     * @param string $endpoint, ruta del enpoint
     * @param string $method, mètodo del llamado (POST, GET, etc)
     * @param array $url_params, array con datos si la consulta es por el método get
     * @param array $data, array con los datos si la consulta es por el método post 
     * @param int $type_get, configuración para formar los parametros get (ej: 1 ruta/get-1/get-2, ej: 2 ruta?get-1=a&get-2=b)
     * @return array $response, array con la respuesta del recurso
     * 
     * @notes : refactorizar la función para eliminar una fuente de datos si es por get o post
     */
    public function call_resource($endpoint, $method, $url_params = '', $data ='', $type_get = 1, $token) {

        $enpoint = $this->getUrl($endpoint, $method, $url_params, $type_get);
        
        $response = '';
        $ch = curl_init($enpoint);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "Authorization: Bearer ". $token,
            "cache-control: no-cache",
            "content-type: application/x-www-form-urlencoded"
          ));
        if($method == 'POST' || $method == 'PUT'){
          curl_setopt($ch, CURLOPT_POSTFIELDS,  json_encode($data));
        }
        try{
    
            $status             = false;
            $buble              = 2;
            $calls              = 1;
            $counter_error      = 1;
    
            do {
    
                $res = curl_exec($ch);
                //echo "<pre>"; print_r($res);die();
                if (!curl_errno($ch)) {//Comprobar si ocurrió un error
    
                    $info           = curl_getinfo($ch);
                    $httpCode       = $info["http_code"];
                    $response_code  = $this->http_response_code($httpCode);
    
                    if($response_code["status"] == "Client Error" || $response_code["status"] == "Server Error"){
    
                        $counter_error++;
                        $status = false;
                    }else{
                        $counter_error = 1;
                        $status = true;
                    }
    
                }else{//Tenemos algun tipo de error distinto a los estado de HTTP
    
                    $counter_error++;
                    $status = false;
                }
    
                $calls++;
            }
            while ($status === false && $counter_error <= $buble);
    
            curl_close($ch);
            $response = json_decode($res,true);
        }catch (ErrorException $e){
          //echo 'error curl';
        }
        return $response;
      }
      /**
      * getUrl, función encargada de formar la url
      * @param url_params
      * @return una url armada según el tipo http
      */
      private function getUrl($endpoint, $method, $url_params, $type_get) {
        $response = '';
        $response2 = '';
        $response .= $this->apiUrl.$endpoint.'/';
        if($method == 'GET' || $method == 'DELETE') {
            foreach ($url_params as $key => $value) {
              $response .= $key.'/'.$value.'/';
              $response2 .= $key.'='.$value.'&';
            }
            if($type_get == 1){
                  $response .= $this->token.'/'. $this->apiKey;
            }else{
                  $response = $this->apiUrl.$endpoint.'?'.$response2;
            }
        }else{//POST / PUT
            $response .= '/';
        }
        return $response;
      }
    
    /**
     * http_response_code, retorna el string con el tipo de error http
     * @param int $code 
     * @return array $status_code
     */
    private function http_response_code($code = 100) {

        $http_status_codes = array(100 => "Continue", 101 => "Switching Protocols",
            102 => "Processing", 200 => "OK", 201 => "Created", 202 => "Accepted",
            203 => "Non-Authoritative Information", 204 => "No Content",
            205 => "Reset Content", 206 => "Partial Content", 207 => "Multi-Status",
            300 => "Multiple Choices", 301 => "Moved Permanently",
            302 => "Found", 303 => "See Other", 304 => "Not Modified",
            305 => "Use Proxy", 306 => "(Unused)", 307 => "Temporary Redirect",
            308 => "Permanent Redirect", 400 => "Bad Request", 401 => "Unauthorized",
            402 => "Payment Required", 403 => "Forbidden", 404 => "Not Found",
            405 => "Method Not Allowed", 406 => "Not Acceptable",
            407 => "Proxy Authentication Required", 408 => "Request Timeout",
            409 => "Conflict", 410 => "Gone", 411 => "Length Required",
            412 => "Precondition Failed",
            413 => "Request Entity Too Large", 414 => "Request-URI Too Long",
            415 => "Unsupported Media Type", 416 => "Requested Range Not Satisfiable",
            417 => "Expectation Failed", 418 => "I'm a teapot",
            419 => "Authentication Timeout", 420 => "Enhance Your Calm",
            422 => "Unprocessable Entity", 423 => "Locked", 424 => "Failed Dependency",
            424 => "Method Failure", 425 => "Unordered Collection", 426 => "Upgrade Required",
            428 => "Precondition Required", 429 => "Too Many Requests",
            431 => "Request Header Fields Too Large", 444 => "No Response",
            449 => "Retry With", 450 => "Blocked by Windows Parental Controls",
            451 => "Unavailable For Legal Reasons", 494 => "Request Header Too Large",
            495 => "Cert Error", 496 => "No Cert", 497 => "HTTP to HTTPS",
            499 => "Client Closed Request", 500 => "Internal Server Error",
            501 => "Not Implemented", 502 => "Bad Gateway", 503 => "Service Unavailable",
            504 => "Gateway Timeout", 505 => "HTTP Version Not Supported",
            506 => "Variant Also Negotiates", 507 => "Insufficient Storage",
            508 => "Loop Detected", 509 => "Bandwidth Limit Exceeded", 510 => "Not Extended",
            511 => "Network Authentication Required", 598 => "Network read timeout error",
            599 => "Network connect timeout error"
        );

        switch ($code) {
            case ($code >= 200 && $code <= 206): $status    = "Successful"; break;
            case ($code >= 300 && $code <= 307): $status    = "Redirection"; break;
            case ($code >= 400 && $code <= 417): $status    = "Client Error"; break;
            case ($code >= 500 && $code <= 505): $status    = "Server Error"; break;
            default: $status = "Other"; break;
        }

        $status_code["status"]  = $status;
        $status_code["value"]   = $http_status_codes[$code];

        return $status_code;
    }
 }
