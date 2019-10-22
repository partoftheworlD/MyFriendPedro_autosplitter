    /*
    #
    #  23/10/19 game version 1.03
    #
    */

state("My Friend Pedro - Blood Bullets Bananas") {
    /*

    iLevel signature - mono.dll 48 8D 0D ? ? ? ? 41 8D 50 08 E8 ? ? ? ? E8 ? ? ? ? 83 3D ? ? ? ? ? 0F 85 ? ? ? ? 48 8D 0D (or "GC_DONT_GC")
    Timer Base       - UnityPlayer.dll 48 89 3d ?? ?? ?? ?? ff 15 ?? ?? ?? ?? 39 35 ?? ?? ?? ??
    Timer offset     - UnityPlayer.dll 0f 11 ?? ?? ?? ?? ?? 41 0f 28 ?? e8 ?? ?? ?? ?? 41 0f 28 ?? f3 0f 11 ?? ??
    */

    int iLevel        : "mono.dll", 0x264110, 0xA8, 0x18, 0x78;       // Just levels id
                                                                      //v1.0  - 0x6C
                                                                      //v1.02 - 0x70
                                                                      //v1.03 - 0x78

    float chapterTime : "UnityPlayer.dll", 0x14797B8, 0x1654;         //0x1654 0x1658s
}

init {
    refreshRate           = 60;
    vars.totalTime        = 0;
    vars.deltaChapterTime = 0;
}

update {
    if (current.chapterTime > old.chapterTime){
        vars.deltaChapterTime = current.chapterTime - old.chapterTime;
        /* counterbalance the focus */        
        vars.totalTime += vars.deltaChapterTime;
    }
}

gameTime {
    if (current.chapterTime > old.chapterTime){
        return TimeSpan.FromSeconds(vars.totalTime - 0.089);
    }
}

split {
    if (current.chapterTime - 1 < old.chapterTime){
         return current.iLevel != old.iLevel;
    } 
}

reset {
    return current.iLevel == 1;
}

start {
    vars.totalTime = -2.26;
    return current.iLevel == 3;
}

isLoading {
    return true;

}

exit {
    timer.IsGameTimePaused = true;
}
