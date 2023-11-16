return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "luacheck",
      "shfmt",
      "pyproject-flake8",
      "flake8",
      "mypy",
      "isort",
      "black",
      "debugpy",
    },
  },
}
