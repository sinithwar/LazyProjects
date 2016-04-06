require 'win32ole'
require 'win32/sound'
include Win32

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
	y = 1000
	while x <= y do
		send = tests[x]
		speed = 0.075
		if x == y
			print "Test Complete"
			Sound.play("key.wav")
			break()
		elsif tests[x] === "%"
			wsh.SendKeys("+{5}")
			sleep speed
			x += 1
		elsif tests[x] === "("
			wsh.SendKeys("+{9}")
			sleep speed
			x += 1
		elsif tests[x] === ")"
			wsh.SendKeys("+{0}")
			sleep speed
			x += 1
		elsif tests[x] === "'"
			wsh.SendKeys("{'}")
			sleep speed
			x += 1
		elsif tests[x] === '"'
			wsh.SendKeys("+{'}")
			sleep speed
			x += 1
		elsif tests[x] === "?"
			wsh.SendKeys("+{/}")
			sleep speed
			x += 1
		elsif tests[x] === ">"
			wsh.SendKeys("+{.}")
			sleep speed
			x += 1
		elsif tests[x] === "<"
			wsh.SendKeys("+{,}")
			sleep speed
			x += 1
		elsif tests[x] === ":"
			wsh.SendKeys("+{;}")
			sleep speed
			x += 1
		elsif tests[x] === "{"
			wsh.SendKeys("+{[}")
			sleep speed
			x += 1
		elsif tests[x] === "}"
			wsh.SendKeys("+{]}")
			sleep speed
			x += 1
		elsif tests[x].is_a? String
			wsh.SendKeys("#{send}")
			sleep speed
			x += 1
		else
			x += 1
		end
	end
