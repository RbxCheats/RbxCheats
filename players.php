<?php
$amount = 0;

if ($_SERVER['REQUEST_METHOD'] === 'GET'){
  if ($_GET['user'] === 1) {
    echo ++$amount; 
    exit(); return;
  }
  elseif ($_GET['getusers'] === 1) {
    echo $amount; 
    exit(); return;
  }
}
?>
