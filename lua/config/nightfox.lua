-- lua/config/nightfox.lua

local nightfox = require("nightfox")

nightfox.setup({
    options = {
        transparent = true, -- Only if the terminal has dark coplors
        styles = {
            comments = "italic", -- change style of comments to be italic
            keywords = "bold", -- change style of keywords to be bold
            functions = "italic,bold", -- styles can be a comma separated list
        },
    },
})
