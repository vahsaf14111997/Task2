class User < ApplicationRecord
    has_one :place, dependent: :destroy
    accepts_nested_attributes_for :place
    validates :name, :phone, presence: true 
    validates :phone, uniqueness: true
end
