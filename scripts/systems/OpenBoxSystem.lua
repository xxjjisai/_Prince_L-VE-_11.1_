_G.OpenBoxSystem = System:DeriveClass("OpenBoxSystem");

OpenBoxSystem:SetRegisterCompo{
    "Box","Position","Size",
};

function OpenBoxSystem:MouseDown(x,y,button)
    if button == 1 then
        local iScene = self:GetCurScene();
        for _,iActor in pairs(iScene:GetActorList()) do
            repeat
                if not self:GetRegisterCompo(iActor) then break end
                local x = iActor:GetiCompo("Position").x;
                local y = iActor:GetiCompo("Position").y;
                local iMap = iScene:GetActorByTagType("Map");
                local iMapCompo = iMap:GetiCompo("Map");
                local nCellSize = iMapCompo.nCellSize;
                local nCol,nRow = math.floor(x/nCellSize),math.floor(y/nCellSize);
                local mx,my = CameraMgr:GetMousePosition();
                local nmCol,nmRow = math.floor(mx/nCellSize),math.floor(my/nCellSize);
                if nCol == nmCol and nRow == nmRow then 
                    iScene:RemoveActor(iActor);
                    for i = 1, #iMapCompo.tbRealMapInfo do
                        local item = iMapCompo.tbRealMapInfo[i];
                        local nColItem,nRowItem = math.floor(item.x/nCellSize),math.floor(item.y/nCellSize);
                        if nCol == nColItem and nRow == nRowItem then 
                            if item.nWalkAble == 0 then 
                                item.nWalkAble = 1; 
                                return;
                            end
                        end 
                    end
                end
             until true
        end
    end 
end