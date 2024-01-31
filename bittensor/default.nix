{ buildPythonPackage
, fetchFromGitHub
, lib
, aiohttp
, ansible
, ansible_vault
, backoff
, black
, cryptography
, ddt
, fuzzywuzzy
, fastapi
, loguru
, munch
, netaddr
, numpy
, msgpack-numpy-opentensor
, nest_asyncio
, pycryptodome
, pyyaml
, password_strength
, pydantic
, pynacl
, pytest-asyncio
, python-levenshtein
, pytest
, retry
, requests
, rich
, scalecodec
, shtab
, substrate-interface
, termcolor
, torch
, tqdm
, uvicorn
, wheel
, pip
, setuptools
}:

buildPythonPackage rec {
    pname = "bittensor";
    version = "6.7.0";
    src = fetchFromGitHub {
      owner = "opentensor";
      repo = "bittensor";
      rev = "refs/tags/v${version}";
      hash = "sha256-tbtI32Lx0gnXoAUlbyEHa7a82e7fzLmuS9gMPCjJLKA";
    };
    preBuild = ''
      rm Makefile
    '';
    nativeBuildInputs = [
        pip
        setuptools
    ];
    #pythonImportsCheck = [];
    #nativeCheckInputs = [];
    doCheck = true;
    #doInstallCheck = false;
    #nativeInstallCheckInputs = [];
    meta = with lib; {
      description = "Internet-scale Neural Networks";
      homepage = "https://bittensor.com/";
      license = licenses.mit;
    };
}
