#
# Mecab Dockerfile
#
# https://github.com/umeice/mecab
#

# Pull base image.
FROM dockerfile/ubuntu

MAINTAINER @bungoume <bungoume@gmail.com>

# Install Python.
RUN \
  apt-get update && apt-get upgrade -y && \
  apt-get install -y python python-dev && \
  wget https://bootstrap.pypa.io/ez_setup.py -O - | python && \
  easy_install pip


# Install MeCab.
RUN \
  cd /tmp && \
  wget https://mecab.googlecode.com/files/mecab-0.996.tar.gz && \
  tar xvzf mecab-0.996.tar.gz && \
  cd mecab-0.996 && \
  ./configure --enable-utf8-only && \
  make && make install && \
  ldconfig && \
  cd /tmp && \
  wget https://mecab.googlecode.com/files/mecab-ipadic-2.7.0-20070801.tar.gz && \
  tar xvzf mecab-ipadic-2.7.0-20070801.tar.gz && \
  cd mecab-ipadic-2.7.0-20070801 && \
  ./configure --with-charset=utf8 && \
  make && make install && \
  cd /tmp && \
  wget https://mecab.googlecode.com/files/mecab-python-0.996.tar.gz && \
  tar xvzf mecab-python-0.996.tar.gz && \
  cd mecab-python-0.996 && \
  python setupy.py install


# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
# CMD ["mecab"]

# Expose ports.
#   - 5000: HTTP
EXPOSE 5000
