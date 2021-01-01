<?php
$amount = 0

if($_SERVER['REQUEST_METHOD'] === 'POST'){
  if($_POST['user'] == 1){$amount = $amount + 1;echo $amount; exit(); return;}
}
if($_SERVER['REQUEST_METHOD'] === "GET"){echo $amount; exit(); return;}
?>
