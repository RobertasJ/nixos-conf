{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "bash"
    ];

    userSettings = {
      vim_mode = true;
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "nixd"
          ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
      lsp = {
        rust-analyzer = {
          binary = {
            path_lookup = true;
          };
        };
      };
    };
  };
}
