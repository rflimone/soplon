<?php
class Router extends CI_Controller{

  public function index(){
    $data = ['title_page' => 'Soplón app'];
    $this->load->view('includes/head', $data)
               ->view('includes/nav')
               ->view('home/index')
               ->view('includes/footer_view', $data);
  }
}
?>
