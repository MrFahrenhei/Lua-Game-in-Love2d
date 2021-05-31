BUTTON_HEIGHT = 60
local

function newButton(text, fn)
    return {
        text = text,
        fn = fn
    }
end

local buttons = {}
local font = nil
function love.load()
    font = love.graphics.newFont(32)
    table.insert(buttons, newButton(
        "novo jogo", 
        function ()
            print("Carregando o jogo")
        end
    ))
    table.insert(buttons, newButton(
        "Sair", 
            function ()
                love.event.quit(0)
            end))
end

function love.update(dt)

end

function love.draw()
    local ww = love.graphics.getWidth()
    local wh = love.graphics.getHeight()
    local button_width = ww * (1/3)
    local margin = 16

    local total_height = (BUTTON_HEIGHT + margin) * #buttons
    local cursor_y = 0

    for i, button in ipairs(buttons) do
        local bx = (ww * 0.5) - (button_width * 0.5)
        local by = (wh * 0.5) - (total_height * 0.5) + cursor_y
        
        love.graphics.setColor(0.4, 0.4, 0.5, 1.0)
        love.graphics.rectangle(
           "fill", 
            bx, 
            by, 
            button_width, 
            BUTTON_HEIGHT
        )

        love.graphics.setColor(0, 0, 0, 1)

        local textW = font:getWidth(button.text)
        local textH = font:getHeight(button.text)

        love.graphics.print(
            button.text,
            font,
            textW ,
            textH
        )
        cursor_y = cursor_y + (BUTTON_HEIGHT + margin)
   end
end