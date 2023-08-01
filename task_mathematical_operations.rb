class Operation
 
  def check_integer?(a, b)
    a.is_a?(Integer) && b.is_a?(Integer)
  end

  def arithmetic_operation
    puts "Welcome to the Mathematical Operations Program!"
    while true
      puts "Enter the First Number"
      a = gets.to_i
      puts "Enter the Second Number"
      b = gets.to_i
      puts "Enter the operator"
      op = gets
      op = op.chomp unless op.nil?
      case op
      when '+'
        if check_integer?(a, b)
          result = a + b
          puts "Result: #{result}"
        end
      when '-'
        if check_integer?(a, b)
          result = a - b
          puts "Result: #{result}"
        end
      when '*'
        if check_integer?(a, b)
          result = a * b
          puts "Result: #{result}"
        end
      when '/'
        if b == 0 
          puts "Second number should not be zero."
        else
          if check_integer?(a, b)
            result = a / b
            puts "Result: #{result}"
          end
        end
      else 
        puts "Choose proper operator among(+,-,*,/)"
      end
      puts "Do you want to perform another calculation? (Y/N)"
      continue = gets
      continue = continue.chomp unless continue.nil?
      break if continue == "N"
    end
    puts "Exiting the program. Goodbye!"
  end
end
