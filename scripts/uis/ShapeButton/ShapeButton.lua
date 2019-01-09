local ShapeButton = {};
function ShapeButton:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);

   function obj:Update(dt)
      local tbMouse = {
         x = love.mouse.getX(),
         y = love.mouse.getY(),
         w = 1,
         h=1
      }
      local tbButton = {
         x = self:GetAttr("x"),
         y = self:GetAttr("y"),
         w = self:GetAttr("w"),
         h = self:GetAttr("h")
      }
      if hitTestObject(tbMouse,tbButton) then 
         self:SetAttr("bHover",true);
         if self:GetAttr("onHover") then 
            self:GetAttr("onHover")();
         end
      else
         self:SetAttr("bHover",false); 
      end 
   end

   function obj:Render()
      if not self:GetAttr("bVisible") then 
         return 
      end 
      local color = self:GetAttr("style").color;
      if self:GetAttr("bShowHover") then 
         if self:GetAttr("bHover") then 
            color = self:GetAttr("style").bHoverColor;
         end 
      end
      love.graphics.setColor(color);
      local font = AssetsMgr:GetFont(self:GetAttr("style").nFontSize);
      love.graphics.setFont(font);
      local nFontx = ((self:GetAttr("x") + self:GetAttr("w")*0.5) ) - font:getWidth(self:GetAttr("sName"))*0.5;
      local nFonty = ((self:GetAttr("y") + self:GetAttr("h")*0.5) ) - font:getHeight(self:GetAttr("sName"))*0.5;
      love.graphics.print(self:GetAttr("sName"),nFontx,nFonty)
      if self:GetAttr("style").bShape then 
         love.graphics.rectangle(self:GetAttr("style").sFill,self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"))
      end
   end

   function obj:MouseDown(x,y,button)
      local tbMouse = {
         x = x,
         y = y,
         w = 1,
         h=1
      }
      local tbButton = {
         x = self:GetAttr("x"),
         y = self:GetAttr("y"),
         w = self:GetAttr("w"),
         h = self:GetAttr("h")
      }

      if hitTestObject(tbMouse,tbButton) then 
         if self:GetAttr("onClick") then 
            self:Trace(2,self.sClassName)
            self:GetAttr("onClick")();
         end
      end 
   end

   return obj;
end
return ShapeButton;