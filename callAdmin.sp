#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "a1rman*"
#define PLUGIN_VERSION "final"

#include <basecomm>
#include <cstrike>
#include <sdktools>
#include <sourcemod>

#pragma newdecls required

//EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "CallAdmin",
	author = PLUGIN_AUTHOR,
	description = "This plugin is used to report a player to the connected admins.",
	version = PLUGIN_VERSION,
	url = "https://www.youtube.com/channel/UCtF6wGyiFXzfZLW2DMVhWoA?view_as=subscriber"
}

public void OnPluginStart()
{
    RegConsoleCMD("sm_calladmin", Command_CallAdmin, "Report a player to the connected admins");
}

Public Action Command_CallAdmin(int client, int target, int reason){
    for (int i = 1; i<=MaxClients; i++){
        if (!IsFakeclient(i) && IsPlayerInGame(i)){
            if (CheckcommandAccess(i, "sm_admin",ADMFLAG_GENERIC, true)){
                PrintToChat(i, "%s A report has been filed on %d" +target + "%s for doing:%d" +reason + "%s by%d" + client);
            }
        }
    }
}