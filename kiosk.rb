class Kiosk
  attr_reader :items

  def initialize
    @items = [Coffee.new, Tea.new]
  end
end

class Customer
  attr_reader :name, :basket

  def initialize(name)
    @name = name
    @basket = []
  end
end

class Coffee
  attr_reader :name, :extras

  def initialize
    @name = "Coffee"
    @extras = ["sweetener", "sugar"]
  end
end

class Tea
  attr_reader :name, :extras

  def initialize
    @name = "Tea"
    @extras = ["sugar", "lemon"]
  end
end

kiosk = Kiosk.new
customer = Customer.new("George")

loop do
  puts "What do you want from the kiosk?"
  puts "We have"

  puts  kiosk.items.map(&:name)

  want = gets.chomp

  if want == "coffee"
    customer.basket << Coffee.new

    puts "Do you want the extras?"
    answer = gets.chomp

    if answer != "yes"
      customer.basket[-1].extras.clear
    end
  elsif want == "tea"
    customer.basket << Tea.new

    puts "Do you want the extras?"
    answer = gets.chomp

    if answer != "yes"
      customer.basket[-1].extras.clear
    end
  end

  puts "#######################"
  puts "Here's your basket now:"
  puts "#######################"
  puts "\n"

  customer.basket.each do |item|
    p item
  end

  puts "\n"
end
