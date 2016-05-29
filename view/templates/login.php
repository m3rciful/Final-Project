<?php
    $mysite = dirname($_SERVER['SCRIPT_NAME']);
    $title = "Форма авторизации";
    $link = '<link rel="stylesheet" href="'.$mysite.'/public/css/signin.css">';
?>
<?php ob_start(); ?>

<div class="container">

  <div class="alert alert-danger <?php echo $data['error'];?>" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button><h4>Ошибка</h4>
    <p>Вы ввели неверный <b>логин</b> или <b>пароль</b></p>
  </div>

	 <form class="form-signin" action="<?php echo $mysite;?>/index.php/login" method="POST">

      <h2 class="form-signin-heading">Войдите</h2>
      <label for="inputEmail" class="sr-only">Логин</label>
      <input type="text" id="_username" name="username" class="form-control" placeholder="Логин" required autofocus><br>
      <label for="inputPassword" class="sr-only">Пароль</label>
      <input type="password" id="_password" name="password" class="form-control" placeholder="Пароль" required>
      <p>&nbsp;</p>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>

    </form>

</div>
<?php $content=ob_get_clean(); ?>

<?php include 'view/layout.php'; ?>
