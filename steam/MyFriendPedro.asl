    /*
    #
    # Update 14/11/2019 game version 1.03
    #
    */

state("My Friend Pedro - Blood Bullets Bananas") {
    int iLevel           : "mono.dll", 0x264110, 0xA8, 0x18, 0x78;
    float chapterTime    : "UnityPlayer.dll", 0x14797B8, 0x1654;
    byte isLoading       : "UnityPlayer.dll" , 0x144BCE5;

}

init {
    refreshRate           = 60;
    vars.totalTime        = 0;
    vars.deltaChapterTime = 0;
}

update {
    if (current.chapterTime > old.chapterTime && current.isLoading > 0){
        vars.deltaChapterTime = current.chapterTime - old.chapterTime;
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
