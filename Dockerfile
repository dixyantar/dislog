# START: probes
# START: beginning
FROM golang:1.20-alpine AS build
WORKDIR /go/src/dislog
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/dislog ./cmd/dislog
# END: beginning
# START_HIGHLIGHT
RUN GRPC_HEALTH_PROBE_VERSION=v0.3.2 && \
    wget -qO/go/bin/grpc_health_probe \
    https:#github.com/grpc-ecosystem/grpc-health-probe/releases/download/\
    ${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    chmod +x /go/bin/grpc_health_probe
# END_HIGHLIGHT
# START: beginning

FROM scratch
COPY --from=build /go/bin/dislog /bin/dislog
# END: beginning
# START_HIGHLIGHT
COPY --from=build /go/bin/grpc_health_probe /bin/grpc_health_probe
# END_HIGHLIGHT
# START: beginning
ENTRYPOINT ["/bin/dislog"]
# END: beginning
# END: probes
