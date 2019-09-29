Puggle
by Cixi@Remulos (Classic Oceanic)

WHAT THE ADDON IS FOR:
  Puggle is there to help you find a group, by showing you all the group request spammed into any of your active channels
  The players will appear in the clean list sorted by dungeon, with their class and level displayed for convenience.
  You can then directly contact any player via the whisper button and check if they are interested to join you. 

  
INSTALLATION:
  - Copy the "Puggle" folder into your Wow Classic \Interface\AddOns\ folder
  - Restart World of Warcraft Classic
 
  
HOW TO ACTIVATE:
  use the slash command /puggle or /pug
  or click the minimap button (click again to hide)
  
   
HOW IT WORKS:
  The addon continually checks the channels you have joined for any message that looks like a group request.
  If it finds one, it matches it against any dungeon it recognises and finds the class and level of the requester.
  The addon will then list all such players and their requests in its friendly interface and keep them there for 5 minutes.
  If a requester 'refreshes' his request (updated message for example) the timer is reset.
  
 
LOCALIZATION:
The default release comes with search terms in English (LFG / Ragefire / Sunken etc) which works well for players on the US/UK client, but not so well for our friends in Germany, France, China or wherever English is not the preferred language.
To help with that, the search patterns can now be updated directly inside the addon, by going to Settings > Customize Search Patterns
Feel free to edit them to suit your needs
    

CONTACT:
  Feel free to post suggestions and comments on either Curse or WoWInterface. 
  I won't promise I'll respond, but if I see some cool suggestions I might decide to implement them!
  
  May the Earth Mother protect you all.
  https://warcraftratings.com
  Cixi@Remulos (Classic Oceanic server)
  
  
RELEASE NOTES:
  - v1.0: 
    Basic list of players sending LFG requests in channels
	
  - v1.1: 
    Sound on open/close 
	Close button
	Minimap button
	Settings tab, options to show/hide minimap button, show a message on new group request parsed , play a sound on new group request parsed
	Changed Idle timeout to 5min
	Added this Readme file
	
  - v1.2
    Updated sounds
	2-pass parsing of request for better recognition of actual group requests
	Miscellaneous bucket for non-instance groups (Hogger!)
	Instance Level brackets
	Color coding for instances not in player's level bracket
	Settings option for color coding
	Updated /who request to return unique results
	Truncated request text to prevent time overlap
	Fixed issue with Scarlet Monastery requests all ending in SM:Graveyard
	Updated credits 
	
  - v1.3
    Made the frame moveable
	Color coding changed to have green and red for lower and higher instances
	fixed an issue where players were shown in "Temple of Ahn'Qiraj" instead of "Sunken Temple" 
	
  - v1.4 
    Fixed an issue with a missing lib  >.< sorry about that
	Externalized the search tags and instance names ta make them easy to localize
  
  - v1.5
	Fixed an issue where special characters in chat requests were being problematic
	Fixed an issue where the class icon would not appear on non english clients
	Added a setting to hide all request that are not level appropriate
	Removed a potential leak in frame creation
	
  - v1.6
    Requests listing several instances will now appear in the various instance lists (ex "LFG lib/cath")
	The chat command "/pug sound" now toggles the notification sound
	The Puggle window has been enlarged to fit more information
	Hovering a request now shows the full request message, as well as when the initial request was made, and when the last 'refresh' of this request was made
	Fixed an issue where the minimap button would reappear even when toggled off
	Chat alert messages now include the dungeon
	Several more special characted are now handled in requests (ex "LFG RFC? anyone?" will now correctly go under RDC, not Misc)
	There is a new setting option to change the sort order (newest request at the top or the bottom)
	A couple keybindings have been added (toggle UI, toggle notification sound)
	The "Idle Timeout" is now available in settings. You can configure how long a request stays before it gets cleaned up. Note, this idle timeout is reset whenever a refresh request (same player/dungeon) is received.

  - v1.7
     A new button has appeared in the settings, giving you the option to add/remove/translate/adjust your own search tags. 
	 The tags are still saved in your SavedVariables file, to make them easy to share with others if needed.
	 You can now disable the automatic /who request that retrieves class and level of players sending group requests. 
	 This was done as it can queue up at peak times and cause interference with other addons.
	 A "/who" button next to the chat requests is now available to send the /who request manually. This is only really applicable while the automatic /who is disabled. The button will show as disabled while the /who request is pending
	 Some group requests were creating duplicates under the same dungeon. This has been fixed.
	 Some players with unicode characters in their name could not be retrieved with /who. This has been fixed
	 Selecting "Only show level-appropriate requests" will now also filter out requests from players that are over or under 5 levels from yours. Obvisously this will only work once the level of the requester is known.
  
  - v1.8
	following a hotfix from Blizzard preventing /who commands to be called repeatedly b addon:
	The auto /who option has been removed
	The manual who button now has a cooldown of 10seconds.
	
  - v1.9
	A new option to select which dungeons to show can be found in the Settings, next to the dungeon name and tags. Untick the checkbox to skip those dungeons.
	Note that this setting is "Per character". All other settings are "Per Account"
	There are now 3 "User Defined" groupings you can use to define your own searches. For example you can make the addon flag all "LF enchanter" requests.


	