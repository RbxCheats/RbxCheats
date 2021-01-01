<?php
$amount = 0

if($_SERVER['REQUEST_METHOD'] === 'POST'){
  if($_POST['user'] == 1){$amount = $amount + 1; return echo $amount; exit();}
}
?>
