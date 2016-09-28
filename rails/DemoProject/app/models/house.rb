class House < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true

  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'Person'
end
