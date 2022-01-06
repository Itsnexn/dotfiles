-- =============================================
--             -== Dashboard ==-
-- =============================================
local g = vim.g

vim.g.dashboard_custom_header = {
[[                  ▄                  ]],
[[                 ▟█▙                 ]],
[[                ▟███▙                ]],
[[               ▟█████▙               ]],
[[              ▟███████▙              ]],
[[             ▂▔▀▜██████▙             ]],
[[            ▟██▅▂▝▜█████▙            ]],
[[           ▟█████████████▙           ]],
[[          ▟███████████████▙          ]],
[[         ▟█████████████████▙         ]],
[[        ▟███████████████████▙        ]],
[[       ▟█████████▛▀▀▜████████▙       ]],
[[      ▟████████▛      ▜███████▙      ]],
[[     ▟█████████        ████████▙     ]],
[[    ▟██████████        █████▆▅▄▃▂    ]],
[[   ▟██████████▛        ▜█████████▙   ]],
[[  ▟██████▀▀▀              ▀▀██████▙  ]],
[[ ▟███▀▘                       ▝▀███▙ ]],
[[▟▛▀                               ▀▜▙]],
[[                                     ]],
[[                                     ]],
}

g.dashboard_default_executive ="telescope"
g.dashboard_session_directory = "~/.config/nvim/session"

g.dashboard_custom_section = {
    a = {description= {"Find File                              "}, command= "Telescope find_files"},
    b = {description= {"New File                               "}, command= ":ene!"},
    c = {description= {"Recents                                "}, command= "Telescope oldfiles"},
    d = {description= {"Update Plugins                         "}, command= "PackerUpdate"},
    e = {description= {"Settings                               "}, command= "edit ~/.config/nvim/"},
}

