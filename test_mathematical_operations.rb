require 'minitest/autorun'
require 'stringio'
require_relative 'task_mathematical_operations.rb'

class TestOperation < Minitest::Test

  def test_addition_operation
    user_input = "5\n10\n+\nN\n"
    expected_result =<<~OUTPUT
    Welcome to the Mathematical Operations Program!
    Enter the First Number\nEnter the Second Number
    Enter the operator
    Result: 15
    Do you want to perform another calculation? (Y/N)
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_result) { Operation.new.arithmetic_operation }
  end

  def test_subtraction_operation
    user_input = "9\n6\n-\nN\n"
    expected_result =<<~OUTPUT
    Welcome to the Mathematical Operations Program!
    Enter the First Number
    Enter the Second Number
    Enter the operator
    Result: 3
    Do you want to perform another calculation? (Y/N)
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_result) { Operation.new.arithmetic_operation }
  end

  def test_multiplication_operation
    user_input = "9\n13\n*\nN\n"
    expected_result =<<~OUTPUT 
    Welcome to the Mathematical Operations Program!
    Enter the First Number
    Enter the Second Number
    Enter the operator
    Result: 117
    Do you want to perform another calculation? (Y/N)
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_result) { Operation.new.arithmetic_operation }
  end

  def test_division_operation
    user_input = "10\n5\n/\nN\n"
    expected_result =<<~OUTPUT
    Welcome to the Mathematical Operations Program!
    Enter the First Number
    Enter the Second Number
    Enter the operator
    Result: 2
    Do you want to perform another calculation? (Y/N)
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_result) { Operation.new.arithmetic_operation }
  end

  def test_division_operation_with_second_number_zero
    user_input = "5\n0\n/\nN\n"
    expected_result =<<~OUTPUT
    Welcome to the Mathematical Operations Program!
    Enter the First Number
    Enter the Second Number
    Enter the operator
    Second number should not be zero.
    Do you want to perform another calculation? (Y/N)
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_result) { Operation.new.arithmetic_operation }
  end

  def test_with_numbers_taken_as_strings
    user_input = "abcd\nefgh\n+\nN\n"
    expected_result =<<~OUTPUT
    Welcome to the Mathematical Operations Program!
    Enter the First Number
    Enter the Second Number
    Enter the operator
    Result: 0
    Do you want to perform another calculation? (Y/N)
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_result) { Operation.new.arithmetic_operation }
  end

  def test_for_termination_of_infinite_loop
    user_input = "8\n9\n*\nN\n"
    expected_result =<<~OUTPUT
    Welcome to the Mathematical Operations Program!
    Enter the First Number
    Enter the Second Number
    Enter the operator
    Result: 72
    Do you want to perform another calculation? (Y/N)
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_result) { Operation.new.arithmetic_operation }
  end

  def test_for_wrong_operator_selection
    user_input = "100\n769\n%\nN\n"
    expected_result =<<~OUTPUT
    Welcome to the Mathematical Operations Program!
    Enter the First Number
    Enter the Second Number
    Enter the operator
    Choose proper operator among(+,-,*,/)
    Do you want to perform another calculation? (Y/N)
    Exiting the program. Goodbye!
    OUTPUT
    $stdin = StringIO.new(user_input)
    assert_output(expected_result) { Operation.new.arithmetic_operation }
  end
end
