package main

import (
	"net/http"
	"os"
)

func main() {
    path := "."
    if len(os.Args) > 1 {
        path = os.Args[1]
    }
    port := "8080"
    if len(os.Args) > 2 {
        port = os.Args[2]
    }
    println("Serving " + path + " on port " + port)
    err := http.ListenAndServe(":"+port, http.FileServer(http.Dir(path)))
    if err != nil {
        panic(err)
    }
}
