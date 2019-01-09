
_G.Scene_2 = 
{
    tbActor = 
    {
        { sActorType = "Player"; },
        { sActorType = "Map"; tbProperty = {
            ["Map"] = { nCellCount = 215 };
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