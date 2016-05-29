<?php
	$mysite = dirname($_SERVER['SCRIPT_NAME']);
	$title = "Список всех учеников";
?>
<?php ob_start(); ?>
	<h2 class="page-header">Список всех учеников</h2>

		<ol>
			<?php foreach($data['persons'] as $person): ?>
				<li class="well well-sm">
					<a href="<?php echo $mysite;?>/index.php/insertstudenttogroup?person_id=<?php echo $person->getId();?>&group_id=<?php echo $data['group_id']?>">
						<?php echo $person->getName().' '.$person->getSurname(); ?>
					</a>
				</li>
			<?php endforeach ?>
		</ol>

<?php $content=ob_get_clean(); ?>

<?php include 'view/layout.php'; ?>
