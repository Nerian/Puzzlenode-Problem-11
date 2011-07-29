# Hitting Rock Bottom              

Put your spelunker's hat on and simulate the manner in which a stream of water would progressively fill an underground cavern.

# How to use it
           
	bundle install 
	cd bin/
	./waterflow name_of_file [--slow] # for a nice slow motion effect. Try it in simple cave.
	
# Cave format

	100  -> Units of water

	################################
	~                              #
	#         ####                 #
	###       ####                ##
	###       ####              ####
	#######   #######         ######
	#######   ###########     ######
	################################
                              
	~ -> Origin of the water
	
	# -> Solid block
	
	' ' -> Empty space

		
# Running the specs

	rspec spec

# Licence

MIT licence. Gonzalo Rodríguez-Baltanás Díaz 2011. http://nerian.es