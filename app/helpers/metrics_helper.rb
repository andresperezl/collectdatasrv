load "matrix.rb"
module MetricsHelper

	module Filters
		def self.zero_v(size = 1)
			Vector.[](*Array.new(size, 0))
		end
		
		def self.wma(data, n = 0)
			matrix = Matrix.[](*data) if data[0].kind_of?(Array)
			unless matrix
				result = data.each_index.map do |i|
					ws = 0
					r = ((i-n)..(i+n)).inject(0) do |acc, j| 
						if j >= 0 && j < data.length
							w = (n+1)-(i-j).abs
							ws +=  w
							acc+(data[j]*(w))
						else
							acc+(0)
						end
					end/ws.to_f
				end
			else 
				result = matrix.row_vectors.each_with_index.map do |v, i|
					ws = 0
					r = ((i-n)..(i+n)).inject(zero_v(matrix.column_size)) do |acc, j|
						if j >= 0 && j < matrix.row_count
							w = (n+1)-(i-j).abs
							ws += w
							acc+(matrix.row(j)*(w))
						else
							acc+(zero_v(matrix.column_size))
						end
					end*(1/ws.to_f)
				end
				result = result.to_a
			end
			result
		end
	end
end
