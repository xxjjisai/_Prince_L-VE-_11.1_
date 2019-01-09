_G.PlayerTweenMoveSystem = System:DeriveClass("PlayerTweenMoveSystem");

PlayerTweenMoveSystem.tbDataPlayer = {x = 0,y = 0};
PlayerTweenMoveSystem.tbPath = nil;
PlayerTweenMoveSystem:SetRegisterCompo{
    "GridWalk"
};

function PlayerTweenMoveSystem:Start()
    local iPlayer = SceneMgr:GetCurPlayer();
    self.tbDataPlayer = 
    {
        x = iPlayer:GetiCompo("Position").x,
        y = iPlayer:GetiCompo("Position").y
    };
end 

function PlayerTweenMoveSystem:Update(dt)
    local iPlayer = SceneMgr:GetCurPlayer();
    iPlayer:GetiCompo("Position").x = self.tbDataPlayer.x;
    iPlayer:GetiCompo("Position").y = self.tbDataPlayer.y;
end

function PlayerTweenMoveSystem:SearchPathComplete(tbPath,pfn)
    self.tbPath = tbPath;
    self.pfn = pfn;
    local iScene = self:GetCurScene();
    table.remove(self.tbPath,#self.tbPath);
    self:MoveHandler(self:GetNextNode());
end

function PlayerTweenMoveSystem:MoveHandler(iTargetNode)
    if iTargetNode == nil then 
        if self.pfn then 
            self.pfn();
            return;
        end 
        return;
    end 
    local iPlayer = SceneMgr:GetCurPlayer();
    local pw = iPlayer:GetiCompo("Size").w;
    local ph = iPlayer:GetiCompo("Size").h;
    local nx,ny = iTargetNode.x,iTargetNode.y;
    local nCellSize = iTargetNode.nCellSize;
    local nNCol,nNRow = math.floor(nx/nCellSize),math.floor(ny/nCellSize);
    local ox,oy = nNCol * nCellSize + pw * 0.5,nNRow * nCellSize + ph * 0.5;
    local tbPos = { x = ox, y = oy }
    Timer:tween(0.4, self.tbDataPlayer, tbPos, 'linear', function() 
        self:MoveHandler(self:GetNextNode());
    end)
end 

function PlayerTweenMoveSystem:GetNextNode()
    local nNextNode = self.tbPath[#self.tbPath];
    table.remove(self.tbPath,#self.tbPath);
    return nNextNode;
end