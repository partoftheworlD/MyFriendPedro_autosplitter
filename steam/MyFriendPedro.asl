    /*
    #
    # Update 4/02/2020 game version 1.03
    #
    */

state("My Friend Pedro - Blood Bullets Bananas") {
    /*

    iLevel signature - mono.dll 48 8D 0D ? ? ? ? 41 8D 50 08 E8 ? ? ? ? E8 ? ? ? ? 83 3D ? ? ? ? ? 0F 85 ? ? ? ? 48 8D 0D (or "GC_DONT_GC")
    Timer Base       - UnityPlayer.dll 48 89 3d ?? ?? ?? ?? ff 15 ?? ?? ?? ?? 39 35 ?? ?? ?? ??
    Timer offset     - UnityPlayer.dll 0f 11 ?? ?? ?? ?? ?? 41 0f 28 ?? e8 ?? ?? ?? ?? 41 0f 28 ?? f3 0f 11 ?? ??
    */

    int iLevel           : "mono.dll", 0x264110, 0xA8, 0x18, 0x78;    // Just levels id
                                                                      //v1.0  - 0x6C
                                                                      //v1.02 - 0x70
                                                                      //v1.03 - 0x78

    float chapterTime    : "UnityPlayer.dll", 0x14797B8, 0x1654;      //0x1654 0x1658s
    //ulong isInGameState: "UnityPlayer.dll", 0x13B7294;
    byte isLoading       : "UnityPlayer.dll" , 0x144BCE5;             // 0 in main menu, 1 or 2 in game/pause menu (static)

}

init {
    refreshRate           = 60;
    vars.totalTime        = 0;
    vars.deltaChapterTime = 0;
    //vars.tmp_cfg          = 0;
}

update {
    if (current.chapterTime > old.chapterTime && current.isLoading > 0){
        vars.deltaChapterTime = current.chapterTime - old.chapterTime;
        /* FIXME counterbalance the focus */        
        vars.totalTime += vars.deltaChapterTime;
    }
}

gameTime {
    if (current.chapterTime > old.chapterTime){
        return TimeSpan.FromSeconds(vars.totalTime);
    }
}

startup {

    settings.Add("StartGroup", true, "Start Timer At");
    settings.Add("TutorialLevel_start", true, "Tutorial", "StartGroup");
    settings.Add("OldTownlLevel_start", false, "Old Town", "StartGroup");
    settings.Add("DistrictNullLevel_start", false, "District Null", "StartGroup");
    settings.Add("PedroWorldLevel_start", false, "Pedro World", "StartGroup");
    settings.Add("SewerLevel_start", false, "The Sewer", "StartGroup");
    settings.Add("InternetLevel_start", false, "The Internet", "StartGroup");
    settings.Add("PedroBossFightLevel_start", false, "The End", "StartGroup");

    settings.Add("level_splits", true, "Splits");

    vars.levels = new Dictionary<string,string>{{"TutorialLevel_1","Tutorial 1"},
                                                  {"TutorialLevel_2","Tutorial 2"},
                                                  {"TutorialLevel_3","Tutorial 3"},
                                                  {"OldTownlLevel_1","Old Town 1"},
                                                  {"OldTownlLevel_2","Old Town 2"},
                                                  {"OldTownlLevel_3","Old Town 3"},
                                                  {"OldTownlLevel_4","Old Town 4"},
                                                  {"OldTownlLevel_5","Old Town 5"},
                                                  {"OldTownlLevel_6","Old Town 6"},
                                                  {"OldTownlLevel_7","Old Town 7"},
                                                  {"OldTownlLevel_7_5","Old Town Scene with taking bike"},
                                                  {"OldTownlLevel_8","Old Town 8"},
                                                  {"DistrictNullLevel_Cutscene","District Null Cutscene"},
                                                  {"DistrictNullLevel_1","District Null 1"},
                                                  {"DistrictNullLevel_2","District Null 2"},
                                                  {"DistrictNullLevel_3","District Null 3"},
                                                  {"DistrictNullLevel_4","District Null 4"},
                                                  {"DistrictNullLevel_5","District Null 5"},
                                                  {"DistrictNullLevel_6","District Null 6"},
                                                  {"DistrictNullLevel_7","District Null 7"},
                                                  {"DistrictNullLevel_8","District Null 8"},
                                                  {"DistrictNullLevel_9","District Null 9"},
                                                  {"PedroWorldLevel_1","Pedro's World 1"},
                                                  {"PedroWorldLevel_2","Pedro's World 2"},
                                                  {"PedroWorldLevel_3","Pedro's World 3"},
                                                  {"PedroWorldLevel_4","Pedro's World 4"},
                                                  {"PedroWorldLevel_CutScene","Pedro's World End Level Cutscene"},
                                                  {"SewerLevel_CutScene","The Sewer Cutscene"},
                                                  {"SewerLevel_1","The Sewer 1"},
                                                  {"SewerLevel_2","The Sewer 2"},
                                                  {"SewerLevel_3","The Sewer 3"},
                                                  {"SewerLevel_4","The Sewer 4"},
                                                  {"SewerLevel_5","The Sewer 5"},
                                                  {"SewerLevel_6","The Sewer 6"},
                                                  {"SewerLevel_7","The Sewer 7"},
                                                  {"SewerLevel_8","The Sewer 8"},
                                                  {"SewerLevel_9","The Sewer 9"},
                                                  {"SewerLevel_CutScene2","The Sewer Cutscene Jumping into train"},
                                                  {"SewerLevel_10","The Sewer 10"},
                                                  {"InternetLevel_CutScene","The Internet Cut Scene"},
                                                  {"InternetLevel_1","The Internet 1"},
                                                  {"InternetLevel_2","The Internet 2"},
                                                  {"InternetLevel_3","The Internet 3"},
                                                  {"InternetLevel_4","The Internet 4"},
                                                  {"InternetLevel_5","The Internet 5"},
                                                  {"InternetLevel_6","The Internet 6"},
                                                  {"InternetLevel_7","The Internet 7"},
                                                  {"InternetLevel_8","The Internet 8"},
                                                  {"InternetLevel_CutScene2","The Internet Cut Scene with pressing E"},
                                                  {"PedroBossFightLevel","The End (Pedro Boss Fight)"}};

    foreach (var level in vars.levels) {
        settings.Add(level.Key, true, level.Value, "level_splits");
    };
}


