<?php
    $mysite = dirname($_SERVER['SCRIPT_NAME']);
    $title = "Cведения о группе";
    
    $sid = new Session('START'); 
    $user=new User( $sid->getSession(), 'READ');
 ?>
 <?php ob_start(); ?>
    <h2 class="page-header">Cведения о группе</h2>

    <div class="well well-sm"><?php echo $data['group']->getGroupName()." ".$data['group']->getCourse().$data['group']->getAbbreviation(); ?></div>
    <div class="well well-sm">Начало обучения: <?php echo $data['group']->getBeginMonth().".".$data['group']->getBeginYear();?></div>
    <div class="well well-sm">Окончание: <?php echo $data['group']->getEndMonth() .".". $data['group']->getEndYear();?></div>

    <h2 class="sub-header">Ученики</h2> 
    
    <ul class="list-group">
        <?php if(isset($data['students'])){ foreach($data['students'] as $student): ?>
            <li class="list-group-item">
                <a href="<?php echo $mysite;?>/index.php/showstudent?id=<?php echo $student->getId();?>">
                    <?php echo $student->getPerson()->getName().' '.$student->getPerson()->getSurname(); ?>
                </a>
                <?php if($user->getAccess() > 1) { echo "<a href='".$mysite."/index.php/removestudentfromgroup?person_id=".$student->getId()."&group_id=".$data['group']->getId()."' title='Удалить'>
                        <span class='glyphicon glyphicon-remove pull-right' aria-hidden='true'></span></a>"; } ?>
            </li>
        <?php endforeach; } if( empty( $data['students'] ) ) {echo "Список пуст";} ?>
    </ul>

    <?php if($user->getAccess() > 1) {?>
    <a class="btn btn-default" href="<?php echo $mysite;?>/index.php/addstudent?id=<?php echo $data['group']->getId() ?>" role="button">Добавить существующего ученика в группу</a>
    <?php } ?>

<?php $content=ob_get_clean(); ?>

<?php include 'view/layout.php'; ?>
