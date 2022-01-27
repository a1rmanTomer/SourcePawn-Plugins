#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "a1rman*"
#define PLUGIN_VERSION "final"

#include <sourcemod>
#include <sdktools>
#include <cstrike>

#pragma newdecls required

//EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "a1rman*",
	author = PLUGIN_AUTHOR,
	description = "Admin Chat Commands And Features.",
	version = PLUGIN_VERSION,
	url = "https://www.youtube.com/channel/UCtF6wGyiFXzfZLW2DMVhWoA?view_as=subscriber"
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_ac", AdminChat);
}

//admin chat message:
public Action AdminChat(int client, int args, int param1){
    for (int i = 1; i<= MaxClients; i++){
        if (!IsFakeClient(i) && IsClientConnected(i)){
            if(CheckCommandAccess(i, "sm_admin", ADMFLAG_GENERIC, true)){
                PrintToChat(i, args);
            }
        }
    }
}