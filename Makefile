%/conda-linux-64.lock: %/environment.yml
	cd $(dir $<); \
	conda-lock --mamba --kind=explicit -p linux-64 -f environment.yml 
