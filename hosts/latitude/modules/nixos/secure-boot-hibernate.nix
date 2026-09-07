{ inputs, lib, ... }: {
  # Resume from the decrypted SWAP
  boot.resumeDevice = "/dev/mapper/luks-e6163b9d-149f-4b63-9038-9fdbc57c8412";

  boot.kernelPatches = [
    {
      name = "lockdown-hibernate";
      patch = ../../0001-Kelvie-patch.patch;
    }
  ];

  boot.kernelParams = [
    "lockdown_hibernate"
    "secretmem.enable=0"
  ];
}
