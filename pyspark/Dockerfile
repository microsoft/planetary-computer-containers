FROM pangeo/base-image:2021.03.27

# GDALWarp bindings are built against GDAL 3.1.2 (see https://github.com/geotrellis/gdal-warp-bindings/)
# GDAL changes dynamic dynamic binaries names across releses
# To address GDAL JNI linking change we can create a symlink 
# TODO: rebuild GDALWarp bindings against the fresh GDAL version
RUN ln -s /srv/conda/envs/notebook/lib/libgdal.so.30 /srv/conda/envs/notebook/lib/libgdal.so.27
