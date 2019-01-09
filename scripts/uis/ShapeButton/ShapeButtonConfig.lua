local ShapeButtonConfig = 
{
    bVisible = true;
    nItemID = 0;
    x = 100;
    y = 100;
    w = 70;
    h = 50;
    bAutoPos = false;
    style = {
        bShape = true;
        color = {1,1,1,1},
        sFill = "line",
        nFontSize = 182;
        bHoverColor = {0.5,0.5,1,1},
    };
    sName = "按钮";
    onClick = nil;
    onHover = nil;
    bHover = false;
    bShowHover = true;

}
return ShapeButtonConfig