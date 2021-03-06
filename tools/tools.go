// +build tools

package tools

import (
	_ "github.com/Songmu/gocredits/cmd/gocredits"
	_ "github.com/Songmu/goxz/cmd/goxz"
	_ "github.com/git-chglog/git-chglog/cmd/git-chglog"
	_ "github.com/sanemat/go-importlist/cmd/import-list"
	_ "github.com/sanemat/go-xgoinstall/cmd/x-go-install"
	_ "github.com/tcnksm/ghr"
	_ "github.com/x-motemen/gobump/cmd/gobump"
	_ "golang.org/x/lint/golint"
	_ "golang.org/x/tools/cmd/goimports"
)
