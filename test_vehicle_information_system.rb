require 'minitest/autorun'
require 'stringio'
require_relative 'task_vehicle_information_system.rb'

class TestMyVehicle < Minitest::Test

	def test_add_vehicle_successful
    @vehicle = MyVehicle.new
		user_input = "1\nToyota\nCamry\n2022\nCars\nSedan\nN\n"
		expected_output =<<~OUTPUT
    Enter 1 for adding vehicle
    Enter 2 for searching vehicle by model
    Enter 3 for displaying vehicles by category
    Enter 4 for displaying vehicle details
    Enter vehicle make:
    enter Vehicle model:
    enter manufacturing year:
    enter vehicle category:
    enter vehicle type:
    Vehicle added successfully.
    Car Make: Toyota
    Car Model: Camry
    Year: 2022
    Vehicle Category: Cars
    Vehicle Type: Sedan
    If you want to continue press Y or else press N
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_output) do
      @vehicle.vehicle_information
    end
  end

  def test_invalid_input_data
    @vehicle = MyVehicle.new
 		user_input = "1\nHonda\nCamry\n1700\nCycles\n Sedan\nN\n"
 		expected_output =<<~OUTPUT
    Enter 1 for adding vehicle
    Enter 2 for searching vehicle by model
    Enter 3 for displaying vehicles by category
    Enter 4 for displaying vehicle details
    Enter vehicle make:
    enter Vehicle model:
    enter manufacturing year:
    enter vehicle category:
    enter vehicle type:
    Invalid Input is provided, when creating vehicle, again give the input.
    If you want to continue press Y or else press N
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_output) do
      @vehicle.vehicle_information
    end
 	end

	def test_search_vehicles_by_model
    @vehicle = MyVehicle.new
		user_input = "2\nCamry\nN\n"
		expected_output =<<~OUTPUT
    Enter 1 for adding vehicle
    Enter 2 for searching vehicle by model
    Enter 3 for displaying vehicles by category
    Enter 4 for displaying vehicle details
    enter the vehicle model:
    Toyota, Camry, 2022, Cars, Sedan
    If you want to continue press Y or else press N
    Exiting the program. Goodbye!
    OUTPUT
		$stdin = StringIO.new(user_input)
    assert_output(expected_output) do
      @vehicle.vehicle_information
    end
	end

	def test_display_vehicles_by_category
    @vehicle = MyVehicle.new
		user_input = "3\nCars\nN\n"
		expected_output =<<~OUTPUT
    Enter 1 for adding vehicle
    Enter 2 for searching vehicle by model
    Enter 3 for displaying vehicles by category
    Enter 4 for displaying vehicle details
    enter the vehicle category:
    Toyota, Camry, 2022, Cars, Sedan
    If you want to continue press Y or else press N
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_output) do
      @vehicle.vehicle_information
    end
	end

	def test_display_vehicle_details
    @vehicle = MyVehicle.new
  	user_input = "4\nToyota\nCamry\n2022\nN\n"
		expected_output =<<~OUTPUT
    Enter 1 for adding vehicle
    Enter 2 for searching vehicle by model
    Enter 3 for displaying vehicles by category
    Enter 4 for displaying vehicle details
    enter the vehicle make:
    enter the vehicle model:
    enter the year:
    Vehicle details:
    Toyota
    Camry
    2022
    Cars
    Sedan
    If you want to continue press Y or else press N
    Exiting the program. Goodbye!
    OUTPUT
		$stdin = StringIO.new(user_input)
    assert_output(expected_output) do
      @vehicle.vehicle_information
    end
	end

	def test_wrong_choice_selection
    @vehicle = MyVehicle.new
		user_input = "5\nN\n"
		expected_output =<<~OUTPUT
    Enter 1 for adding vehicle
    Enter 2 for searching vehicle by model
    Enter 3 for displaying vehicles by category
    Enter 4 for displaying vehicle details
    You entered wrong choice
    If you want to continue press Y or else press N
    Exiting the program. Goodbye!
    OUTPUT
		$stdin = StringIO.new(user_input)
    assert_output(expected_output) do
      @vehicle.vehicle_information
    end
	end

	def test_for_no_vehicles_found_with_the_model
    @vehicle = MyVehicle.new
		user_input = "2\nAcconto\nN\n"
		expected_output =<<~OUTPUT
    Enter 1 for adding vehicle
    Enter 2 for searching vehicle by model
    Enter 3 for displaying vehicles by category
    Enter 4 for displaying vehicle details
    enter the vehicle model:
    No such model vehicles is found
    If you want to continue press Y or else press N
    Exiting the program. Goodbye!
    OUTPUT
		$stdin = StringIO.new(user_input)
    assert_output(expected_output) do
      @vehicle.vehicle_information
    end
	end

	def test_for_no_vehicles_found_with_the_category
    @vehicle = MyVehicle.new
		user_input = "3\nCycle\nN\n"
		expected_output =<<~OUTPUT
    Enter 1 for adding vehicle
    Enter 2 for searching vehicle by model
    Enter 3 for displaying vehicles by category
    Enter 4 for displaying vehicle details
    enter the vehicle category:
    No such category vehicles is found
    If you want to continue press Y or else press N
    Exiting the program. Goodbye!
    OUTPUT
		$stdin = StringIO.new(user_input)
    assert_output(expected_output) do
      @vehicle.vehicle_information
    end
	end
end
