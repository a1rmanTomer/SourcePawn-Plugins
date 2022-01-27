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
	name = "CombatBox",
	author = PLUGIN_AUTHOR,
	description = "Box for bots.",
	version = PLUGIN_VERSION,
	url = "https://www.youtube.com/channel/UCtF6wGyiFXzfZLW2DMVhWoA?view_as=subscriber"
};

bool check = false;

public void OnPluginStart()
{
	
	RegAdminCmd("sm_box", callBack, ADMFLAG_GENERIC);
	
}


public Action callBack (int client, int args)
{
	//toggle;
	if (args == 0)
	{

		if (check)
			{
				check = false;
				ServerCommand("mp_teammates_are_enemies 0");
				ServerCommand("rcon mp_friendlyfire 0");
				PrintToChatAll("airman* u mad son of a bitch u turned OFF BOX!");
			}
			else
			{
				check = true;
				ServerCommand("mp_teammates_are_enemies 1");
				ServerCommand("rcon mp_friendlyfire 1");
				PrintToChatAll("airman* u mad son of a bitch u turned ON BOX!");
			}

	}

	//on-off
	if (args == 1)
	{

		char arg[3];
		GetCmdArg(1, arg, 3);
		
		if (StrEqual(arg,"1"))
		{
			check = true;
			
			ServerCommand("mp_teammates_are_enemies 1");
			ServerCommand("rcon mp_friendlyfire 1");
			PrintToChatAll("airman* u mad son of a bitch u turned ON BOX!");
		}
		
		else if (StrEqual(arg,"0"))
		{
			check = false;
			ServerCommand("mp_teammates_are_enemies 0");
			ServerCommand("rcon mp_friendlyfire 0");
			PrintToChatAll("airman* u mad son of a bitch u turned OFF BOX!");
		}

	}

}