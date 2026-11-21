{
  inputs,
  lib,
  ...
}: let
  repo = inputs.wallpapers;

  isImage = name: type:
    type == "regular"
    && lib.any (ext: lib.hasSuffix ext (lib.toLower name)) [
      ".jpg"
      ".jpeg"
      ".png"
      ".webp"
      ".avif"
    ];

  images = lib.filterAttrs isImage (builtins.readDir repo);
in {
  # Linkujemy pojedyncze pliki, a nie cały katalog — dzięki temu wybierak
  # tapet widzi zwykłe pliki w ~/Pictures/Wallpapers.
  home.file = lib.mapAttrs' (
    name: _:
      lib.nameValuePair "Pictures/Wallpapers/${name}" {
        source = repo + "/${name}";
      }
  ) images;
}
