{
  description = "Test environment for Bittensor derivation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, nixpkgs, flake-utils }: 
  flake-utils.lib.eachSystem ["x86_64-linux"] (system: let 
    pkgs = import nixpkgs { inherit system; };
  in {
    devShells = let
      bittensor = import ./.;
    in rec {
      default = pkgs.mkShell {
        name = "nix-tao";
        buildInputs = with pkgs; [
          (python310.withPackages (pp: with pp; [
            (pkgs.callPackage ./bittensor {
              buildPythonPackage = buildPythonPackage;
              fetchFromGitHub = fetchFromGitHub;
              lib = lib;
              aiohttp = aiohttp;
              ansible = ansible-core;
              ansible_vault = ansible-vault-rw;
              backoff = backoff;
              black = black;
              cryptography = cryptography;
              ddt = ddt;
              fuzzywuzzy = fuzzywuzzy;
              fastapi = fastapi;
              loguru = loguru;
              munch = munch;
              netaddr = netaddr;
              numpy = numpy;
              msgpack-numpy-opentensor = (pkgs.callPackage ./msgpack-numpy {
                buildPythonPackage = buildPythonPackage;
                fetchFromGitHub = fetchFromGitHub;
                lib = lib;
                numpy = numpy;
                msgpack = msgpack-numpy;
              });
              nest_asyncio = nest-asyncio;
              pycryptodome = pycryptdome;
              pyyaml = pyyaml;
              password_strength = (pkgs.callPackage ./password-strength {});
              pydantic = pydantic;
              pynacl = pynacl;
              pytest-asyncio = pytest-asyncio;
              python-levenshtein = (pkgs.callPackage ./python-levenshtein {});
              pytest = pytest;
              retry = retry;
              requests = requests;
              rich = rich;
              scalecodec = (pkgs.callPackage ./scalecodec {});
              shtab = shtab;
              substrate-interface = (pkgs.callPackage ./substrate-interface {});
              termcolor = termcolor;
              torch = torch;
              tqdm = tqdm;
              uvicorn = uvicorn;
              wheel = wheel;
              pip = pip;
              setuptools = setuptools;
            })
          ]))
        ];
      };
    };
  });
}
