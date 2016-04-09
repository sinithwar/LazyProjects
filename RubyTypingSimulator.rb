require 'win32ole'
require 'Benchmark'

def file_to_array(file)
  empty = []
  File.foreach("#{file}") do |line|
    empty << line.to_s.split('')
  end
  return empty.flatten!
end
def key_handler(start,stop,tests)
	wsh = WIN32OLE.new("WScript.Shell")
	while start <= stop do
		send = tests[start]
		speed = 0.05
		case send
		when stop
			print "Test Complete"
			break()
		when "%"
			wsh.SendKeys("+{5}")
			sleep speed
		when "("
			wsh.SendKeys("+{9}")
			sleep speed
		when ")"
			wsh.SendKeys("+{0}")
			sleep speed
		when "'"
			wsh.SendKeys("{'}")
			sleep speed
		when '"'
			wsh.SendKeys("+{'}")
			sleep speed
		when "?"
			wsh.SendKeys("+{/}")
			sleep speed
		when ">"
			wsh.SendKeys("+{.}")
			sleep speed
		when "<"
			wsh.SendKeys("+{,}")
			sleep speed
		when ":"
			wsh.SendKeys("+{;}")
			sleep speed
		when "{"
			wsh.SendKeys("+{[}")
			sleep speed
		when "}"
			wsh.SendKeys("+{]}")
			sleep speed
		when String
			wsh.SendKeys("#{send}")
			sleep speed
		else
			break()
		end
	start += 1
	end
end
def typing_simulator_big(start,stop)
	wsh = WIN32OLE.new("WScript.Shell")
	big_file_classes = file_to_array("C:\\xampp\\htdocs\\PhpDolphin\\Script\\includes\\classes.php")
	sleep 10
	start = start
	stop = stop
	key_handler(start,stop,big_file_classes)
	# while start <= stop do
	# 	send = big_file_classes[start]
	# 	speed = 0.02
	# 	case send
	# 	when stop
	# 		print 'Program Complete'
	# 		break()
	# 	when "%"
	# 		wsh.SendKeys("+{5}")
	# 		sleep speed
	# 	when "("
	# 		wsh.SendKeys("+{9}")
	# 		sleep speed
	# 	when ")"
	# 		wsh.SendKeys("+{0}")
	# 		sleep speed
	# 	when "'"
	# 		wsh.SendKeys("{'}")
	# 		sleep speed
	# 	when '"'
	# 		wsh.SendKeys("+{'}")
	# 		sleep speed
	# 	when "?"
	# 		wsh.SendKeys("+{/}")
	# 		sleep speed
	# 	when ">"
	# 		wsh.SendKeys("+{.}")
	# 		sleep speed
	# 	when "<"
	# 		wsh.SendKeys("+{,}")
	# 		sleep speed
	# 	when ":"
	# 		wsh.SendKeys("+{;}")
	# 		sleep speed
	# 	when "{"
	# 		wsh.SendKeys("+{[}")
	# 		sleep speed
	# 	when "}"
	# 		wsh.SendKeys("+{]}")
	# 		sleep speed
	# 	when String
	# 		wsh.SendKeys("#{send}")
	# 		sleep speed
	# 	else
	# 		break()
	# 	end
	# start += 1
	# end
end
def big_file
	puts "Which number would you like to do?"
	puts "Press ENTER to exit."
	decision = gets.chomp!

	case decision
	when "1"
		typing_simulator_big(0, 5888)
	when "2"
		typing_simulator_big(5888, 10922)
	when "3"
		typing_simulator_big(10922, 15954)
	when "4"
		typing_simulator_big(15954,19591)
	when "5"
		typing_simulator_big(19591,25375)
	when "6"
		typing_simulator_big(25375,32477)
	when "7"
		typing_simulator_big(32477,36644)
	when "8"
		exit()
	when "9"
		exit()
	when "10"
		exit()
	when "11"
		exit()
	when "12"
		exit()
	when "13"
		exit()
	when "14"
		exit()
	when "15"
		exit()
	when "16"
		exit()
	when "17"
		exit()
	when "18"
		exit()
	when "19"
		exit()
	when "20"
		exit()
	when "21"
		exit()
	when "22"
		exit()
	when "23"
		exit()
	when "24"
		exit()
	when "25"
		exit()
	when "26"
		exit()
	when "27"
		exit()
	when "28"
		exit()
	when "29"
		exit()
	when "30"
		exit()
	when "31"
		exit()
	when "32"
		exit()
	when "33"
		exit()
	when "34"
		exit()
	when "35"
		exit()
	when "36"
		exit()
	else
		exit()
	end
	big_file()
end
def typing_simulator_reg(file)
	wsh = WIN32OLE.new("WScript.Shell")

	tests = file_to_array("#{file}")
	puts "File will be read in 10 seconds."
	sleep 10
	start = 0
	stop = tests.length
	key_handler(start,stop,tests)
end

def terminal_choice
	puts "Please choose an option"
	puts "Big: These are for files exceding a character size of 5,000."
	puts "Reg: The default option that will work for characters sizes less than 5,000."
	puts "Please note that the Reg option will continue to run until the file is complete."
	choice = gets.chomp!
	case choice
	when "Reg", "reg", "REG"
		puts "Please enter a file location:"
		puts "Example: C:\\random\\location"
		file_location = gets.chomp! + "\\"
		puts file_location
			while file_location.is_a? String
				puts "Please enter file name:"
				file = gets.chomp!
				full_file = file_location + file
				typing_simulator_reg(full_file)
				def continue(file)
					puts "Would you like to continue?"
					puts "Please provide a Yes or a No:"
					answer = gets.chomp!
					file_location = file
					case answer
					when "Yes", "yes", "Y", "y"
						puts "Please enter a file name:"
						puts "Example: randomname.txt"
						new_file = gets.chomp!
						new_full_file = file_location + new_file
						typing_simulator_reg(new_full_file)
						continue(file_location)
					when "No", "no", "N", "n"
						exit()
					else
						puts "Invalid Response ..."
						sleep 1
						puts "Exiting ..."
						sleep 1
						exit()
					end
				end
				continue(file_location)
			end
		exit()
	when "Big", "big", "BIG"
		big_file()
	else
		puts "Invalid option ..."
		sleep 1
		puts "Exiting ..."
		sleep 1
		exit()
	end
end
terminal_choice()