# テーブル設計

## userテーブル

|      Culumn      |  Type  |  Option    |
| ---------------- | ------ | null false |
| nickname         | string | null false |
| email            | string | null false |
| password         | string | null false |
| family_name      | string | null false |
| first_name       | string | null false |
| family_name_kana | string | null false |
| first_name_kane  | date   | null false |

### Assciation

- has_many :items
- has_many :comments
- has_many :purchase

## itemsテーブル

|      Culumn      |    Type    |            Option             |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null false                    |
| description      | string     | null false                    |
| category         | string     | null false                    |
| status           | string     | null false                    |
| shopping_charges | string     | null false                    |
| shopping_area    | string     | null false                    |
| days_to_shop     | string     | null false                    |
| price            | string     | null false                    |
| user             | references | null false, foreign_key: true |

### Assciation

- has_many   :comments
- belongs_to :user
- has_one    :purchase

## purchaseテーブル

|    Culumn     |    Type    |            Option             |
| ------------- | ---------- | ----------------------------- |
| postal_code   | string     | null false                    |
| prefecture    | string     | null false                    |
| municipality  | string     | null false                    |
| address       | string     | null false                    |
| buliding_name | string     | null false                    |
| phone_number  | string     | null false                    |
| user          | references | null false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## commentテーブル

| Culumn |    Type    |            Option             |
| ------ | ---------- | ----------------------------- |
| text   | text       | null false                    |
| user   | references | null false, foreign_key: true |
| item   | references | null false, foreign_key: true |

### Association

- belongs_to :user
- belongs_tp :item