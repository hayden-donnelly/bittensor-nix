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
              pycryptodome = pycryptodome;
              pyyaml = pyyaml;
              password_strength = (pkgs.callPackage ./password-strength {
                buildPythonPackage = buildPythonPackage;
                fetchFromGitHub = fetchFromGitHub;
                lib = lib;
                six = six;
              });
              pydantic = pydantic;
              pynacl = pynacl;
              pytest-asyncio = pytest-asyncio;
              python-levenshtein = (pkgs.callPackage ./python-levenshtein {
                buildPythonPackage = buildPythonPackage;
                fetchFromGitHub = fetchFromGitHub;
                lib = lib;
              });
              pytest = pytest;
              retry = retry;
              requests = requests;
              rich = rich;
              scalecodec = (pkgs.callPackage ./scalecodec {
                buildPythonPackage = buildPythonPackage;
                fetchFromGitHub = fetchFromGitHub;
                lib = lib;
                base58 = base58;
                atomicwrites = atomicwrites;
                attrs = attrs;
                coverage = coverage;
                more-itertools = more-itertools;
                pluggy = pluggy;
                py = py;
                pytest = pytest;
                requests = requests;
                six = six;
                mkdocs = mkdocs;
                mkdocs-material = mkdocs-material;
                mkdocs-autorefs = mkdocs-autorefs;
                mkdocstrings = mkdocstrings;
                mkdocstrings-python = mkdocstrings-python;
              });
              shtab = shtab;
              substrate-interface = (pkgs.callPackage ./substrate-interface {
                buildPythonPackage = buildPythonPackage;
                fetchFromGitHub = fetchFromGitHub;
                lib = lib;
                websocket-client = websocket-client;
                base58 = base58;
                certifi = certifi;
                idna = idna;
                requests = requests;
                xxhash = xxhash;
                pytest = pytest;
                ecdsa = ecdsa;
                eth-keys = eth-keys;
                eth_utils = eth-utils;
                pycryptodome = pycryptodome;
                pynacl = pynacl;
                scalecodec = (pkgs.callPackage ./scalecodec {
                  buildPythonPackage = buildPythonPackage;
                  fetchFromGitHub = fetchFromGitHub;
                  lib = lib;
                  base58 = base58;
                  atomicwrites = atomicwrites;
                  attrs = attrs;
                  coverage = coverage;
                  more-itertools = more-itertools;
                  pluggy = pluggy;
                  py = py;
                  pytest = pytest;
                  requests = requests;
                  six = six;
                  mkdocs = mkdocs;
                  mkdocs-material = mkdocs-material;
                  mkdocs-autorefs = mkdocs-autorefs;
                  mkdocstrings = mkdocstrings;
                  mkdocstrings-python = mkdocstrings-python;
                });
                py-sr25519-bindings = py-sr25519-bindings;
                py-ed25519-zebra-bindings = py-ed25519-zebra-bindings;
                py-bip39-bindings = py-bip39-bindings;
                mkdocs = mkdocs;
                mkdocs-material = mkdocs-material;
                mkdocs-autorefs = mkdocs-autorefs;
                mkdocstrings = mkdocstrings;
                mkdocstrings-python = mkdocstrings-python;
              });
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
