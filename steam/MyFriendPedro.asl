    /*
    #
    # Update 14/11/2019 game version 1.03
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
    //vars.tmp_cfg = current.isInGameState & 0xfff;
    //TODO: Check out isInGameState not return current values at last level of each chapters -_-
    //if (current.chapterTime > old.chapterTime && vars.tmp_cfg < 4080){
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
}


split {
    return current.iLevel != old.iLevel;
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
