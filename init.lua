local chr = require('unicode').char(0x2580)
local gpu = add_component('gpu')
local screen = add_component('screen')
local inflate = add_component('data').inflate

local function draw()
  local colors = {0x1aac28, 0xffff00, 0xff0000, 0, [0] = 0x06660f}
  local text = inflate(fs_read('image'))
  screen.setPrecise(true)
  gpu.setResolution(97, 80)
  gpu.setBackground(colors[0])
  gpu.fill(1, 1, 97, 80, ' ')
  local x, y = 1, 1
  for i = 1, #text do
    local w = text:sub(i, i):byte()
    gpu.setForeground(colors[w >> 4])
    gpu.setBackground(colors[w & 15])
    gpu.set(x, y, chr)
    if i % 97 == 0 then
      x, y = 1, y + 1
    else
      x = x + 1
    end
  end
end

local function main()
  draw()
  gpu.setForeground(0)
  while true do
    local e = {computer.pullSignal(1)}
    if e[1] == 'touch' then
      
    end
  end
end

main()
