<?php
	$mysite = dirname($_SERVER['SCRIPT_NAME']);
	$title = "Список групп";
?>
<?php ob_start(); ?>

<h2 class="page-header">Список активных групп на текущий год</h2>


		<ol>
			<?php foreach($data["list"] as $row): ?>
				<li class="well well-sm">
					<a href="<?php echo $mysite;?>/index.php/showgroup?id=<?php echo $row->getId();?>">
						<?php echo $row->getCourse().$row->getAbbreviation()." ".$row->getGroupname(); ?>
					</a>
				</li>
			<?php endforeach ?>
		</ol>

<?php $content=ob_get_clean(); ?>

<?php include 'view/layout.php'; ?>
