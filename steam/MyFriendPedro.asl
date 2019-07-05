/*
    # Update 30/06/2019 game version 1.02
    #
    #
    #
    #
    #

*/

state("My Friend Pedro - Blood Bullets Bananas") {
    //
    //UnityPlayer.dll 74 ?? 48 8B 41 10 48 85 C0 74 ?? 89 90 ?? ?? ?? ?? 48 83 C4 28 (+13)
    //UnityPlayer.dll F3 0F 10 78 ?? 48 3B DF 74 ?? 83 B9 ?? ?? ?? ?? 00 75 ?? (+12)
    //

    int isMenu      : "UnityPlayer.dll", 0x144CD38, 0x80, 0x10, 0xAC;
    byte isLoading  : "UnityPlayer.dll", 0x144BCE5;
    //v1.0 - 0x6C
    int iLevel      : "mono.dll", 0x264110, 0xA8, 0x18, 0x70;
}

startup {

  	/*
    ======================================================================
    */    
    settings.Add("TutorialGroup", true, "Tutorial");
    settings.Add("TutorialLevel_1", false, "Tutorial 1", "TutorialGroup");
    settings.Add("TutorialLevel_2", false, "Tutorial 2", "TutorialGroup");
    settings.Add("TutorialLevel_3", false, "Tutorial 3", "TutorialGroup");


  	/*
    ======================================================================
    */    
    settings.Add("OldTownGroup", true, "Old Town");
    settings.Add("OldTownlLevel_1", false, "Old Town 1", "OldTownGroup");
    settings.Add("OldTownlLevel_2", false, "Old Town 2", "OldTownGroup");
    settings.Add("OldTownlLevel_3", false, "Old Town 3", "OldTownGroup");
    settings.Add("OldTownlLevel_4", false, "Old Town 4", "OldTownGroup");
    settings.Add("OldTownlLevel_5", false, "Old Town 5", "OldTownGroup");
    settings.Add("OldTownlLevel_6", false, "Old Town 6", "OldTownGroup");
    settings.Add("OldTownlLevel_7", false, "Old Town 7", "OldTownGroup");
    settings.Add("OldTownlLevel_7_5", false, "Old Town Scene with taking bike", "OldTownGroup");
    settings.Add("OldTownlLevel_8", false, "Old Town 8", "OldTownGroup");


  	/*
    ======================================================================
    */    
    settings.Add("DistrictGroup", true, "District Null");
    settings.Add("DistrictNullLevel_Cutscene", false, "District Null Cutscene", "DistrictGroup");
    settings.Add("DistrictNullLevel_1", false, "District Null 1", "DistrictGroup");
    settings.Add("DistrictNullLevel_2", false, "District Null 2", "DistrictGroup");
    settings.Add("DistrictNullLevel_3", false, "District Null 3", "DistrictGroup");
    settings.Add("DistrictNullLevel_4", false, "District Null 4", "DistrictGroup");
    settings.Add("DistrictNullLevel_5", false, "District Null 5", "DistrictGroup");
    settings.Add("DistrictNullLevel_6", false, "District Null 6", "DistrictGroup");
    settings.Add("DistrictNullLevel_7", false, "District Null 7", "DistrictGroup");
    settings.Add("DistrictNullLevel_8", false, "District Null 8", "DistrictGroup");
    settings.Add("DistrictNullLevel_9", false, "District Null 9", "DistrictGroup");


  	/*
    ======================================================================
    */
    settings.Add("PedroGroup", true, "Pedro World");
    settings.Add("PedroWorldLevel_1", false, "Pedro's World 1", "PedroGroup");
    settings.Add("PedroWorldLevel_2", false, "Pedro's World 2", "PedroGroup");
    settings.Add("PedroWorldLevel_3", false, "Pedro's World 3", "PedroGroup");
    settings.Add("PedroWorldLevel_4", false, "Pedro's World 4", "PedroGroup");
    settings.Add("PedroWorldLevel_CutScene", false, "Pedro's World End Level Cutscene", "PedroGroup");

  	/*
    ======================================================================
    */    
    settings.Add("SewageGroup", true, "The Sewage");
    settings.Add("SewageLevel_CutScene", false, "The Sewage Cutscene", "SewageGroup");
    settings.Add("SewageLevel_1", false, "The Sewage 1", "SewageGroup");
    settings.Add("SewageLevel_2", false, "The Sewage 2", "SewageGroup");
    settings.Add("SewageLevel_3", false, "The Sewage 3", "SewageGroup");
    settings.Add("SewageLevel_4", false, "The Sewage 4", "SewageGroup");
    settings.Add("SewageLevel_5", false, "The Sewage 5", "SewageGroup");
    settings.Add("SewageLevel_6", false, "The Sewage 6", "SewageGroup");
    settings.Add("SewageLevel_7", false, "The Sewage 7", "SewageGroup");
    settings.Add("SewageLevel_8", false, "The Sewage 8", "SewageGroup");
    settings.Add("SewageLevel_9", false, "The Sewage 9", "SewageGroup");
    settings.Add("SewageLevel_CutScene2", false, "The Sewage Cutscene Jumping into train", "SewageGroup");
    settings.Add("SewageLevel_10", false, "The Sewage 10", "SewageGroup");

  	/*
    ======================================================================
    */    
    settings.Add("InternetGroup", true, "The Internet");
    settings.Add("InternetLevel_CutScene", false, "The Internet Cut Scene", "InternetGroup");
    settings.Add("InternetLevel_1", false, "The Internet 1", "InternetGroup");
    settings.Add("InternetLevel_2", false, "The Internet 2", "InternetGroup");
    settings.Add("InternetLevel_3", false, "The Internet 3", "InternetGroup");
    settings.Add("InternetLevel_4", false, "The Internet 4", "InternetGroup");
    settings.Add("InternetLevel_5", false, "The Internet 5", "InternetGroup");
    settings.Add("InternetLevel_6", false, "The Internet 6", "InternetGroup");
    settings.Add("InternetLevel_7", false, "The Internet 7", "InternetGroup");
    settings.Add("InternetLevel_8", false, "The Internet 8", "InternetGroup");
    settings.Add("InternetLevel_CutScene2", false, "The Internet Cut Scene with pressing E", "InternetGroup");

 	 /*
    ======================================================================
    */    
    settings.Add("PedroBossFightLevel", false, "Pedro Boss Fight");
  	/*
    ======================================================================
    */    
}

