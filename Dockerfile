FROM ubuntu:latest as build
WORKDIR /src
COPY . .
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install build-essential -y
RUN make all -j $(nproc)

FROM ubuntu:latest
WORKDIR /app
COPY --from=build /src/bin/hlcsg /src/bin/hlbsp /src/bin/hlvis /src/bin/hlrad /src/bin/ripent /app/
