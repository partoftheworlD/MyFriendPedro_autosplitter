    /*
    # Update 18/10/2019 game version 1.03
    #
    #
    #
    #
    #
    */

state("My Friend Pedro - Blood Bullets Bananas") {
    /*
    iLevel signature    - mono.dll 48 8D 0D ? ? ? ? 41 8D 50 08 E8 ? ? ? ? E8 ? ? ? ? 83 3D ? ? ? ? ? 0F 85 ? ? ? ? 48 8D 0D (or "GC_DONT_GC")
    Timer Base- 48 89 3d ?? ?? ?? ?? ff 15 ?? ?? ?? ?? 39 35 ?? ?? ?? ??
    Timer offset - 0f 11 ?? ?? ?? ?? ?? 41 0f 28 ?? e8 ?? ?? ?? ?? 41 0f 28 ?? f3 0f 11 ?? ?? 
    isMenu - 48 8b ?? ?? 83 ?? ?? ?? ?? ?? ?? 75 ?? 0f 28 ?? eb ??
    isMenu Base - e8 ?? ?? ?? ?? 48 8b c8 e8 ?? ?? ?? ?? e8 ?? ?? ?? ?? 48 85 c0 74 ?? 48 8b c8 48 83 c4 ?? 

    */

    int iLevel      : "mono.dll", 0x264110, 0xA8, 0x18, 0x78;         // Just levels id
                                                                      //v1.0  - 0x6C
                                                                      //v1.02 - 0x70
                                                                      //v1.03 - 0x78

    float chapterTime: "UnityPlayer.dll", 0x14797B8, 0x1658;    
    bool isMenu : "UnityPlayer.dll", 0x144CD38, 0x80, 0x10, 0xAC;      
}

init {
    vars.totalTime = 0;
}

update {
    if (current.chapterTime > old.chapterTime)
    {
        vars.totalTime = vars.totalTime + (current.chapterTime - old.chapterTime);
    }
}

gameTime {
    if (current.chapterTime > old.chapterTime)
    {
        return TimeSpan.FromSeconds(vars.totalTime / 2);
    }
}

split {
    if(current.chapterTime - 1 < old.chapterTime){
         return current.iLevel != old.iLevel;
    } 
}

reset {
    return current.iLevel == 1;
}

start {
    vars.totalTime = 0;
    return current.iLevel == 3;
}

isLoading {
    return current.isMenu;

}
