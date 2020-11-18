let builder = import "redis-controller.ncl" in
builder.mkRedisController "slave" "k8s.gcr.io/redis-slave:v2" 2
