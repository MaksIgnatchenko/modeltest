<?php
require_once("Connection.php");
class Model
{
    protected static $pk;
    protected $fields;

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

    public static function getByPk($pk)
    {
        $sql = 'SELECT * FROM ' . static::$__table__ . ' WHERE ' . static::getPk() . ' = :pk';
        $query = Connection::get_instance()->prepare($sql);
        $params = [':pk' => $pk];
        $query->execute($params);
        return $query->fetch(PDO::FETCH_ASSOC);
    }

    public function __construct($result)
    {
        $this->fields = $result;
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

//print_r(Posts::getDesc());
print_r(Posts::getByPk(1));
//print_r(Posts::getPk());