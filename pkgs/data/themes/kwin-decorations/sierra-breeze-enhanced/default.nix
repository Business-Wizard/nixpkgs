{
  stdenv,
  fetchFromGitHub,
  cmake,
  extra-cmake-modules,
  wrapQtAppsHook,
  kwin,
  lib,
  useQt5 ? false,
}:
let
  latestVersion = "2.1.1";
  latestSha256 = "sha256-7mQnJCQr/zm9zEdg2JPr7jQn8uajyCXvyYRQZWxG+Q8=";

  qt5Version = "1.3.3";
  qt5Sha256 = "sha256-zTUTsSzy4p0Y7RPOidCtxTjjyvPRyWSQCxA5sUzXcLc=";
in
stdenv.mkDerivation rec {
  pname = "sierra-breeze-enhanced";
  version = if useQt5 then qt5Version else latestVersion;

  src = fetchFromGitHub {
    owner = "kupiqu";
    repo = "SierraBreezeEnhanced";
    rev = if version == "2.1.1" then "V.2.1.1" else "V${version}";
    sha256 = if useQt5 then qt5Sha256 else latestSha256;
  };

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    wrapQtAppsHook
  ];
  buildInputs = [ kwin ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_PREFIX=$out"
    "-DBUILD_TESTING=OFF"
    "-DKDE_INSTALL_USE_QT_SYS_PATHS=ON"
  ];

  meta = with lib; {
    description = "OSX-like window decoration for KDE Plasma written in C++";
    homepage = "https://github.com/kupiqu/SierraBreezeEnhanced";
    changelog = "https://github.com/kupiqu/SierraBreezeEnhanced/releases/tag/V${version}";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ A1ca7raz ];
  };
}
