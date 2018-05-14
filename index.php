<?php
require_once("Connection.php");
class Model
{
    protected static $pk;
    protected static $fields;
    protected static $identityMap;
    protected $dirty;
    public $data;

    public function __construct($data = [])
    {
        $this->data = $data;
        $this->dirty = false;
        static::$identityMap[$this->{static::getPk()}] = $this;
    }

    public function __set($name, $value)
    {
        if (in_array($name, static::getDesc()) && ($name !== static::getPk())) {
            $this->data[$name] = $value;
            $this->dirty = true;
        }
    }

    public function __get($name)
    {
        if (array_key_exists($name, $this->data)) {
            return $this->data[$name];
        }
    }

    public static function getPk()
    {
        if (!static::$pk) {
            $sql = "DESC " . static::$__table__ . ";";
            $query = Connection::get_instance()->prepare($sql);
            $query->execute();
            $desc = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach ($desc as $value) {
                if ($value['Extra'] == "auto_increment") {
                    static::$pk = $value['Field'];
                    break;
                }
            }
        }
        return static::$pk;
    }

    public static function getDesc()
    {
        if (!static::$fields) {
            $sql = "DESC " . static::$__table__ . ";";
            $query = Connection::get_instance()->prepare($sql);
            $query->execute();
            $desc = $query->fetchAll(PDO::FETCH_ASSOC);
            foreach ($desc as $value) {
                static::$fields[] = $value['Field'];
                if ($value['Extra'] == "auto_increment") {
                    static::$pk = $value['Field'];
                }
            }
        }
        return static::$fields;
    }

    public static function getByPk($pk)
    {
        if (!isset(static::$identityMap[$pk])) {
            $sql = 'SELECT * FROM ' . static::$__table__ . ' WHERE ' . static::getPk() . ' = :pk';
            $query = Connection::get_instance()->prepare($sql);
            $params = [':pk' => $pk];
            $query->execute($params);
            $data = $query->fetch(PDO::FETCH_ASSOC);
            return new static($data);
        } else return static::$identityMap[$pk];
    }

    public function save()
    {
        if ($this->dirty) {
            $pk = static::getPk();
            list($setArray, $setString) = $this->buildSetValues();
            $execute = [];
            foreach ($setArray as $key => $value) {
                $execute[":" . $key] = $value;
            }
            if (isset($this->data[$pk])) {
                $sql = "update " . static::$__table__ . " set " . $setString . " where " . $pk . " = " . $this->data[$pk];
            }   else {
                $sql = "insert into " . static::$__table__ . " set " . $setString;
            }
            $query = Connection::get_instance()->prepare($sql);
            $query->execute($execute);
            $this->dirty = false;
        }
    }

    

    public function buildSetValues ()
    {
        $setArray = [];
        $setString = "";
        $pk = static::getPk();
        foreach ($this->data as $key => $value) {
            if ($key !== $pk) {
                $setArray[$key] = $value;
                $setString .= $key . " = :" . $key . ",";
            }
        }
        return [$setArray, trim($setString, ",")];
    }
}


class Posts extends Model
{
    protected static $__table__ = "posts";

}

class Comments extends Model
{
    protected static $__table__ = "comments";
}
