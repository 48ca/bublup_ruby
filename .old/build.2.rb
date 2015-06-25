def main()
	height = 40;
	$i = 60
	while $i>0 do
		for l in 0..10
			if $i<height[0] and l>offset and l<=width+offset
				print "#"
			else
				print " "
			end
			print "\n"
		end
		$i--
	end
end
main
