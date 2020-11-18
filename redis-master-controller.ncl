let builder = import "redis-controller.ncl" in
builder.mkRedisController "master" "redis:2.8.23" 1
