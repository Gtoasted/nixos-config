{ ... }: {
  additions = final: prev: import ./pkgs final.pkgs;
}
