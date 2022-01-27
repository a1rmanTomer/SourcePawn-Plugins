#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "a1rman*"
#define PLUGIN_VERSION "final"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
//#include <sdkhooks>

#pragma newdecls required

//EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "NoSpread",
	author = PLUGIN_AUTHOR,
	description = "Turns On & Off NOSPREAD",
	version = PLUGIN_VERSION,
	url = "https://www.youtube.com/channel/UCtF6wGyiFXzfZLW2DMVhWoA?view_as=subscriber"
};

bool check = false;

public void OnPluginStart()
{
	
	RegConsoleCmd("sm_nospread", callBack);
	
}


public Action callBack (int client, int args)
{
	//toggle;
	if (args == 0)
	{

		if (check)
			{
				check = false;
				ServerCommand("sv_cheats 1");
				ServerCommand("weapon_accuracy_nospread 0");
				ServerCommand("sv_cheats 0");
				PrintToChatAll("[Gamers-Israel] Nospread is now OFF");

			}
			else
			{
				check = true;
				ServerCommand("sv_cheats 1");
				ServerCommand("weapon_accuracy_nospread 1");
				ServerCommand("weapon_debug_spread_gap 1");
				ServerCommand("weapon_recoil_cooldown 0");
				ServerCommand("weapon_recoil_decay1_exp 99999");
				ServerCommand("weapon_recoil_decay2_exp 99999");
				ServerCommand("weapon_recoil_decay2_lin 99999");
				ServerCommand("weapon_recoil_scale 0");
				ServerCommand("weapon_recoil_suppression_shots 500");
				ServerCommand("weapon_recoil_view_punch_extra 0");
				ServerCommand("sv_cheats 0");
				PrintToChatAll("[Gamers-Israel] Nospread is now ON");
				
			}
	}
}
//tomer
//test