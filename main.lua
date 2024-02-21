local lib = {}
_G.libUI = nil
local RGB = Color3.fromRGB
local defaultScheme = {
  Background = RGB(70,70,70),
  MainColor = RGB(90,90,90),
  Text = RGB(255,255,255)
}

local Create = function(name, parent, props)
  local Inst = Instance.new(name)
  Inst.Parent = parent
  for PropName, PropValue in next, props do
    Inst[PropName] = PropValue
  end
  return Inst
end

function lib:new(properties)
  if _G.libUI then _G.libUI:Destroy() end
  local colors = properties.ColorScheme or defaultScheme
  local self = {}
  self.size = {width=properties.Size[1], height=properties.Size[2]}
  self.name = properties.Name
  self.bgColor = colors.Background
  self.textColor = colors.Text
  self.mainCol = colors.MainColor
  self.mainFrame = Create("Frame", game.CoreGui, {
      Size = UDim2.fromScale(self.size.width, self.size.height)
      BackgroundColor3 = self.bgColor
    }
    _G.libUI = self.mainFrame
  return setmetatable(self, lib)
end

function lib:NewRadio(self, name: string, defaultValue: boolean)
  local Button = Create("TextButton", self.mainFrame, {
      Text = name,
      Name = name,
      BackgroundColor3 = RGB(self.bgColor.R + 20, self.bgColor.G + 20, self.bgColor.B + 20)
      }
  local Frame = Create("Frame", Button, {
          Size = UDim2.new(self.size.width / 4, 0, 1, 0)
          BackgroundColor3 = RGB(Button.BackgroundColor3.R + 40, Button.BackgroundColor3.G + 40, Button.BackgroundColor3.B + 40)
        }
end

return lib
