
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player"; },
        { sActorType = "Map"; tbProperty = {
            ["Map"] = { nCellCount = 115 };
        }},
    };

    tbSystem = 
    {
        "RectangleRenderSystem",
        "MapGeneratorSystem",
        "GridWalkSystem",
        "OpenBoxSystem",
        "PlayerTweenMoveSystem",
        "FindPathSystem",
        "LeaveAndEnterSystem",
        "UITestSystem",
        "LayerSortSystem",
        "SpriteRenderSystem",
    };
}