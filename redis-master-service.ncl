let builder = import "redis-service.ncl" in
builder.mkRedisService "master"
