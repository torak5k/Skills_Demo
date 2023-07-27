FROM python:3-alpine

RUN apk add --update
RUN apk add git wget dialog newt elinks bash


RUN git clone https://github.com/s0md3v/Photon.git Photon
WORKDIR /Photon
RUN pip3 install -r requirements.txt

RUN sed -i '406d' photon.py
RUN sed -i '406d' photon.py
RUN sed -i '406d' photon.py
RUN sed -i '406d' photon.py
RUN sed -i '406d' photon.py
RUN sed -i '406d' photon.py


COPY photon_wrapper.sh /Photon

CMD ["/bin/bash", "./photon_wrapper.sh"]

