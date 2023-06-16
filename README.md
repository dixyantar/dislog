# Dislog

 ___A mini Kafka; written in Go.___

[Dislog](https://github.com/dixyantar/dislog) is a __distributed__, __stateful__, __observable__, __streaming__ ___logger___, that runs on a gRPC server deployed with Kubernetes, with self-managed __service discovery__ & __consensus__.

## Inspiration

[Dislog](https://github.com/dixyantar/dislog) is a result of follow-along learnings from [Travis Jeffery](https://twitter.com/travisjeffery)'s Distributed Services with Go.

## The Log

The Log package consists of 5 parts:

- Record: _the structure of basic data stored in the log_
- Store: _the system file where logs are stored_
- Index: _the system file that houses the index entries_
- Segment: _the abstraction that ties a store and an index together_
- Log: _the abstraction that ties all the segments together_

## Segmentation (Todo)

Segmentation is made possible by the [gommap](https://pkg.go.dev/github.com/tysonmote/gommap) package. All memory managed through this package is outside of Go's own memory management.
Segments are used to keep logs rolling so that older segments can be deleted when approaching max file system memory.

## Service Discovery with Serf 

- [Serf](https://www.serf.io/)
- [Gossip Protocol](https://www.serf.io/docs/internals/gossip.html)

## Raft Consensus Algorithm 

- [Raft Algorithm](https://en.wikipedia.org/wiki/Raft_(algorithm))
- [Scaling Raft](https://www.cockroachlabs.com/blog/scaling-raft/)
- [Why The Name - Raft?](https://groups.google.com/g/raft-dev/c/95rZqptGpmU)

## gRPC Server 

- [gRPC](https://grpc.io/)
- [Why gRPC?](https://grpc.io/docs/languages/go/basics/#why-use-grpc)

## Kubernetes StatefulSets

- [StatefulSets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
- [Deployment](https://kubernetes.io/docs/tutorials/stateful-application/basic-stateful-set/)


