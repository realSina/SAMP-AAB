/*
  __      _      __           _     _ 
 | _|    / \    |_ |  _ __   | |_  (_)
 | |    / _ \    | | | '_ \  | __| | |
 | |   / ___ \   | | | | | | | |_  | |
 | |  /_/   \_\  | | |_| |_|  \__| |_|
 |__|           |__|                  
  __      _      __   _             
 | _|    / \    |_ | (_)  _ __ ___  
 | |    / _ \    | | | | | '_ ` _  |
 | |   / ___ \   | | | | | | | | | |
 | |  /_/   \_\  | | |_| |_| |_| |_|
 |__|           |__|                
  __   ____    __           _   
 |_|  | __ )  |_ |   ___   | |_ 
 | |  |  _ \   | |  / _ \  | __|
 | |  | |_) |  | | | (_) | | |_ 
 | |  |____/   | |  \___/   \__|
 |__|         |__|                 
   _                 ____    _                 
 | |__    _   _    / ___|  (_)  _ __     __ _ 
 | '_ \  | | | |   \___ \  | | | '_ \   / _` |
 | |_) | | |_| |    ___) | | | | | | | | (_| |
 |_.__/   \__, |   |____/  |_| |_| |_|  \__,_|
          |___/                               
*/
/* ----------------[Includes]---------------- */
#include <a_samp>
/* ----------------[Defines]---------------- */
new HeadCounter[MAX_PLAYERS];
new ZeroTimer[MAX_PLAYERS];
new AIBTimer[MAX_PLAYERS];
forward SetZero(playerid);
forward CheckCounts(playerid);
/* ----------------[Publics]---------------- */
public OnFilterScriptInit()
{
    print("AIB v0.1 filterscript loaded");
    print("Github: https://github.com/realSina/");
    print("Author: Sina");
    return 1;
}
public OnPlayerConnect(playerid)
{
	HeadCounter[playerid] = 0;
	ZeroTimer[playerid] = SetTimerEx("SetZero", 1000, true, "i", playerid);
	AIBTimer[playerid] = SetTimerEx("CheckCounts", 5000, true, "i", playerid);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	KillTimer(ZeroTimer[playerid]);
	KillTimer(AIBTimer[playerid]);
	return 1;
}
public OnFilterScriptExit()
{
    return 1;
}
public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{

    if(issuerid != INVALID_PLAYER_ID && bodypart == 9)
    {
    	HeadCounter[issuerid] ++;
    }
    return 1;
}
/* ----------------[Timers]---------------- */
public SetZero(playerid)
{
HeadCounter[playerid] = 0;
return 1;
}
public CheckCounts(playerid)
{
if(HeadCounter[playerid] >= 3)
{
CallRemoteFunction("OnAIBDetected", "i", playerid);
}
return 1;
}