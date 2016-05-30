<div class="col-sm-3 col-md-2 sidebar">
  
<?php 

  // ГРУППЫ
  $text = "<h6><b>ГРУППЫ</b></h6>";
  $text.= "<ul class='nav nav-sidebar'>";
  $text.= "<li><a href='".$mysite."/index.php'>Все группы</a></li>";
  if($user->getAccess() > 2) {
    $text.= "<li><a href='".$mysite."/index.php/addgroup'>Добавить группу</a></li>"; 
  }
  $text.="</ul>";

  // УЧЕНИКИ
  if($user->getAccess() > 2) {

    $text.= "<h6><b>УЧЕНИКИ</b></h6>";
    $text.= "<ul class='nav nav-sidebar'>";
    $text.= "<li><a href='".$mysite."/index.php/addnewstudent'>Добавить ученика</a></li>";
    $text.="</ul>";

  }

  // ПОЛЬЗОВАТЕЛИ
  $text.= "<h6><b>ПОЛЬЗОВАТЕЛИ</b></h6>";
  $text.= "<ul class='nav nav-sidebar'>";
  $text.= "<li><a href='".$mysite."/index.php/showuser'>Все пользователи</a></li>";
  if($user->getAccess() > 2) {
    $text.= "<li><a href='".$mysite."/index.php/adduser'>Добавить пользователя</a></li>";
  }
  $text.="</ul>";

  // ВЫВОД МЕНЮ
  echo $text;

?>

</div>