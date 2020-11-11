FROM ubuntu:18.04
MAINTAINER sudhams reddy duba<dubareddy.383@gmail.com>
RUN apt update && \
    apt install -y iputils-ping iproute2
CMD ["/bin/bash"]
