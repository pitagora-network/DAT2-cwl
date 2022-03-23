FROM alpine:3.9
USER root
RUN apk --no-cache add ruby
WORKDIR /workdir
COPY --chmod=0777 sort-bed.rb /usr/bin
