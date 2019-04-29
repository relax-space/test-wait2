package main

import (
	"fmt"

	"github.com/labstack/echo"
)

func main() {
	e := echo.New()

	fmt.Println("test-wait2 started")
	if err := e.Start(":8080"); err != nil {
		fmt.Println(err)
	}
}
