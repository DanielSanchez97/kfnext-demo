package main

import (
	"fmt"
	"net/http"
	"os"
	"log"
)

func main() {
	//fmt.Println("PORT:", os.Getenv("PORT"))]
	host := os.Getenv("HOST_demo")
	port := os.Getenv("PORT_demo")
	fmt.Println("running on env port: " + port +" and host: "+ host)


	Info := log.New(os.Stdout,
		"INFO: ",
		log.Ldate|log.Ltime|log.Lshortfile)

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {

		fmt.Fprintf(w, "Hello World")

		client := r.RemoteAddr

		
		Info.Println("served " + client)
	})

	http.ListenAndServe(host+":"+port, nil)
}
