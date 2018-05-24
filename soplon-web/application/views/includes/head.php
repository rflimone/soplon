<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <title><?php echo $title_page; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="<?php echo base_url()?>asset/images-app/other/favicon.ico" rel="shortcut icon" type="image/x-icon">
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="<?php echo base_url()?>asset/css/master.css">
     <link rel="stylesheet" href="<?php echo base_url()?>asset/css/materialize.css">
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
     <!-- Compiled and minified JavaScript -->

     <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
     <script type="text/javascript" src="<?php echo base_url();?>asset/js/init.js?v=1"></script>
  </head>
  <body class="">
    <style>
    .patreon-ad {
        position: fixed;
        left: 0;
        bottom: 0;
        height: 50px;
        width: 239px;
        background-color: #fff;
        z-index: 1000;
        border-top: 1px solid rgba(0,0,0,0.14);
    }
    .patreon-ad a {
        width: 100%;
        line-height: 45px;
        padding: 0 30px;
    }
    body {
      display: flex;
      min-height: 100vh;
      flex-direction: column;
      background-color: #fafbfc !important;
    }

   main {
       flex: 1 0 auto;
     }
    header, main, footer {
        padding-left: 240px;
    }
    </style>
