let config = import "config.ncl" in

{
  mkRedisService = fun role_ =>
    let name_ = "redis-#{role_}" in

    {
      kind = "Service";
      apiVersion = config.version;
      metadata = {
        name = name_;
        labels = {
          app = "redis";
          role = role_;
        }
      };
      spec = {
        selector = {
          app = "redis";
          role = role_;
        };
        ports = [
          {
            name = "redis-server";
            port = 6379
          }
        ];
      }
    };
}
