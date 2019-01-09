_G.UIMgr = Class:DeriveClass("UIMgr"); 

UIMgr.tbUIList = {};

function UIMgr:CreateUI(sUIType,tbAttribute)
    local sUIPath = string.format("scripts/uis/%s/%s",sUIType,sUIType);
    local sUICfgPath = string.format("scripts/uis/%s/%sConfig",sUIType,sUIType);
    local sClassName = sUIType..Origin:SetUniqueID();
    local iUI = require(sUIPath):Create(sClassName);
    iUI.sTagType = sUIType;
    local tbCfgUI = clone(require(sUICfgPath));
    local tbAttribute = tbAttribute or {}
    if next(tbAttribute) then 
        for k,v in pairs(tbAttribute) do 
            tbCfgUI[k] = clone(v);
        end
    end
    iUI:SetAttribute(clone(tbCfgUI));
    self.tbUIList[sClassName] = iUI;
    iUI:GetAttr("nItemID")
    return iUI
end

function UIMgr:RemoveUI(sClassName)
    self.tbUIList[sClassName] = nil;
end

function UIMgr:Update(dt)
    for i,v in pairs(self.tbUIList) do 
        if v.Update then 
            if v:GetAttr("bVisible") then 
                v:Update(dt)
            end
        end 
    end 
end

function UIMgr:Render()
    for i,v in pairs(self.tbUIList) do 
        if v.Render then 
            if v:GetAttr("bVisible") then 
                v:Render(dt)
            end
        end 
    end 
end

function UIMgr:MouseDown(x,y,button)
    for i,v in pairs(self.tbUIList) do 
        if v.MouseDown then 
            if v:GetAttr("bVisible") then 
                v:MouseDown(x,y,button)
            end
        end 
    end 
end


-- how to use
-- UIMgr:CreateUI("Button",{sName="确定",x=100,y=100,w=100,h=100,onClick=function ()
--      -- todo... 
-- end})