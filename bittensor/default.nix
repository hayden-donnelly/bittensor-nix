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
      echo "aiohttp==3.9.0
      ansible==6.7.0
      ansible_vault==2.1.0
      backoff
      black==23.7.0
      cryptography==41.0.3
      ddt==1.6.0
      fuzzywuzzy>=0.18.0
      fastapi==0.99.1
      loguru==0.7.0
      munch==2.5.0
      netaddr
      numpy
      msgpack-numpy-opentensor==0.5.0
      nest_asyncio
      pycryptodome>=3.18.0,<4.0.0
      pyyaml
      password_strength
      pydantic!=1.8,!=1.8.1,<2.0.0,>=1.7.4
      PyNaCl>=1.3.0,<=1.5.0
      pytest-asyncio
      python-Levenshtein
      pytest
      retry
      requests
      rich
      scalecodec==1.2.7
      shtab==1.6.5
      substrate-interface==1.5.2
      termcolor
      torch>=1.13.1
      tqdm
      uvicorn>=0.22.0
      wheel" | cat > requirements/prod.txt
    '';
    nativeBuildInputs = [
      aiohttp
      ansible
      ansible_vault
      backoff
      black
      cryptography
      ddt
      fuzzywuzzy
      fastapi
      loguru
      munch
      netaddr
      numpy
      msgpack-numpy-opentensor
      nest_asyncio
      pycryptodome
      pyyaml
      password_strength
      pydantic
      pynacl
      pytest-asyncio
      python-levenshtein
      pytest
      retry
      requests
      rich
      scalecodec
      shtab
      substrate-interface
      termcolor
      torch
      tqdm
      uvicorn
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
