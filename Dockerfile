FROM node:8

# last directory must be "nwrfcsdk"
ENV SAPNWRFC_HOME /where/you/want/the/nwrfcsdk

WORKDIR $SAPNWRFC_HOME
# download files manually on host, docker build copies them into image
COPY download/ .

# extract SAR archive, run ldconfig
RUN chmod +x SAPCAR_0-80000935.EXE && \
    cd .. && \
    ./nwrfcsdk/SAPCAR_0-80000935.EXE -xvf ./nwrfcsdk/NWRFC_38-20004565.SAR && \
    rm nwrfcsdk/NWRFC_38-20004565.SAR nwrfcsdk/SAPCAR_0-80000935.EXE && \
    echo "$SAPNWRFC_HOME/lib" > /etc/ld.so.conf.d/saprfc.conf && \
    ldconfig

WORKDIR /code
COPY package.json /code/package.json

# enforce compilation of node-rfc with the current compiler and glibc
# available in the node base image.
# Deny the access to github.com to block download of the prebuilt node binding.
RUN npm install --build-from-source --production

COPY app.js /code/app.js

CMD ["node", "app.js"]
