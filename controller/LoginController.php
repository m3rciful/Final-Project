<?php

class LoginController{

        public function __construct(){
        }

        /**
         * метод, который оборачивает данные в html
         * @param  String $path путь к шаблону html
         * @param  array $data объект или массив с данными, которые будут доступны в шаблоне.
         * @access private
         * @return строка содержащая данные, обернутые в html
         */
        private function renderTemplate($path, $data = null) {

            ob_start();
            require $path;
            $html=ob_get_clean();
            return $html;
        }

        /**
         * [getAccess description]
         * @param  string $response начальное значение взятое из index.php
         * @param  int $level    уровень доступа пользователя (берется из базы)
         * @param  int $access   необходимый уровень доступа (задается в index.php)
         * @return string ответ сервера клиенту (браузеру)
         */
        public function getAccess($response, $level, $access) {

            if($level < $access) {
                $paramForResponse = array('level' => $level, 'access' => $access, 'test' => 'vasja');
                $response=$this->renderTemplate("view/templates/access.php", $paramForResponse);
            }
            return $response;
        }

        /**
         * метод, который обрабатывает данные из формы авторизации и создает сессию, если пользователь существует.
         * @param  массив $args содержит значения (user, pass) для полей в таблице user
         * @return string ответ сервера клиенту (браузеру)
         */
        public function showLogin_action($args) {

            $error = "hide"; // для вывода ошибок

            if($args['username'] AND $args['password']) 
            {  
                $user = new User($args,'READ');

                if(password_verify($args['password'], $user->getPass()))
                {
                    $session = new Session();
                    $session->refresh();
    
                    $paramForUser = array($session->getSession(), $user->getId());
                    $user = new User($paramForUser, 'UPDATE');
    
                    header('Location: http://'.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME']); // временное решение
                    exit();
                }
                else $error = "alert";
            }

            $response=$this->renderTemplate("view/templates/login.php", array('error'=>$error));
            return $response;
        }

        /**
         * Метод, который получает session_id пользователя и закрывает сессию
         * @param  string $session_id - сессия пользователя
         * @return возвращает функцию header для передаресации на index.php
         */
        public function showLogout_action($session_id) {

            $userRepository=new userRepository();
            $userRepository->destroyUserSession($session_id);

            return header('Location: http://'.$_SERVER['HTTP_HOST'].$_SERVER['SCRIPT_NAME']); // временное решение
        }

        /**
         * Добывает список пользователей и оборачивает его в html
         * @return string ответ сервера клиенту (браузеру)
         */
        public function listExistsUsers_action() {

            $userRepository=new userRepository();
            $users=$userRepository->listExistsUsers();

            $response=$this->renderTemplate("view/templates/listExistsUsers.php", array('users'=>$users));
            return $response;
        }

        /**
         * Выводит форму для добавления нового пользователя
         * @return string  ответ сервера клиенту (браузеру)
         */
        public function addUser_action(){

            $response=$this->renderTemplate("view/templates/addUser.php", array());
            return $response;
        }

        /**
         * Записывает информацию о новом пользователу в базу
         * @param  массив $args содержит значения для полей в таблице user
         * @return список всех пользователей (перенаправление)
         */
        public function insertUser_action($args) {

            if($args['name'] AND $args['pass']) {

                $args['pass'] = password_hash($args['pass'], PASSWORD_DEFAULT);
                
                $user=new User($args,"INSERT");
                return $this->listExistsUsers_action();
            }
            else {
                return $this->addUser_action();
            }
        }

        /**
         * Удаляется пользователя из базы данных
         * @param  int $id содержит номер пользователя
         * @return список всех пользователей (перенаправление)
         */
        public function deleteUser_action($id) {

            if($id) {
                $user=new User($id,"DELETE");
            }
            return $this->listExistsUsers_action();
        }


    }