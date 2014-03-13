--Desktop

local slc = 0
local tBarC = 8
local tBartC = 1
local backColor = 1
term.setBackgroundColor(backColor)
term.clear()
local contextX = 0
local contextY = 0
local function titleBar()
  term.setCursorPos(1,1)
  term.setBackgroundColor(tBarC)
  term.setTextColor(tBartC)
  term.clearLine()
  term.setCursorPos(3, 1)
  print("[Begin]")
end
local function drawDesktop()
  term.setBackgroundColor(backColor)
  term.clear()
  bground = paintutils.loadImage("/somethingos/p.bground")
  paintutils.drawImage(bground,1,1)
  fileBicon  = paintutils.loadImage("/somethingos/programs/filemanager/icon")
  paintutils.drawImage(fileBdicon, 2, 3)
  term.setBackgroundColor(backColor)
  term.setTextColor(128)
  term.setCursorPos(2,10)
  print("File Browser")
  titleBar()
end

local function drawMenu1()
term.setTextColor(256)
term.setBackgroundColor(128)
term.setCursorPos(1,2)
print("----------")
term.setCursorPos(1,3)
print(" Shutdown ")
term.setCursorPos(1,4)
print(" Restart  ")
term.setCursorPos(1,5)
print("----------")
end
local function drawMenu2()
term.setBackgroundColor(128)
term.setTextColor(256)
term.setCursorPos(contextX, contextY)
print("-------------")
term.setCursorPos(contextX, contextY+1)
print(" Edit GUI    ")
term.setCursorPos(contextX, contextY+2)
print(" FileManager ")
term.setCursorPos(contextX, contextY+3)
print("-------------")
end

drawDesktop()
while true do
local event, button, X, Y = os.pullEventRaw()
  if slc == 0 then
    if event == "mouse_click" then
      if X >=2 and X <=8 and Y==1 and button ==1 then
      drawMenu1()
      slc = 1
        elseif X >=2 and X<=8 and Y>=3 and Y<=9 and button == 1 then
        shell.run("/somethingos/programs/filemanager/filebrowser")
          elseif X >= 1 and Y >=2 and button == 2 then slc = 2
            if X >=38 then
            contextX = 38
            end
            if Y >=14 then
            contextY = 14
            end
            if X <= 38 then
            contextX = X
            end
            if Y <= 14 then
            contextY = Y
            end
            drawMenu2()
        else
        drawDesktop()
      end
    end
   elseif slc == 1 then
     if X >=1 and X <=11 and button == 1 and Y== 3 then slc = 0 
       os.shutdown()
       elseif X>=1 and X<=11 and Y==4 and button ==1 then slc = 0
       os.reboot()
       else
       slc = 0
       drawDesktop()
     
     end 
  elseif slc == 2 then
        if X >= contextX and X <= contextX+13 and Y==contextY+1 and button == 1 then slc = 0
        shell.run("edit","somethingos/main/main.lua")
        drawDesktop()
          elseif X>= contextX and X <=contextX+13 and Y==contextY+2 and button == 1 then slc = 0
            shell.run("/somethingos/programs/filemanager/filebrowser")
            drawDesktop()
              else slc = 0
              drawDesktop()
        end
  end
end
