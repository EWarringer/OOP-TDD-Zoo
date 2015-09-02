class Zoo
  attr_accessor :name, :cages, :employees

  def initialize(name)
    @name = name
    @cages = []
    @employees = []
    10.times do
      @cages << Cage.new
    end
  end

  def add_employee(name)
    @employees << name
  end

  def add_animal(animal)
    raise ZooAtCapacity if not cages.last.empty?
    cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        break
      end
    end
  end

  def visit
    greeting = []
    employees.each do |employee|
      greeting << employee.greet + "\n"
    end
    cages.each do |cage|
      if not cage.empty?
        greeting << "#{cage.animal.speak}\n"
      end
    end
    greeting.join("")
  end
end
