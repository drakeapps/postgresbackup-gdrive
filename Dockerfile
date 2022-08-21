FROM rclone/rclone

RUN apk update && apk add postgresql bash

ENV POSTGRES_HOST=localhost
ENV POSTGRES_USER=root
ENV POSTGRES_PASS=
ENV POSTGRES_DB=
ENV RCLONE_TOKEN=
ENV DEST_DIR=/

COPY copy.sh /copy.sh

ENTRYPOINT [ "/bin/bash", "/copy.sh" ]

