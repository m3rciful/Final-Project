<!DOCTYPE html>
<html lang="ru">
  <head>
    <?php 
      $mysite = dirname($_SERVER['SCRIPT_NAME']); 
      $siteName = "Главная"; // Название сайта в nabvar
    ?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php if($title) echo $mysite." - ".$title; else echo $mysite; ?></title>
    <script src="<?php echo $mysite;?>/public/js/jquery.min.js"></script>
	  <script src="<?php echo $mysite;?>/public/js/bootstrap.js"></script>
    <script src="<?php echo $mysite;?>/public/js/sidebar.js"></script>
    <link href="<?php echo $mysite;?>/public/css/bootstrap.css" rel="stylesheet">
    <link href="<?php echo $mysite;?>/public/css/dashboard.css" rel="stylesheet">
    <?php if(isset($link)) echo $link; ?>

  </head>

  <body>

    <?php 
      $sid = new Session('START'); 
      $user=new User( $sid->getSession(), 'READ');

      include ('navbar.php');
    ?>

    <div class="container-fluid">

      <div class="row">

      <?php $class_set  = "";

			if($user->getId()) {
				$class_set = "col-sm-9 col-sm-offset-3 col-md-6 col-md-offset-2 ";
				include ('sidebar.php'); 
      }

		  ?>
		<div class="<?php echo $class_set; ?> main">

			<?php echo $content; ?>

		</div>


      </div>

    </div>

  </body>

</html>
