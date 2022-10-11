# remote

<https://github.com/distribution/distribution>

```bash
git remote add upstream git@github.com:docker/distribution.git
git fetch upstream
git merge v2.8.1
```

## build

```bash
# tls
bash .beagle/registry.beagle.default.sh

# link go path
rm -rf $GOPATH/src/github.com/docker/distribution
ln -s $GOPATH/src/github.com/open-beagle/distribution $GOPATH/src/github.com/docker/distribution

# golang
docker run \
--rm \
-v $PWD/:/go/src/github.com/docker/distribution \
-w /go/src/github.com/docker/distribution \
-e PLUGIN_BINARY=registry \
-e PLUGIN_MAIN=cmd/registry \
-e CI_WORKSPACE=/go/src/github.com/docker/distribution \
registry.cn-qingdao.aliyuncs.com/wod/devops-go-arch:1.19-alpine
```

## hub.docker.com

```bash
# x86_64
docker pull registry:2.8.1 && \
docker tag registry:2.8.1 registry.cn-qingdao.aliyuncs.com/wod/registry:2.8.1 && \
docker push registry.cn-qingdao.aliyuncs.com/wod/registry:2.8.1

# arm64
docker pull arm64v8/registry:2.8.1 && \
docker tag arm64v8/registry:2.8.1 registry.cn-qingdao.aliyuncs.com/wod/registry:2.8.1-arm64 && \
docker push registry.cn-qingdao.aliyuncs.com/wod/registry:2.8.1-arm64
```

与 DockerHub 不同，本项目编译的是基于 debian 运行的 glibc 的 registry 二进制文件。
