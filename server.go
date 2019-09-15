package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

func main() {
	//fmt.Println("PORT:", os.Getenv("PORT"))
	port := os.Getenv("PORT")
	fmt.Println("runninf main and env port: " + port)

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {

		fmt.Fprintf(w, "Hello World")

		client := r.RemoteAddr
		fmt.Println("served " + client + " at time " + time.Now().String())
	})

	http.ListenAndServe(":"+port, nil)
}
