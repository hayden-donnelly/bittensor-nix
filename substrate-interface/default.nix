{ buildPythonPackage
, fetchFromGitHub
, lib
, websocket-client
, base58
, certifi
, idna
, requests
, xxhash
, pytest
, ecdsa
, eth-keys
, eth_utils
, pycryptodome
, pynacl
, scalecodec
, py-sr25519-bindings
, py-ed25519-zebra-bindings
, py-bip39-bindings
, mkdocs
, mkdocs-material
, mkdocs-autorefs
, mkdocstrings
, mkdocstrings-python
}:

buildPythonPackage rec {
  pname = "substrate-interface";
  version = "1.7.5";
  src = fetchFromGitHub {
    owner = "polkascan";
    repo = "py-substrate-interface";
    rev = "refs/tags/v${version}";
    hash = lib.fakeHash;
  };
  nativeBuildInputs = [
    websocket-client
    base58
    certifi
    idna
    requests
    xxhash
    pytest
    ecdsa
    eth-keys
    eth_utils
    pycryptodome
    pynacl
    scalecodec
    py-sr25519-bindings
    py-ed25519-zebra-bindings
    py-bip39-bindings
    mkdocs
    mkdocs-material
    mkdocs-autorefs
    mkdocstrings
    mkdocstrings-python
  ];
  meta = with lib; {
    description = "Python Substrate Interface";
    homepage = "https://github.com/polkascan/py-substrate-interface";
  };
}
