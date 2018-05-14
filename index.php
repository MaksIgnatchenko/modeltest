<?php
require_once("Connection.php");
class Model
{
    protected static $pk;
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
        $pk_field = static::getPk();
        $table = static::$__table__;
        $sql = 'SELECT * FROM :table WHERE :pk_field = :pk';
        $query = Connection::get_instance() -> prepare($sql);
        $params = [':table' => $table, ':pk_field' => $pk_field, ':pk' => $pk];
        $query -> execute($params);
        return $query->fetch(PDO::FETCH_ASSOC);
    }

    public static function getColumns()
    {
        static::$pk = (static::$pk) ? static::$pk : static::getPk();
//        if (!static::$pk) {
//            static::$pk = static::getPk();
//        }
        return static::$pk;
    }

//    public static function getAll()
//    {
//        $sql = "select * from " . static::$__table__  . ";";
//        $query = Connection::get_instance()->prepare($sql);
//        $query->execute();
//        return $query->fetchAll(PDO::FETCH_ASSOC);
//    }
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