# /bin/sh

set -ex

apk add --no-cache bash coreutils file git

export GO111MODULE=auto
export CGO_ENABLED=0

VERSION=2.8.3
REVISION=$(git rev-parse HEAD)

PKG="github.com/docker/distribution"
LDFLAGS="-s -w"
BUILDTAGS="include_oss,include_gcs"

export GOARCH=amd64

go build -tags "${BUILDTAGS}" \
-trimpath \
-ldflags "-X ${PKG}/version.Version=${VERSION#v} -X ${PKG}/version.Revision=${REVISION} \
-X ${PKG}/version.Package=${PKG} ${LDFLAGS}" \
-o ./dist/registry-linux-${GOARCH} ./cmd/registry

export GOARCH=arm64

go build -tags "${BUILDTAGS}" \
-trimpath \
-ldflags "-X ${PKG}/version.Version=${VERSION#v} -X ${PKG}/version.Revision=${REVISION} \
-X ${PKG}/version.Package=${PKG} ${LDFLAGS}" \
-o ./dist/registry-linux-${GOARCH} ./cmd/registry

export GOARCH=ppc64le

go build -tags "${BUILDTAGS}" \
-trimpath \
-ldflags "-X ${PKG}/version.Version=${VERSION#v} -X ${PKG}/version.Revision=${REVISION} \
-X ${PKG}/version.Package=${PKG} ${LDFLAGS}" \
-o ./dist/registry-linux-${GOARCH} ./cmd/registry

export GOARCH=mips64le

go build -tags "${BUILDTAGS}" \
-trimpath \
-ldflags "-X ${PKG}/version.Version=${VERSION#v} -X ${PKG}/version.Revision=${REVISION} \
-X ${PKG}/version.Package=${PKG} ${LDFLAGS}" \
-o ./dist/registry-linux-${GOARCH} ./cmd/registry