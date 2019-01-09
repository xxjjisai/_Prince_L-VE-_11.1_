_G.UITestSystem = System:DeriveClass("UITestSystem");

function UITestSystem:Start()

    local btn_BeiBao = UIMgr:CreateUI("ShapeButton",{sName="背包",x=50,y=50,w=70,h=50})
    local btn_Juese = UIMgr:CreateUI("ShapeButton",{sName="角色",x=50,y=130,w=70,h=50})
    local btn_Story = UIMgr:CreateUI("ShapeButton",{sName="故事",x=50,y=210,w=70,h=50})
    local btn_Right = UIMgr:CreateUI("ShapeButton",{sName=" ",x=600,y=50,w=380,h=500,style = {
        bShape = true;
        color = {1,1,1,1},
        sFill = "line",
        nFontSize = 722;
        bHoverColor = {0.5,0.5,1,1},
    }})

    local tbName = 
    {
        "金币", "铜币", "小刀", "钥匙", "衣服", "战靴", "指环", "胶水", "速度",
    }

    local gridx = btn_BeiBao:GetAttr("x") + btn_BeiBao:GetAttr("w") + 50;
    local gridy = btn_BeiBao:GetAttr("y");
    local gridItemSize = 100;
    local nItemLength = 4;
    local nItemCount = nItemLength * nItemLength

    local grid_BeiBao = UIMgr:CreateUI("ShapeGrid",{x = gridx, y= gridy, w = nItemLength * gridItemSize,h = nItemLength * gridItemSize,nItemLength = nItemLength,gridItemSize= gridItemSize})
    for i = 1,20 do 
        local button = UIMgr:CreateUI("ShapeButton",{sName=tbName[i],w=gridItemSize,h=gridItemSize})
        grid_BeiBao:AddItem(button); 
        button:SetAttr("onHover",function ()
            btn_Right:SetAttr("sName",button:GetAttr("sName"))
        end)
    end

    local grid_Juese = UIMgr:CreateUI("ShapeGrid",{x = gridx, y= gridy, w = nItemLength * gridItemSize,h = nItemLength * gridItemSize,nItemLength = nItemLength,gridItemSize= gridItemSize})
    for i = 1,12 do 
        local button = UIMgr:CreateUI("ShapeButton",{sName=tbName[i],w=gridItemSize,h=gridItemSize})
        grid_Juese:AddItem(button);
        button:SetAttr("onHover",function ()
            btn_Right:SetAttr("sName",button:GetAttr("sName"))
        end)
    end

    local grid_Story = UIMgr:CreateUI("ShapeGrid",{x = gridx, y= gridy, w = nItemLength * gridItemSize,h = nItemLength * gridItemSize,nItemLength = nItemLength,gridItemSize= gridItemSize})
    for i = 1,15 do 
        local button = UIMgr:CreateUI("ShapeButton",{sName=tbName[i],w=gridItemSize,h=gridItemSize})
        grid_Story:AddItem(button);
        button:SetAttr("onHover",function ()
            btn_Right:SetAttr("sName",button:GetAttr("sName"))
        end)
    end

    btn_BeiBao:SetAttr("onHover",function ()
        grid_BeiBao:ShowItem()
        grid_Juese:HideItem()
        grid_Story:HideItem()
        btn_Right:SetAttr("sName","")
    end)
    btn_BeiBao:SetAttr("onClick",function ()
        local button = UIMgr:CreateUI("ShapeButton",{sName=tbName[i],w=gridItemSize,h=gridItemSize})
        grid_BeiBao:AddItem(button);
    end)

    btn_Juese:SetAttr("onHover",function ()
        grid_Juese:ShowItem()
        grid_BeiBao:HideItem()
        grid_Story:HideItem()
        btn_Right:SetAttr("sName","")
    end)
    btn_Juese:SetAttr("onClick",function ()
        local button = UIMgr:CreateUI("ShapeButton",{sName=tbName[i],w=gridItemSize,h=gridItemSize})
        grid_Juese:AddItem(button);
    end)

    btn_Story:SetAttr("onHover",function ()
        grid_Story:ShowItem()
        grid_BeiBao:HideItem()
        grid_Juese:HideItem()
        btn_Right:SetAttr("sName","")
    end)
    btn_Story:SetAttr("onClick",function ()
        local button = UIMgr:CreateUI("ShapeButton",{sName=tbName[i],w=gridItemSize,h=gridItemSize})
        grid_Story:AddItem(button);
    end)
     
end

