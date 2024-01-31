{ buildPythonPackage
, fetchFromGitHub
, lib
, numpy
, msgpack
}:

buildPythonPackage rec {
  pname = "msgpack-numpy";
  version = "1.0.0";
  src = fetchFromGitHub {
    owner = "opentensor";
    repo = "msgpack-numpy";
    rev = "refs/tags/v${version}";
    hash = lib.fakeHash;
  };
  meta = with lib; {
    description = "Serialize numpy arrays using msgpack";
    homepage = "https://github.com/opentensor/msgpack-numpy";
  };
}

