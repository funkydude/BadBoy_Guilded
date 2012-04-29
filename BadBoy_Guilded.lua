
local strfind = string.find
local savedID, result, triggers = 0, nil, {
	"wowstead",
	"guildlaunch",
	"enjin",
	"re[cq]ruit",
	"looking for.*join [ou][us]r?",--<> is Looking for Dedicated and skilled DPS and Healer classes to join us in the current 10 man  raids and expand to 25 man raids. Raids on mon,wed,thurs,sunday 21.00-24.00 18+
	"www.*apply", --pls go to www.*.com to apply or wisp me for extra info.
	"looking.*members", -- <<>> is a social levelling looking for all members no lvl requirement, Once we have more members were looking to do Raids and PvP premades, /w if you would like to join please or  /w me for info.
	"guild.*join", --<> is a lvling guild but as soon as we have enough 85 we will raid  we are here not 2 take the game 2 serously and 2 have fun if u wanna join wisper me or <> any lvl welcome :)
	"levell?in.*guild", --<> Easy Going Leveling Guild LFM of any levels, we are friendly, helpfull and have 6 guild tabs available.
	"apply.*www", --<> We Are Looking For people Item lvl 333+ for our25man Cataclysm Raiding team. Must Be over 18+ to Apply or Have some insane Skills. If you Got Any Questions Go to www.<>.net Or contact me or a officer.
	"gu?ilde?.*[/w][/w]", --<> is a newly formed social guild for all classes and levels. Our aim is to have fun and we hope to do raids when we are big enough. For any more info or an invite /w me. Thank You.
	"pvp.*pve.*wh?isper", --instead of joining solo and end up loosing with randoms. Ofcourse we group up for Random HCs with both PvP and PvE players aswell and if the PvE group need an extra player for the raid, PvP guys can get invited. Whisper me for more info.
	"looking for.*http", --<> Looking for: Resto shaman&Tank. You need skill, focus and patience to learn and pass the fights. If you want to clear bosses before the nerfs then this is the right place for you /w or go to http://<>.info
	"guild.*pst",--<> an adult guild looking for more players who are active ,like to have fun ,talk in vent & will help others. LVL 5 GUILD !we'd like fun people to enjoy the new content of CATA,all lvls, classes, races are welcome PST FOR MORE INFO/INVI
	"guild.*bank.*tabs", --Looking for a guild to relax after a hard day of work or school? <> is layed back and alota fun. We are a lev 7 guild and have 7 Guild Bank tabs. we have vent as well so stop by and check us out. come run some dungeons..
	"guild.*wh?isper m[ey]", -- <> is a layed-back social level 10  heroic/raiding guild. We organize a few heroics/raids a week and ALWAYS use teamspeak while doing so. Is this something you like to do? Whisper me!
	"looking.*strengthen.*raid", --<> is looking for, 1 ele sham, 1 balance druid, 1 holy pala,  to strengthen our raid teams for the current 10 man raids. Raids 21.00-24.00 Mon,Wed,Thurs,Sun. 349+ gear req age 18+
	"looking for.*/w.*info", --<><level10>Is looking for more people to start raiding with. We are in need of everything and dps needs to do atleast 10k+ dps and have atleast 345 Item level, /w me for an inv, or for more info
	"guild.*welcome", -->< is a new dungeon/raid guild we are setting up our raid/HC group. ofc every lvl is welcome in our guild but we preff 60-85 all classes/races. You also have to be an active player
	"guild.*looking", -->< raiding guild. (5/12) we are looking for exp/dedicated players for our 10mans. slowly moving into 25mans. must have a ilvl 350+ (need 1 tank, 2 ranged(pref. boomkin), 1 melee(pref enhance)
	"lookk?ing.*welcome", --<> is a lvl 11 recuiting for their 10man group, lookking for people with experiance with a min 348 ilvl (2ranged dps ) all other players are welcome we are 6/12 with cataclysm bosses - raid times are mon - thurs 8:00pm to 12:00am (midnight) Pst
	"raid.*%.com", --<> <lvl 23> has openings in its' 25 man raid group, Raids are Sunday - Thurs 9-12. see xyz.com for info
	"looking.*raidtimes.*/w", --Knixxs Order of the Darkside -  Lvl 25. We are on the lookout for Tanks and Healers for our raidteam. We are currently 5/12 and looking to progress further. Our raidtimes are: Wed, Thurs and Sunday, 21:15 realm time. For more info /w me. Thanks :)
	"social.*leveling.*looking", --<> <level 6> Is a social leveling looking for people to fill out raiding spots. Currently in need of dps and healers. Starting firelands trash runs & eventually boss runs.
	"looking.*player.*social", --<> (6) Looking for more players to set our first raiding team and also our first RBG team! We are looking for social players that is experienced of either Raiding or PvP. Whisper me if you want more information about us and our plans!
	"team.*looking.*raiders", --<> is trying to gather a exceptional raiding team to raid FL hc and DS, we are curently looking for skilled raiders who knows the bosses, have decent gear and have a fair amount of raiding exp, we raid Mondays and Thursday 20:00 - 23:00
	"looking for.*raid.*progress", --<> is currently looking for a Warlock ready for raiding DS10 HC. We're currently 5/8 HC and progressing every week. You have to know what you're doing and your gear must be ready to go tonight. We prefer Swedes
	"social.*looking.*join", --Hello there! :D  * (lvl25)  is looking for socials. We're looking for pvp, old raid, chat or leveling oriented ppl or ppl who like to chat. We got spots for social/alt raids aswell, if u like to raid. Fancy joining? /W me! hf :D
	"new.*guild.*rate", --<*> is a newly formed pvp guild, aiming to do rated bgs. No lvl requirement atm
	"need.*apply", --[*]  7/8 HC ,in need of 1x melee  DPS &1x range dps and 1x healer . exceptionals are always  welcome to apply @ *, com  , /w for more info

	--Swedish
	"rekryt", --<*> rekryterar. Vi söker aktiva spelare från Sverige och Norge. Vi är i behov av DPS (SPriest, Boomkin, DK) och en tank (warr, DK) med dps OS. Progress: 3/8 HC, raidar onsd, sön & mån 20-23. Socials är alltid välkomna!. /w för mer info
	"guild.*söker", -- *  är ett svenskt  LvL25  guild som nu söker nya members. Vi kör Dragon Soul 10-manna. Vi söker PvE till Raid, PvP:are till RBG:s och även sociala spelare som vill ha ett bra ställe att hänga på :)
	"guild.*folk.*whisp", --<*> Nystartad, svensk, seriös PvE-guild som satsar på att få in seriöst folk till våra 10-manna DS Heroics. Raidar fre 20-00 samt sön 19-22. Låter detta intressant så whispar DU mig för vidare information.

	--Finnish
	"kilta.*etsii", --*, Suomalainen PvE-kilta joka etsii vain pelaajia jotka osaavat liikkua tulesta ja joita kiinnostaisi raidata 10man DS normaalia ja heroiccia jatkossa, tähtäämme parempaan tasoon kuin suurin osa servun suomikilloista! /w jos kysyttävää
	"etsimme.*pelaajia.*yhteyttä", --<*> lvl 25 Progress DS 1/8 hc. Etsimme hc koitoksiin aktiivisia pelaajia. Erityiseti healerille on tarvetta. Myös 85 lvl sosiaalit on tervetulleita. Ota yhteyttä jos kiinnostuit.
	"etsii.*kilta", --<*> Etsii suomalaisia pelaajia joukkoonsa. Kilta on casual PvE/PvP/social. Kaikki ovat tervetulleita! Nyt haetaan pelaajia aloittamaan DS10 progress.
	"etsii.*ihmisiä.*progress", --[*] Etsii suomalaisia, raidaamisesta kiinnostuneita motivoituneita ihmisiä liittymään meidän HC Main-raid grouppiin. Nykyinen progress 5/8 Hc ja eteenpäin mennään.

	--German
	"sucht.*willkommen", --<> sucht für ihre 10er Raids Mi + Fr 19.30-23.00 (10/12) noch tatkräftige Unterstützung! Hirn, flinke Finger, wache Augen und ein sehr! gutes Klassenverständnis sind uns in jeder Klasse willkommen. [www.xyz.de]
	"such[et]n?.*%.de", --Die "" (Glvl5) suchen noch Mitglieder, egal ob groß oder klein, zum gemeinsamen leveln, Instanzen(und HC's)-, PvP- und später Cata-Raid erleben. Weitere Infos findet ihr auf [www.xyz.de]  Ts Vorhanden
	"such[et]n?.*gilde", --Hi wir suchen für unsere LvL-Gilde <>(Stufe 2) noch Member. Wir wollen zusammen Leveln und Instanzen laufen. Den 5% ep Bonus gibts auch dazu. Hast du lust? Dann melde dich bei mir :)
	"bewerbung.*www.*/w", --noch gute und zuverlässige Member für weitere 10er Stammgruppen später 25er.Gesucht werden:Heiler;Pala,Dudu - DD;Eule,Feral,Mage,Verstärker!Raidzeiten Mi,Do,So 19-22:30!Bewerbung unter [www.xyz.de] für Infos /w me
	"gu?ilde?.*pvp.*raid", --Die PvP und Twink Gilde <> sucht gute PvPler für gemeinsame Events,Raids und Bgs. Aufgenommen wird ab lvl.50! w me oder Geilertyp
	"gu?ilde?.*raid.*bank", --Die neue Gilde "<>" sucht noch nette Mitspieler zum Leveln, Questen, Raiden und Spaß haben. Ts³ und Gildenbank ist vorhanden.
	"gilde.*such[et]", --Moin, der lustige Haufen (Gilde) "<>" suchen noch ältere Spieler (22+) für Instanzen, Questen, Heros und 10er; Spielspaß ist dabei die absolute Mussbedingung! Wenn du dich angesprochen fühlst, schreib uns einfach mal:) [www.<>.de]
	"gilde.*inte?rr?esse", --Die Gilde <> sucht nette Mitspieler zum gemeinsamen questen, spass haben, heros abfarmen, pvp zocken usw... Sind keine raidgilde und wollen es auch nicht werden. Neuanfänger sowie lowlvl gerne willkommen. Intresse? pls w/m

	--French
	"recrute",

	--Turkish
	"ekibi.*oyuncu.*sosyal", --*/10m  5/8 HC  2. RAID ekibi için  390 ve üstü ilvl a sahip, raidlere düzenli takılabilecek HER CLASS VE SPECC ten oyuncu alımları yapılacaktır. Sosyal alımlarımız bulunmaktadır. Basvuru ıcın /w
	"guild.*aranıyor", --Guildimize beraber lvl kasmak isteyen arkadaşlar aranıyor. 1lvl %50 deyiz......
	--* [25] 5/8 HC  Progressimize Düzenli katilim saglayacan Heroic deneyimi olan Mage,Lock aramaktadir.Social alimi da gerceklestirilmektedir . Detayli bilgi icin /w
	"progres.*so[cs][iy]al", --* [25 Lvl]10M5/8 HC Progresimizi ilerletmeye yardimci olabilecek HC Tecrubesi olan Mage Lock sp alimi yapilacaktir. Ayrica sosyal alimimiz da vardir
	"progres.*arıyor", --* (25 lvl) 6/8 hc progress, Spine ve Madness progressine katkıda bulunabilecek online süresi yüksek yeterli gear ve oyunculuk seviyesine sahip 1 melee dps arıyor. Bilgi için /w
	"progres.*aran?maktadır", --*/10m  5/8 HC  ACIL OLARAK, PROGRESS ekibi için en az 3 boss HC deneyimi olan 395-400 arasında ilvl a sahip, raidlere düzenli takılabilecek ELEM SHMY, BLANCE DRUID ve LOCK oyuncular aranmaktadır. Basvuru ve bilgi icin /w.
	"progres.*guild", --8:30 da basliycak olan hc progresimize 1 burst dps gerek! guild run 6/8 hc progresimiz war Spine hc icin sabırlı 1 dps lazim ''*'' !!! Spine dan baslanıcak!!!
	"aran?maktadır.*progres", --*  - * yeni transfer olmustur ve suanki tier ve MOP icin kadrosuna classina hakim oyuncular aramaktadır ,Suanki 1/8 HC progressimiz devam ettirmek istiyoruz oncelikli Tank ve Healer alimi vardir.
	"guild.*raid.*oyuncu", --* guildi kurulmuş olan 25 man kadrosunu güçlendiriyor. Raidlere istekli katılacak, saygılı ve paylaşımı seven türk oyuncuları bekliyoruz. 
	"başvuru.*www", --Hurish Başvuru için lütfen "www.*.com" adresine giriş yaparak formu doldurunuz.

	--Hungarian
	"guild.*játékosokat keres", --* Guild játékosokat keres.Létszámtól függően Old Dungeon,RBG,Content Raid szervezése.Fejlödö szintü karaktereket is várunk.
}

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", function(_,event,msg,player,_,_,_,_,chanid,_,_,_,id)
	if id == savedID then return result else savedID = id end --Incase a message is sent more than once
	if chanid == 0 or chanid == 25 then result = nil return end --Don't scan custom channels or GuildRecruitment channel
	if not CanComplainChat(id) or UnitIsInMyGuild(player) then result = nil return end --Don't filter ourself/friends
	msg = (msg):lower() --Lower all text, remove capitals
	for i = 1, #triggers do
		if strfind(msg, triggers[i]) then --Found a match
			result = true
			if BadBoyLogger then BadBoyLogger("Guilded", event, player, msg) end
			return true --found a trigger, filter
		end
	end
	result = nil
