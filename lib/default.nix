{ lib, ... }:
rec {
  hasDefaultNix =
    path:
    (
      builtins.readDir path
      |> lib.filterAttrs (n: v: v == "regular" && n == "default.nix")
    )
    != [ ];
  getAllChildren =
    path:
    builtins.readDir path
    |> lib.filterAttrs (n: v: (v == "directory") || (v == "regular" && lib.hasSuffix ".nix" n))
    |> lib.attrNames
    |> lib.remove "default.nix"
    |> lib.map (name: "${path}/${name}");
}
