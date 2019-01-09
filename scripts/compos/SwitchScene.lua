-- 切换关卡
local SwitchScene = {};

function SwitchScene:New(tbParams) 
    local obj = Compo:DeriveClass("SwitchScene");
    obj.sOper = tbParams.sOper or "+";
    obj.bExit = false;
    return obj; 
end 

return SwitchScene;