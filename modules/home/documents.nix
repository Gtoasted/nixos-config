{ config, lib, pkgs, ...}: {
  options.gtoasted.documents= {
    enable = lib.mkEnableOption "Enable programs for editing and viewing documents.";
  };

  config = lib.mkIf config.gtoasted.documents.enable {
    home.packages = with pkgs; [
			libreoffice-qt
			texliveFull
			xournalpp
			pdfpc
			obsidian

			inkscape
			gimp

			hunspell
			hunspellDicts.de_DE
			hunspellDicts.en_US
    ];

		programs.zathura = {
			enable = true;
			options = {
				window-title-basename = true;
        selection-clipboard = "clipboard";
			};
		};

		xdg = {
			desktopEntries.zathura = {
				name = "Zathura";
				exec = "${pkgs.zathura}/bin/zathura";
			};
			mimeApps = {
				enable = true;
				defaultApplications = {
					"application/pdf" = "zathura.desktop";
				};
			};
		};
  };
}
