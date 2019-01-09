-- 地图
local Map = {};

function Map:New(tbParams) 
    local obj = Compo:DeriveClass("Map");
    obj.tbDataMapInfo = {};
    obj.tbRealMapInfo = {};
    obj.nCellSize = tbParams.nCellSize or 100;
    obj.nCellCount = tbParams.nCellCount or 30;
    return obj;
end 
return Map;