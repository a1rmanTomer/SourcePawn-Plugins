#include <sourcemod>
#include <pilo>
#include <cstrike>
#include <sdktools>
#include <store>

bool g_bUsed = false;
int g_iRounds = 0;

/* TODO: 

VIP PLAYERS :
x1 בלתי נראה ל20 שניות ללא אפשרות לפגוע

*/

public Plugin myinfo = 
{
	name = "RTD",
	author = "Pilo + a1rman*",
	description = "",
	version = "1.1",
	url = "https://forums.alliedmods.net/member.php?u=290157"
}

public void OnPluginStart()
{
	RegConsoleCmd("sm_rtd", Command_RTD);
	HookEvent("round_start", Event_RoundStart);
}

public void OnMapStart()
{
	g_bUsed = false;
	g_iRounds = 0;
}

public Action Event_RoundStart(Event event, const char[] name, bool dontBrodcast)
{
	if (g_iRounds < 3 && g_bUsed)
		g_iRounds ++;
	
	if (g_iRounds >= 3 && g_bUsed)
	{
		g_iRounds = 0;
		g_bUsed = false;
	}
	if (g_iRounds == 0 && !g_bUsed)
		PrintToChatAll("%s \x03RTD Command is available.\x01");
		
	return Plugin_Continue;
}

public Action Command_RTD(int client, int args)
{
	if (IsClientInGame(client) && !IsFakeClient(client))
	{
		if (!IsPlayerAlive(client))
		{
			PrintToChat(client, "%s You need to be alive in order to use that command.", PREFIX);
			return Plugin_Handled;
		}
		if (GetClientTeam(client) == CS_TEAM_T)
		{
			//
			
			if (g_iRounds < 3 && g_bUsed)
			{
				PrintToChat(client, "%s You need to wait \x04%i\x01 more rounds to use that command.", PREFIX, 3 - g_iRounds);
				return Plugin_Handled;
			}
			
			
		}
		else
		{
			PrintToChat(client, "%s You need to be a terrorist in order to use that command.", PREFIX);
			return Plugin_Handled;
		}
		
			//
		
		if (!Store_IsClientVIP(client))
		{
			int itemNum = GetRandomInt(0, 2);
			switch(itemNum)
			{
				case 0:
				{
					GivePlayerItem(client, "weapon_glock");
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a GLOCK!", PREFIX);
				}
				case 1:
				{
					SetEntityHealth(client, 150);
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a 150HP BOUNUS!", PREFIX);
				}
				case 2:
				{
					GivePlayerItem(client, "weapon_hegrenade");
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a GRANADE!", PREFIX);
				}
			}
		}
		else
		{
			int itemNum = GetRandomInt(0, 6);
			switch(itemNum)
			{
				case 0:
				{
					GivePlayerItem(client, "weapon_glock");
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a GLOCK!", PREFIX);
				}
				case 1:
				{
					SetEntityHealth(client, 150);
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a 150HP BOUNUS!", PREFIX);
				}
				case 2:
				{
					GivePlayerItem(client, "weapon_hegrenade");
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a GRANADE!", PREFIX);
				}
				case 3:
				{
					GivePlayerItem(client, "weapon_healthshot");
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a HEALTHSHOT!", PREFIX);
				}
				case 4:
				{
					GivePlayerItem(client, "weapon_deagle");
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a DEAGLE!", PREFIX);
				}
				case 5:
				{
					GivePlayerItem(client, "weapon_hegrenade");
					GivePlayerItem(client, "weapon_flashbang");
					PrintToChat(client, "%s You used an \x04rtd\x01 and recieved a GRENADE SET!", PREFIX);
				}
				case 6:
				{
					SetEntityRenderMode(client , RENDER_NONE);
					PrintToChat(client, "%s You used an \x04rtd\x01 and BECAME INVISIBLE!", PREFIX);
				}
			}
		}
		/*PrintToChat(client, "%s You used an \x04rtd\x01!", PREFIX);*/
		for (int i = 1; i <= MaxClients; i++)
		{
			if (IsClientInGame(i) && !IsFakeClient(i))
			{
				if (GetClientTeam(i) == CS_TEAM_CT)
				{
					PrintToChat(i, "%s \x02[ WARNING ]\x01 One of the terrorist has used an rtd, and received a special item.", PREFIX);
				}
			}
		}
		g_bUsed = true;
		g_iRounds = 0;
	}
	PrintToServer("Alon oev boolbool");
	return Plugin_Handled;
}
