#
# Mecab Dockerfile
#
# https://github.com/umeice/mecab
#

# Pull base image.
FROM umeice/python

MAINTAINER @bungoume <bungoume@gmail.com>

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
  python setup.py install


# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
# CMD ["mecab"]

# Expose ports.
#   - 5000: HTTP
EXPOSE 5000
