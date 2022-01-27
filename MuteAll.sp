#pragma semicolon 1
 
#define DEBUG
 
#define PLUGIN_AUTHOR  "a1rman*"
#define PLUGIN_VERSION "final"
 
#include <basecomm>
#include <cstrike>
#include <sdktools>
#include <sourcemod>
 
//#include <sdkhooks>
 
#pragma newdecls required
 
// EngineVersion g_Game;
 
public Plugin myinfo =
{
	name        = "MuteAll",
	author      = PLUGIN_AUTHOR,
	description = "Mutes and Unmutes all players",
	version     = PLUGIN_VERSION,
	url         = "https://www.youtube.com/channel/UCtF6wGyiFXzfZLW2DMVhWoA?view_as=subscriber"
};
 
public void OnPluginStart()
{
	RegAdminCmd("sm_muteall", Command_MuteAll, ADMFLAG_GENERIC, "Mutes All Players");             // muteall
	RegAdminCmd("sm_unmuteall", Command_UnmuteAll, ADMFLAG_GENERIC, "Unmutes All Players");       // unmuteall
	RegAdminCmd("sm_mutet", Command_MuteT, ADMFLAG_GENERIC, "Mutes all Terrorists");              // mute t
	RegAdminCmd("sm_mutect", Command_MuteCT, ADMFLAG_GENERIC, "Mutes all Counter-Terrorists");    // mute ct

}
 
// muteall
 
public Action Command_MuteAll(int client, int args)
{
	PrintToChatAll("[ADMIN] All players have been muted.");
 
	for (int i = 1; i <= MaxClients; i++)
	{
		if (!IsFakeClient(i) && IsClientInGame(i) && !BaseComm_IsClientMuted(i))
		{
			SetClientListeningFlags(i, VOICE_MUTED);
		}
	}
}
 
// unmuteall
 
public Action Command_UnmuteAll(int client, int args)
{
	PrintToChatAll("[ADMIN] All players have been unmuted.");
 
	for (int i = 1; i <= MaxClients; i++)
	{
		if (!IsFakeClient(i) && IsClientInGame(i) && BaseComm_IsClientMuted(i))
		{
			SetClientListeningFlags(i, VOICE_NORMAL);
		}
	}
}
 
// mutet
 
public Action Command_MuteT(int client, int args)
{
	PrintToChatAll("[ADMIN] All Terrorists have been muted.");
 
	for (int i = 1; i <= MaxClients; i++)
	{
		if (!IsFakeClient(i) && IsClientInGame(i) && !BaseComm_IsClientMuted(i) && GetClientTeam(i) == CS_TEAM_T)
		{
			SetClientListeningFlags(i, VOICE_MUTED);
		}
	}
}
 
// mutect
 
public Action Command_MuteCT(int client, int args)
{
	PrintToChatAll("[ADMIN] All Counter-Terrorists have been muted.");
 
	for (int i = 1; i <= MaxClients; i++)
	{
		if (!IsFakeClient(i) && IsClientInGame(i) && !BaseComm_IsClientMuted(i) && GetClientTeam(i) == CS_TEAM_CT)
		{
			SetClientListeningFlags(i, VOICE_MUTED);
		}
	}
}
 
//test mac