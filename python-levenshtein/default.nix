{ buildPythonPackage
, fetchFromGitHub
, lib
}:

buildPythonPackage rec {
  pname = "python-levenshtein";
  version = "0.23.0";
  src = fetchFromGitHub {
    owner = "rapidfuzz";
    repo = "python-Levenshtein";
    rev = "refs/tags/v${version}";
    hash = lib.fakeHash;
  };
  meta = with lib; {
    description = "Functions for fast computation of Levenshtein distance and string similarity";
    homepage = "https://github.com/rapidfuzz/python-Levenshtein";
  };
}

