{ ... }: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        indicate_hidden = "yes";
        offset = "10x10";
        notification_height = 0;

        separator_height = 2;

        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        frame_width = 2;

        frame_color = "#f5c2e7";
        separator_color = "frame";

        sort = true;
        idle_threshold = 120;
        font = "monospace 10";
        line_height = 0;
        markup = "full";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        word_wrap = true;
        stack_duplicates = true;
        hide_duplicate_count = false;

        show_indicators = true;

        min_icon_size = 0;
        max_icon_size = 64;

        # icon_path = /usr/share/icons/Papirus-Dark/16x16/status/:/usr/share/icons/Papirus-Dark/16x16/devices/:/usr/share/icons/Papirus-Dark/16x16/actions/:/usr/share/icons/Papirus-Dark/16x16/animations/:/usr/share/icons/Papirus-Dark/16x16/apps/:/usr/share/icons/Papirus-Dark/16x16/categories/:/usr/share/icons/Papirus-Dark/16x16/emblems/:/usr/share/icons/Papirus-Dark/16x16/emotes/:/usr/share/icons/Papirus-Dark/16x16/devices/mimetypes:/usr/share/icons/Papirus-Dark/16x16/panel/:/usr/share/icons/Papirus-Dark/16x16/places/

        dmenu = "rofi -p dunst:";
        browser = "firefox --new-tab";

        title = "Dunst";
        class = "Dunst";

        corner_radius = 10;
        timeout = 5;
      };

      urgency_low = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };

      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
      };

      urgency_critical = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        frame_color = "#FAB387";
      };
    };
  };
}