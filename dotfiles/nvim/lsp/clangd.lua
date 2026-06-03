return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
  },
  filetypes = {
    "c",
    "cpp"
  },
}
