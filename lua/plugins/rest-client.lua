return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      ---@diagnostic disable-next-line: missing-parameter
      require("rest-nvim").setup()
    end,
    keys = {
      {
        "<leader>rr",
        "<cmd>Rest run<cr>",
        desc = "Run request under the cursor",
      },
      {
        "<leader>rl",
        "<cmd>Rest run last<cr>",
        desc = "Rest run last",
      },

      {
        "<leader>re",
        function()
          require("telescope").extensions.rest.select_env()
        end,
        desc = "Rest select env",
      },
    },
  },
}
