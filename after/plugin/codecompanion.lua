-- require("codecompanion").setup({
--   strategies = {
--     chat = {
--       adapter = "gemini",
--     },
--     inline = {
--       adapter = "gemini",
--     },
--   },
--   gemini = function()
--     return require("codecompanion.adapters").extend("gemini", {
--       schema = {
--         model = {
--           default = "gemini-2.0-flash-lite",
--         },
--       },
--       env = {
--         api_key = "GEMINI_API_KEY",
--       },
--     })
--   end,
-- })
