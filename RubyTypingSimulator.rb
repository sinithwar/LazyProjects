require 'win32ole'
require 'win32/sound'
require 'Benchmark'
include Win32

def typing_simulator
	wsh = WIN32OLE.new("WScript.Shell")

	def fileToArray(file)
		x = []
		File.foreach("#{file}") do |line|
			x << line.to_s.split('')
		end
		return x.flatten!
	end
	tests = fileToArray("C:\\xampp\\htdocs\\PhpDolphin\\Script\\includes\\classes.php")
	
	sleep 10
	x = 0
	y = 10000
	while x <= y do
		send = tests[x]
		speed = 0.015
		case send
		when y
			print "Test Complete"
			break()
		when "%"
			wsh.SendKeys("+{5}")
			sleep speed
			x += 1
		when "("
			wsh.SendKeys("+{9}")
			sleep speed
			x += 1
		when ")"
			wsh.SendKeys("+{0}")
			sleep speed
			x += 1
		when "'"
			wsh.SendKeys("{'}")
			sleep speed
			x += 1
		when '"'
			wsh.SendKeys("+{'}")
			sleep speed
			x += 1
		when "?"
			wsh.SendKeys("+{/}")
			sleep speed
			x += 1
		when ">"
			wsh.SendKeys("+{.}")
			sleep speed
			x += 1
		when "<"
			wsh.SendKeys("+{,}")
			sleep speed
			x += 1
		when ":"
			wsh.SendKeys("+{;}")
			sleep speed
			x += 1
		when "{"
			wsh.SendKeys("+{[}")
			sleep speed
			x += 1
		when "}"
			wsh.SendKeys("+{]}")
			sleep speed
			x += 1
		when String
			wsh.SendKeys("#{send}")
			sleep speed
			x += 1
		else
			x += 1
		end
	end
end
def typing_simulator_2
	wsh = WIN32OLE.new("WScript.Shell")

	def fileToArray(file)
		x = []
		File.foreach("#{file}") do |line|
			x << line.to_s.split('')
		end
		return x.flatten!
	end
	tests = fileToArray("C:\\xampp\\htdocs\\PhpDolphin\\Script\\includes\\classes.php")
	
	sleep 10
	x = 0
	y = 10000
	while x <= y do
		send = tests[0]
		speed = 0.015
		case send
		when y
			print "Test Complete"
			break()
		when "%"
			wsh.SendKeys("+{5}")
			sleep speed
			x += 1
		when "("
			wsh.SendKeys("+{9}")
			sleep speed
			x += 1
		when ")"
			wsh.SendKeys("+{0}")
			sleep speed
			x += 1
		when "'"
			wsh.SendKeys("{'}")
			sleep speed
			x += 1
		when '"'
			wsh.SendKeys("+{'}")
			sleep speed
			x += 1
		when "?"
			wsh.SendKeys("+{/}")
			sleep speed
			x += 1
		when ">"
			wsh.SendKeys("+{.}")
			sleep speed
			x += 1
		when "<"
			wsh.SendKeys("+{,}")
			sleep speed
			x += 1
		when ":"
			wsh.SendKeys("+{;}")
			sleep speed
			x += 1
		when "{"
			wsh.SendKeys("+{[}")
			sleep speed
			x += 1
		when "}"
			wsh.SendKeys("+{]}")
			sleep speed
			x += 1
		when String
			wsh.SendKeys("#{send}")
			sleep speed
			x += 1
		else
			x += 1
		end
	tests.shift
	end
end


Benchmark.bm do |results|
	results.report { typing_simulator   }
	results.report { typing_simulator_2 }
end