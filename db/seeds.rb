class Seed

  def self.begin
    seed = Seed.new
    seed.generate_animals
  end

  def generate_animals
    10.times do |i|
      animal = Animal.create!(
        name: Faker::Cat.name,
        species: "cat"
      )
    end
    10.times do |i|
      animal = Animal.create!(
        name: Faker::Cat.name,
        species: "dog"
      )
    end
  end
end

Seed.begin
