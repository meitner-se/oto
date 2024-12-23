{
  description = "Go driven rpc code generation tool for right now";

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages.${system}.oto = pkgs.buildGoModule {
      pname = "oto";
      version = "0.11.1-meitner1.1";
      src = self;

      excludedPackages = "otohttp example";

      vendorSha256 = "P15nut6Ped6O7xsopx/m0QlqV3JfkNSLg6LgrJTHAjg=";
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.oto;
  };
}
