FROM pangeo/base-image:2024.03.13
RUN wget https://github.com/stac-utils/qgis-stac-plugin/releases/download/v1.0.0/qgis_stac.1.0.0.zip  && \
   unzip qgis_stac.1.0.0.zip && \
   mv qgis_stac /srv/conda/envs/notebook/share &&\
   rm -rf qgis_stac.1.0.0.zip
