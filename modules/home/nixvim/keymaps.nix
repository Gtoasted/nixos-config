{
  globals.mapleader = " ";

  keymaps = [
    # Window switching
    {
      key = "<C-h>";
      action = "<C-w>h";
      mode = "n";
    }
    {
      key = "<C-j>";
      action = "<C-w>j";
      mode = "n";
    }
    {
      key = "<C-k>";
      action = "<C-w>k";
      mode = "n";
    }
    {
      key = "<C-l>";
      action = "<C-w>l";
      mode = "n";
    }
    # Line numbers
    {
      key = "<Leader>n";
      action = "<cmd> set nu! <CR>";
      mode = "n";
    }
    {
      key = "<Leader>rn";
      action = "<cmd> set rnu! <CR>";
      mode = "n";
    }
    # Buffer Navigation
    {
      key = "<Leader>x";
      action = "<cmd>Bdelete<CR>";
      mode = "n";
    }
    {
      key = "<Tab>";
      action = "<cmd>bn<CR>";
      mode = "n";
    }
    {
      key = "<S-Tab>";
      action = "<cmd>bp<CR>";
      mode = "n";
    }
    # Other
    {
      key = "<Esc>";
      action = "<cmd>noh<CR>";
      mode = "n";
    } # Clear highlights
    # {key = "<C-Space>"; action = "<C-\\><C-n>"; mode= "t";} # Exit terminal mode
    # Plugins
    # comment
    {
      key = "<Leader>/";
      action = "<Plug>(comment_toggle_linewise_current)";
      mode = "n";
    }
    {
      key = "<Leader>/";
      action = "<Plug>(comment_toggle_linewise_visual)";
      mode = "v";
    }
    # floaterm
    {
      key = "<C-Space>";
      action = "<cmd>FloatermToggle<CR>";
      mode = "n";
    }
    {
      key = "<C-Space>";
      action = "<cmd>FloatermToggle<CR>";
      mode = "t";
    }
    {
      key = "<Leader><CR>";
      action = "<cmd>FloatermNew<CR>";
      mode = "n";
    }
    {
      key = "<Leader>fn";
      action = "<cmd>FloatermNext<CR>";
      mode = "n";
    }
    {
      key = "<Leader>fp";
      action = "<cmd>FloatermPrev<CR>";
      mode = "n";
    }
    {
      key = "<Leader>fk";
      action = "<cmd>FloatermKill<CR>";
      mode = "n";
    }
    # nvim-tree
    {
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<CR>";
      mode = "n";
    }
  ];
}
