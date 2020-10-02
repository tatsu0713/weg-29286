FactoryBot.define do
  factory :tweet do
    brand_id            {2}
    type_id             {2}
    model_year_id       {2}
    title               {'海の見える街'}
    caption             {'aaaaaaaaaaaaaa'}
    user
  end
end
