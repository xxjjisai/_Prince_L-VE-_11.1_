-- 动画
local Animate = {};

function Animate:New(tbParams) 
    local obj = Compo:DeriveClass("Animate");
    obj.nSingleFrameW = tbParams.nSingleFrameW or 0;
    obj.nSingleFrameH = tbParams.nSingleFrameH or 0;
    obj.nImageCol = tbParams.nImageCol or 0;
    obj.nImageRow = tbParams.nImageRow or 0;
    obj.tbQuadList = {};
    obj.sLoop = "once"; -- once,loop,times
    obj.nLoopTimes = 0;
    obj.bInverse = false; -- 倒序播放
    obj.nCurFrame = 0;
    obj.nTotalFrame = 0;
    obj.bStart = false;
    obj.bPause = false;
    return obj;
end 

return Animate;