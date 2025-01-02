{
  plugins.nvim-tree = {
    enable = true;
    autoClose = true;
    disableNetrw = true;
    hijackCursor = true;
    hijackUnnamedBufferWhenOpening = false;
    syncRootWithCwd = true;

    view = {
      side = "right";
      width = 30;
      preserveWindowProportions = true;
    };
  };
}
