local ui = require "ui"

-- create a simple Window 
local win = ui.Window("TabItem.owner sample", "fixed", 320, 250)
local tab = ui.Tab(win, {"Tab 1", "Tab 2", "Tab 3"})

function tab:onSelect(item)
    win:status(item.text.." is selected")
    assert(item.owner == self)
end

tab.selected = tab.items[1]
win:show()

-- update user interface 
repeat
    ui.update()
until not win.visible 