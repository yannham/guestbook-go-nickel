let config = import "config.ncl" in
let metadataBase = {
    labels = {
      app = config.name
    }
} in

{
  kind = "ReplicationController";
  apiVersion = config.version;
  metadata = metadataBase & {name = config.name};
  spec = {
    replicas = 3;
    selector = {app = config.name};
    template = {
       metadata = metadataBase;
        spec = {
          containers = [
            {
              name = config.name;
              image = "k8s.gcr.io/#{name}:v3";
              ports = [
                {
                  name = "http-server";
                  containerPort = config.port
                }
              ]
            }
          ]
        }
    }
  }
}
