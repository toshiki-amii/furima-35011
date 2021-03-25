FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'test000000'}
    password_confirmation {password}
    family_name           {'田中'}
    first_name           {'太郎'}
    read_family           {'タナカ'}
    read_first           {'タロウ'}
    birth           {'1931-03-04'}
  end
end