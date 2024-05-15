{ ... }: 
let
	user = "robin";
in {
	services.syncthing = {
		enable = true;
		user = user;
		dataDir = "/home/${user}/Documents/Obsidian";
		configDir = "/home/${user}/Documents/Obsidian/.config/syncthing";
	};
}
