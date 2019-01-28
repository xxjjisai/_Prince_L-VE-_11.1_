
_G.Scene_3 = 
{
    tbActor = 
    {
        { sActorType = "Player"; },
        { sActorType = "Map"; tbProperty = {
            ["Map"] = { nCellCount = 315 };
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
        "LayerSortSystem",
        "SpriteRenderSystem",
    };
}