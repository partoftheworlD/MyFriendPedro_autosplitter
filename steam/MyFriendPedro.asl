/*
#
# Update 2/03/2020 game version 1.03
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
    if (current.chapterTime > old.chapterTime && current.isLoading > 0) {
        vars.deltaChapterTime = current.chapterTime - old.chapterTime;     
        vars.totalTime += vars.deltaChapterTime;
    }
}

gameTime {
    if (current.chapterTime > old.chapterTime) {
        return TimeSpan.FromSeconds(vars.totalTime);
    }
}

startup {
    vars.split_levels = new Dictionary<string,int>{{"TutorialLevel_1", 3},
                                                  {"TutorialLevel_2", 4},
                                                  {"TutorialLevel_3", 5},
                                                  {"OldTownLevel_1", 6},
                                                  {"OldTownLevel_2", 7},
                                                  {"OldTownLevel_3", 8},
                                                  {"OldTownLevel_4", 9},
                                                  {"OldTownLevel_5", 10},
                                                  {"OldTownLevel_6", 11},
                                                  {"OldTownLevel_7", 12},
                                                  {"OldTownLevel_7_5", 13},
                                                  {"OldTownLevel_8", 14},
                                                  {"DistrictNullLevel_Cutscene", 15},
                                                  {"DistrictNullLevel_1", 16},
                                                  {"DistrictNullLevel_2", 17},
                                                  {"DistrictNullLevel_3", 18},
                                                  {"DistrictNullLevel_4", 19},
                                                  {"DistrictNullLevel_5", 20},
                                                  {"DistrictNullLevel_6", 21},
                                                  {"DistrictNullLevel_7", 22},
                                                  {"DistrictNullLevel_8", 23},
                                                  {"DistrictNullLevel_9", 24},
                                                  {"PedroWorldLevel_1", 25},
                                                  {"PedroWorldLevel_2", 26},
                                                  {"PedroWorldLevel_3", 27},
                                                  {"PedroWorldLevel_4", 28},
                                                  {"PedroWorldLevel_CutScene", 29},
                                                  {"SewerLevel_CutScene", 30},
                                                  {"SewerLevel_1", 31},
                                                  {"SewerLevel_2", 32},
                                                  {"SewerLevel_3", 33},
                                                  {"SewerLevel_4", 34},
                                                  {"SewerLevel_5", 35},
                                                  {"SewerLevel_6", 36},
                                                  {"SewerLevel_7", 37},
                                                  {"SewerLevel_8", 38},
                                                  {"SewerLevel_9", 39},
                                                  {"SewerLevel_CutScene2", 40},
                                                  {"SewerLevel_10", 41},
                                                  {"InternetLevel_CutScene", 42},
                                                  {"InternetLevel_1", 43},
                                                  {"InternetLevel_2", 44},
                                                  {"InternetLevel_3", 45},
                                                  {"InternetLevel_4", 46},
                                                  {"InternetLevel_5", 47},
                                                  {"InternetLevel_6", 48},
                                                  {"InternetLevel_7", 49},
                                                  {"InternetLevel_8", 50},
                                                  {"InternetLevel_CutScene2", 51},
                                                  {"PedroBossFightLevel", 52}};

    vars.levels       = new Dictionary<string,string>{{"TutorialLevel_1","Tutorial 1"},
                                                  {"TutorialLevel_2","Tutorial 2"},
                                                  {"TutorialLevel_3","Tutorial 3"},
                                                  {"OldTownLevel_1","Old Town 1"},
                                                  {"OldTownLevel_2","Old Town 2"},
                                                  {"OldTownLevel_3","Old Town 3"},
                                                  {"OldTownLevel_4","Old Town 4"},
                                                  {"OldTownLevel_5","Old Town 5"},
                                                  {"OldTownLevel_6","Old Town 6"},
                                                  {"OldTownLevel_7","Old Town 7"},
                                                  {"OldTownLevel_7_5","Old Town Scene with taking bike"},
                                                  {"OldTownLevel_8","Old Town 8"},
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
    
    settings.Add("StartGroup", true, "Start Timer At");
    settings.Add("TutorialLevel_start", true, "Tutorial", "StartGroup");
    settings.Add("OldTownLevel_start", false, "Old Town", "StartGroup");
    settings.Add("DistrictNullLevel_start", false, "District Null", "StartGroup");
    settings.Add("PedroWorldLevel_start", false, "Pedro World", "StartGroup");
    settings.Add("SewerLevel_start", false, "The Sewer", "StartGroup");
    settings.Add("InternetLevel_start", false, "The Internet", "StartGroup");
    settings.Add("PedroBossFightLevel_start", false, "The End", "StartGroup");
    settings.Add("level_splits", true, "Splits");    
    foreach (var level in vars.levels) {
        settings.Add(level.Key, true, level.Value, "level_splits");
    };
}


split {
    foreach (var sl in vars.split_levels) {
        if(settings[sl.Key] && old.iLevel == sl.Value) {
            return current.iLevel != old.iLevel;
        }
    }
}

reset {
    return current.iLevel == 1;
}

start {
    vars.totalTime = 0;
    if(settings["TutorialLevel_start"]) {
        return current.iLevel == 3;
    }
    if(settings["OldTownLevel_start"]) {
        return current.iLevel == 6;
    }
    if(settings["DistrictNullLevel_start"]) {
        return current.iLevel == 16;
    }
    if(settings["PedroWorldLevel_start"]) {
        return current.iLevel == 25;
    }
    if(settings["SewerLevel_start"]) {
        return current.iLevel == 31;
    }
    if(settings["InternetLevel_start"]) {
        return current.iLevel == 43;
    }
    if(settings["PedroBossFightLevel_start"]) {
        return current.iLevel == 52;
    }
}

isLoading {
    return true;
}

exit {
    timer.IsGameTimePaused = true;
}