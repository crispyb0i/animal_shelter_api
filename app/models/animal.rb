class Animal < ApplicationRecord
  validates_presence_of :name, :species

  scope :search, -> (keyword){ where("name like ?", "%#{keyword}%") }
  scope :random_animal, -> { order("RANDOM()").first}
end
