--var

local r = require("robot")

local component = require("component")
local g = component.generator



local i = 0
local j = 0

function eat()
  local selectedSlot = r.select()
--begin
  print("Eating fuel...")
  r.select(16)
  g.insert(8)
  r.select(selectedSlot)
end

function fillChest()
  local selectedSlot = r.select()
  local k = 0
--begin
  r.select(15)
  r.placeDown()
  print("Clearing slots...")
  for k = 1, 14 do
    r.select(k)
    r.dropDown()
  end
  r.select(selectedSlot)
end

function checkInv()
--begin
  if r.count(14) > 0 then
    print("Slot 14 is partially filled!")
    fillChest()
  end
end

function forward()
  checkInv()
  repeat
    r.swing()
  until not r.detect()
  r.forward()
  r.swingUp()
  r.swingDown()
end
function ret()
r.turnRight()
for i = 0,10 do
	r.forward()
	os.sleep(1)
end
r.turnRight()
for i = 0,10 do
	r.forward()
	os.sleep(1)
end
for i = 0,3 do
	r.swingDown()
	r.down()
	os.sleep(1)
end
kopka()
end
function kopka()
local leng = 3

forward()
r.turnRight()
forward()
r.turnRight()

while true do
  print("Current tunnel length: "..leng)
  
  if g.count() < 1 then
    eat()
  end
  
  for j = 1, 2 do
    for i = 1, tonumber(leng) - 1 do
      forward()
    end
    r.turnRight()
  end
  leng = leng + 1
  if leng == 400 then 
  ret()
  end
end
end
kopka()