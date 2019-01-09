-- 网格方式行走
local GridWalk = {};

function GridWalk:New(tbParams) 
    local obj = Compo:DeriveClass("GridWalk");
    return obj; 
end 

return GridWalk;