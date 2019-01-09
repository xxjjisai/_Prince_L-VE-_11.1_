_G.GameMgr = Class:DeriveClass("GameMgr");

function GameMgr:StartUp()
    Option.sTitle = love.window.getTitle();
    Option.sGameState = "LOAD";
    Camera:setFollowLerp(0.09);
    Camera:setFollowStyle('LOCKON');
    StorageMgr:Init();
    StorageMgr:InitInfo();
    AssetsMgr:Start("Currency",function()
        Option.sGameState = "MENU";
        MenuMgr:Start(0.5,function ()
            Option.bMenuPlayed = true;
        end)
    end) 
end

function GameMgr:Init()
    SceneMgr:Start();
end

function GameMgr:Update(dt)
    love.window.setTitle(Option.sTitle.." ["..love.timer.getFPS().."]" );
    if Option.sGameState == "LOAD" then 
        AssetsMgr:Update(dt);
    elseif Option.sGameState == "MENU" then 
        MenuMgr:Update(dt);
    elseif Option.sGameState == "GUODU" then 
        GuoDuMgr:Update(dt);
    elseif Option.sGameState == "PAUSE" then 
    elseif Option.sGameState == "PLAY" then 
        CameraMgr:Update(dt); 
        SceneMgr:Update(dt)
    elseif Option.sGameState == "UI" then 
        UIMgr:Update(dt)
    elseif Option.sGameState == "EDITOR" then  
    elseif Option.sGameState == "OVER" then 
    end
end 

function GameMgr:Render()
    if Option.sGameState == "LOAD" then 
        if not Option.bLoaded then 
            AssetsMgr:Render();
        end
    elseif Option.sGameState == "MENU" then 
        MenuMgr:Render();
    elseif Option.sGameState == "GUODU" then 
        GuoDuMgr:Render();
    elseif Option.sGameState == "PAUSE" then 
        PauseMgr:Render();
    elseif Option.sGameState == "PLAY" then 
        SceneMgr:Render();
    elseif Option.sGameState == "UI" then  
        UIMgr:Render();
    elseif Option.sGameState == "EDITOR" then  
    elseif Option.sGameState == "OVER" then 
        OverMgr:Render();
    end
end 

function GameMgr:MouseDown(x,y,button)
    if Option.sGameState == "PLAY" then
        CameraMgr:MouseDown(x,y,button);
        SceneMgr:MouseDown(x,y,button);
        UIMgr:MouseDown(x,y,button);
    end   
    if Option.sGameState == "UI" then 
        UIMgr:MouseDown(x,y,button);
    end
    if button == 2 then 
        if Option.sGameState == "PLAY" then 
            Option.sGameState = "UI";
        elseif Option.sGameState == "UI" then 
            Option.sGameState = "PLAY";
        end 
    end 
end

function GameMgr:MouseUp(x,y,button)  
    if Option.sGameState == "MENU" then 
        if Option.bMenuPlayed == true then
            Option.sGameState = "GUODU"
            GuoDuMgr:Start(function ()
                Option.sGameState = "PLAY";
                GameMgr:Init(); 
            end);
        end
    end
end

function GameMgr:KeyBoardDown(key) 
    if key == 'tab' then Option.bDebug = not Option.bDebug end
    if key == "return" then 
        if Option.sGameState == "MENU" then 
            if Option.bMenuPlayed == true then
                Option.sGameState = "GUODU"
                GuoDuMgr:Start(function ()
                    Option.sGameState = "PLAY";
                    GameMgr:Init(); 
                end);
            end
        end
    end

    if key == "1" then 
        SceneMgr:SetAppointScene(1)
    end
    if key == "2" then 
        SceneMgr:SetAppointScene(2)
    end
    if key == "3" then 
        SceneMgr:SetAppointScene(3)
    end

    if key == "z" then 
        if Option.sGameState == "PLAY" then 
            Option.sGameState = "UI";
        elseif Option.sGameState == "UI" then 
            Option.sGameState = "PLAY";
        end 
    end 

    if key == "p" then   
        Option.bPaused = not Option.bPaused; 
        if Option.bPaused then 
            PauseMgr.sOldGameState = Option.sGameState;
            Option.sGameState = "PAUSE";
        else 
            Option.sGameState = PauseMgr.sOldGameState;
        end 
    end 
end

function GameMgr:WheelMoved(x, y)
    if Option.sGameState == "PLAY" then 
        CameraMgr:WheelMoved(x, y);
    end
end

function GameMgr:QuitGame()

end