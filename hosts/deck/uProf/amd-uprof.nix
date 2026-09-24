{
    stdenv,
    requireFile,
    lib,
    pkgs
}: stdenv.mkDerivation rec {
    pname = "amd-uprof";
    version = "5.3.521";

    src = let packageName = "AMDuProf_Linux_x64_${version}.tar.bz2"; in requireFile {
        name = packageName;
        sha256 = "1yf0lsm5s8zpfbmzan3yn8ikdm8vkhb0dm1acciy6jrrv735jihk";
        message = ''
            The download for this file is behind a EULA acceptance screen you need to accept first,
            Visit https://developer.amd.com/amd-uprof/ and download the tarball, then run the following:
            $ nix-prefetch-url file:///path/to/${packageName}
        '';
    };

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
    ];

    buildInputs = with pkgs; [
        binutils
        stdenv.cc.cc.lib
        gcc
        glib
        freetype
        fontconfig
        numactl
        dbus
        coreutils
        ncurses5
        kmod
        libGLU
        elfutils
        libxkbcommon
        libarchive
        libglvnd
        rocmPackages.rocprofiler

        libx11
        libxi
        libxcb
        libxcb-wm
        libxcb-image
        libxcb-render-util
        libxcb-keysyms
        libice
        libxmu
        libsm
    ];

    postUnpack = ''
    patchelf --replace-needed libroctracer64.so.1 libroctracer64.so AMDuProf_Linux_x64_${version}/bin/ProfileAgents/x64/libAMDGpuAgent.so
    '';

    installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/lib $out/share/doc
    cp -r ./bin/* $out/bin/
    cp -r ./lib/* $out/lib/
    cp ./Legal/AMDuProfEndUserLicenseAgreement.htm $out/share/doc

    rm -f $out/bin/libstdc++.so* $out/lib/libstdc++.so*

    patchShebangs $out/bin

    runHook postInstall
    '';

    meta = with lib; {
        description = "AMD uProf is a performance analysis tool for applications running on Windows and Linux operating systems. It allows developers to better understand the runtime performance of their application and to identify ways to improve its performance.";
        license = licenses.amd;
        maintainers = [];
        platforms = platforms.linux;
    };
}
