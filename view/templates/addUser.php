<?php
    $mysite = dirname($_SERVER['SCRIPT_NAME']);
    $title = "Добавление нового пользователя";
?>
<?php ob_start(); ?>
  <h2 class="page-header">Добавление нового пользователя</h2>

    <form role="form" action="<?php echo $mysite;?>/index.php/insertuser" method="POST">
        <div class="form-group" >
          <label for="_name">Логин:</label>
          <input type="text" class="form-control" id="_name" name="name" placeholder="Логин">
        </div>
        <div class="form-group" >
          <label for="_pass">Пароль:</label>
          <input type="password" class="form-control" id="_pass" name="pass" placeholder="Пароль">
        </div>
        <div class="form-group" >
          <label for="_email">Эл. адрес:</label>
          <input type="email" class="form-control" id="_email" name="email" placeholder="E-mail">
        </div>
        <div class="form-group" >
          <label for="_access">Доступ:</label>
          <select class="form-control" id="_access" name="access">
          <?php
            $sid = new Session('START'); 
            $user=new User( $sid->getSession(), 'READ');

            $max = 0;
            if($user->getAccess() == 4) {
              $max = 5;
            }
            else {
              $max = $user->getAccess();
            }


            for($i=1; $i < $max; $i++) {

              $access = '';
              switch($i) {
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
              echo "<option value='".$i."'>".$access."</option>";
            }
          ?>
          </select>
        </div>
        
        <button type="reset" class="btn btn-default">Очистить</button>
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>

<?php $content=ob_get_clean(); ?>

<?php include 'view/layout.php'; ?>