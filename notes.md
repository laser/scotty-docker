FROM haskell:7.8

RUN cabal update

# Add .cabal file
ADD ./server/scotty-docker.cabal /opt/server/scotty-docker.cabal

# Docker will cache this command as a layer, freeing us up to
# modify source code without re-installing dependencies
RUN cd /opt/server && cabal install --only-dependencies -j4

# Add and Install Application Code
ADD ./server /opt/server
RUN cd /opt/server && cabal install

# Add installed cabal executables to PATH
ENV PATH /root/.cabal/bin:$PATH

# Default Command for Container
WORKDIR /opt/server

ENTRYPOINT ["scotty-docker"]



###############
docker run -d -p 82:8080 --entrypoint=/bin/sh --link cloudwatchlogs:cloudwatchlogs laser/scotty-docker -c 'scotty-docker 2>&1 | /usr/bin/logger -t scotty-docker -p local6.info -n cloudwatchlogs -P 514'