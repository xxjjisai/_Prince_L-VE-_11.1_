_G.LeaveAndEnterSystem = System:DeriveClass("LeaveAndEnterSystem");

LeaveAndEnterSystem:SetRegisterCompo{
    "SwitchScene",
}

function LeaveAndEnterSystem:TriggerHandler()
    local iScene = self:GetCurScene();
    local iPlayer = SceneMgr:GetCurPlayer();
    for _,iActor in pairs(iScene:GetActorList()) do
        repeat
            if not self:GetRegisterCompo(iActor) then break end
            if TestCollision(iPlayer,iActor) then
                local bExit = iActor:GetiCompo("SwitchScene").bExit;
                if bExit then 
                    return;
                end 
                local sOper = iActor:GetiCompo("SwitchScene").sOper;
                Timer:after(0.5,function () 
                    SceneMgr:SetAppointScene(nil,sOper);
                end)
                iActor:GetiCompo("SwitchScene").bExit = true;
                return;
            end
        until true
    end
end