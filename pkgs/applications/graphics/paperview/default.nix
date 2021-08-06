{ stdenv, lib, fetchurl, SDL2, libX11 }:

stdenv.mkDerivation rec {
  name = "paperview";

  src = fetchurl {
    url = "https://github.com/glouw/paperview/archive/40162fb76566fec8163c338c169c2fcd9df6ef42.tar.gz";
    sha256 = "5a64c7142c29486601dc7893c2523abe16773d18209b51532edfb99f5d36b7aa";
  };

  buildInputs = [
    SDL2
    libX11
  ];

  installPhase = ''
    runHook preInstall
    install -Dm755 paperview $out/bin/paperview
    runHook postInstall
  '';
   
  meta = with lib; {
    description = "A high performance X11 animated wallpaper setter";
    homepage = "https://github.com/glouw/paperview";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = [ maintainers.yvesh ];
  };
} 

