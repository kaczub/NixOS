{pkgs, ...}: {
  # Konto użytkownika.
  users.users.kamil = {
    isNormalUser = true;
    description = "Kamil";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "input"];
  };

  # Narzędzia deweloperskie dostępne systemowo.
  environment.systemPackages = with pkgs; [
    # Podstawowe narzędzia i budowanie
    curl
    wget
    gnumake

    # Formatowanie i serwer języka dla Nixa
    alejandra
    nixd
  ];
}
