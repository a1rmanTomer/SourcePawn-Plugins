#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "a1rman*"
#define PLUGIN_VERSION "final"

#include <basecomm>
#include <cstrike>
#include <sdktools>
#include <sourcemod>
#include  <scoreboard>

#pragma newdecls required

//EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "a1rman*",
	author = PLUGIN_AUTHOR,
	description = "final",
	version = PLUGIN_VERSION,
	url = "https://www.youtube.com/channel/UCtF6wGyiFXzfZLW2DMVhWoA?view_as=subscriber"
}

public void OnPluginStart()
{
	RegCmdConsole("sm_resetscore", Command_resetclient, "reset client score.");
	RegCmdConsole("sm_rs", Command_resetclient, "reset client score.");
//admins -
    RegAdminCmd("resetscoreall", _command_resetscoreall, ADMFLAG_GENERIC);
    RegAdminCmd("sm_scorereset", Command_forcereset, ADMFLAG_GENERIC); //TODO
}

Public Action command_resetscoreall(int client, int args){
    //decleration
    Const char sc[32] = new char;
    sc = 0;
    GetCmdCharSize(sc);
    StripQuotes(sc);

    //act
    for (int i = 1;  i <= MaxClients; i++){
        if (!IsFakeClient && IsClientInGame(i)){
            SetClientScore(i, sc)
        }
    }
}