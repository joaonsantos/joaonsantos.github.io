package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
  args := os.Args
  if len(args) < 2 {
    panic("usage: ./server <serve_root_filepath>")
  }

  handler := http.FileServer(http.Dir(args[1]))

  log.Println("Listening on :3000...")
  log.Println("Serving", args[1])
  log.Fatal(http.ListenAndServe(":3000", handler))
}
