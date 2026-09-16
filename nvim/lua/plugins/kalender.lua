return{
"atiladefreitas/bloocky",

    config = function()
require('bloocky').setup({
     window = { width = "full", height = "full" },
     week_start = "monday",
     default_view = "month",
    sync = {
        enabled = true,
        accounts = {
            {
                id = "gcal",
                provider = "google",
                client_id = "416913242859-g5b2josg89h236p7nlc18l13eha8cq4d.apps.googleusercontent.com",
                client_secret_cmd = { "secret-tool", "lookup", "service", "bloocky", "key", "google" },
            },
        },
    },
})
end,
}
