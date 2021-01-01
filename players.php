<?php
if($_SERVER['REQUEST_METHOD'] === 'POST'){
  if($_POST['user'] === 1){$amount = $amount + 1;echo $amount; exit(); return;}
}
if($_SERVER['REQUEST_METHOD'] === "GET" && $_GET['getusers'] === 1)echo $amount; exit(); return;}
?>
