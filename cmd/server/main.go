package main

import (
	"log"

	"github.com/dixyantar/dislog/internal/server"
)

func main() {
	srv := server.NewHTTPServer(":8080")
	log.Fatal(srv.ListenAndServe())
}
