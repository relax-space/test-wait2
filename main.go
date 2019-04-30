package main

import (
	"fmt"
	"net/http"
)

func main() {

	http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "pong")
	})
	fmt.Println("⇨ test-wait2 started on [::]:8080")
	http.ListenAndServe(":8080", nil)
}
