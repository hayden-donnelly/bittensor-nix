{ buildPythonPackage
, fetchFromGitHub
, lib
, six
}:

buildPythonPackage rec {
  pname = "password-strength";
  version = "0.0.3";
  src = fetchFromGitHub {
    owner = "kolypto";
    repo = "py-password-strength";
    rev = "refs/tags/v${version}";
    hash = lib.fakeHash;
  };
  nativeBuildInputs = [
    six
  ];
  meta = with lib; {
    description = "Password strength and validation";
    homepage = "https://github.com/kolypto/py-password-strength";
  };
}
