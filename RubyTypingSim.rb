require 'win32ole'
require 'Benchmark'

#This method turns the file into an array so that it can be iterated over.
def file_to_array(file)
	File.open("#{file}") do |line|
		line.each_char.to_a
	end
end

big_file_classes = file_to_array("C:\\xampp\\htdocs\\PhpDolphin\\Script\\includes\\classes.php")
#This key handler handles special cases where win32ole needs direct guidance to send the correct keys.
def key_handler(start,stop,tests)
	wsh = WIN32OLE.new("WScript.Shell")
	while start <= stop do
		send = tests[start]
		speed = 0.0025
		check = {'%'=>'+{5}','('=>'+{9}',')'=>'+{0}','\''=>'{\'}','"'=>'+{\'}','?'=>'+{/}','>'=>'+{.}','<'=>'+{,}',':'=>'+{;}','{'=>'+{[}','}'=>'+{]}'}
		case send
		when stop
			print 'Test Complete'
			break()
		when '%','(',')','\'','"','?','>','<',':','{','}'
			wsh.SendKeys(check[send])
		else
			wsh.SendKeys(send)
		end
	start = start + 1
	sleep speed
	end
end
def alternative_file_handler(file)
	wsh = WIN32OLE.new("WScript.Shell")
	def ftoa(path)
		File.open(path) do |f|
			while char = f.read(1)
				yield char
			end
		end
	end
	ftoa(file) do |char|
		speed = 0.0025
		check = {'%'=>'+{5}','('=>'+{9}',')'=>'+{0}','\''=>'{\'}','"'=>'+{\'}','?'=>'+{/}','>'=>'+{.}','<'=>'+{,}',':'=>'+{;}','{'=>'+{[}','}'=>'+{]}'}
		case char
		when '%','(',')','\'','"','?','>','<',':','{','}'
			wsh.SendKeys(check[char])
		else
			wsh.SendKeys(char)
		end
	sleep speed
	end
end
def typing_simulator_big(start,stop, big_file_pass)
	wsh = WIN32OLE.new("WScript.Shell")
	sleep 10
	start = start
	stop = stop
	big_file_classes = big_file_pass
	key_handler(start,stop,big_file_classes)
end
def big_file(big_file_pass)
	puts 'Which number would you like to do?'
	puts 'Press ENTER to exit.'
	decision = gets.chomp!
	big_file_classes = big_file_pass
	#This big case is handling the massive 180,000 character file and is not complete.
	case decision
	when "1"
		typing_simulator_big(0, 5888, big_file_classes)
	when "2"
		typing_simulator_big(5888, 10922, big_file_classes)
	when "3"
		typing_simulator_big(10922, 15954, big_file_classes)
	when "4"
		typing_simulator_big(15954,19591, big_file_classes)
	when "5"
		typing_simulator_big(19591,25375, big_file_classes)
	when "6"
		typing_simulator_big(25375,32477, big_file_classes)
	when "7"
		typing_simulator_big(32477,36644, big_file_classes)
	else
		exit()
	end
	big_file(big_file_classes)
end
#This method is complete and will handle regular files of 5,000 characters perfectly fine.
def typing_simulator_reg(file)
	tests = file_to_array("#{file}")
	puts 'File will be read in 10 seconds.'
	sleep 10
	start = 0
	stop = tests.length
	Benchmark.bm do |results|
		results.report { key_handler(start,stop,tests) }
	end
end
#This is the function that the end_user interacts with via the terminal window
def terminal_choice(big_file_pass)
	big_file_classes = big_file_pass
	puts 'Please choose an option'
	puts 'Big: These are for files exceding a character size of 5,000.'
	puts 'Reg: The default option that will work for characters sizes less than 5,000.'
	puts 'Alt: The Alternative method'
	puts 'Please note that the Reg option will continue to run until the file is complete.'
	choice = gets.chomp!
	case choice
	when "Reg", "reg", "REG"
		puts 'Please enter a file location:'
		puts 'Example: C:\\random\\location'
		file_location = gets.chomp! + "\\"
		puts file_location
			while file_location.is_a? String
				puts 'Please enter file name:'
				file = file_location + gets.chomp!
				puts file
				typing_simulator_reg(file)
				def continue(file)
					puts 'Would you like to continue?'
					puts 'Please provide a Yes or a No:'
					answer = gets.chomp!
					file_location = file
					case answer
					when "Yes", "yes"
						puts 'Please enter a file name:'
						puts 'Example: randomname.txt'
						new_file = file_location + gets.chomp!
						typing_simulator_reg(new_file)
						continue(file_location)
					when "No", "no"
						exit()
					else
						puts 'Invalid Response ...'
						sleep 1
						puts 'Exiting ...'
						sleep 1
						exit()
					end
				end
				continue(file_location)
			end
		exit()
	when "Big", "big", "BIG"
		big_file(big_file_classes)
	when 'Alt','alt','ALT'
		puts 'File:'
		file = gets.chomp!
		puts 'Location:'
		file_location = gets.chomp! + "\\" + file
		puts "Loading #{file_location} \n Please wait..."
		sleep 10
		alternative_file_handler(file_location)
	else
		puts "Invalid option ..."
		sleep 1
		puts "Exiting ..."
		sleep 1
		exit()
	end
end
terminal_choice(big_file_classes)