{
  # Val-niri style: no client-side decorations, thin border around every window.
  prefer-no-csd = {};

  layout = {
    gaps = 6;
    center-focused-column = "never";
    default-column-width.proportion = 0.5;

    preset-column-widths._children = [
      {proportion = 0.25;}
      {proportion = 0.5;}
      {proportion = 0.75;}
    ];

    # Border instead of a focus ring: the ring is what made Nautilus look
    # like it had a hard black edge.
    focus-ring.off = {};

    border = {
      on = {};
      width = 2;
      active-color = "#9a5b3f";
      inactive-color = "#4a463c";
      urgent-color = "#a34a3a";
    };
  };
}
