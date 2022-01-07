### PySpark / RasterFrames image details.

GDAL Warp bindings at this point work only with GDAL 3.1.x. To workaround it, the following hack is used:

```bash
# run the built container
$ docker run --rm -it -e GRANT_SUDO=yes daunnc/planetary-computer-pyspark:2021.11.29.0-gdal3.4-rf bash
$ ln -s /srv/conda/envs/notebook/lib/libgdal.so.30 /srv/conda/envs/notebook/lib/libgdal.so.27
# in a separate terminal window
$ docker commit <containerid> daunnc/planetary-computer-pyspark:2021.11.29.0-gdal3.4-3.1-rf
$ docker push daunnc/planetary-computer-pyspark:2021.11.29.0-gdal3.4-3.1-rf
```

This image also depends on the most recent snapshot rasterframes build (see [requirements.txt](./requirements.txt)):

```bash
https://geotrellis-test.s3.amazonaws.com/raster-frames/pyrasterframes-0.10.1.dev0-py3-none-any.whl
```
