__int64 __fastcall UITimerScript::Update(struct_this *this)
{
  // [COLLAPSED LOCAL DECLARATIONS. PRESS KEYPAD CTRL-"+" TO EXPAND]

  v26[0] = 0;
  if ( this->rootShared->showUITimer )
  {
    if ( !this->showUITimerDoOnce )
    {
      ((void (__fastcall *)(_QWORD, __int64))loc_26384DDED50)(this->qword18, 1i64);
      ((void (__fastcall *)(_QWORD, _QWORD))loc_26384DDEE40)(this->qword50, 0i64);
      ((void (__fastcall *)(_QWORD, __int64))loc_26384DDEE40)(this->qword50, 1i64);
      v16 = this->qword20;
      sub_26384DD93A0(this->qword28, 0x2638493A7E0i64);
      sub_26384DD93A0(v16, 0x2638493A7E0i64);
      this->showUITimerDoOnce = 1;
    }
  }
  else if ( this->showUITimerDoOnce )
  {
    ((void (__fastcall *)(_QWORD, _QWORD))((char *)&qword_26384DD1238[3] + 1))(this->qword18, 0i64);
    this->showUITimerDoOnce = 0;
  }
  root = sub_26384D46040((__int64)this->root, 0i64);
  if ( (_DWORD)root )
  {
    num = 0.0;
    sub_26384E0CA30(v26);
    buildIndex = sub_26384E0CB40(v26);
    // if (this.root.levelEnded || this.root.fadeToBlack)
    if ( this->root->vtable->pfunc2F8(this->root) || this->root->fadeToBlack )
    {
      root = this->levelEndedDoOnce;
      if ( !this->levelEndedDoOnce )
      {
        if ( this->root->fadeToBlack )
          buffer = ((float (*)(void))((char *)&qword_26384DDED00[3] + 1))() - this->root->timePaused;
        else
          buffer = this->root->finishTime;
        finishTime = buffer;
        v17 = this->qword28;
        v5 = (*(__int64 (__fastcall **)(struct_this *))(this->qword0 + 112i64))(this);
        ((void (__fastcall *)(__int64, __int64))((char *)&qword_26384DD5990[2] + 7))(v17, v5);
        if ( (signed int)buildIndex < this->levelTimers->dword18 )
        {
          levelTimers = this->levelTimers;
          if ( levelTimers[6] <= buildIndex )
          {
            v15 = 653i64;
            goto LABEL_32;
          }
          new_time = finishTime - this->root->startTime;
          *(float *)&levelTimers[buildIndex + 8] = new_time;
        }
        for ( i = 0; (signed int)i < this->levelTimers->dword18; ++i )
        {
          levelTimers__vftable = this->levelTimers;
          if ( levelTimers__vftable[6] <= i )
          {
            while ( 1 )
            {
              v15 = 598i64;
LABEL_32:
              MEMORY[0x263846D1CD0](0x2000678i64, v15);
            }
          }
          old_time = num + *(float *)&levelTimers__vftable[i + 8];
          num = old_time;
        }
        v18 = this->qword20;
        v10 = (*(__int64 (__fastcall **)(struct_this *))(this->qword0 + 112i64))(this);
        root = ((__int64 (__fastcall *)(__int64, __int64))((char *)&qword_26384DD5990[2] + 7))(v18, v10);
        this->levelEndedDoOnce = 1;
      }
    }
    else
    {
      root = this->root->unsigned___int8816;
      if ( !this->root->unsigned___int8816 )
      {
        root = ((__int64 (__fastcall *)(_QWORD))loc_26384DC2750)(this->qword18);
        if ( (_DWORD)root )
        {
          MEMORY[0x263A49A2570]();
          v19 = this->qword28;
          v11 = (*(__int64 (__fastcall **)(struct_this *))(this->qword0 + 112i64))(this);
          sub_26384DD93A0(v19, v11);
          for ( j = 0; (signed int)j < this->levelTimers->dword18; ++j )
          {
            if ( j != buildIndex )
            {
              v12 = (__int64)this->levelTimers;
              if ( *(_DWORD *)(v12 + 24) <= j )
              {
                v15 = 198i64;
                goto LABEL_32;
              }
              v13 = num + *(float *)(v12 + 4i64 * (int)j + 32);
              num = v13;
            }
          }
          v20 = this->qword20;
          v14 = (*(__int64 (__fastcall **)(struct_this *))(this->qword0 + 112i64))(this);
          root = sub_26384DD93A0(v20, v14);
        }
      }
    }
  }
  return root;
}