#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ARG base_img

FROM $base_img
WORKDIR /

# Reset to root to run installation tasks
USER 0

RUN mkdir ${SPARK_HOME}/python

RUN apt-get update && \
  apt-get install wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev binutils libproj-dev gdal-bin libgdal-dev -y && \
  rm -rf /root/.cache && rm -rf /var/cache/apt/*

# Python version on executor should match Python version on a Driver
RUN wget https://www.python.org/ftp/python/3.8.8/Python-3.8.8.tar.xz && \
  tar -xf Python-3.8.8.tar.xz && \
  mv Python-3.8.8 /opt/Python-3.8.8

RUN cd /opt/Python-3.8.8/; ./configure --enable-optimizations --enable-shared; make -j6; make altinstall
RUN ldconfig /opt/Python-3.8.8

RUN wget https://bootstrap.pypa.io/get-pip.py && python3.8 get-pip.py

# GDALWarp bindings are built against GDAL 3.1.2 (see https://github.com/geotrellis/gdal-warp-bindings/)
# GDAL changes dynamic dynamic binaries names across releses
# To address GDAL JNI linking change we can create a symlink 
# TODO: rebuild GDALWarp bindings against the fresh GDAL version
RUN ln -s /usr/lib/libgdal.so.28 /usr/lib/libgdal.so.27
RUN rm -f /usr/bin/python3
RUN ln -s /usr/local/bin/python3.8 /usr/bin/python && ln -s /usr/local/bin/python3.8 /usr/bin/python3 && python3 -m pip install --upgrade pip
RUN pip3 install --upgrade pip setuptools # planetary-computer - to sign URIs via UDFs

COPY python/pyspark ${SPARK_HOME}/python/pyspark
COPY python/lib ${SPARK_HOME}/python/lib

RUN ls /opt/

RUN python3 --version

WORKDIR /opt/spark/work-dir
ENTRYPOINT [ "/opt/entrypoint.sh" ]

# Specify the User that the actual main process will run as
ARG spark_uid=185
USER ${spark_uid}
