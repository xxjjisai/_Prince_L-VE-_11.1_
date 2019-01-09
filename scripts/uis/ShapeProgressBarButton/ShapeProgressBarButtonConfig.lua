local ShapeProgressBarButtonConfig = 
{
    bVisible = true;
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
    nCurProgress = 0;
    nMaxProgress = 1;
    nAddRateProgress = 0.01;
    tbProgressStyle = {
        bShape = true;
        color = {1,0,1,0.8},
        sFill = "fill",
        nFontSize = 182;
        bHoverColor = {0.5,0.5,1,1},
    };
}
return ShapeProgressBarButtonConfig