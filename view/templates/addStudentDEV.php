<?php
    $mysite = dirname($_SERVER['SCRIPT_NAME']);
    $title = "Добавление нового ученика";
    $link='<script defer src="'.$mysite.'/public/js/addGroup.js"></script>';
?>
<?php ob_start(); ?>
  <h2 class="page-header">Добавление нового ученика</h2>

    <form role="form" action="<?php echo $mysite;?>/index.php/insertstudent" method="POST" onsubmit="return validate()">
        <div class="form-group" >
          <label for="_group_id">Группа:</label>
          <select class="form-control" id="_group_id" name="group_id">
              <?php  foreach($data['groups'] as $group): ?>
                <option value="<?php echo $group->getId(); ?>"><?php echo $group->getGroupName(); ?></option>
              <?php endforeach ?>
          </select>
        </div>
        <div class="form-group" >
          <label for="_name">Имя:</label>
          <input type="text" class="form-control" id="_name" name="name" placeholder="имя">
        </div>
        <div class="form-group" >
          <label for="_surname">Фамилия:</label>
          <input type="text" class="form-control" id="_surname" name="surname" placeholder="Фамилия">
        </div>
        <div class="form-group" >
          <label for="_code">Личный код:</label>
          <input type="text" class="form-control" id="_code" name="code" placeholder="Личный код" value="<?php echo rand(3, 4).rand(60, 99).rand(1, 12).rand(1, 31).rand(1000, 9000); ?>">
        </div>
        <div class="form-group" >
          <label for="_registry">Код регистра:</label>
          <input type="text" class="form-control" id="_registry" name="registry" placeholder="Код регистра" value="<?php echo rand(30000, 40000); ?>">
        </div>
        <div class="form-group" >
          <label for="_eban">Банковский счет:</label>
          <input type="text" class="form-control" id="_eban" name="eban" placeholder="Банковский счет" value="<?php echo "EE".rand(1000000000, 4000000000); ?>">
        </div>
        <div class="form-group" >
          <label for="_bankname">Имя банка:</label>
          <input type="text" class="form-control" id="_bankname" name="bankname" placeholder="Имя банка" value="<?php $text = array("Swedbank", "SEB Bank", "Nordea", "Danske", "Sampo bank"); echo $text[rand(1, count($text))-1]; ?>">
        </div>
        <h3>Адрес:</h3>
        <div class="form-group">
          <label for="_street">Улица:</label>
          <input type="text" class="form-control" id="_street" name="street" placeholder="Улица" value="<?php $text = array("Kalevi", "Parna", "Katse", "Rea", "Lehe", "Aasa", "Rohu", "Muru", "Vase"); echo $text[rand(1, count($text))-1]; ?>">
        </div>
        <div class="form-group">
          <label for="_house">Дом:</label>
          <input type="text" class="form-control" id="_house" name="house" placeholder="Дом" value="<?php echo rand(1, 100); ?>">
        </div>
        <div class="form-group">
          <label for="_room">Квартира:</label>
          <input type="text" class="form-control" id="_room" name="room" placeholder="Квартира" value="<?php echo rand(1, 100); ?>">
        </div>
        <div class="form-group">
          <label for="_city_id">Город:</label>
          <select class="form-control" id="_city_id" name="city_id">
              <?php  foreach($data['cities'] as $city): ?>
                <option value="<?php echo $city['id']; ?>"><?php echo $city['name']; ?></option>
              <?php endforeach ?>
          </select>
        </div><div class="form-group">
          <label for="_country_id">Страна:</label>
          <select class="form-control" id="_country_id" name="country_id">
              <?php  foreach($data['countries'] as $country): ?>
                <option value="<?php echo $country['id']; ?>"><?php echo $country['name']; ?></option>
              <?php endforeach ?>
          </select>
        </div>

        <button type="reset" class="btn btn-default">Очистить</button>
        <button type="submit" class="btn btn-default">Добавить</button>
    </form>


<?php $content=ob_get_clean(); ?>

<?php include 'view/layout.php'; ?>