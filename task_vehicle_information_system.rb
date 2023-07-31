module VehicleCategory
  $vehicle_objects = []
  VEHICLE_CATEGORIES = { "Cars" => ["Sedan", "SUV", "CUV", "Hatch Back"], "motorcycles" => ["Bike", "Scooter"], "trucks" => ["lorry", "DCM"] }
  
  def check_vehicle_input?(category, type)
    return false unless VEHICLE_CATEGORIES.keys.include?(category)
    VEHICLE_CATEGORIES[category].include?(type)
  end

  def check_valid_year?(year)
    year.between?(1886, 2030)
  end
end

class Vehicle
  include VehicleCategory
  attr_accessor :make, :model, :year, :category, :type

  def add_vehicle(vehicle_make, vehicle_model, vehicle_year, vehicle_category, vehicle_type)
    if check_vehicle_input?(vehicle_category, vehicle_type) && check_valid_year?(vehicle_year)
      @make = vehicle_make
      @model = vehicle_model
      @year = vehicle_year
      @category = vehicle_category
      @type = vehicle_type
      puts "Vehicle added successfully."
      puts "Car Make: #{@make}"
      puts "Car Model: #{@model}"
      puts "Year: #{@year}"
      puts "Vehicle Category: #{@category}"
      puts "Vehicle Type: #{@type}"
    else
      puts "Invalid Input is provided, when creating vehicle, again give the input."
    end
  end

  def search_vehicle_by_model(vehicle_objects, model)
    flag = 0
    vehicle_objects.each do |itr|
      if itr.model == model
        flag = 1
        puts "#{itr.make}, #{itr.model}, #{itr.year}, #{itr.category}, #{itr.type}"
      end
    end
    if flag == 0
      puts "No such model vehicles is found"
    end
  end

  def display_vehicles_by_category(vehicle_objects, category)
    flag = 0
    vehicle_objects.each do |itr|
      if itr.category == category
        flag = 1
        puts "#{itr.make}, #{itr.model}, #{itr.year}, #{itr.category}, #{itr.type}"
      end
    end
    if flag == 0
      puts "No such category vehicles is found"
    end
  end

  def display_vehicle_details(vehicle_objects, make, model, year)
    flag = 0
    puts "Vehicle details:"
    vehicle_objects.each do |itr|
      if itr.make == make && itr.model == model && itr.year == year
        flag = 1
        puts "#{itr.make}"
        puts "#{itr.model}"
        puts "#{itr.year}"
        puts "#{itr.category}"
        puts "#{itr.type}"
      end
    end
    if flag == 0
      puts "No such vehicles is found"
    end
  end
end

class MyVehicle

  def vehicle_information
    while (true)
      puts "Enter 1 for adding vehicle"
      puts "Enter 2 for searching vehicle by model"
      puts "Enter 3 for displaying vehicles by category"
      puts "Enter 4 for displaying vehicle details"
      num = gets.to_i
      obj = Vehicle.new
      case num
        when 1
          puts "Enter vehicle make:"
          s1 = gets
          s1 = s1.chomp unless s1.nil?
          puts "enter Vehicle model:"
          s2 = gets
          s2 = s2.chomp unless s2.nil?
          puts "enter manufacturing year:"
          s3 = gets.to_i
          puts "enter vehicle category:"
          s4 = gets
          s4 = s4.chomp unless s4.nil?
          puts "enter vehicle type:"
          s5 = gets
          s5 = s5.chomp unless s5.nil?
          obj.add_vehicle(s1,s2,s3,s4,s5)
          $vehicle_objects.push(obj)
        when 2
          puts "enter the vehicle model:"
          model = gets
          model = model.chomp unless model.nil?
          obj.search_vehicle_by_model($vehicle_objects, model)
        when 3
          puts "enter the vehicle category:"
          category = gets
          category = category.chomp unless category.nil?
          obj.display_vehicles_by_category($vehicle_objects, category)
        when 4
          puts "enter the vehicle make:"
          make = gets
          make = make.chomp unless make.nil?
          puts "enter the vehicle model:"
          model = gets
          model = model.chomp unless model.nil?
          puts "enter the year:"
          year = gets.to_i
          obj.display_vehicle_details($vehicle_objects, make, model, year)
        else
          puts "You entered wrong choice"
        end
      puts "If you want to continue press Y or else press N"
      continue = gets
      continue = continue.chomp unless continue.nil?
      break if continue == "N"
    end
    puts "Exiting the program. Goodbye!"
  end
end
