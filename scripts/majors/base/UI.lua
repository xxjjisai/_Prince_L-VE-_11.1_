_G.UI = Class:DeriveClass("UI");

function UI:DeriveClass(sClassName)
    local obj = {}; 
    obj.sClassName = sClassName;
    obj.tbListenerList = {};    -- 侦听列表 
    obj.tbAttributeList = {};      -- 组件列表
    obj.nUniqueID = 0;          -- 唯一识别
    obj.sTagType = "UI";     -- 标签类型
	setmetatable(obj,{__index = self});
	return obj;
end

function UI:SetAttribute(tbAttribute)
    self.tbAttributeList = tbAttribute;
end

function UI:SetAttr(key,value)
    self.tbAttributeList[key] = value;
end

function UI:GetAttribute()
    return self.tbAttributeList;
end

function UI:GetAttr(key)
    return self.tbAttributeList[key];
end
