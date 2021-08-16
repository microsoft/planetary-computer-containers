%/conda-linux-64.lock: %/environment.yml
	cd $(dir $<); \
	mamba lock lock --mamba -p linux-64 -f environment.yml 
