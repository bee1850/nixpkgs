{ lib
, buildPythonPackage
, fetchPypi
, spotipy
, click
, pycryptodomex
, mutagen
, requests
, deezer-py
, pythonOlder
}:

buildPythonPackage rec {
  pname = "deemix";
  version = "3.6.3";
  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-mzQ5bqVBMkfBQmedO8+qh7r1OwWQxg1oMHGaYWBlBWo=";
  };

  propagatedBuildInputs = [
    spotipy
    click
    pycryptodomex
    mutagen
    requests
    deezer-py
  ];

  # Project has no tests
  doCheck = false;
  pythonImportsCheck = [
    "spotipy"
    "click"
    "Cryptodome"
    "mutagen"
    "requests"
    "deezer"
  ];

  meta = with lib; {
    homepage = "https://git.freezer.life/RemixDev/deemix-py";
    description = "Deezer downloader built from the ashes of Deezloader Remix";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ natto1784 ];
  };
}
