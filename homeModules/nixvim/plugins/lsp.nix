{
  plugins.lsp = {
    enable = true;
    servers = {
      lua_ls.enable = true;
			nixd.enable = true;

			# I found a total of three LaTeX Servers
      # digestif.enable = true;
      # ltex = {
      #   enable = true;
      #   settings = {
      #     enabled = [ "latex" "tex" "text"];
      #     completionEnabled = true;
      #     language = "en-US de-DE";
      #   };
      # };
      texlab.enable = true;
    };
  };
}
