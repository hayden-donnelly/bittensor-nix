{ buildPythonPackage
, fetchFromGitHub
, lib
, base58
, atomicwrites
, attrs
, coverage
, more-itertools
, pluggy
, py
, pytest
, requests
, six
, mkdocs
, mkdocs-material
, mkdocs-autorefs
, mkdocstrings
, mkdocstrings-python
}:

buildPythonPackage rec {
  pname = "scalecodec";
  version = "1.3.0a5";
  src = fetchFromGitHub {
    owner = "polkascan";
    repo = "py-scale-codec";
    rev = "refs/tags/v${version}";
    hash = lib.fakeHash;
  };
    
  nativeBuildInputs = [
    base58
    atomicwrites
    attrs
    coverage
    more-itertools
    pluggy
    py
    pytest
    requests
    six
    mkdocs
    mkdocs-material
    mkdocs-autorefs
    mkdocstrings
    mkdocstrings-python
  ];

  meta = with lib; {
    description = "Python SCALE-Codec";
    homepage = "https://github.com/polkascan/py-scale-codec";
  };
}
