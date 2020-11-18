let config = import "config.ncl" in

{
  kind = "Service";
  apiVersion = "v1";
  metadata = {
    name = config.name;
    labels = {app = config.name}
  };
  spec = {
    ports = [
      {
        port = config.port;
        targetPort = "http-server";
      }
    ];
    selector = {
      app = config.name;
    };
    type = "LoadBalancer"
  }
}
