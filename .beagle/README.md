# remote

<https://github.com/distribution/distribution>

```bash
git remote add upstream git@github.com:docker/distribution.git
git fetch upstream
git merge v2.8.3
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
registry.cn-qingdao.aliyuncs.com/wod/golang:1.20-alpine \
sh .beagle/build.sh
```

## hub.docker.com

```bash
# x86_64
docker pull registry:2.8.3 && \
docker tag registry:2.8.3 registry.cn-qingdao.aliyuncs.com/wod/registry:2.8.3 && \
docker push registry.cn-qingdao.aliyuncs.com/wod/registry:2.8.3

# arm64
docker pull arm64v8/registry:2.8.3 && \
docker tag arm64v8/registry:2.8.3 registry.cn-qingdao.aliyuncs.com/wod/registry:2.8.3-arm64 && \
docker push registry.cn-qingdao.aliyuncs.com/wod/registry:2.8.3-arm64
```

## debug

```bash
# /etc/hosts 
# registry.beagle.default，解析为172.29.7.216时，docker默认使用https协议
# registry.beagle.default，解析为127.0.0.1时，docker默认使用http协议
docker pull alpine:3 && \
docker tag alpine:3 registry.beagle.default:6444/wod/alpine:3 && \
docker push registry.beagle.default:6444/wod/alpine:3
```
