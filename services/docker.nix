{ config, lib, pkgs, modulesPath, ... }:
{
  virtualisation.docker.enable = true;
  virtualisation.oci-containers = {
    backend = "docker";
    containers.irc-bridge = {
      image = "discordirc/discord-irc";
      autoStart = true;
      volumes = [ "${./user-configs/irc-bridge-config.json}:/config/config.json" ];
    };
  };
}
