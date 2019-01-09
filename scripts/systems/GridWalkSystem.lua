_G.GridWalkSystem = System:DeriveClass("GridWalkSystem");

GridWalkSystem.bMoved = false;
GridWalkSystem.tbEndPoint = nil;


GridWalkSystem:SetRegisterCompo{
    "GridWalk"
};

function GridWalkSystem:Start()
    self.bMoved = false;  
    self.tbEndPoint = nil;
end

-- function GridWalkSystem:Render()
--     local iScene = self:GetCurScene();
--     local iMap = iScene:GetActorByTagType("Map");
--     if iMap == nil then return end 
--     local iMapCompo = iMap:GetiCompo("Map");
--     local nCellSize = iMapCompo.nCellSize;
--     if self.tbEndPoint ~= nil then 
--         local nECol,nERow = math.floor(self.tbEndPoint.x/nCellSize),math.floor(self.tbEndPoint.y/nCellSize);
--         local ex,ey = nECol * 100 + 50 * 0.5,nERow * 100 + 150 * 0.5;
--         love.graphics.setColor(1,0,0.4,0.4);
--         love.graphics.rectangle("fill",ex,ey,50,10);
--     end
--     if self.bMoved then return end 
--     local mx,my = CameraMgr:GetMousePosition();
--     local nCol,nRow = math.floor(mx/nCellSize),math.floor(my/nCellSize);
--     local ox,oy = nCol * 100,nRow * 100;
--     if ox == nil or oy == nil then return end;
--     local bCanWalk = self:CheckCanWalk(iMapCompo,nCellSize,nCol,nRow);
--     if not bCanWalk then return end
--     love.graphics.setColor(1,0.4,0.4,1);
--     love.graphics.setLineStyle("smooth")
--     love.graphics.setLineWidth(4)
--     love.graphics.rectangle("line",ox,oy,100,100);
-- end

function GridWalkSystem:MouseDown(x,y,button)
    if button == 1 then 
        if self.bMoved then return end 
        self.bMoved = true;
        self.tbEndPoint = nil;
        local iScene = self:GetCurScene();
        local iPlayer = SceneMgr:GetCurPlayer();
        local iMap = iScene:GetActorByTagType("Map");
        if iMap == nil then self.bMoved = false return end 
        local iMapCompo = iMap:GetiCompo("Map");
        local nCellSize = iMapCompo.nCellSize;
        local tbRealMapInfo = iMapCompo.tbRealMapInfo;
        local px = iPlayer:GetiCompo("Position").x;
        local py = iPlayer:GetiCompo("Position").y;
        local nPCol,nPRow = math.floor(px/nCellSize),math.floor(py/nCellSize);
        local mx,my = CameraMgr:GetMousePosition();
        local nMCol,nMRow = math.floor(mx/nCellSize),math.floor(my/nCellSize);
        local bCanWalk = self:CheckCanWalk(iMapCompo,nCellSize,nMCol,nMRow);
        if not bCanWalk then self.bMoved = false return end
        self.tbDataPlayer = {x = px, y = py};
        local tbStartPoint = self:GetNodeFromRealMap(nPCol,nPRow,tbRealMapInfo);
        local tbEndPoint = self:GetNodeFromRealMap(nMCol,nMRow,tbRealMapInfo);
        if tbStartPoint == nil or tbEndPoint == nil then 
            self:Trace(2," Not Finde Start or End Point ");
            return 
        end 
        self.tbEndPoint = tbEndPoint;
        FindPathSystem:SearchPath(tbStartPoint,tbEndPoint,function (nCode,tbPath)
            if nCode ~= 0 then 
                -- self:Trace(1,"Find Path Fail!");
                return;
            end 
            -- 寻路完成
            -- 利用缓动移动
            PlayerTweenMoveSystem:SearchPathComplete(tbPath,function ()
                LeaveAndEnterSystem:TriggerHandler();
                self.bMoved = false
            end);
        end)
    end
end

function GridWalkSystem:CheckCanWalk(iMapCompo,nCellSize,nCol,nRow)
    for i = 1, #iMapCompo.tbRealMapInfo do
        local item = iMapCompo.tbRealMapInfo[i];
        local nColItem,nRowItem = math.floor(item.x/nCellSize),math.floor(item.y/nCellSize);
        if nCol == nColItem and nRow == nRowItem then 
            if item.nWalkAble == 1 then 
                return true 
            end 
        end
    end
    return false;
end

function GridWalkSystem:GetNodeFromRealMap(nCol,nRow,tbRealMapInfo)
    for i,v in ipairs(tbRealMapInfo) do 
        local tbNode = v;
        local nx = tbNode.x;
        local ny = tbNode.y;
        local nCellSize = tbNode.nCellSize;
        local nNCol,nNRow = math.floor(nx/nCellSize),math.floor(ny/nCellSize);
        if nCol == nNCol and nRow == nNRow then 
            return tbNode;
        end
    end
    return nil;
end

-- local pw = iPlayer:GetiCompo("Size").w;
-- local ph = iPlayer:GetiCompo("Size").h;
-- local ox,oy = nMCol * 100 + pw * 0.5,nMRow * 100 + ph * 0.5;
-- Timer:tween(0.3, self.tbDataPlayer, { x = ox, y = oy }, 'linear', function() self.bMoved = false end)
