<?php
    $mysite = dirname($_SERVER['SCRIPT_NAME']);
    $title = "Отказано в доступе";
 ?>
 <?php ob_start(); ?>
    <h2 class="page-header">Отказано в доступе</h2>

    <div class="alert alert-danger" role="alert">
  		<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  		<span class="sr-only">Error:</span>
  		<?php
  			$access = '';
			switch($data['access']) {
				case 1:
					$access = 'ученика';
					break; 
				case 2:
					$access = 'учителя';
					break;
				case 3:
					$access = 'куратора';
					break;
				case 4:
					$access = 'администратора';
					break;  
				default:
					$access = 'гостя';
					break;
			}
			echo "Для просмотра этой страницы необходимы права <b>" .$access."</b>";
  		?>
	</div>

<?php $content=ob_get_clean(); ?>

<?php include 'view/layout.php'; ?>
