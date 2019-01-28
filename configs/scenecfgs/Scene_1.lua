
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player"; },
        { sActorType = "Map"; tbProperty = {
            ["Map"] = { nCellCount = 7 };
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
        "AnimationSystem",
    };
}