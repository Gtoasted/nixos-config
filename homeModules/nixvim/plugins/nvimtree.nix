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
      width = {
				min = 30;
				max = -1;
			};
      preserveWindowProportions = true;
    };
  };
}
