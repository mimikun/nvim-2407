-- TODO: fix it
---@type boolean
local cond = false

---@type table
local cmds = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatClose",
    "CopilotChatToggle",
    "CopilotChatReset",
    "CopilotChatSave",
    "CopilotChatLoad",
    "CopilotChatDebugInfo",
    "CopilotChatExplain",
    "CopilotChatReview",
    "CopilotChatFix",
    "CopilotChatOptimize",
    "CopilotChatDocs",
    "CopilotChatTests",
    "CopilotChatFixDiagnostic",
    "CopilotChatCommit",
    "CopilotChatCommitStaged",
}

---@type LazySpec[]
local dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
}

---@type LazySpec
local spec = {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    --lazy = false,
    enabled = cond,
    cmd = cmds,
    dependencies = dependencies,
    opts = {},
    cond = cond,
}

return spec
