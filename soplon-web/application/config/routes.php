<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'Router/index';
// $route['404_override'] = '';
$route['translate_uri_dashes'] = TRUE;

// categorias
$route['c/(:any)/(:num)'] = 'app/home/categories/$1/$2';
$route['c/(:any)'] = 'app/home/categories/$1';

// Notification
$route['notification/new'] = 'app/notification';
//login
$route['login'] = 'app/login/index';
$route['verify/account'] = 'app/login/login';
$route['logout'] = 'app/login/logout';
$route['register'] = 'app/register';
$route['register/new'] = 'app/register/newUser';

// profile
$route['profile/subscription'] = 'app/profile/subscription';
$route['profile'] = 'app/profile';
