FROM ubuntu:latest

RUN apt update && apt install -y \
  openjdk-8-jre \
  openjdk-8-jdk \
  maven \
  git \
  firefox && \
  apt remove -y openjdk-11-jre-headless && \
  rm -rf /var/cache/apt/

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
  mkdir -p /home/developer && \
  mkdir -p /etc/sudoers.d && \
  echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
  echo "developer:x:${uid}:" >> /etc/group && \
  echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
  chmod 0440 /etc/sudoers.d/developer && \
  chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer

RUN cd /home/developer && \
  git clone https://github.com/GraphWalker/graphwalker-example && \
  cd graphwalker-example/java-amazon && \
  mvn graphwalker:generate-sources package
  
CMD cd /home/developer/graphwalker-example/java-amazon && \
  echo "  Run following command:" && \
  echo '  mvn graphwalker:test' && \
  bash
