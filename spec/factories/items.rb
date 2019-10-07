FactoryBot.define do

  factory :item do
    name                  {"ロングコート"}
    price                 {"5000"}
    product_condition     {"1"} #新品、未使用
    description           {"レディースのロングコートです"}
    sold_condition        {"1"} #出品中
    category_id           {"32"} #ロングコート
    region_id             {"13"} #東京都
    brand_id              {"5788"} #ユニクロ
    user_id               {"2"}
    buyer_id              {""}
    size_id               {"5"} #M
    delivery_payee        {"1"} #送料込み(出品者負担)
    delivery_time         {"1"} #1~2日で発送
    delivery_method       {"5"} #クロネコヤマト
  end

end