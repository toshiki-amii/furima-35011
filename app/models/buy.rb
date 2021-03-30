class Buy < ApplicationRecord
  belongs_to :user_id
  belongs_to :item
end
