# Tommy Mertell :)

	public
	def bigfsw(character_size,tmp_dir)

			tmp_dir = tmp_dir
			c_s = character_size
			b_f_s_w = self

		def format_big_file
			# This function servers to turn whatever file it is handed and make it into an array.

			file = self
			file_to_array = File.open("#{file}").each_char.to_a
		end

		def split_and_write_file(cs, tmp_dir)
			# variables to gather the array, create a temporary directory, and split on character size

			file = self
			tmp_dir = tmp_dir
			cs = cs

			#This variable serves for pulling out the appropriate single dimensional array from the new_multi_array

			count = 0

			# The new_multi_array is a container, multi-dimensional array that will hold singular arrays that were divided from the file_to_array based on character size

			new_multi_array = []
			file.each_slice(cs) do |slice|
				new_multi_array << slice
			end

			# This is where the temporary directory is made, then if either the location exists, or doesn't exist, then the singular arrays from new_multi_array are pulled from the multi-array and written into the file in a serialized form
			# C:\\tmp\\
			# new_multi_array[1] === tmp1.txt
			# C:\\tmp\\tmp1.txt
			
			while count <= new_multi_array.length
				if Dir.exist?("#{tmp_dir}")
					File.open("#{tmp_dir}/tmp#{count}.txt", "w") { |file| file.write(new_multi_array[count]) }
				else
					Dir.mkdir("#{tmp_dir}")
					File.open("#{tmp_dir}/tmp#{count}.txt", "w") { |file| file.write(new_multi_array[count]) }
				end
				count += 1
			end
		end
		#This line allows the method to be called by using a single mixin
		b_f_s_w.format_big_file.split_and_write_file(c_s, tmp_dir)
	end