split {
    //FIXME: check the level id for each check
    if(settings["TutorialLevel_1"] && old.iLevel == 1)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["TutorialLevel_2"] && old.iLevel == 2)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["TutorialLevel_3"] && old.iLevel == 3)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_1"] && old.iLevel == 4)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_2"] && old.iLevel == 5)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_3"] && old.iLevel == 6)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_4"] && old.iLevel == 7)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_5"] && old.iLevel == 8)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_6"] && old.iLevel == 9)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_7"] && old.iLevel == 10)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_7_5"] && old.iLevel == 11)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["OldTownlLevel_8"] && old.iLevel == 12)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_Cutscene"] && old.iLevel == 13)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_1"] && old.iLevel == 14)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_2"] && old.iLevel == 15)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_3"] && old.iLevel == 16)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_4"] && old.iLevel == 17)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_5"] && old.iLevel == 18)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_6"] && old.iLevel == 19)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_7"] && old.iLevel == 20)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_8"] && old.iLevel == 21)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["DistrictNullLevel_9"] && old.iLevel == 22)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["PedroWorldLevel_1"] && old.iLevel == 23)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["PedroWorldLevel_2"] && old.iLevel == 24)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["PedroWorldLevel_3"] && old.iLevel == 25)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["PedroWorldLevel_4"] && old.iLevel == 26)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["PedroWorldLevel_CutScene"] && old.iLevel == 27)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_CutScene"] && old.iLevel == 28)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_1"] && old.iLevel == 29)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_2"] && old.iLevel == 30)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_3"] && old.iLevel == 31)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_4"] && old.iLevel == 32)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_5"] && old.iLevel == 33)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_6"] && old.iLevel == 34)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_7"] && old.iLevel == 35)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_8"] && old.iLevel == 36)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_9"] && old.iLevel == 37)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_CutScene2"] && old.iLevel == 38)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["SewerLevel_10"] && old.iLevel == 39)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_CutScene"] && old.iLevel == 40)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_1"] && old.iLevel == 41)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_2"] && old.iLevel == 42)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_3"] && old.iLevel == 43)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_4"] && old.iLevel == 44)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_5"] && old.iLevel == 45)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_6"] && old.iLevel == 46)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_7"] && old.iLevel == 47)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_8"] && old.iLevel == 48)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["InternetLevel_CutScene2"] && old.iLevel == 49)
    {
        return current.iLevel != old.iLevel;
    }
    if(settings["PedroBossFightLevel"] && old.iLevel == 50)
    {
        return current.iLevel != old.iLevel;
    }
}

reset {
    return current.iLevel == 1;
}

start {
    vars.totalTime = 0;
    if (settings["TutorialLevel_start"])
    {
        return current.iLevel == 3;
    }
    if (settings["OldTownlLevel_start"])
    {
        return current.iLevel == 6;
    }
    if (settings["DistrictNullLevel_start"])
    {
        return current.iLevel == 16;
    }
    if (settings["PedroWorldLevel_start"])
    {
        return current.iLevel == 25;
    }
    if (settings["SewerLevel_start"])
    {
        return current.iLevel == 31;
    }
    if (settings["InternetLevel_start"])
    {
        return current.iLevel == 43;
    }
    if (settings["PedroBossFightLevel_start"])
    {
        return current.iLevel == 52;
    }
}

isLoading {
    return true;
}

exit {
    timer.IsGameTimePaused = true;
}