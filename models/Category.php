<?php

namespace app\models;
use yii\db\ActiveRecord;

class Category extends ActiveRecord
{

    public static function tableName()
{
        return 'category';
}

    public function getProducts()
{
        return $this->hasOne(Product::className(),['id' => 'category_id']);
}

}