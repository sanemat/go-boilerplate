VERSION = $(shell gobump show -r)
CURRENT_REVISION = $(shell git rev-parse --short HEAD)
BUILD_LDFLAGS = "-s -w -X github.com/sanemat/go-boilerplate.revision=$(CURRENT_REVISION)"
u := $(if $(update),-u)

.PHONY: test
test: download
	go test

.PHONY: download
download:
	go mod download && \
	go mod tidy

.PHONY: install-tools
install-tools: download
	go install \
	github.com/sanemat/go-xgoinstall/cmd/x-go-install \
	github.com/sanemat/go-importlist/cmd/import-list \
	; \
	import-list -z tools.go | x-go-install -0

.PHONY: goimports
goimports:
	goimports -w .

echo:
	echo ${VERSION} ${BUILD_LDFLAGS}

.PHONY: build
build: download
	go build -ldflags=$(BUILD_LDFLAGS) ./cmd/boilerplate

.PHONY: install
install: download
	go install -ldflags=$(BUILD_LDFLAGS) ./cmd/boilerplate

.PHONY: crossbuild
crossbuild:
	goxz -pv=v$(VERSION) -build-ldflags=$(BUILD_LDFLAGS) \
      -os=linux,darwin,windows -d=./dist/v$(VERSION) ./cmd/*

.PHONY: upload
upload:
	ghr v$(VERSION) dist/v$(VERSION)

.PHONY: credits
credits:
	gocredits . > credits.txt
