<?php

class User{

    private $id;
    private $user;
    private $pass;
    private $email;
    private $access;

    /**
     *  Считывает состояние из таблицы user или записывает, изменяет или удаляет строку таблицы.
     *
     * @param array $args содержит id строки в таблице, которыую необходимо затронуть, 
     * или значения полей таблицы в следующем порядке: id, username, password, email, access
     * @param string $flag содержит строку-флаг, который определяет действие (READ,INSERT,UPDATE,DELETE)
     */
    public function __construct($args, $flag=null){

        if($flag!=null){
            $repo=new UserRepository();
            switch ($flag) {
                case 'READ':{
                    if(count($args) < 2) {
                        $user=$repo->readUserBySession($args);
                    }
                    else {
                        $user=$repo->readUser(strtolower($args['username']));
                    }

                    $this->_setId($user['id']);
                    $this->_setUser($user['username']);
                    $this->_setPass($user['password']);
                    $this->_setEmail($user['email']);
                    $this->_setAccess($user['access']);
                    break;
                }
                case 'INSERT':{
                    $this->_setId($repo->insertUser($args));
                    break;
                }
                case 'UPDATE':{
                    $repo->updateUser($args);
                    //break;
                }
                case 'DELETE':{
                    $repo->deleteUser($args);
                    break;
                }
            }
        }else{
            $this->_setId();
            $this->_setUser();
            $this->_setPass();
            $this->_setEmail();
            $this->_setAccess();
        }

    }

    /**
     * Получает значение id
     * @return id;
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Устанавливает значение $id
     * @param String $id номель пользователя
     * @return self
     */
    private function _setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Получает значение user
     * @return String;
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Устанавливает значение $user
     * @param String $user имя пользователя
     * @return self
     */
    private function _setUser($user)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Получает значение pass
     * @return String;
     */
    public function getPass()
    {
        return $this->pass;
    }

    /**
     * Устанавливает значение $pass
     * @param int $pass пароль пользователя
     * @return self
     */
    private function _setPass($pass)
    {
        $this->pass = $pass;

        return $this;
    }

    /**
     * Получает значение email
     * @return String;
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Устанавливает значение $email
     * @param String $email эл. адресс
     * @return self
     */
    private function _setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Получает значение access
     * @return Int;
     */
    public function getAccess()
    {
        return $this->access;
    }

    /**
     * Устанавливает значение $access
     * @param int $access уровень доступа
     * @return self
     */
    private function _setAccess($access)
    {
        $this->access = $access;

        return $this;
    }

}