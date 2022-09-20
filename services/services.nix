{ config, lib, pkgs, modulesPath, ... }:
{
# Enable the OpenSSH daemon.
	services.openssh.enable = true;

	services.znc = {
		enable = true;
		mutable = false;
		useLegacyConfig = false;
		openFirewall = true;
	};

	services.znc.config = let users = import ./user-configs/users.nix; in {
		inherit (users) User;
		LoadModule = ["adminlog" "webadmin"];
	};
}
