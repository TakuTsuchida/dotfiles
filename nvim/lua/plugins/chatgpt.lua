return {
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        openai_params = {
          model = "gpt-4o-mini-2024-07-18",
          max_tokens = 4096,
          temperature = 1,
          n = 1,
          presence_penalty = 0.2,
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
}

