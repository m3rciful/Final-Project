<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<?php echo $mysite; ?>/index.php" title="Главная страница"><?php echo $siteName; ?></a>
    </div>
     <?php
		    if($user->getId()) {

        $access = $user->getAccess();
        switch($access) 
        {
          case 1:
            $access = 'Ученик';
            break; 
          case 2:
            $access = 'Учитель';
            break;
          case 3:
            $access = 'Куратор';
            break;
          case 4:
            $access = 'Админ';
            break;  
          default:
            $access = 'Гость';
            break;
        } 
			   echo "<p class='navbar-text'>Привет, <b title='".$access."'>".$user->getUser()."</b></p>";
			   echo "<a class='btn btn-primary navbar-btn' href='".$mysite."/index.php/logout' role='button'>Выйти</a>"; 
      } ?>
  </div>
</nav>