return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = true },
        panel = { enabled = false },
      })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    -- build = "make tiktoken",
    opts = {
      debug = false,
      model = 'gpt-4o',
      auto_insert_mode = true,
      show_help = false,
      window = {
        layout = 'vertical',
        width = 0.4,
        border = 'rounded',
      },
      headers = {
        user = "   You ",
        assistant = "   Copilot ",
        tool = "   Tool ",
      },
      prompts = {
        Refactor = {
          prompt =
          'Review the selected code and suggest refactoring to improve readability and maintainability. Focus on DRY and SOLID principles.',
        },
      },
    },
    keys = {
      -- Chat
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>",      desc = "[Chat] Toggle",          mode = { "n", "v" } },
      { "<leader>cm", "<cmd>CopilotChatModels<cr>",      desc = "[Chat] Select Model" },
      { "<leader>cr", "<cmd>CopilotChatReset<cr>",       desc = "[Chat] Reset" },
      { "<leader>cs", "<cmd>CopilotChatStop<cr>",        desc = "[Chat] Stop Output" },
      -- Debug
      { "<leader>cd", "<cmd>CopilotChatDebug<cr>",       desc = "[Debug] Debug Code",     mode = "v" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>",         desc = "[Debug] Fix Code",       mode = "v" },
      { "<leader>cF", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "[Debug] Fix Diagnostic", mode = "v" },
      -- Documentation
      { "<leader>cD", "<cmd>CopilotChatDocs<cr>",        desc = "[Docs] Generate Docs",   mode = "v" },
      -- Explain
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>",     desc = "[Explain] Explain Code", mode = "v" },
      -- Refactor
      { "<leader>cR", "<cmd>CopilotChatRefactor<cr>",    desc = "[Refactor] Refactor",    mode = "v" },
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>",    desc = "[Refactor] Optimize",    mode = "v" },
      { "<leader>cv", "<cmd>CopilotChatReview<cr>",      desc = "[Refactor] Review",      mode = "v" },
      -- Tests
      { "<leader>ct", "<cmd>CopilotChatTests<cr>",       desc = "[Tests] Generate Tests", mode = "v" },
  },
}
