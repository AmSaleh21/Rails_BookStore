class Book < ApplicationRecord
    validates :isbn, presence: true, uniqueness: true
    validates :name, presence:true
    validates :description, presence: true
    validates :image_url, presence: true
end