end)


local whispers = {
	"would.*join my.*guild", --Would you like to join my social raiding guild?.. lv1 but it will grow fast with your help :D and lottery. u can win 50g a week. MORE later!!
	"would.*join our.*guild", --Would you like to join our guild ? if you join We will pay your all repair costrs...
	"would.*join a.*guild", --Would You Like To Join a New Guild ? Help us Grow. That Will Give You Free Repair When You Reach Lvl 5! wen you reach 85 u will Get 2000g
	"would.*join.*social.*guild", --Hello <>,how are you? would you like to join <> a newly created socialplayer guild!
	"want.*join.*social.*guild", --hey m8 u want to join in 14 level social guild with 10% more xp from quest and 30 gold every day free repair??
	"invite.*social.*guild.*join", --Hello *! You have been invited to * a newly founded social guild, hope you join! Cant wait to see you!:)
	"wanna.*join.*guild.*le?ve?l", --Heya wanna join Guild * lvl 25 for faster lvling? :)
	"hello.*intere?sted.*join.*guild", --Hello,  intersted in joining a guild? :)

	"looking for.*members.*join", --Hello, <> is looking for more members to join our ranks, we are both recruiting socials/levelers and raiders for our raiding team! We would like you, <>, to join our ranks.
	"raid.*guild.*looking for", --Social casual raiding Guild 8/8 <> is looking for raiders for our DS run, we are in need of 3 healers. perfer with os dps. our main raidday is wednesday...
	"recruit.*member.*join", --<> is recruiting members. We raid,quest and dungeon together feel free to join.

	"social guild.*wh?ant.*players", --Hello. Were a social guild that whants to help new players to get better. In oure stab we have a Raid Leader from the guild <> and a member of the guild. With good experience from DS and been playing Since TBC. And we whant to help you to get better !
	"guild.*recruit.*social", --Hello, were a lvl 2 guild looking to recruit members of all lvl's.We're a social guild looking for members to help us reach lvl 25
	"new.*social guild.*repair", --Greetings <>! <> is a newly started social guild where you have a possibility to advance into high-end content. We'll soon be providing with guild repairs as well as hosting events! Come, take part of the community! We have 10% XP, REP an
	"join.*guild.*member", --Hi * , please join our Level 15 guild for for weekly raids & rbgs and %10 extra XP. We do dungeon runs to help our low level members too.

	"guild.*please come.*bonus", --Our guild have %10 xp %10 Mount Speed and % 100 Spirit speed boost please come and lvl at our guild if you hit from 80 lvl to 85 lvl while in this guild you will get a bonus 1.5 k gold
	"join.*community.*gbank", --Hello <> Come And Join <> now and be part of a fast growing community we have a Gbank :) we may be lvl 1 but we are aiming high for the sky and thats why we need you
	"%d.*perks.*social.*guild", --<> 6/8 HC DS , Take advatage of our perks and socials lvl 25 guild.
	"guild.*friendly.*player.*repair", --Hey, we are a levelling guild that plans to be very friendly and reward our players for helping the guild. We will provide higher rewards for pro-active players. Once the guild properly starts guild repairs will be provided for everyone. Give us a shot!!
	"new.*guild.*casual.*raid", --* is a new started Guild, that will be a Casual guild from the start. But when we get peoples we will start doing Rbg, Raids etc. On a casual level
	"recruit.*player.*raid.*whisp", --"*" now recruiting new players! Need all classes and all specs! Ready for raiding, but we just need the people, Whisper for more! Levelers and pvpers welcome!
	"social guild.*member.*join", --Hello *. * (25) is a  social guild with 900+ members join us and have fun
	"guild.*invite.*boost.*join", --THIS IS THE BEST GUILD YOU'LL EVER BE INVITED TO, SO GO ON AND DO WHAT YOU KNOW YOU MUST DO ......... accept the [invite] ;) plus there's a 10% exp boost for joining :P
	"guild.*recruit.*faster", --Hi! * <<*>> is the BEST Guild in THE WORLD and WE are recruiting YOU cause YOU PWN, does that make sense?? - NO... but who cares? (((( 5% xp bonus (soon 10%) and 10% faster mount))))
	"recruit.*player.*social", --Hello *, * is recruiting players of all levels and skills as socials along with end game experienced raiders for our newly formed friendly guild, english speaking mature players, click accept now to join :)
	"guild.*join.*repair", --Hello *, sorry to bother you but * is a lvl 25 guild and is the biggest growing guild on the server! Join us and gain Guild Repair and 10% more XP, Honor and Justice Points! We have hundreds of level 85 characters already!
	"guild.*looking.*member", --<*> is a level 3 guild looking for members. Come enjoy [Fast Track], [Mount Up] and more!
	"recr?uit.*casual.*repair", --<*> is now recuiting! We are a casual and fun guild atm but will focus on both PvE and PvP when the time is right! We want you who is active and like to play much! We will soon have guild repair and a open guildbank!
	"want.*friendly.*pv[pe].*environment", --Do you want to a friendly environment with both PvE and PvP events every week. We are altso capable of helping with your character. "specc - gemming and how to optimize your dps/healing. We hope you will find our environment suited for you!
	"social.*le?ve?l.*guild", --* Its only for the sirs of sirs so if you think your sir enough for the sirs of sirs then whisper the best sir of sirs (me) and join the soon to be best social,leveling,questing,SIRING,raiding,pvping guild EVER!! .......Like a Sir!
}

ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", function(_,event,msg,player)
	if not BADBOY_GWHISPERS or not CanComplainChat(player) or UnitIsInMyGuild(player) then return end --Don't filter ourself/friends
	msg = (msg):lower() --Lower all text, remove capitals
	for i = 1, #whispers do
		if strfind(msg, whispers[i]) then --Found a match
			if BadBoyLogger then BadBoyLogger("Guilded", event, player, msg) end
			return true --found a trigger, filter
		end
	end
end)

