{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    nodejs
    python3
    python38Packages.pynvim
  ];
  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";

  nixpkgs.overlays = [
    (self: super: {
      neovim = super.neovim.override {
        viAlias = true;
	vimAlias = true;
      };
     })
  ];
}