isLoading {
    return current.isLoading == 0 || current.isMenu == 1;
}


split {
	/*current.iLevel == level id + 1 // this is done so that split works at the beginning of next level */
    if (settings["TutorialLevel_1"]) {
        if (current.iLevel == 4 && current.iLevel != old.iLevel) {
            return settings["TutorialLevel_1"];
        }
    }
    if (settings["TutorialLevel_2"]) {
        if (current.iLevel == 5 && current.iLevel != old.iLevel) {
            return settings["TutorialLevel_2"];
        }
    }
    if (settings["TutorialLevel_3"]) {
        if (current.iLevel == 6 && current.iLevel != old.iLevel) {
            return settings["TutorialLevel_3"];
        }
    }

    if (settings["OldTownlLevel_1"]) {
        if (current.iLevel == 7 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_1"];
        }
    }
    if (settings["OldTownlLevel_2"]) {
        if (current.iLevel == 8 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_2"];
        }
    }
    if (settings["OldTownlLevel_3"]) {
        if (current.iLevel == 9 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_3"];
        }
    }
    if (settings["OldTownlLevel_4"]) {
        if (current.iLevel == 10 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_4"];
        }
    }
    if (settings["OldTownlLevel_5"]) {
        if (current.iLevel == 11 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_5"];
        }
    }
    if (settings["OldTownlLevel_6"]) {
        if (current.iLevel == 12 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_6"];
        }
    }
    if (settings["OldTownlLevel_7"]) {
        if (current.iLevel == 13 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_7"];
        }
    }
    if (settings["OldTownlLevel_7_5"]) {
        if (current.iLevel == 14 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_7_5"];
        }
    }
    if (settings["OldTownlLevel_8"]) {
        if (current.iLevel == 15 && current.iLevel != old.iLevel) {
            return settings["OldTownlLevel_8"];
        }
    }

    if (settings["DistrictNullLevel_Cutscene"]) {
        if (current.iLevel == 16 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_Cutscene"];
        }
    }
    if (settings["DistrictNullLevel_1"]) {
        if (current.iLevel == 17 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_1"];
        }
    }
    if (settings["DistrictNullLevel_2"]) {
        if (current.iLevel == 18 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_2"];
        }
    }
    if (settings["DistrictNullLevel_3"]) {
        if (current.iLevel == 19 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_3"];
        }
    }
    if (settings["DistrictNullLevel_4"]) {
        if (current.iLevel == 20 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_4"];
        }
    }
    if (settings["DistrictNullLevel_5"]) {
        if (current.iLevel == 21 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_5"];
        }
    }
    if (settings["DistrictNullLevel_6"]) {
        if (current.iLevel == 22 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_6"];
        }
    }
    if (settings["DistrictNullLevel_7"]) {
        if (current.iLevel == 23 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_7"];
        }
    }
    if (settings["DistrictNullLevel_8"]) {
        if (current.iLevel == 24 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_8"];
        }
    }
    if (settings["DistrictNullLevel_9"]) {
        if (current.iLevel == 25 && current.iLevel != old.iLevel) {
            return settings["DistrictNullLevel_9"];
        }
    }

    if (settings["PedroWorldLevel_1"]) {
        if (current.iLevel == 26 && current.iLevel != old.iLevel) {
            return settings["PedroWorldLevel_1"];
        }
    }
    if (settings["PedroWorldLevel_2"]) {
        if (current.iLevel == 27 && current.iLevel != old.iLevel) {
            return settings["PedroWorldLevel_2"];
        }
    }
    if (settings["PedroWorldLevel_3"]) {
        if (current.iLevel == 28 && current.iLevel != old.iLevel) {
            return settings["PedroWorldLevel_3"];
        }
    }
    if (settings["PedroWorldLevel_4"]) {
        if (current.iLevel == 29 && current.iLevel != old.iLevel) {
            return settings["PedroWorldLevel_4"];
        }
    }
    if (settings["PedroWorldLevel_CutScene"]) {
        if (current.iLevel == 30 && current.iLevel != old.iLevel) {
            return settings["PedroWorldLevel_CutScene"];
        }
    }

    if (settings["SewageLevel_CutScene"]) {
        if (current.iLevel == 31 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_CutScene"];
        }
    }
    if (settings["SewageLevel_1"]) {
        if (current.iLevel == 32 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_1"];
        }
    }
    if (settings["SewageLevel_2"]) {
        if (current.iLevel == 33 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_2"];
        }
    }
    if (settings["SewageLevel_3"]) {
        if (current.iLevel == 34 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_3"];
        }
    }
    if (settings["SewageLevel_4"]) {
        if (current.iLevel == 35 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_4"];
        }
    }
    if (settings["SewageLevel_5"]) {
        if (current.iLevel == 36 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_5"];
        }
    }
    if (settings["SewageLevel_6"]) {
        if (current.iLevel == 37 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_6"];
        }
    }
    if (settings["SewageLevel_7"]) {
        if (current.iLevel == 38 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_7"];
        }
    }
    if (settings["SewageLevel_8"]) {
        if (current.iLevel == 39 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_8"];
        }
    }
    if (settings["SewageLevel_9"]) {
        if (current.iLevel == 40 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_9"];
        }
    }
    if (settings["SewageLevel_CutScene2"]) {
        if (current.iLevel == 41 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_CutScene2"];
        }
    }
    if (settings["SewageLevel_10"]) {
        if (current.iLevel == 42 && current.iLevel != old.iLevel) {
            return settings["SewageLevel_10"];
        }
    }

    if (settings["InternetLevel_CutScene"]) {
        if (current.iLevel == 43 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_CutScene"];
        }
    }
    if (settings["InternetLevel_1"]) {
        if (current.iLevel == 44 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_1"];
        }
    }
    if (settings["InternetLevel_2"]) {
        if (current.iLevel == 45 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_2"];
        }
    }
    if (settings["InternetLevel_3"]) {
        if (current.iLevel == 46 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_3"];
        }
    }
    if (settings["InternetLevel_4"]) {
        if (current.iLevel == 47 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_4"];
        }
    }
    if (settings["InternetLevel_5"]) {
        if (current.iLevel == 48 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_5"];
        }
    }
    if (settings["InternetLevel_6"]) {
        if (current.iLevel == 49 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_6"];
        }
    }
    if (settings["InternetLevel_7"]) {
        if (current.iLevel == 50 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_7"];
        }
    }
    if (settings["InternetLevel_8"]) {
        if (current.iLevel == 51 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_8"];
        }
    }
    if (settings["InternetLevel_CutScene2"]) {
        if (current.iLevel == 52 && current.iLevel != old.iLevel) {
            return settings["InternetLevel_CutScene2"];
        }
    }

    if (settings["PedroBossFightLevel"]) {
        if (current.iLevel == 53 && current.iLevel != old.iLevel) {
            return settings["PedroBossFightLevel"];
        }
    }
}

reset {
    return current.iLevel == 1;
}

start {
    return current.iLevel == 3;
}

exit {
    timer.IsGameTimePaused = true;
}
