require 'win32ole'
require 'Benchmark'



def typing_simulator_big(x,y)
	wsh = WIN32OLE.new("WScript.Shell")

	def fileToArray(file)
		empty = []
		File.foreach("#{file}") do |line|
			empty << line.to_s.split('')
		end
		return empty.flatten!
	end

	tests = fileToArray("C:\\xampp\\htdocs\\PhpDolphin\\Script\\includes\\classes.php")
	
	sleep 10
	
	while x <= y do
		send = tests[x]
		speed = 0.02
		case send
		when y
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
	x += 1
	end
end
def typing_simulator_reg(file)
	wsh = WIN32OLE.new("WScript.Shell")

	def fileToArray(file)
		empty = []
		File.foreach("#{file}") do |line|
			empty << line.to_s.split('')
		end
		return empty.flatten!
	end

	tests = fileToArray("#{file}")
	puts "File will be read in 10 seconds."
	sleep 10
	x = 0
	y = tests.length
	
	while x <= y do
		send = tests[x]
		speed = 0.02
		case send
		when y
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
	x += 1
	end
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
def terminal_choice
	puts "Please choose an option"
	puts "Big: These are for files exceding a character size of 5,000."
	puts "Reg: The default option that will work for characters sizes less than 5,000."
	puts "Please note that the Reg option will continue to run until the file is complete."
	choice = gets.chomp!
	case choice
	when "Reg", "reg", "REG"
		puts "Please enter a file location."
		puts "Example: C:\\random\\location"
		file_location = gets.chomp! + "\\"
		puts file_location
			while file_location.is_a? String
				puts "Please enter file name"
				file = gets.chomp!
				full_file = file_location + file
				typing_simulator_reg(full_file)
				exit()
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