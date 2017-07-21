class AddSpecies < ActiveRecord::Migration[5.1]
  def change
    add_column(:animals, :name, :string)
    add_column(:animals, :species, :string)
  end
end
