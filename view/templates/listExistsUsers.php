<?php
	$mysite = dirname($_SERVER['SCRIPT_NAME']);
	$title = "Список всех пользователей";
?>
<?php ob_start(); ?>

	<?php 
		$sid = new Session('START'); 
      	$user=new User( $sid->getSession(), 'READ');
    ?>
	
	<h2 class="page-header">Список всех пользователей</h2>

	<div class="panel panel-default">
	<table class="table table-hover">
    	<thead>
      		<tr>
      			<td></td>
        		<td><b>Логин</b></td>
        		<td><b>Эл. адрес</b></td>
        		<td colspan="2"><b>Доступ</b></td>
      		</tr>
    	</thead>
    <tbody>

	<?php $num = 0; foreach($data['users'] as $row): ?>
		<tr>
			<td><?php echo $num+=1; ?></td>
			<td><?php echo $row['username']; ?></td>
			<td><?php echo $row['email']; ?></td>
			<td><?php 
					$access = '';
					switch($row['access']) {
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
					echo $access;
				?>
			</td>
			<td>
			<?php 
				if( $user->getAccess() > 2 AND ($row['access'] < $user->getAccess() OR $user->getAccess() == 4) ) 
				{
					if($row['id'] != $user->getId()) {
						echo "<a href='".$mysite."/index.php/deleteuser?id=".$row['id']."' title='Удалить'>
						<span class='glyphicon glyphicon-remove pull-right' aria-hidden='true'></span></a>"; 
					}
					else {
						echo "<span class='glyphicon glyphicon-remove pull-right text-muted' aria-hidden='true' title='Не доступно'></span>"; 
					}
				}
			?>
			</td>
		<tr>
	<?php endforeach ?>

	</tbody>
  </table>
  </div>

<?php $content=ob_get_clean(); ?>

<?php include 'view/layout.php'; ?>
