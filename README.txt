649-Patch
=========

NOTE: This is a ROM BASE, not a hack. You cannot catch 649 Pokémon in this hack. It is a base that allows hackers to create hacks with all 649 in it. HOWEVER. THIS PATCH IS STILL IN BETA AND IS HIGHLY UNSTABLE. This patch is only available for testing purposes at this point. If any hacks are made with it, I will personally request their removal.



Stuff from Jambo's thread on PC that I really don't want to type again:


Included in this patch:

*Extended Pokédex* - All Pokémon currently available (as of 22/11/2011) are included in the patch - cries, sprites and all.
*New Moves* - All moves currently available are included.
*New Abilities* - All abilities currently available are included.
*Extra TMs* - Added 45 new and extra TMs. Changed all TMs to match Gen V's set.
*Formes* - Yes, that's right. Formes are possible using this patch.
*Extra Items* - Added an extra 300 items to the game. No more worrying about replacing existing items!
*Extra Direct Music Tracks* - OK, not strictly part of the extension. But nice to have anyway, no? Now have 12 direct tracks available instead of the standard measly 5.
*Random Double Wild Battles* - There will be a chance of any grass location to randomly produce a double wild battle. This can be increased or decreased in likelihood or stopped altogether if wanted.
*Proper Regional Pokédexes* - The ability to create and use a custom regional Pokédex on FireRed. Included in this is the ability to have new generation Pokémon evolve without needing the National Pokédex.
*New Physical/Special Split* - Avoids the pitfalls of the older system by simply replacing one small part of the existing system, instead of the whole thing.
*Black/White Experience Gain System* - That's right. I've added the experience gain formula from Pokémon Black/White to my ROM. I don't even force you to use it, if you don't want to! It's deactivatable/activatable with the simple setting of a flag.
*Decapitalisation*- The ROM doesn't shout at you any more!
*Hidden Abilities* - It is possible to define a condition within your ROM which will give any Pokémon caught which meet this condition their hidden ability.

*To deactivate the BW Exp System (but still have Exp Gain), simply set flag 0x8D0. To disable Exp Gain altogether, set flag 0x8D1.*
~Flag 0x8D1 takes precedence, so if you set flag 0x8D1, you won't get any experience from either exp system. If you set flag 0x8D0, the game willl revert to its standard Gen 1-4 exp system. If you clear both flags, the game will use my new BW Exp System.


*Useful Stuff for testers:*
-All are found in the root of the Master branch.-

~>stditems.rbh
~>stdpoke.rbh
~>INI
(This INI is for PGE, but it should contain most (if not all) of the relevant pointers/data.)






How to change Rotom's Forme:
----------------------------

You will need 1 script each for each of Rotom's formes, or a clever combination of scripts - I don't care which. The core part of what you need to do is have this script accessed by your calling script:

*Example:*

#dynamic 0xB2A000
 
#org @main
lock
special 0x9F
waitstate
setvar 0x8005 [WHICH FORME YOU WANT]
callasm 0x08755E31
compare LASTRESULT 0x1
if 0x1 goto @failed
end

#org @failed
msgbox @itfailed 0x4
closeonkeypress
end
 
#org @itfailed
= You did not select a Rotom.


The forme IDs are listed in std.rbh, so that you only need to remember this following set of values, rather than the actual hex values:
FORME_HEATROTOM
FORME_WASHROTOM
FORME_FROSTROTOM
FORME_FANROTOM
FORME_MOWROTOM





How Basculin Works:
-------------------
Currently, the code randomly picks one of the 2 striped forms when generating a Basculin. This should apply to both trainer battles and wild battles. Should you only want one to appear in your game, but still be able to support the "other" Basculin being shown, do the following hex edits:

087669F8: XX 20
087669FA: 00 00

Where the XX is:
00 - Red Striped Basculin
01 - Blue Striped Basculin

If you do this, only the Basculin you chose will ever be generated in your hack, but should the need arise for the "other" to be shown, it will still work perfectly well.




How Burmy Works:
----------------
When a Burmy is GENERATED, the game checks what type of terrain you are in. It switches the cloak based on this. Captured Burmies are NOT yet capable of switching cloak. The distinct Burmies CAN be caught if you encounter (and capture) them. I have not yet tested it, but it should carry this cloak into its evolution into Wormadam. Obviously, it loses it if evolving into Mothim.






Jambo51's Credits:
Myself (Jambo51) - (Original) Creater/Owner of the patch.
LinkandZelda - For listening to me spout absolute rubbish, for keeping me focussed when my mind wandered and most importantly, for urging me to keep going when I hit a game killing bug. He was also indirectly responsible for the addition of a couple of other little things, by asking me for help with LC.
Diegoisawesome - For being insanely patient with me while I developed this.
NintendoBoyDX - For finding a list of potential limiters for me to check (among other things).
Gamer2020 - For his wonderful PGE tool, and for listening to me talking absolute rubbish about my ideas for the patch, and for explaining how the addition of new moves worked.
knizz - His guidance led me to the finding of the seen/caught flags, a major (if invisible) part of this hack and a lot of my knowledge is built on knizz's discoveries.
HackMew - His short, but very sweet, tutorial on ASM, as well as all the other wonderful things he's achieved/released since (and before as well) I came to PC. I've always strived to be a bit like HackMew. His small hack to make the field effects of Magma Armour/Flame Body work is included too, so credit to HackMew for the routine.
JPAN - Most of my routines are built in the same style as JPAN's because it was what I looked at to gain a comprehension of the code. A few of my routines are extensions of his in many ways. For the save block hack as well - without it, this patch could not exist.
Prime_Dialga - For his wonderful DNS tool, and for letting me include it in the patch as standard.
WesleyFG, ChaosRush, Miyuki, Ingrid, Icy and Wiznatts - For the 4th and 5th Generation sprites included in the upcoming version of the hack. Thanks guys! The new sprites look so much better!
dudedude1 / Speedster and link12552 - For inserting the footprints for me!
Darthatron - For working out how to show the category images, and for sharing that code. Also for sharing the physical/special split code. Thanks man!
crowlover - For finding so many little bugs and issues and reporting them to me. Helped massively!
LCCoolJ95 - All the movesets and TM/HM Learnsets 


karatekid552's Credits:
mrdollsteak - Move animations and custom particle research
doesntknowhowtoplay - Move animations, finding the new type chart
