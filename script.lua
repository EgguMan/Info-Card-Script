function onCreate()
    --Hello to anybody wishing to edit the code for this! A few things. 1, Thank you for downloading my script! And 2, if you have any questions or bug reports, please DM them to me on discord @Eggu#3084. 
    --If you wish to use this in your mod. Please do not remove this! And just put me in the credits. Doesnt have the be the in game credits, can be on the 1, 1banana page.
    --Started at 4:30 PM.
    --ended around 6:45 PM.

    --I will document what everything does, so if you're looking to learn Psych Lua, learn some basic programming, pull up the wiki and start from here!

    --making the object in the games code
    makeLuaSprite("MiddleCard", "InfoCardMid", 1000, -50);
    makeLuaSprite("LeftBar", "InfoCardLeft", 1000, -50);
    makeLuaSprite("RightBar", "InfoCardRight", 1000, -50);
    --changing the size of the objects
    scaleObject("MiddleCard", 0.75, 0.75);
    scaleObject("LeftBar", 0.75, 0.75);
    scaleObject("RightBar", 0.75, 0.75);
    --making sure it moves with the camera.
    setObjectCamera("MiddleCard", "other");
    setObjectCamera("LeftBar", "other");
    setObjectCamera("RightBar", "other");
    --putting it ingame
    addLuaSprite("LeftBar", true);
    addLuaSprite("RightBar", true);
    addLuaSprite("MiddleCard", true);
    ---make the text in the game's code
    makeLuaText("NowPlay", "Now Playing; " .. songName, 1000, 1500, 550);
    if difficulty == 0 then
        makeLuaText("Diff", "Difficulty; Easy/Other", 850, 1500, 600);
    elseif difficulty == 1 then
        makeLuaText("Diff", "Difficulty; Normal", 850, 1500, 600);
    elseif difficulty == 2 then
        makeLuaText("Diff", "Difficulty; Hard", 850, 1500, 600);
    end
    makeLuaText("TheWeek", "Current Week; " .. week, 850, 1500, 650);
    addLuaText("NowPlay", true);
    addLuaText("Diff", true);
    addLuaText("TheWeek", true);
    setObjectCamera("NowPlay", "other");
    setObjectCamera("Diff", "other");
    setObjectCamera("TheWeek", "other");
    setTextSize("NowPlay", 22);
    setTextSize("Diff", 22);
    setTextSize("TheWeek", 22)
end

--alright, here comes the hard parts
function onStepHit()
    if curStep==1 then
        doTweenX("NullButOriginalByEggu1","LeftBar", -150, 1, "backIn");
        doTweenX("NullButOriginalByEggu4","NowPlay", 460, 1, "backIn");
        doTweenX("NullButOriginalByEggu5","Diff", 460, 1, "backIn");
        doTweenX("NullButOriginalByEggu6","TheWeek", 435, 1, "backIn");
        runTimer("LeftZoom", 0.00001) 
    end
end

function onTimerCompleted(tag)
    if tag=="LeftZoom" then
        doTweenX("NullButOriginalByEggu2","MiddleCard", -150, 1, "backIn");
        runTimer("MidZoom", 0.00001)
    elseif tag=="MidZoom" then
        doTweenX("NullButOriginalByEggu3","RightBar", -150, 1, "backIn");
        runTimer("WaitUntilFinal", 3);
    elseif tag=="WaitUntilFinal" then
        doTweenX("NullButOriginalByEggu1","LeftBar", 1000, 1, "backIn");
        doTweenX("NullButOriginalByEggu2","MiddleCard", 1000, 1, "backIn");
        doTweenX("NullButOriginalByEggu3","RightBar", 1000, 1, "backIn");
        doTweenX("NullButOriginalByEggu7","NowPlay", 1500, 1, "backIn");
        doTweenX("NullButOriginalByEggu8","Diff", 1500, 1, "backIn");
        doTweenX("NullButOriginalByEggu9","TheWeek", 1500, 1, "backIn");
    end
end
