let config = import "config.ncl" in

let mkRedisController = fun role_ image_ replicas_ =>
  let name_ = "redis-${role_}" in
  let metadata_ = {
    labels = {
      app = app_;
      role = role_;
    }
  } in

  {
    kind = "ReplicationController";
    apiVersion = config.version;
    metadata = metadata_ & {name = name_};
    spec = {
      replicas = replicas_;
      selector = {
        app = app_;
        role = role_;
      };
      template = {
        metadata = metadata_;
        spec = {
          containers = [
            {
              name = name_;
              image = image_;
              ports = [
                {
                  name = "redis-server";
                  containerPort = 6379
                }
              ];
            }
          ]
        }
      }
    }
  }
in
