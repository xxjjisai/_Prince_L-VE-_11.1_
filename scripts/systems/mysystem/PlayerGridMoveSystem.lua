_G.PlayerGridMoveSystem = System:DeriveClass("PlayerGridMoveSystem");

PlayerGridMoveSystem.tbDataPlayer = {x = 0,y = 0};
PlayerGridMoveSystem.tbPath = nil;
PlayerGridMoveSystem:SetRegisterCompo{
    "GridWalk"
}

function PlayerGridMoveSystem:Start()
    local iPlayer = SceneMgr:GetCurPlayer();
    self.tbDataPlayer = 
    {
        x = iPlayer:GetiCompo("Position").x,
        y = iPlayer:GetiCompo("Position").y
    };
end 

function PlayerGridMoveSystem:Update(dt)

end

function PlayerGridMoveSystem:SearchPathComplete(tbPath,pfn)
    self.tbPath = tbPath;
    self.pfn = pfn;
    local iScene = self:GetCurScene();
    table.remove(self.tbPath,#self.tbPath);
    self:MoveHandler(self:GetNextNode());
end

function PlayerGridMoveSystem:MoveHandler(iTargetNode)
    if iTargetNode == nil then 
        if self.pfn then 
            self.pfn();
            return;
        end 
        return;
    end 
    
end 

function PlayerGridMoveSystem:StartMove()

end 

function PlayerGridMoveSystem:GetNextNode()
    local nNextNode = self.tbPath[#self.tbPath];
    table.remove(self.tbPath,#self.tbPath);
    return nNextNode;
end 