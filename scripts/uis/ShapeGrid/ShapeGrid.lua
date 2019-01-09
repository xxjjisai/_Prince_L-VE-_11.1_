local ShapeGrid = {};
function ShapeGrid:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);
   obj.bNextOper = false;

   function obj:AddItem(iUI)
      table.insert(self:GetAttr("tbUIList"),iUI)
      local nIndex = #self:GetAttr("tbUIList");
      iUI:SetAttr("x",self:GetAttr("x") + self:GetAttr("nItemRow") * self:GetAttr("gridItemSize") - self:GetAttr("gridItemSize"));
      iUI:SetAttr("y",self:GetAttr("y") + self:GetAttr("nItemCol") * self:GetAttr("gridItemSize") - self:GetAttr("gridItemSize"));
      if nIndex %self:GetAttr("nItemLength") == 0 then 
         self:SetAttr("nItemCol",self:GetAttr("nItemCol") + 1)
         self:SetAttr("nItemRow",0)
      end
      self:SetAttr("nItemRow",self:GetAttr("nItemRow") + 1)
   end

   function obj:HideItem()
      for _,iUI in ipairs(self:GetAttr("tbUIList")) do 
         iUI:SetAttr("bVisible",false)
      end 
   end

   function obj:ShowItem()
      for _,iUI in ipairs(self:GetAttr("tbUIList")) do 
         iUI:SetAttr("bVisible",true)
      end 
   end

   function obj:DeleteItem(sClassName)
      if self.bNextOper then 
         return 
      end
      self.bNextOper = true;
      local nDelnIndex = 0;
      for nIndex,iUI in ipairs(self:GetAttr("tbUIList")) do 
         if iUI.sClassName == sClassName then 
            nDelnIndex = nIndex;
            break;
         end
      end 
      if nDelnIndex == 0 then return end
      table.remove(self:GetAttr("tbUIList"),nDelnIndex)
      UIMgr:RemoveUI(sClassName)
      Timer:after(0.2,function ()
         self:SortGrid(function ()
            self.bNextOper = false;
         end);
      end)
   end

   function obj:SortGrid(pfn)
      self:SetAttr("nItemCol",1);
      self:SetAttr("nItemRow",1);
      for i,iUI in ipairs(self:GetAttr("tbUIList")) do 
         iUI:SetAttr("x",self:GetAttr("x") + self:GetAttr("nItemRow") * self:GetAttr("gridItemSize"));
         iUI:SetAttr("y",self:GetAttr("y") + self:GetAttr("nItemCol") * self:GetAttr("gridItemSize"));
         if i %self:GetAttr("nItemLength") == 0 then 
            self:SetAttr("nItemCol",self:GetAttr("nItemCol") + 1)
            self:SetAttr("nItemRow",0)
         end
         self:SetAttr("nItemRow",self:GetAttr("nItemRow") + 1)
      end
      if pfn then 
         pfn()
      end
   end
   return obj;
end
return ShapeGrid;