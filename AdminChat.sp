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
	name = "a1rman*",
	author = PLUGIN_AUTHOR,
	description = "Admin Chat Commands And Features.",
	version = PLUGIN_VERSION,
	url = "https://www.youtube.com/channel/UCtF6wGyiFXzfZLW2DMVhWoA?view_as=subscriber"
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_ac", AdminChat); //admin chat message
    RegAdminCmd("sm_asay", ASay, ADMFLAG_GENERIC); //say to all
    RegConsoleCmd("sm_svip", SVip); //vip chat
    RegAdminCmd("sm_tsay", TSay); //tsay
    RegAdminCmd("sm_ctsay", CtSay); //ctsay
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

//say to all:
public Action ASay(int client, int args){
    PrintToChatAll("%s " + args);
}

//vip chat:
public Action SVip(int client, int args){
    for (int i = 1, i<=MaxClients, i++){
        if (!IsFakeClient(i) && IsClientConnected(i)){
            if (CheckCommandAccess(i, "sm_vip", A, true){
                PrintToChat(i, "%s " + args);
            }
        }
    }
}

//tsay:
public Action TSay(int client, int args){
    for (int i = 1, i<=MaxClients, i++){
        if (!IsFakeClient(i) && IsClientConnected(i)){
            if (GetClientTeam() == CS_TEAM_T){
                PrintToChat(i, "%s " + args);
            }
        }
    }
}

//ctsay:
public Action CtSay(int client, int args){
    for (int i = 1, i<=MaxClients, i++){
        if (!IsFakeClient(i) && IsClientConnected(i)){
            if (GetClientTeam() == CS_TEAM_CT){
                PrintToChat(i, "%s " + args);
            }
        }
    }
}