{ lib, python3, fetchFromGitHub }:

python3.pkgs.buildPythonApplication rec {
  pname = "pls";
  version = "5.1.2";
  format = "pyproject";

  src = fetchFromGitHub {
    owner = "dhruvkb";
    repo = "pls";
    rev = version;
    sha256 = "sha256-xJvAAlRVKQHEOz8wbErHCUTcb8Y1otcPEUwTw2lgddo=";
  };

  nativeBuildInputs = [ python3.pkgs.poetry-core ];

  propagatedBuildInputs = with python3.pkgs; [
    pyyaml
    requests
    rich
  ];

  checkInputs = with python3.pkgs; [
    freezegun
    jsonschema
    pytestCheckHook
  ];

  pytestFlagsArray = [ "tests/" "--ignore=tests/e2e" ];

  pythonImportsCheck = [ "pls" ];

  meta = with lib; {
    homepage = "https://dhruvkb.github.io/pls/";
    description = "Prettier and powerful ls";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ arjan-s ];
  };
}
