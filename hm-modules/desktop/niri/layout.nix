{
  # Styl val-niri: bez dekoracji po stronie klienta, cienka ramka wokół okien.
  prefer-no-csd = {};

  layout = {
    gaps = 6;
    center-focused-column = "never";
    default-column-width.proportion = 0.5;
    background-color = "transparent";

    preset-column-widths._children = [
      {proportion = 0.25;}
      {proportion = 0.33333;}
      {proportion = 0.5;}
      {proportion = 0.66667;}
      {proportion = 0.75;}
    ];

    # Ramka zamiast focus-ringu — to on powodował twardą czarną krawędź
    # w Nautilusie.
    focus-ring.off = {};

    border = {
      on = {};
      width = 2;
      active-color = "#9a5b3f";
      inactive-color = "#4a463c";
      urgent-color = "#a34a3a";
    };

    # Jak w val-niri: delikatny cień zamiast ciężkich CSD.
    shadow = {
      on = {};
      softness = 40;
      spread = 4;
      offset._props = {x = 0; y = 0;};
    };
  };
}
