<?php
/**
 * @author Sergei Novitskov
 * @copyright 2KTVRp Group IVKHK 2016
 * @version 1.0
 */

    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    /**
     * функция автозагрузки классов по требованию
     * @param  string $class_name - название папки
     * @return подключает файл, если он еще не был подключен.
     */
    function myLoader($class_name){

        $myDirs=array(  'controller/',
                        'model/entity/',
                        'model/repository/',
                        'model/',
                        'route/',
                        'view/templates/',
                        'view/',
                        'utils/'
                    );
        foreach($myDirs as $directory)
        {
            if(file_exists($directory.$class_name .'.php'))
            {
                require_once($directory.$class_name .'.php');
                return;
            }
        }
    }

    spl_autoload_register('myLoader'); //регистрация автозагрузчика

    $filter=new Filter();

    $uri=$filter->filterGetUri();
    $s = explode('?', $uri);
    $uri = $s[0];
    $uri=rtrim($uri,'/');
    $uriPrefix= $_SERVER['SCRIPT_NAME']; // путь /mysite/index.php

$groupController=new GroupController();
$studentController=new StudentController();
$loginController=new LoginController();

$sid = new Session('START'); // Считываем сессию SESSION_ID
$user=new User( $sid->getSession(), 'READ'); // Проверяем есть ли такой сеанс в базе

if (!$user->getId()) {
    $uri = $uriPrefix.'/login';
}

$level = $user->getAccess(); // 0-Гость, 1-Ученик, 2-Учитель, 3-Куратор, 4-Админ

switch ($uri) {
    // ПРОСМОТР ГРУПП
    case $uriPrefix.'/showgroup':
        $response=$groupController->getGroup_action($filter->filterId());
        $response=$loginController->getAccess($response, $level, 1);
        break;
    // ДОБАВЛЕНИЕ НОВОЙ ГРУППЫ
    case $uriPrefix.'/addgroup':
        $response=$groupController->addGroup_action();
        $response=$loginController->getAccess($response, $level, 3);
        break;
    case $uriPrefix.'/insertgroup':
        $response=$groupController->insertGroup_action($filter->filterInsertGroup());
        $response=$loginController->getAccess($response, $level, 3);
        break;
    // ПРОСМОТР СТУДЕНТА
    case $uriPrefix.'/showstudent':
        $response=$studentController->showStudent_action($filter->filterId());
        $response=$loginController->getAccess($response, $level, 2);
        break;
    // ДОБАВЛЕНИЕ НОВОГО СТУДЕНТА
    case $uriPrefix.'/addnewstudent':
        $response=$studentController->addStudent_action();
        $response=$loginController->getAccess($response, $level, 3);
        break;
    case $uriPrefix.'/insertstudent':
        $response=$studentController->insertStudent_action($filter->filterInsertStudent());
        $response=$loginController->getAccess($response, $level, 3);
        break;
    // ДОБАВЛЕНИЕ СУЩЕСТВУЮШЕГО СТУДЕНТА
    case $uriPrefix.'/addstudent':
        $response=$studentController->listExistsStudents_action($filter->filterId());
        $response=$loginController->getAccess($response, $level, 2);
        break;
    case $uriPrefix.'/insertstudenttogroup':
        $response=$studentController->insertStudentToGroup_action($filter->insertStudentToGroup());
        $response=$loginController->getAccess($response, $level, 2);
        break;
    // УДАЛЕНИЕ СТУДЕНТА ИЗ ГРУППЫ
    case $uriPrefix.'/removestudentfromgroup':
        $response=$studentController->removeStudentFromGroup_action($filter->insertStudentToGroup());
        $response=$loginController->getAccess($response, $level, 2);
        break;
    // АВТОРИЗАЦИЯ
    case $uriPrefix.'/login':
        $response=$loginController->showLogin_action($filter->filterInsertLogin());
        break;
    case $uriPrefix.'/logout':
        $response=$loginController->showLogout_action($user->getId());
        break;
    // ДОБАВЛЕНИЕ ПОЛЬЗОВАТЕЛЯ
    case $uriPrefix.'/adduser':
        $response=$loginController->addUser_action();
        $response=$loginController->getAccess($response, $level, 3);
        break;
    case $uriPrefix.'/insertuser':
        $response=$loginController->insertUser_action($filter->filterInsertUser());
        $response=$loginController->getAccess($response, $level, 3);
        break;
    // ПРОСМОТР ПОЛЬЗОВАТЕЛЯ
    case $uriPrefix.'/showuser':
        $response=$loginController->listExistsUsers_action();
        $response=$loginController->getAccess($response, $level, 1);
        break;
    // УДАЛЕНИЕ ПОЛЬЗОВАТЕЛЯ
    case $uriPrefix.'/deleteuser':
        $response=$loginController->deleteUser_action($filter->filterId());
        $response=$loginController->getAccess($response, $level, 3);
        break;
    // ГЛАВНАЯ СТРАНИЦА
    default: 
        $response=$groupController->getAllGroups_action();
        $response=$loginController->getAccess($response, $level, 1);
        break;
}
    
    if(isset($response)){
        echo $response;
    }


