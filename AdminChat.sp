#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "a1rman*"
#define PLUGIN_VERSION "final"

#include <basecomm>
#include <cstrike>
#include <sdktools>
#include <sourcemod>
#include <store>

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
	RegConsoleCmd("sm_ac", AdminChat, "Admin Chat"); //admin chat message
    RegAdminCmd("sm_asay", ASay, ADMFLAG_GENERIC); //say to all
    RegConsoleCmd("sm_svip", SVip, "Vip Chat"); //vip chat
    RegAdminCmd("sm_tsay", TSay, ADMFLAG_GENERIC); //tsay
    RegAdminCmd("sm_ctsay", CtSay, ADMFLAG_GENERIC); //ctsay
}

//admin chat message:
public Action AdminChat(int client, int args){
    char sText[192];
	GetCmdArgString(sText, 192);
	StripQuotes(sText);
    for (int i = 1; i<= MaxClients; i++){
        if (!IsFakeClient(i) && IsClientConnected(i)){
            if(CheckCommandAccess(i, "sm_admin", ADMFLAG_GENERIC, true)){
                PrintToChat(i, sText);
            }
        }
    }
}

//say to all:
public Action ASay(int client, int args){
    char sText[192];
	GetCmdArgString(sText, 192);
	StripQuotes(sText);
    PrintToChatAll(sText);
}

//vip chat:
public Action SVip(int client, int args){
    char sText[192];
	GetCmdArgString(sText, 192);
	StripQuotes(sText);
    for (int i = 1; i<= MaxClients; i++){
        if (!IsFakeClient(i) && IsClientConnected(i)){
            if (Store_IsClientVIP(i)){
                PrintToChat(i, sText);
            }
            else{
                continue;
            }
        }
    }
}

//tsay:
public Action TSay(int client, int args){
    char sText[192];
	GetCmdArgString(sText, 192);
	StripQuotes(sText);
    for (int i = 1, i<=MaxClients, i++){
        if (!IsFakeClient(i) && IsClientConnected(i)){
            if (GetClientTeam(i) == CS_TEAM_T){
                PrintToChat(i, "%s " + sText);
            }
        }
    }
}

//ctsay:
public Action CtSay(int client, int args){
    char sText[192];
	GetCmdArgString(sText, 192);
	StripQuotes(sText);
    for (int i = 1, i<=MaxClients, i++){
        if (!IsFakeClient(i) && IsClientConnected(i)){
            if (GetClientTeam(i) == CS_TEAM_CT){
                PrintToChat(i, "%s " + sText);
            }
        }
    }
}