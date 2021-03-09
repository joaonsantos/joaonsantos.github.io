.PHONY: run build

run: build
	./server ./static

build: main.go
	go build -a -o server main.go
