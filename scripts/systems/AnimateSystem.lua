_G.AnimateSystem = System:DeriveClass("AnimateSystem");

AnimateSystem:SetRegisterCompo{
    "Animate",
};

function AnimateSystem:Start()
    local iScene = self:GetCurScene();
    local iPlayer = SceneMgr:GetCurPlayer();
    for _,iActor in pairs(iScene:GetActorList()) do
        repeat
            if not self:GetRegisterCompo(iActor) then break end
            self:QuadMaker(iActor); 
        until true
    end
end

function AnimateSystem:QuadMaker(iActor)
    if iActor == nil then return end
    local sImg = iActor:GetiCompo("Sprite").sImg;
    local image = AssetsMgr:GetTexture(sImg); 
    local nImageW = image:getWidth();
    local nImageH = image:getHeight();
    local nSingleFrameW = iActor:GetiCompo("Animate").nSingleFrameW;
    local nSingleFrameH = iActor:GetiCompo("Animate").nSingleFrameH;
    local nImageCol = iActor:GetiCompo("Animate").nImageCol;
    local nImageRow = iActor:GetiCompo("Animate").nImageRow;
    local tbQuadList = iActor:GetiCompo("Animate").tbQuadList;
    for i = 0, nImageCol-1 do 
        for j = 0,nImageRow-1 do 
            local quad = love.graphics.newQuad(j*nSingleFrameW, i*nSingleFrameH, nSingleFrameW, nSingleFrameH, nImageW, nImageH)
            table.insert(tbQuadList,quad)
        end 
    end 
    iActor:GetiCompo("Animate").nTotalFrame = #tbQuadList;
end

function AnimateSystem:Update(dt)
    local iScene = self:GetCurScene();
    local iPlayer = SceneMgr:GetCurPlayer();
    for _,iActor in pairs(iScene:GetActorList()) do
        repeat
            if not self:GetRegisterCompo(iActor) then break end
            
        until true
    end
end 

function AnimateSystem:Render()
    local iScene = self:GetCurScene();
    for _,tbLayer in pairs(iScene:GetRenderList()) do
       for _,iActor in ipairs(tbLayer) do 
          repeat
             if not self:GetRegisterCompo(iActor) then break end
             if not iActor:GetiCompo("sClassName").bStart then break end
             local x = iActor:GetiCompo("Position").x;
             local y = iActor:GetiCompo("Position").y;
             local w = iActor:GetiCompo("Size").w;
             local h = iActor:GetiCompo("Size").h;
             local nImageW = image:getWidth();
             local nImageH = image:getHeight();
             local nImageX = x - (nImageW * 0.5 - w * 0.5)
             local nImageY = y - (nImageH - h);
             local color = iActor:GetiCompo("Color");
             local tbQuadList = iActor:GetiCompo("Animate").tbQuadList; 
             love.graphics.setColor(color.r,color.g,color.b,color.a);
             for _,quad in ipairs(tbQuadList) do 
                love.graphics.draw(image, quad, nImageX, nImageY)
             end 
            if Option.bDebug then 
                -- 贴图轮廓
                love.graphics.setColor(100,100,250,100);
                love.graphics.rectangle("line", nImageX, nImageY, nImageW, nImageH);
                -- 底部点
                love.graphics.setColor(250,0,0,250); 
                love.graphics.circle( "fill",nImageX + nImageW / 2, nImageY + nImageH, 7 ) 
            end
          until true
       end
    end 
 end

function AnimateSystem:Play(iActor)
    iActor:GetiCompo("Animate").bStart = true;
end

function AnimateSystem:Stop(iActor)
    iActor:GetiCompo("Animate").bStart = false;
end

function AnimateSystem:Pause(iActor)
    if iActor:GetiCompo("Animate").bStart then 
        iActor:GetiCompo("Animate").bPause = true;
    end 
end

function AnimateSystem:Resume(iActor)
    iActor:GetiCompo("Animate").bPause = false; 
end