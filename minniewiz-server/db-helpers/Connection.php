<?php

    class Connection{

        private $host = 'localhost';
        private $user = 'root';
        private $pass = '';
        private $dbName = 'minniewiz';

        protected function connect(){
            $dsn = "mysql:host=" . $this->host . ";dbname=" . $this->dbName;
            $pdo = new PDO($dsn, $this->user, $this->pass);
            $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);

            return $pdo;
        }

    }