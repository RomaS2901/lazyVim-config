return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    ---@diagnostic disable-next-line: missing-parameter
    require("harpoon"):setup()
  end,
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon append list",
    },
    {
      "<leader>hr",
      function()
        require("harpoon"):list():remove()
      end,
      desc = "Harpoon remove list",
    },
    {
      "<leader>hl",
      function()
        local harpoon = require("harpoon")
        local telescope_conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          require("telescope.pickers")
            .new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                results = file_paths,
              }),
              previewer = telescope_conf.file_previewer({}),
              sorter = telescope_conf.generic_sorter({}),
            })
            :find()
        end

        toggle_telescope(harpoon:list())
      end,
      desc = "Harpoon list telescope",
    },
  },
}
