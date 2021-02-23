# テーブル設計

## userテーブル

|        Culum       |  Type  |         Option           |
| ------------------ | ------ | null false               |
| nickname           | string | null false               |
| email              | string | null false, unique: true |
| encrypted_password | string | null false               |
| family_name        | string | null false               |
| first_name         | string | null false               |
| family_name_kana   | string | null false               |
| first_name_kane    | string | null false               |
| birth_day          | date   | null false               |

### Assciation

- has_many :items
- has_many :purchases

## itemsテーブル

|        Culumn       |    Type    |            Option             |
| ------------------- | ---------- | ----------------------------- |
| name                | string     | null false                    |
| description         | string     | null false                    |
| price               | integer    | null false                    |
| category_id         | integer    | null false                    |
| status_id           | integer    | null false                    |
| shopping_charge_id  | integer    | null false                    |
| shopping_area_id    | integer    | null false                    |
| days_to_shop_id     | integer    | null false                    |
| user                | references | null false, foreign_key: true |

<!-- ○○_idはactive_hashで実装予定 -->
### Assciation

- belongs_to :user
- has_one    :purchase

## purchaseテーブル

| Culumn |    Type    |            Option             |
| ------ | ---------- | ----------------------------- |
| user   | references | null false, foreign_key: true |
| item   | references | null false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many   :street_address

## Street_addressテーブル

|     Culumn    |    Type    |            Option             |
| ------------------- | ---------- | ----------------------- |
| postal_code   | string     | null false                    |
| prefecture    | string     | null false                    |
| municipality  | string     | null false                    |
| address       | string     | null false                    |
| buliding_name | string     | null false                    |
| phone_number  | string     | null false                    |
| purchase      | references | null false, foreign_key: true |

### Association

- belongs_to :purchase