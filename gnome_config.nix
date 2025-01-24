{ config, lib, pkgs, ... }:

{
 services.xserver.desktopManager.gnome = {
        enable = lib.mkDefault true;
        extraGSettingsOverrides =
          let
            workspaces = map toString (lib.lists.range 1 9);
          in ''
            [org.gnome.desktop.wm.preferences]
            button-layout=':minimize,minimize,close'
          '';
      };
}
