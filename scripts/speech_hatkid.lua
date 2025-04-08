-- Hat Kid speech file. I didn't feel like writing all 5000 lines or however many there are,
-- so these ones are based on Webber's speech file, modified to remove his specifics.
-- I chose Webber since his dialogue is more playful, which is more in line with Hat Kid's personality than anyone else in the cast

-- References specific to spiders, being multiple beings, family, being a monster, and a few other things have been replaced.
-- Additionally, some only_used_by_wanda lines have been written, since Hat Kid can use Wanda's pocketwatch items.

return{
	ACTIONFAIL =
	{
        GENERIC =
        {
            ITEMMIMIC = "Aw, I guessed wrong!",
        },

		ACTIVATE =
		{
			LOCKED_GATE = "Aww. I want in there.",
            HOSTBUSY = "He looks pretty busy, I can come back later.",
            CARNIVAL_HOST_HERE = "I'm pretty sure I saw him over here.",
            NOCARNIVAL = "Aww, did all the birds leave?",
			EMPTY_CATCOONDEN = "No one's home...",
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDERS = "It'll be more fun with more kitcoons.",
			KITCOON_HIDEANDSEEK_NOT_ENOUGH_HIDING_SPOTS = "It's okay, but maybe I can find a place with more hiding spots.",
			KITCOON_HIDEANDSEEK_ONE_GAME_PER_DAY = "That was fun! Can I play again tomorrow?",
            MANNEQUIN_EQUIPSWAPFAILED = "Actually, maybe I'll just keep it instead.",
            PILLOWFIGHT_NO_HANDPILLOW = "I need a pillow first!",
            NOTMYBERNIE = "Bernie still wants to play!",
            NOTMERM = "They don't listen to me!",
            NOKELP = "only_used_by_wurt",
--fallback to speech_wilson.lua             HASMERMLEADER = "only_used_by_wurt",
		},
        APPLYMODULE =
        {
            COOLDOWN = "only_used_by_wx78",
            NOTENOUGHSLOTS = "only_used_by_wx78",
        },
        APPRAISE =
        {
            NOTNOW = "Aw, looks like he's busy.",
        },
        ATTUNE =
        {
            NOHEALTH = "I don't feel so good right now. Maybe later?",
        },
        BATHBOMB =
        {
            GLASSED = "There's too much glass in the way.",
            ALREADY_BOMBED = "Aw, I wanted to do it!",
        },
        BEDAZZLE =
        {
            BURNING = "Aaah!",
            BURNT = "There isn't really much left to decorate...",
            FROZEN = "Hmm it might be hard to get my decorations to stick to ice...",
            ALREADY_BEDAZZLED = "I think I already decorated it pretty good.",
        },
        BEGIN_QUEST =
        {
            ONEGHOST = "only_used_by_wendy",
        },
        BUILD =
        {
            MOUNTED = "All my arms can't quite reach from up here.",
            HASPET = "I like the pet I've got.",
			TICOON = "I'm good with just one guide.",
            BUSY_STATION = "I have to wait my turn.",
        },
        CARNIVALGAME_FEED =
        {
            TOO_LATE = "Aw, I wasn't fast enough.",
        },
		CAST_POCKETWATCH =
		{
			GENERIC = "It'd be too risky.",
			REVIVE_FAILED = "It looks like I was too late...",
			WARP_NO_POINTS_LEFT = "That's enough backtracking for now.",
			SHARD_UNAVAILABLE = "Huh? I guess it won't work for now.",
		},
		CAST_SPELLBOOK =
		{
--fallback to speech_wilson.lua 			NO_TOPHAT = "only_used_by_waxwell",
		},
		CASTAOE =
		{
--fallback to speech_wilson.lua 			NO_MAX_SANITY = "only_used_by_waxwell",
            NOT_ENOUGH_EMBERS = "only_used_by_willow",
            NO_TARGETS = "only_used_by_willow",
            CANT_SPELL_MOUNTED = "only_used_by_willow",
            SPELL_ON_COOLDOWN = "only_used_by_willow",
			NO_BATTERY = "only_used_by_winona",
			NO_CATAPULTS = "only_used_by_winona",
		},
        CASTSPELL =
        {
            TERRAFORM_TOO_SOON = "only_used_by_wurt",
        },
        CHANGEIN =
        {
            GENERIC = "Not right now, I'm comfy.",
            BURNING = "Woah! Hot fashions!",
            INUSE = "I'll give them some privacy while they change.",
            NOTENOUGHHAIR = "Maybe once the fur grows back.",
            NOOCCUPANT = "Once I've got a beefalo hitched up, I can make them fancy!",
        },
        CHARGE_FROM =
        {
            NOT_ENOUGH_CHARGE = "only_used_by_wx78",
            CHARGE_FULL = "only_used_by_wx78",
        },
		COMPARE_WEIGHABLE =
		{
            FISH_TOO_SMALL = "This little guy's too small!",
            OVERSIZEDVEGGIES_TOO_SMALL = "I'll have to get a bigger veggie, or maybe a fruit!",
		},
        CONSTRUCT =
        {
            INUSE = "Aw, I don't wanna mess up someone else's stuff.",
            NOTALLOWED = "It doesn't go there.",
            EMPTY = "I need stuff to build with.",
            MISMATCH = "I don't think these are the right plans.",
            NOTREADY = "Everything's too scary right now!",
        },
        COOK =
        {
            GENERIC = "I can't even",
            INUSE = "Ooo, make something tasty!",
            TOOFAR = "I should get closer!",
        },
		DISMANTLE =
		{
			COOKING = "I can't, it's still cooking!",
			INUSE = "Oops. Someone else is using that.",
			NOTEMPTY = "There's still stuff inside!",
        },
        DISMANTLE_POCKETWATCH =
        {
            ONCOOLDOWN = "Just a little longer...",
        },
        DRAW =
        {
            NOIMAGE = "But what should I draw?!",
        },
        ENTER_GYM =
        {
--fallback to speech_wilson.lua             NOWEIGHT = "only_used_by_wolfang",
--fallback to speech_wilson.lua             UNBALANCED = "only_used_by_wolfang",
--fallback to speech_wilson.lua             ONFIRE = "only_used_by_wolfang",
--fallback to speech_wilson.lua             SMOULDER = "only_used_by_wolfang",
--fallback to speech_wilson.lua             HUNGRY = "only_used_by_wolfang",
--fallback to speech_wilson.lua             FULL = "only_used_by_wolfang",
        },
        FILL_OCEAN =
        {
            UNSUITABLE_FOR_PLANTS = "Ms. Wickerbottom says that salt water is bad for plants.",
        },
        FISH_OCEAN =
		{
			TOODEEP = "I can't reach the fish with this rod!",
		},
        GIVE =
        {
            GENERIC = "Nope, don't think so!",
            DEAD = "Um. I should probably keep it.",
            SLEEPING = "Aww... It's sleepy-snoozy right now!",
            BUSY = "I can try again when it's finished.",
            ABIGAILHEART = "Wendy would've been so happy if it worked.",
            GHOSTHEART = "I don't think I even want them to come back.",
            NOTGEM = "It doesn't fit right!",
            WRONGGEM = "I'd rather keep this one for myself.",
			NOGENERATORSKILL = "I'd rather keep this one for myself.",
            NOTSTAFF = "I think that'd make it angry.",
            MUSHROOMFARM_NEEDSSHROOM = "It needs a mushroom!",
            MUSHROOMFARM_NEEDSLOG = "It needs a special kind of log!",
            MUSHROOMFARM_NOMOONALLOWED = "I don't think they're going to grow.",
            SLOTFULL = "I didn't know your pockets were full, sorry!",
            FOODFULL = "It's still working on the first one.",
            NOTDISH = "I don't think I should offer that.",
            DUPLICATE = "I don't need two!",
            NOTSCULPTABLE = "I... don't know about that one.",
--fallback to speech_wilson.lua             NOTATRIUMKEY = "It's not quite the right shape.",
            CANTSHADOWREVIVE = "It's not waking up.",
            WRONGSHADOWFORM = "I put the bones together wrong.",
            NOMOON = "Doesn't work. I probably need to see the moon or something.",
			PIGKINGGAME_MESSY = "I need to clean up before I can play.",
			PIGKINGGAME_DANGER = "Lets wait until the danger passes before I play.",
			PIGKINGGAME_TOOLATE = "It's too close to bedtime to start another game.",
			CARNIVALGAME_INVALID_ITEM = "Hmm, it doesn't want that.",
			CARNIVALGAME_ALREADY_PLAYING = "I'm playing next!",
            SPIDERNOHAT = "There's not enough room, I don't want to squish them by accident!",
            TERRARIUM_REFUSE = "Maybe I can give it something else?",
            TERRARIUM_COOLDOWN = "I'll wait for the little tree to come back first!",
            NOTAMONKEY = "Sorry, neither of me speak monkey.",
            QUEENBUSY = "She looks pretty busy... maybe I'll just wait.",
        },
        GIVE_TACKLESKETCH =
		{
			DUPLICATE = "I don't need two!",
        },
        GIVETOPLAYER =
        {
            FULL = "Hey! Make room!",
            DEAD = "Um. I should probably keep it.",
            SLEEPING = "Aww... They're getting their snoozies right now!",
            BUSY = "I have something for you!",
        },
        GIVEALLTOPLAYER =
        {
            FULL = "Hey! Make room!",
            DEAD = "Um. I should probably keep it.",
            SLEEPING = "Aww... They're getting their snoozies right now!",
            BUSY = "I have something for you!",
        },
        HARVEST =
        {
            DOER_ISNT_MODULE_OWNER = "I don't think Jimmy wants to play.",
        },
        HEAL =
        {
            NOT_MERM = "It won't work on me.",
        },
        HERD_FOLLOWERS =
        {
            WEBBERONLY = "Okay everybody, follow me!",
        },
        HITCHUP =
        {
            NEEDBEEF = "I don't have a beefalo to hitch up.",
            NEEDBEEF_CLOSER = "My beefalo is too far away!",
            BEEF_HITCHED = "My beefalo isn't going anywhere.",
            INMOOD = "I think they're a bit too cranky for that right now.",
        },
		LOOKAT = --fail strings for close inspection
		{
			-- Winona specific
--fallback to speech_wilson.lua 			ROSEGLASSES_INVALID = "only_used_by_winona",
--fallback to speech_wilson.lua 			ROSEGLASSES_COOLDOWN = "only_used_by_winona",
--fallback to speech_wilson.lua             ROSEGLASSES_DISMISS = "only_used_by_winona",
--fallback to speech_wilson.lua             ROSEGLASSES_STUMPED = "only_used_by_winona",
			--
		},
        LOWER_SAIL_FAIL =
        {
            "I never did much sailing back home.",
            "Ouchie! The rope burned my hands!",
            "I almost had it!",
        },
        MARK =
        {
            ALREADY_MARKED = "I'm pretty sure I picked the right one!",
            NOT_PARTICIPANT = "I can't play without entering a beefalo in the contest.",
        },
        MOUNT =
        {
            TARGETINCOMBAT = "It's too angry!",
            INUSE = "I didn't climb into the saddle in time!",
			SLEEPING = "Oops, were you sleeping?",
        },
        OCEAN_FISHING_POND =
		{
			WRONGGEAR = "I think I should use a different fishing rod.",
		},
		OPEN_CRAFTING =
		{
            PROFESSIONALCHEF = "Warly gets upset when I play with his things.",
			SHADOWMAGIC = "I don't think I should play with that...",
		},
        PICK =
        {
            NOTHING_INSIDE = "I found nothing inside!",
        },
        PICKUP =
        {
			RESTRICTION = "I don't want to use that.",
			INUSE = "Oops. Someone else is using that.",
            NOTMINE_SPIDER = "Oh! I'm sorry, you looked like a friend of a friend.",
            NOTMINE_YOTC =
            {
                "Whoops! Wrong Carrat!",
                "They all look kind of similar...",
            },
			NO_HEAVY_LIFTING = "I might be able to manage it... if I was just a bit stronger.",
            FULL_OF_CURSES = "I think I've had enough of these bracelets.",
        },
        PLANTREGISTRY_RESEARCH_FAIL =
        {
            GENERIC = "I already know everything about this plant!",
            FERTILIZER = "There's nothing else I need to know.",
        },
        POUR_WATER =
        {
            OUT_OF_WATER = "Oops, out of water!",
        },
        POUR_WATER_GROUNDTILE =
        {
            OUT_OF_WATER = "Aw, I'm all out of water.",
        },
        --wickerbottom specific action
--fallback to speech_wilson.lua         READ =
--fallback to speech_wilson.lua         {
--fallback to speech_wilson.lua             GENERIC = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             NOBIRDS = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             NOWATERNEARBY = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             TOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             WAYTOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             NOFIRES =       "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             NOSILVICULTURE = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             NOHORTICULTURE = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             NOTENTACLEGROUND = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             NOSLEEPTARGETS = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             TOOMANYBEES = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             NOMOONINCAVES = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua             ALREADYFULLMOON = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua         },
		REMOTE_TELEPORT =
		{
			NOSKILL = "only_used_by_winona",
			NODEST = "only_used_by_winona",
		},
        REMOVEMODULES =
        {
            NO_MODULES = "only_used_by_wx78",
        },
        REPAIR =
        {
            WRONGPIECE = "This two piece puzzle sure is hard!",
        },
        REPLATE =
        {
            MISMATCH = "Hmmm... I think I need a different dish for this.",
            SAMEDISH = "I already put this on a dish.",
        },
        ROW_FAIL =
        {
            BAD_TIMING0 = "I need to paddle at the right time!",
            BAD_TIMING1 = "Whoops! One more time!",
            BAD_TIMING2 = "Row row row your boat... maybe a bit better next time.",
        },
		RUMMAGE =
		{
			GENERIC = "That's off-limits.",
			INUSE = "It's okay, I can wait for you to finish!",
            NOTMASTERCHEF = "Warly gets upset when I play with his things.",
            NOTAMERM = "I don't think I'm allowed.",
		},
        SADDLE =
        {
            TARGETINCOMBAT = "It's too angry!",
        },
		SHAVE =
		{
			AWAKEBEEFALO = "That would be stupid.",
			GENERIC = "It's not shaving time!",
			NOBITS = "Clean as a whistle.",
--fallback to speech_wilson.lua             REFUSE = "only_used_by_woodie",
            SOMEONEELSESBEEFALO = "I shouldn't do that to someone else's beefalo.",
		},
        SING_FAIL =
        {
--fallback to speech_wilson.lua             SAMESONG = "only_used_by_wathgrithr",
        },
        SLAUGHTER =
        {
            TOOFAR = "Aw, it got away.",
        },
        START_CARRAT_RACE =
        {
            NO_RACERS = "I need to find some Carrats!",
        },
		STORE =
		{
			GENERIC = "All full!",
			NOTALLOWED = "That's against the rules.",
			INUSE = "Are you finding everything okay in there?",
            NOTMASTERCHEF = "Warly gets upset when I play with his things.",
		},
        TEACH =
        {
            --Recipes/Teacher
            KNOWN = "I'm pretty sure one of me knows that one.",
            CANTLEARN = "Ms. Wickerbottom will have to explain this one.",

            --MapRecorder/MapExplorer
            WRONGWORLD = "Is it upside down? Nope. It's just wrong.",

			--MapSpotRevealer/messagebottle
			MESSAGEBOTTLEMANAGER_NOT_FOUND = "I should wait until I get outside.",--Likely trying to read messagebottle treasure map in caves

            STASH_MAP_NOT_FOUND = "Hey... there's no \"X\" on this map!",-- Likely trying to read stash map  in world without stash                  
        },
		TELLSTORY =
		{
			GENERIC = "only_used_by_walter",
--fallback to speech_wilson.lua 			NOT_NIGHT = "only_used_by_walter",
--fallback to speech_wilson.lua 			NO_FIRE = "only_used_by_walter",
		},
		UNLOCK =
        {
--fallback to speech_wilson.lua             WRONGKEY = "I can't do that.",
        },
        UPGRADE =
        {
            BEDAZZLED = "But I made it look so nice! I should keep it the way it is.",
        },
        USEITEMON =
        {
            --GENERIC = "I can't use this on that!",

            --construction is PREFABNAME_REASON
            BEEF_BELL_INVALID_TARGET = "I'm pretty sure it's not meant for that.",
            BEEF_BELL_ALREADY_USED = "That's someone else's friend.",
            BEEF_BELL_HAS_BEEF_ALREADY = "I already have a beefalo of my own!",
        },
		USEKLAUSSACKKEY =
        {
            WRONGKEY = "That doesn't go there!",
            KLAUS = "It's too dangerous!",
			QUAGMIRE_WRONGKEY = "Aw... It's the wrong one.",
        },
        WRAPBUNDLE =
        {
            EMPTY = "But what should I wrap up?",
        },
        WRITE =
        {
            GENERIC = "I can't write on that now.",
            INUSE = "I'll get my crayons ready while they finish up!",
        },
        YOTB_STARTCONTEST =
        {
            DOESNTWORK = "Anybody there? Guess not...",
            ALREADYACTIVE = "Maybe there's another contest going on somewhere else?",
        },
        YOTB_UNLOCKSKIN =
        {
            ALREADYKNOWN = "Hey, I already have that one!",
        },
		CARVEPUMPKIN =
		{
			INUSE = "Aww, I have to wait my turn.",
			BURNING = "Ouch! Fire!",
		},
		DECORATESNOWMAN =
		{
			INUSE = "I have to wait my turn.",
			HASHAT = "I can't cover the hat.",
			STACKEDTOOHIGH = "It's so tall already!",
			MELTING = "Aww. It's going to melt!",
		},
    },

	ANNOUNCE_CANNOT_BUILD =
	{
		NO_INGREDIENTS = "I don't have enough stuff!",
		NO_TECH = "I'm not sure how to make that yet...",
		NO_STATION = "I can't make that right now.",
	},

	ACTIONFAIL_GENERIC = "Nope, nuh uh.",
	ANNOUNCE_BOAT_LEAK = "The boat is crying!",
	ANNOUNCE_BOAT_SINK = "I'm too young to drown!",
    ANNOUNCE_PREFALLINVOID = "I should get out of here!",
	ANNOUNCE_DIG_DISEASE_WARNING = "Doesn't that feel better!", --removed
	ANNOUNCE_PICK_DISEASE_WARNING = "Yuck!", --removed
	ANNOUNCE_ADVENTUREFAIL = "Play time is over.",
    ANNOUNCE_MOUNT_LOWHEALTH = "My hairy friend is hurt!",

    --waxwell and wickerbottom specific strings
--fallback to speech_wilson.lua     ANNOUNCE_TOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua     ANNOUNCE_WAYTOOMANYBIRDS = "only_used_by_waxwell_and_wicker",
--fallback to speech_wilson.lua     ANNOUNCE_NOWATERNEARBY = "only_used_by_waxwell_and_wicker",

	--waxwell specific
--fallback to speech_wilson.lua 	ANNOUNCE_SHADOWLEVEL_ITEM = "only_used_by_waxwell",
--fallback to speech_wilson.lua 	ANNOUNCE_EQUIP_SHADOWLEVEL_T1 = "only_used_by_waxwell",
--fallback to speech_wilson.lua 	ANNOUNCE_EQUIP_SHADOWLEVEL_T2 = "only_used_by_waxwell",
--fallback to speech_wilson.lua 	ANNOUNCE_EQUIP_SHADOWLEVEL_T3 = "only_used_by_waxwell",
--fallback to speech_wilson.lua 	ANNOUNCE_EQUIP_SHADOWLEVEL_T4 = "only_used_by_waxwell",

    --wolfgang specific
--fallback to speech_wilson.lua     ANNOUNCE_NORMALTOMIGHTY = "only_used_by_wolfang",
--fallback to speech_wilson.lua     ANNOUNCE_NORMALTOWIMPY = "only_used_by_wolfang",
--fallback to speech_wilson.lua     ANNOUNCE_WIMPYTONORMAL = "only_used_by_wolfang",
--fallback to speech_wilson.lua     ANNOUNCE_MIGHTYTONORMAL = "only_used_by_wolfang",
    ANNOUNCE_EXITGYM = {
--fallback to speech_wilson.lua         MIGHTY = "only_used_by_wolfang",
--fallback to speech_wilson.lua         NORMAL = "only_used_by_wolfang",
--fallback to speech_wilson.lua         WIMPY = "only_used_by_wolfang",
    },

	ANNOUNCE_BEES = "Flying ouchies!",
	ANNOUNCE_BOOMERANG = "It hurts me when I don't catch it.",
	ANNOUNCE_CHARLIE = "Is somebody there?!",
	ANNOUNCE_CHARLIE_ATTACK = "Aah! Monsters in the dark!",
--fallback to speech_wilson.lua 	ANNOUNCE_CHARLIE_MISSED = "only_used_by_winona", --winona specific
	ANNOUNCE_COLD = "Brrr...",
	ANNOUNCE_HOT = "Hot as peck!",
	ANNOUNCE_CRAFTING_FAIL = "I'm missing something.",
	ANNOUNCE_DEERCLOPS = "That sounded like a big meanie.",
	ANNOUNCE_CAVEIN = "I think the sky is falling!",
	ANNOUNCE_ANTLION_SINKHOLE =
	{
		"The ground's giving way!",
		"It's rumble-y!",
		"What's that?",
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "For you!",
        "Maybe it'll be happier now.",
        "I hope you like my tribute!",
	},
	ANNOUNCE_SACREDCHEST_YES = "It likes me!",
	ANNOUNCE_SACREDCHEST_NO = "But those were presents!",
    ANNOUNCE_DUSK = "Almost time for bed.",

    --wx-78 specific
--fallback to speech_wilson.lua     ANNOUNCE_CHARGE = "only_used_by_wx78",
--fallback to speech_wilson.lua 	ANNOUNCE_DISCHARGE = "only_used_by_wx78",

    -- Winona specific
--fallback to speech_wilson.lua     ANNOUNCE_ROSEGLASSES = 
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_winona",
--fallback to speech_wilson.lua         "only_used_by_winona",
--fallback to speech_wilson.lua         "only_used_by_winona",
--fallback to speech_wilson.lua     },
    ANNOUNCE_CHARLIESAVE = 
    {
        "only_used_by_winona",
    },
	ANNOUNCE_ENGINEERING_CAN_UPGRADE = "only_used_by_winona",
	ANNOUNCE_ENGINEERING_CAN_DOWNGRADE = "only_used_by_winona",
	ANNOUNCE_ENGINEERING_CAN_SIDEGRADE = "only_used_by_winona",

	ANNOUNCE_EAT =
	{
		GENERIC = "Yummy in my tummy!",
		PAINFUL = "My tummy hurts.",
		SPOILED = "Past its date.",
		STALE = "That wasn't a very fresh snack.",
		INVALID = "That doesn't look like food to me.",
        YUCKY = "I can't, I won't, I refuse to eat that.",

        --Warly specific ANNOUNCE_EAT strings
--fallback to speech_wilson.lua 		COOKED = "only_used_by_warly",
--fallback to speech_wilson.lua 		DRIED = "only_used_by_warly",
--fallback to speech_wilson.lua         PREPARED = "only_used_by_warly",
--fallback to speech_wilson.lua         RAW = "only_used_by_warly",
--fallback to speech_wilson.lua 		SAME_OLD_1 = "only_used_by_warly",
--fallback to speech_wilson.lua 		SAME_OLD_2 = "only_used_by_warly",
--fallback to speech_wilson.lua 		SAME_OLD_3 = "only_used_by_warly",
--fallback to speech_wilson.lua 		SAME_OLD_4 = "only_used_by_warly",
--fallback to speech_wilson.lua         SAME_OLD_5 = "only_used_by_warly",
--fallback to speech_wilson.lua 		TASTY = "only_used_by_warly",
    },

	ANNOUNCE_FOODMEMORY = "only_used_by_warly",

    ANNOUNCE_ENCUMBERED =
    {
        "Ughh!",
        "So heavy...!",
        "Left foot... Right foot...",
        "I... can do it!",
        "Am... I there yet...",
        "Chugga chugga chugga chugga...",
        "Not enough... hat... to lift...",
        "Hhhhfn!",
        "Oof...!",
    },
    ANNOUNCE_ATRIUM_DESTABILIZING =
    {
		"That gateway did something weird.",
		"Something's happening.",
		"I should get out of here.",
	},
    ANNOUNCE_RUINS_RESET = "Everything's back!",
    ANNOUNCE_SNARED = "Hey! Meanie!",
    ANNOUNCE_SNARED_IVY = "Hey! Let go!",
    ANNOUNCE_REPELLED = "I can't hit it.",
	ANNOUNCE_ENTER_DARK = "I can't see!",
	ANNOUNCE_ENTER_LIGHT = "Phew, light!",
	ANNOUNCE_FREEDOM = "I made it!",
	ANNOUNCE_HIGHRESEARCH = "I'm learning so much!",
	ANNOUNCE_HOUNDS = "Doggies are coming!",
	ANNOUNCE_WORMS = "Ohhh nooo. I'm not friends with worms!",
    ANNOUNCE_WORMS_BOSS = "Yikes! Here comes a BIG worm!",
    ANNOUNCE_ACIDBATS = "I don't like that sound.",
	ANNOUNCE_HUNGRY = "It's time for a snack!",
	ANNOUNCE_HUNT_BEAST_NEARBY = "Fresh tracks!",
	ANNOUNCE_HUNT_LOST_TRAIL = "Animal went bye-bye.",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "It's too muddy to track.",
    ANNOUNCE_HUNT_START_FORK = "Whatever left those prints must be big... and scary...",
    ANNOUNCE_HUNT_SUCCESSFUL_FORK = "They'll never see me coming!",
    ANNOUNCE_HUNT_WRONG_FORK = "Why do I feel like something's watching me...",
    ANNOUNCE_HUNT_AVOID_FORK = "I feel better sticking to the safer trail.",
	ANNOUNCE_INV_FULL = "My pockets are full!",
	ANNOUNCE_KNOCKEDOUT = "Ow, my head!",
	ANNOUNCE_LOWRESEARCH = "That might've taught a toddler something.",
	ANNOUNCE_MOSQUITOS = "Suck someone else's blood!",
    ANNOUNCE_NOWARDROBEONFIRE = "I can't! It's all burny!",
    ANNOUNCE_NODANGERGIFT = "I'll open it later as a celebration of surviving this!",
    ANNOUNCE_NOMOUNTEDGIFT = "I promise I'll ride you again after I open my present!",
	ANNOUNCE_NODANGERSLEEP = "Can't sleep with monsters nearby!",
	ANNOUNCE_NODAYSLEEP = "It's daytime, not bedtime.",
	ANNOUNCE_NODAYSLEEP_CAVE = "I'm not ready for bed.",
	ANNOUNCE_NOHUNGERSLEEP = "My tummy is rumbling, I can't sleep.",
	ANNOUNCE_NOSLEEPONFIRE = "I'm not sure if I should sleep in there.",
    ANNOUNCE_NOSLEEPHASPERMANENTLIGHT = "I can't sleep with such a bright nightlight...",
	ANNOUNCE_NODANGERSIESTA = "Can't nap with monsters nearby!",
	ANNOUNCE_NONIGHTSIESTA = "I can't take a nap, it's nighttime!",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "No naps til daybreak!",
	ANNOUNCE_NOHUNGERSIESTA = "Won't be able to nap with a rumbling tummy.",
	ANNOUNCE_NO_TRAP = "Easy peasy.",
	ANNOUNCE_PECKED = "Bad bird!",
	ANNOUNCE_QUAKE = "I don't think that was my tummy.",
	ANNOUNCE_RESEARCH = "It's almost like being back in school.",
	ANNOUNCE_SHELTER = "Protect me, tree!",
	ANNOUNCE_THORNS = "Yowch!",
	ANNOUNCE_BURNT = "Jeepers, that was hot!",
	ANNOUNCE_TORCH_OUT = "Waah, my light went out!",
	ANNOUNCE_THURIBLE_OUT = "Aw, there goes my lure.",
	ANNOUNCE_FAN_OUT = "Aaw, the twirly is gone.",
    ANNOUNCE_COMPASS_OUT = "Uh oh, I broke it.",
	ANNOUNCE_TRAP_WENT_OFF = "Eek!",
	ANNOUNCE_UNIMPLEMENTED = "Gah! It needs more time.",
	ANNOUNCE_WORMHOLE = "That was a scary hole!",
--fallback to speech_wilson.lua     ANNOUNCE_WORMHOLE_SAMESPOT = "only_used_by_winona",
	ANNOUNCE_TOWNPORTALTELEPORT = "I'm here!",
	ANNOUNCE_CANFIX = "\nI can repair it.",
	ANNOUNCE_ACCOMPLISHMENT = "I'm so capable!",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "I'm a super hero!",
	ANNOUNCE_INSUFFICIENTFERTILIZER = "Not good enough for you, plant?",
	ANNOUNCE_TOOL_SLIP = "Hey! I was using that!",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "I'm invincible!",
	ANNOUNCE_TOADESCAPING = "It's looking around for a way out.",
	ANNOUNCE_TOADESCAPED = "Aww, the frog left!",


	ANNOUNCE_DAMP = "Splishy splashy.",
	ANNOUNCE_WET = "I'm unpleasantly moist.",
	ANNOUNCE_WETTER = "Where did I put my raincoat?",
	ANNOUNCE_SOAKED = "I'm drenched!",

	ANNOUNCE_WASHED_ASHORE = "I'm soaking wet!",

    ANNOUNCE_DESPAWN = "Everything's getting fuzzy!",
	ANNOUNCE_BECOMEGHOST = "oOooOooO!!",
	ANNOUNCE_GHOSTDRAIN = "I'm gonna go mad!",
	ANNOUNCE_PETRIFED_TREES = "The trees are yelling at me!!",
	ANNOUNCE_KLAUS_ENRAGE = "Ah! I'm sorry I killed your deer!!",
	ANNOUNCE_KLAUS_UNCHAINED = "Its belly looks hungry!",
	ANNOUNCE_KLAUS_CALLFORHELP = "Uh-oh, its got friends coming!",

	ANNOUNCE_MOONALTAR_MINE =
	{
		GLASS_MED = "I'll get you out.",
		GLASS_LOW = "Almost!",
		GLASS_REVEAL = "You're free!",
		IDOL_MED = "I'll get you out.",
		IDOL_LOW = "Almost!",
		IDOL_REVEAL = "You're free!",
		SEED_MED = "I'll get you out.",
		SEED_LOW = "Almost!",
		SEED_REVEAL = "You're free!",
	},

    --hallowed nights
    ANNOUNCE_SPOOKED = "Are I seeing things?!",
	ANNOUNCE_BRAVERY_POTION = "Hey, those trees aren't so scary anymore!",
	ANNOUNCE_MOONPOTION_FAILED = "Whoops!",

	--winter's feast
	ANNOUNCE_EATING_NOT_FEASTING = "I really should share.",
	ANNOUNCE_WINTERS_FEAST_BUFF = "Hey! Everything's all sparkly!",
	ANNOUNCE_IS_FEASTING = "I want to try everything!",
	ANNOUNCE_WINTERS_FEAST_BUFF_OVER = "Aww, I was having fun!",

    --lavaarena event
    ANNOUNCE_REVIVING_CORPSE = "Hold on, I'll help!",
    ANNOUNCE_REVIVED_OTHER_CORPSE = "There you go!",
    ANNOUNCE_REVIVED_FROM_CORPSE = "All better!",

    ANNOUNCE_FLARE_SEEN = "Oh, someone's calling me to come over.",
    ANNOUNCE_MEGA_FLARE_SEEN = "Uh-oh, that bright light's attracting a lot of attention...",
    ANNOUNCE_OCEAN_SILHOUETTE_INCOMING = "Don't eat me!",

    --willow specific
--fallback to speech_wilson.lua 	ANNOUNCE_LIGHTFIRE =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_willow",
--fallback to speech_wilson.lua     },

    --winona specific
--fallback to speech_wilson.lua     ANNOUNCE_HUNGRY_SLOWBUILD =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua 	    "only_used_by_winona",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_HUNGRY_FASTBUILD =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua 	    "only_used_by_winona",
--fallback to speech_wilson.lua     },

    --wormwood specific
--fallback to speech_wilson.lua     ANNOUNCE_KILLEDPLANT =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wormwood",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_GROWPLANT =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wormwood",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_BLOOMING =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wormwood",
--fallback to speech_wilson.lua     },

    --wortox specfic
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_EMPTY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_FEW =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_MANY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua     ANNOUNCE_SOUL_OVERLOAD =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "only_used_by_wortox",
--fallback to speech_wilson.lua     },

    --walter specfic
--fallback to speech_wilson.lua 	ANNOUNCE_SLINGHSOT_OUT_OF_AMMO =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 		"only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_STORYTELLING_ABORT_FIREWENTOUT =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua         "only_used_by_walter",
--fallback to speech_wilson.lua 	},
--fallback to speech_wilson.lua 	ANNOUNCE_STORYTELLING_ABORT_NOT_NIGHT =
--fallback to speech_wilson.lua 	{
--fallback to speech_wilson.lua         "only_used_by_walter",
--fallback to speech_wilson.lua 	},

    -- wx specific
    ANNOUNCE_WX_SCANNER_NEW_FOUND = "only_used_by_wx78",
--fallback to speech_wilson.lua     ANNOUNCE_WX_SCANNER_FOUND_NO_DATA = "only_used_by_wx78",

    --quagmire event
    QUAGMIRE_ANNOUNCE_NOTRECIPE = "Oh no! That wasn't a recipe!",
    QUAGMIRE_ANNOUNCE_MEALBURNT = "Oh no! I burnt it!",
    QUAGMIRE_ANNOUNCE_LOSE = "Don't eat me!",
    QUAGMIRE_ANNOUNCE_WIN = "I'm ready to go home now!",

--fallback to speech_wilson.lua     ANNOUNCE_ROYALTY =
--fallback to speech_wilson.lua     {
--fallback to speech_wilson.lua         "Your majesty.",
--fallback to speech_wilson.lua         "Your highness.",
--fallback to speech_wilson.lua         "My liege!",
--fallback to speech_wilson.lua     },

    ANNOUNCE_ATTACH_BUFF_ELECTRICATTACK    = "With great lightning powers comes great responsibility!",
    ANNOUNCE_ATTACH_BUFF_ATTACK            = "I feel so strong!",
    ANNOUNCE_ATTACH_BUFF_PLAYERABSORPTION  = "I feel so much safer now!",
    ANNOUNCE_ATTACH_BUFF_WORKEFFECTIVENESS = "I can help out with the chores!",
    ANNOUNCE_ATTACH_BUFF_MOISTUREIMMUNITY  = "Away, nasty water!",
    ANNOUNCE_ATTACH_BUFF_SLEEPRESISTANCE   = "I'll never feel sleepy again!",

    ANNOUNCE_DETACH_BUFF_ELECTRICATTACK    = "Aww, done already?",
    ANNOUNCE_DETACH_BUFF_ATTACK            = "I'm tired of fighting!",
    ANNOUNCE_DETACH_BUFF_PLAYERABSORPTION  = "Aah! I need armor!",
    ANNOUNCE_DETACH_BUFF_WORKEFFECTIVENESS = "I'm bored now.",
    ANNOUNCE_DETACH_BUFF_MOISTUREIMMUNITY  = "Argh, I want my rain coat!",
    ANNOUNCE_DETACH_BUFF_SLEEPRESISTANCE   = "Actually... I might feel a bit sleepy again.",

	ANNOUNCE_OCEANFISHING_LINESNAP = "Ah! Aww, my line snapped...",
	ANNOUNCE_OCEANFISHING_LINETOOLOOSE = "Should I reel it in a bit?",
	ANNOUNCE_OCEANFISHING_GOTAWAY = "Aww, it got away...",
	ANNOUNCE_OCEANFISHING_BADCAST = "Whoops! I should try that again.",
	ANNOUNCE_OCEANFISHING_IDLE_QUOTE =
	{
		"Was that a nibble? Nope.",
		"Come on out, fishies!",
		"This is getting kinda boring...",
		"I thought fishing would be a bit more exciting.",
	},

	ANNOUNCE_WEIGHT = "Weight: {weight}",
	ANNOUNCE_WEIGHT_HEAVY  = "Weight: {weight}\nWoah, that's heavy!",

	ANNOUNCE_WINCH_CLAW_MISS = "Oops! I missed it.",
	ANNOUNCE_WINCH_CLAW_NO_ITEM = "Aww... nothing.",

    --Wurt announce strings
--fallback to speech_wilson.lua     ANNOUNCE_KINGCREATED = "only_used_by_wurt",
--fallback to speech_wilson.lua     ANNOUNCE_KINGDESTROYED = "only_used_by_wurt",
--fallback to speech_wilson.lua     ANNOUNCE_CANTBUILDHERE_THRONE = "only_used_by_wurt",
--fallback to speech_wilson.lua     ANNOUNCE_CANTBUILDHERE_HOUSE = "only_used_by_wurt",
--fallback to speech_wilson.lua     ANNOUNCE_CANTBUILDHERE_WATCHTOWER = "only_used_by_wurt",
    ANNOUNCE_READ_BOOK =
    {
--fallback to speech_wilson.lua         BOOK_SLEEP = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_BIRDS = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_TENTACLES =  "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_BRIMSTONE = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_GARDENING = "only_used_by_wurt",
--fallback to speech_wilson.lua 		BOOK_SILVICULTURE = "only_used_by_wurt",
--fallback to speech_wilson.lua 		BOOK_HORTICULTURE = "only_used_by_wurt",

--fallback to speech_wilson.lua         BOOK_FISH = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_FIRE = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_WEB = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_TEMPERATURE = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_LIGHT = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_RAIN = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_MOON = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_BEES = "only_used_by_wurt",

--fallback to speech_wilson.lua         BOOK_HORTICULTURE_UPGRADED = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_RESEARCH_STATION = "only_used_by_wurt",
--fallback to speech_wilson.lua         BOOK_LIGHT_UPGRADED = "only_used_by_wurt",
    },

    ANNOUNCE_WEAK_RAT = "I don't think it can race anymore...",

    ANNOUNCE_CARRAT_START_RACE = "Ready, set, go!",

    ANNOUNCE_CARRAT_ERROR_WRONG_WAY = {
        "Hey! You're going the wrong way!",
        "You're supposed to go the other way!",
    },
    ANNOUNCE_CARRAT_ERROR_FELL_ASLEEP = "This is no time for a nap!",
    ANNOUNCE_CARRAT_ERROR_WALKING = "Come on, you've got to run faster!",
    ANNOUNCE_CARRAT_ERROR_STUNNED = "Oh no! Snap out of it!",

    ANNOUNCE_GHOST_QUEST = "only_used_by_wendy",
--fallback to speech_wilson.lua     ANNOUNCE_GHOST_HINT = "only_used_by_wendy",
--fallback to speech_wilson.lua     ANNOUNCE_GHOST_TOY_NEAR = {
--fallback to speech_wilson.lua         "only_used_by_wendy",
--fallback to speech_wilson.lua     },
--fallback to speech_wilson.lua 	ANNOUNCE_SISTURN_FULL = "only_used_by_wendy",
--fallback to speech_wilson.lua     ANNOUNCE_ABIGAIL_DEATH = "only_used_by_wendy",
--fallback to speech_wilson.lua     ANNOUNCE_ABIGAIL_RETRIEVE = "only_used_by_wendy",
--fallback to speech_wilson.lua 	ANNOUNCE_ABIGAIL_LOW_HEALTH = "only_used_by_wendy",
    ANNOUNCE_ABIGAIL_SUMMON =
	{
--fallback to speech_wilson.lua 		LEVEL1 = "only_used_by_wendy",
--fallback to speech_wilson.lua 		LEVEL2 = "only_used_by_wendy",
--fallback to speech_wilson.lua 		LEVEL3 = "only_used_by_wendy",
	},

    ANNOUNCE_GHOSTLYBOND_LEVELUP =
	{
--fallback to speech_wilson.lua 		LEVEL2 = "only_used_by_wendy",
--fallback to speech_wilson.lua 		LEVEL3 = "only_used_by_wendy",
	},

--fallback to speech_wilson.lua     ANNOUNCE_NOINSPIRATION = "only_used_by_wathgrithr",
--fallback to speech_wilson.lua     ANNOUNCE_NOTSKILLEDENOUGH = "only_used_by_wathgrithr",
--fallback to speech_wilson.lua     ANNOUNCE_BATTLESONG_INSTANT_TAUNT_BUFF = "only_used_by_wathgrithr",
--fallback to speech_wilson.lua     ANNOUNCE_BATTLESONG_INSTANT_PANIC_BUFF = "only_used_by_wathgrithr",
--fallback to speech_wilson.lua     ANNOUNCE_BATTLESONG_INSTANT_REVIVE_BUFF = "only_used_by_wathgrithr",

--fallback to speech_wilson.lua     ANNOUNCE_WANDA_YOUNGTONORMAL = "only_used_by_wanda",
--fallback to speech_wilson.lua     ANNOUNCE_WANDA_NORMALTOOLD = "only_used_by_wanda",
--fallback to speech_wilson.lua     ANNOUNCE_WANDA_OLDTONORMAL = "only_used_by_wanda",
--fallback to speech_wilson.lua     ANNOUNCE_WANDA_NORMALTOYOUNG = "only_used_by_wanda",

	ANNOUNCE_POCKETWATCH_PORTAL = "Wheeeeee--OOF!",

	ANNOUNCE_POCKETWATCH_MARK = "This place should work.",
	ANNOUNCE_POCKETWATCH_RECALL = "Nothing like a rift in time!",
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL = "Let's go!",
	ANNOUNCE_POCKETWATCH_OPEN_PORTAL_DIFFERENTSHARD = "Be careful, this one is a BIG jump!",

    ANNOUNCE_ARCHIVE_NEW_KNOWLEDGE = "Haha, it tickles my brain!",
    ANNOUNCE_ARCHIVE_OLD_KNOWLEDGE = "I already learned that one.",
    ANNOUNCE_ARCHIVE_NO_POWER = "Aww, nothing happened!",

    ANNOUNCE_PLANT_RESEARCHED =
    {
        "I'm learning so much about this plant!",
    },

    ANNOUNCE_PLANT_RANDOMSEED = "I can't wait to see what it is!",

    ANNOUNCE_FERTILIZER_RESEARCHED = "I never knew there was so much to learn about this stuff!",

	ANNOUNCE_FIRENETTLE_TOXIN =
	{
		"Owie, that was not a nice plant!",
		"Eek, I feel all burny inside!",
	},
	ANNOUNCE_FIRENETTLE_TOXIN_DONE = "Whew, I'll be more careful not to touch strange weeds.",

	ANNOUNCE_TALK_TO_PLANTS =
	{
        "Hi plants! How do you do today?",
        "Aww, are you lonely? I'll keep you company!",
		"One day you're going to grow up big and strong... and then I'll eat you!",
        "You are a very good plant.",
        "I'm always here when you need somebody to talk to!",
	},

	ANNOUNCE_KITCOON_HIDEANDSEEK_START = "Ready or not, here I come!",
	ANNOUNCE_KITCOON_HIDEANDSEEK_JOIN = "Let's work together to find those kitcoons!",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND =
	{
		"Found you!",
		"There you are!",
		"I found you!",
		"Heehee, gotcha!",
	},
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_ONE_MORE = "I found one more!",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE = "That was the last one, I won!",
	ANNOUNCE_KITCOON_HIDANDSEEK_FOUND_LAST_ONE_TEAM = "I did it, I found them all!",
	ANNOUNCE_KITCOON_HIDANDSEEK_TIME_ALMOST_UP = "I'm almost out of time!",
	ANNOUNCE_KITCOON_HIDANDSEEK_LOSEGAME = "Aw... olly olly oxenfree!",
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR = "I don't think the kitcoons would go this far out...",
	ANNOUNCE_KITCOON_HIDANDSEEK_TOOFAR_RETURN = "I'm back in the kitcoon's playground.",
	ANNOUNCE_KITCOON_FOUND_IN_THE_WILD = "Hello! Are you lost?",

	ANNOUNCE_TICOON_START_TRACKING	= "Wow! He's leading me right to the kitcoons! ...Is that cheating?",
	ANNOUNCE_TICOON_NOTHING_TO_TRACK = "Doesn't look like he found any clues here.",
	ANNOUNCE_TICOON_WAITING_FOR_LEADER = "I should stay close to him.",
	ANNOUNCE_TICOON_GET_LEADER_ATTENTION = "They want to get back to finding the kitcoons.",
	ANNOUNCE_TICOON_NEAR_KITCOON = "I must be getting close!",
	ANNOUNCE_TICOON_LOST_KITCOON = "Either someone else found them, or this one is a lot tinier.",
	ANNOUNCE_TICOON_ABANDONED = "I felt like using him was a bit like cheating anyway.",
	ANNOUNCE_TICOON_DEAD = "Oh no... where are I supposed to go now?",

    -- YOTB
    ANNOUNCE_CALL_BEEF = "Over here, beefalo! Follow me!",
    ANNOUNCE_CANTBUILDHERE_YOTB_POST = "I should put this where the judge can see it.",
    ANNOUNCE_YOTB_LEARN_NEW_PATTERN =  "I can't wait for my beefalo to try it on!",

    -- AE4AE
    ANNOUNCE_EYEOFTERROR_ARRIVE = "Why do I feel like I'm being watched?",
    ANNOUNCE_EYEOFTERROR_FLYBACK = "Coming back to play some more?",
    ANNOUNCE_EYEOFTERROR_FLYAWAY = "It doesn't want to play anymore.",

    -- PIRATES
    ANNOUNCE_CANT_ESCAPE_CURSE = "Oh... maybe I don't want to throw it away after all.",
    ANNOUNCE_MONKEY_CURSE_1 = "I feel weird... weirder than usual...",
    ANNOUNCE_MONKEY_CURSE_CHANGE = "What? How...? Now I'm really confused...",
    ANNOUNCE_MONKEY_CURSE_CHANGEBACK = "I'm me again!",

    ANNOUNCE_PIRATES_ARRIVE = "Uh oh... I'm not sure I like the sound of that.",

--fallback to speech_wilson.lua     ANNOUNCE_BOOK_MOON_DAYTIME = "only_used_by_waxwell_and_wicker",

    ANNOUNCE_OFF_SCRIPT = "Is that how the play is supposed to go?",

    ANNOUNCE_COZY_SLEEP = "I had such a good sleep!",

	--
	ANNOUNCE_TOOL_TOOWEAK = "I don't think this tool's strong enough!",

    ANNOUNCE_LUNAR_RIFT_MAX = "I can see something glowing waaay over there!",
    ANNOUNCE_SHADOW_RIFT_MAX = "What was that creepy light?",

    ANNOUNCE_SCRAPBOOK_FULL = "I already filled up my scrapbook.",

    ANNOUNCE_CHAIR_ON_FIRE = "I am fine.",

    ANNOUNCE_HEALINGSALVE_ACIDBUFF_DONE = "I'd better not go out in the acid rain until I put on more repellent.",

    ANNOUNCE_COACH = 
    {
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
    },
    ANNOUNCE_WOLFGANG_WIMPY_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_MIGHTY_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_BEGIN_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_END_COACHING = "only_used_by_wolfgang",
    ANNOUNCE_WOLFGANG_NOTEAM = 
    {
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
        "only_used_by_wolfgang",
    },

    ANNOUNCE_YOTD_NOBOATS = "I'm not close enough to the starting point!",
    ANNOUNCE_YOTD_NOCHECKPOINTS = "Oops! I forgot to set up the checkpoints!",
    ANNOUNCE_YOTD_NOTENOUGHBOATS = "I should make some room, in case somebody wants to join in!",

    ANNOUNCE_OTTERBOAT_OUTOFSHALLOWS = "Uh-oh... maybe I shouldn't have rowed out so far.",
    ANNOUNCE_OTTERBOAT_DENBROKEN = "I really shouldn't have broken that den!",

    ANNOUNCE_GATHER_MERM = "only_used_by_wurt",

    -- rifts 4
    ANNOUNCE_EXIT_GELBLOB = "I'm all sticky!",
	ANNOUNCE_SHADOWTHRALL_STEALTH = "Ouch! No fair! I can't see you!",
    ANNOUNCE_RABBITKING_AGGRESSIVE = "I hear something coming! And it sounds grouchy!",
    ANNOUNCE_RABBITKING_PASSIVE = "Something's burrowing around me!",
    ANNOUNCE_RABBITKING_LUCKY = "I see a weird rabbit!",
    ANNOUNCE_RABBITKING_LUCKYCAUGHT = "I caught it!",
    ANNOUNCE_RABBITKINGHORN_BADSPAWNPOINT = "Aw, wrong spot!",

	-- Hallowed Nights 2024
	ANNOUNCE_NOPUMPKINCARVINGONFIRE = "Haha! Again!",

	-- Winter's Feast 2024
	ANNOUNCE_SNOWBALL_TOO_BIG = "I can't roll it any bigger!",
	ANNOUNCE_SNOWBALL_NO_SNOW = "Where's more snow?",

	BATTLECRY =
	{
		GENERIC = "Blehh!",
		PIG = "Die, pig!",
		PREY = "I'll kill you!",
		SPIDER = "Die, spider!",
		SPIDER_WARRIOR = "Die, warrior!",
		DEER = "Hopefully I can kill it!",
	},
	COMBAT_QUIT =
	{
		GENERIC = "Well, I would have won!",
		PIG = "Another day, pig.",
		PREY = "Speedy thing!",
		SPIDER = "I didn't actually want to hurt you.",
		SPIDER_WARRIOR = "Simmer down, spider!",
	},

	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "It's pretty... pretty scary!",
        MULTIPLAYER_PORTAL_MOONROCK = "Gosh. It's so sparkly!",
        MOONROCKIDOL = "It looks kinda like an alien.",
        CONSTRUCTION_PLANS = "I should build this.",

        ANTLION =
        {
            GENERIC = "You're fuzzy. I like that.",
            VERYHAPPY = "It's always nice to have more bug friends.",
            UNHAPPY = "I think it's upset.",
        },
        ANTLIONTRINKET = "Sand castles!!",
        SANDSPIKE = "Ouchie!",
        SANDBLOCK = "Not like this!!",
        GLASSSPIKE = "Careful, it's fragile.",
        GLASSBLOCK = "I think it's great and I love it.",
        ABIGAIL_FLOWER =
        {
            GENERIC ="Pretty petals!",
			LEVEL1 = "Can she hear me in there?",
			LEVEL2 = "C'mon Abigail, Wendy misses you!",
			LEVEL3 = "Helloooo? Do you want to come out now?",

			-- deprecated
            LONG = "I think it's listening to me!",
            MEDIUM = "It's getting creepy!",
            SOON = "It gives me itches and skritches up my spine!",
            HAUNTED_POCKET = "Put it down! Put it down!",
            HAUNTED_GROUND = "Scary blossoms!",
        },

        BALLOONS_EMPTY = "Is there going to be a party?!",
        BALLOON = "Balloon animals! Balloon animals!!",
		BALLOONPARTY = "Yay! It's a party!",
		BALLOONSPEED =
        {
            DEFLATED = "I have to hold on tight or it'll fly away!",
            GENERIC = "Circles must be the speediest shape.",
        },
		BALLOONVEST = "I should take it on my boat trips.",
		BALLOONHAT = "It looks like a bunny!",

        BERNIE_INACTIVE =
        {
            BROKEN = "It's all busted up.",
            GENERIC = "A teddy bear.",
        },

        BERNIE_ACTIVE = "That teddy bear is moving!",
        BERNIE_BIG = "It's creepy and cute at the same time!!",

		BOOKSTATION =
		{
			GENERIC = "I helped make the doily!",
			BURNT = "Oh no! I worked so hard on that doily!",
		},
        BOOK_BIRDS = "This one has pictures!",
        BOOK_TENTACLES = "Why are the pages all slimy?",
        BOOK_GARDENING = "Why should I read about flowers when I can pick them?",
		BOOK_SILVICULTURE = "What else is there to know about trees?",
		BOOK_HORTICULTURE = "Reading about veggies is almost as bad as eating them!",
        BOOK_SLEEP = "It's... beddy-bye time...",
        BOOK_BRIMSTONE = "I don't like how that one ends!",

        BOOK_FISH = "Will reading really make me better at fishing?",
        BOOK_FIRE = "Willow keeps trying to burn it... I thought she'd like it!",
        BOOK_WEB = "Spiders can be scary sometimes",
        BOOK_TEMPERATURE = "Not too hot, not too cold, just right! Have I heard this story before?",
        BOOK_LIGHT = "Ms. Wickerbottom, could you make a nightlight for me?",
        BOOK_RAIN = "\"One of the simplest ways to invite rain is to kill a-\" oh...",
        BOOK_MOON = "I try not to think about the moon too much...",
        BOOK_BEES = "I thought I heard it buzzing!",
        
        BOOK_HORTICULTURE_UPGRADED = "It'll take me forever to read that!",
        BOOK_RESEARCH_STATION = "Seeing someone pick up a heavy book makes me nervous, somehow...",
        BOOK_LIGHT_UPGRADED = "It makes the brightest nightlight I've ever seen!",

        FIREPEN = "How dangerous could a pen really be?",

        PLAYER =
        {
            GENERIC = "Hey! Hi %s!",
            ATTACKER = "%s looks mean.",
            MURDERER = "Meanie! Get'em!",
            REVIVER = "%s is super nice to ghosts.",
            GHOST = "Don't worry, %s, I'll find you a heart!",
            FIRESTARTER = "%s, you lit a fire!",
        },
        WILSON =
        {
            GENERIC = "Hi %s! Nice weather I'm having!",
            ATTACKER = "Why are you being so mean, %s?",
            MURDERER = "Meanie! I will stop you no matter what!",
            REVIVER = "%s doesn't believe in ghosts, but he believes in me!",
            GHOST = "You're looking much paler than usual, %s!",
            FIRESTARTER = "Uh... Is your hair smoking, %s?",
        },
        WOLFGANG =
        {
            GENERIC = "Hi %s! Have you been working out?",
            ATTACKER = "Hey %s, you look upset about something.",
            MURDERER = "You're just a big bully!",
            REVIVER = "%s's nice! I wish he'd stop messing up my hat, though.",
            GHOST = "I'm sure you're the strongest ghost, but a heart makes you STRONGER",
            FIRESTARTER = "%s, no!! Fire can hurt you!",
        },
        WAXWELL =
        {
            GENERIC = "Hi %s! Lookin' dapper!",
            ATTACKER = "%s looks eviler than usual...",
            MURDERER = "You're the real monster, %s!",
            REVIVER = "Wow, %s is really nice! He's helping people!",
            GHOST = "Aw %s, no one deserves to be stuck like that!",
            FIRESTARTER = "Don't burn my things please. I like them.",
        },
        WX78 =
        {
            GENERIC = "Hi %s! You look very non-organic today!",
            ATTACKER = "I thought you were a friendly robot, %s!",
            MURDERER = "MYURDER! Pling!",
            REVIVER = "Aww. I'd beep-boop %s on the nose if they had one!",
            GHOST = "Bad day destroying humans, %s? Tomorrow will be better!",
            FIRESTARTER = "Maybe they didn't know fire is dangerous to me.",
        },
        WILLOW =
        {
            GENERIC = "Hi %s! How's Bernie?",
            ATTACKER = "%s's playing with fire. Err...",
            MURDERER = "You're gonna get burned, %s!",
            REVIVER = "She's like a burnt marshmallow. Crispy outside, super mushy inside!",
            GHOST = "Uh-oh! Does that hurt, %s?",
            FIRESTARTER = "Another fire? Well, as long as you're happy...",
        },
        WENDY =
        {
            GENERIC = "Hi %s! Let's play, okay?",
            ATTACKER = "Are you angry at me, %s?",
            MURDERER = "I'm taking my friendship bracelet back!",
            REVIVER = "%s always plays nice with ghosts.",
            GHOST = "Don't worry! I'll bring you back!",
            FIRESTARTER = "Uhh, uh-oh, let's play a different game, %s.",
        },
        WOODIE =
        {
            GENERIC = "Hi %s, hi Lucy!",
            ATTACKER = "%s looks angry today.",
            MURDERER = "You need to treat people nicer, %s!",
            REVIVER = "%s is gruff, but nice.",
            GHOST = "Wanna go heart-hunting with me, %s?",
            BEAVER = "%s's being gnawghty.",
            BEAVERGHOST = "Can I pet your ears or will my hands swish through?",
            MOOSE = "Woah! Would you give me a ride on your back, %s?",
            MOOSEGHOST = "Will I be able to find a heart big enough for you?",
            GOOSE = "Are you here to tell me nursery rhymes?",
            GOOSEGHOST = "Don't worry, I'll get you back to normal! Er, normal-ish.",
            FIRESTARTER = "Um. I think you lit a fire, %s.",
        },
        WICKERBOTTOM =
        {
            GENERIC = "Hello Ms. %s!",
            ATTACKER = "Uh-oh! I'm in trouble with Ms. %s!",
            MURDERER = "Killer! Does this mean I don't have to do my homework?!",
            REVIVER = "Ms. %s is very smart and wise. She's neat!",
            GHOST = "Don't worry Ms. %s, I'll find you a heart!",
            FIRESTARTER = "Ms. %s! I already had my combustion lessons!",
        },
        WES =
        {
            GENERIC = "Hey! Hi %s!",
            ATTACKER = "Maybe I can talk this out?",
            MURDERER = "You're supposed to play nice!",
            REVIVER = "%s is super nice. And his makeup's cool!",
            GHOST = "I'll help you get back on your feet, %s!",
            FIRESTARTER = "You were just supposed to mime lighting it!",
        },
        WEBBER =
        {
            GENERIC = "You look nice, Hi %s!",
            ATTACKER = "Ah! Why'd you do that?",
            MURDERER = "I won't let you hurt my friends!",
            REVIVER = "%s you're a good helper, you know that?",
            GHOST = "Oh no! I'll revive you, friend!",
            FIRESTARTER = "Webber! Why did you light that fire?",
        },
        WATHGRITHR =
        {
            GENERIC = "Wow, %s! You're lookin' tough!",
            ATTACKER = "%s looks really mean. And tough.",
            MURDERER = "I'm not scared of pointy spearsticks! Fight!",
            REVIVER = "%s is a super valiant lady.",
            GHOST = "Wow! Even as a ghost you're super tough, %s!",
            FIRESTARTER = "You're supposed to put fires out when you're finished.",
        },
        WINONA =
        {
            GENERIC = "Hi %s! Build anything neat today?",
            ATTACKER = "Don't do hits, %s!",
            MURDERER = "Murderer! I didn't wanna have to do this!",
            REVIVER = "%s keeps me all together.",
            GHOST = "Aw, I'm sorry that happened to you, %s.",
            FIRESTARTER = "Don't light fires, %s!",
        },
        WORTOX =
        {
            GENERIC = "Hey %s! Your horns look nice!",
            ATTACKER = "Hey, play nice, %s!",
            MURDERER = "Oh no! %s, what did you do!",
            REVIVER = "Grandpa always said laughter was the best medicine!",
            GHOST = "Oh no, %s! You're hurt!",
            FIRESTARTER = "Don't play tricks, Mr. Imp!",
        },
        WORMWOOD =
        {
            GENERIC = "Hey, it's my good friend, %s!",
            ATTACKER = "Hey, %s! Friends don't hit friends!",
            MURDERER = "Wickerbottom says I can't be friends anymore!",
            REVIVER = "%s is really rooting for me!",
            GHOST = "Poor %s! He died of loneliness!",
            FIRESTARTER = "I don't think it's safe for you to be around fire.",
        },
        WARLY =
        {
            GENERIC = "Hey %s! Do you have any snacks?",
            ATTACKER = "%s, don't you think you should say sorry?",
            MURDERER = "I thought you were nice!",
            REVIVER = "Thanks a bunch, %s!",
            GHOST = "Oh no, %s is hurt!",
            FIRESTARTER = "I don't think you were supposed to start that fire.",
        },

        WURT =
        {
            GENERIC = "Hey %s! Whatcha up to?",
            ATTACKER = "Hey, stop it! No hitting!",
            MURDERER = "Why would you do that, %s?",
            REVIVER = "Whew, thanks %s!",
            GHOST = "Don't worry! I'm sure there's a heart around here somewhere!",
            FIRESTARTER = "I... don't think that's allowed...",
        },

        WALTER =
        {
            GENERIC = "Hey %s! Can I pet Woby?",
            ATTACKER = "That wasn't very nice, %s!",
            MURDERER = "%s? I thought we were all friends!",
            REVIVER = "%s is the best!",
            GHOST = "Oh no! What should I do, %s?",
            FIRESTARTER = "Oh... s-should I start making a fire too?",
        },

        WANDA =
        {
            GENERIC = "Hey %s! Have you been any-when interesting lately?",
            ATTACKER = "That's not very nice, %s!",
            MURDERER = "I never wanna see you again, not after what you did!",
            REVIVER = "Thanks %s! I hope it didn't take up too much of your time...",
            GHOST = "Uh oh, %s needs help!",
            FIRESTARTER = "Stop it, %s! You're gonna get in trouble!",
        },

        WONKEY =
        {
            GENERIC = "Hi Monkey!",
            ATTACKER = "Hey, that was mean!",
            MURDERER = "I don't think I should play with that monkey anymore.",
            REVIVER = "I knew you were a nice monkey!",
            GHOST = "Don't worry, I'll make you all better!",
            FIRESTARTER = "No, I'm not supposed to play with fire!",
        },

--fallback to speech_wilson.lua         MIGRATION_PORTAL =
--fallback to speech_wilson.lua         {
--fallback to speech_wilson.lua         --    GENERIC = "If I had any friends, this could take me to them.",
--fallback to speech_wilson.lua         --    OPEN = "If I step through, will I still be me?",
--fallback to speech_wilson.lua         --    FULL = "It seems to be popular over there.",
--fallback to speech_wilson.lua         },
        GLOMMER =
        {
            GENERIC = "Nice eyes.",
            SLEEPING = "I'll find you a blanket!",
        },
        GLOMMERFLOWER =
        {
            GENERIC = "It doesn't smell very nice.",
            DEAD = "I spoke too soon. It smells worse now.",
        },
        GLOMMERWINGS = "I wish I'd at least ended up with wings. Sigh.",
        GLOMMERFUEL = "Yucky muck!",
        BELL = "Exactly the right amount of bell.",
        STATUEGLOMMER =
        {
            GENERIC = "A statue of some weird bug.",
            EMPTY = "Take that, rock bug!",
        },

        LAVA_POND_ROCK = "Wow! A rock!",

		WEBBERSKULL = "How did this get here?",
		WORMLIGHT = "It's gushing with light.",
		WORMLIGHT_LESSER = "I dare you to eat it!",
		WORM =
		{
		    PLANT = "What could possibly go wrong?",
		    DIRT = "Some dirt, big whoop.",
		    WORM = "Creepy crawly!",
		},
        WORMLIGHT_PLANT = "What could possibly go wrong?",
		MOLE =
		{
			HELD = "Are you comfy?",
			UNDERGROUND = "Come out and play!",
			ABOVEGROUND = "Hello little guy!",
		},
		MOLEHILL = "Hidey-hole.",
		MOLEHAT = "It sees for miles and miles.",

		EEL = "Fresh water-snake.",
		EEL_COOKED = "I could slurp this down.",
		UNAGI = "It was easy to make with all my arms.",
		EYETURRET = "Stop looking at me!",
		EYETURRET_ITEM = "Wakey wakey!",
		MINOTAURHORN = "It's quite tender.",
		MINOTAURCHEST = "What a big treasure box!",
		THULECITE_PIECES = "Small bits of fancy rock.",
		POND_ALGAE = "Just a normal pond plant.",
		GREENSTAFF = "Magic taker-apart-er.",
		GIFT = "Oh! What is it?!",
        GIFTWRAP = "I want to give someone something nice!",
		POTTEDFERN = "It's a nice fern.",
        SUCCULENT_POTTED = "Bow might like it.",
		SUCCULENT_PLANT = "I think it's a cactus.",
		SUCCULENT_PICKED = "It got picked.",
		SENTRYWARD = "Woah! I bet it sees so far!",
        TOWNPORTAL =
        {
			GENERIC = "Floaty and weird.",
			ACTIVE = "I hope no one gets a headache.",
		},
        TOWNPORTALTALISMAN =
        {
			GENERIC = "I didn't know rocks could smell.",
			ACTIVE = "I think it's ready!",
		},
        WETPAPER = "It'll probably dry off soon. Maybe.",
        WETPOUCH = "I hope the stuff inside didn't get smushed.",
        MOONROCK_PIECES = "Oh... I don't like this!",
        MOONBASE =
        {
            GENERIC = "I wonder what it wants?",
            BROKEN = "It's broke.",
            STAFFED = "Something else needs to happen, right?",
            WRONGSTAFF = "I don't think it wanted that.",
            MOONSTAFF = "Bright sticky stick!",
        },
        MOONDIAL =
        {
			GENERIC = "Hey, Ms. Wicker! How come I can still see the moon?",
			NIGHT_NEW = "New moon! Neat!",
			NIGHT_WAX = "The moon is growing!",
			NIGHT_FULL = "Wow! Full moon!",
			NIGHT_WANE = "The moon is shrinking!",
			CAVE = "The moon can't fit in a cave! I think.",
--fallback to speech_wilson.lua 			WEREBEAVER = "only_used_by_woodie", --woodie specific
			GLASSED = "It looks like ice, but I think it's actually glass!",
        },
		THULECITE = "Fancy rocks!",
		ARMORRUINS = "Nice and lightweight.",
		ARMORSKELETON = "Rattle rattle.",
		SKELETONHAT = "It's not very comfy.",
		RUINS_BAT = "I will, I will, smash you!",
		RUINSHAT = "And now I am king.",
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "Everything's dandy.",
            WARN = "Something's brewing.",
            WAXING = "It's getting magickier!",
            STEADY = "Stable, for now.",
            WANING = "Magic go down the hole.",
            DAWN = "Return to me, day!",
            NOMAGIC = "Not much magic here.",
		},
		BISHOP_NIGHTMARE = "Bishop of bad dreams.",
		ROOK_NIGHTMARE = "You can't rook me.",
		KNIGHT_NIGHTMARE = "Goodnight, good knight.",
		MINOTAUR = "Wear that frown upside down.",
		SPIDER_DROPPER = "There are spiders up there.",
		NIGHTMARELIGHT = "Not exactly my kind of nightlight.",
		NIGHTSTICK = "Night light, night bright!",
		GREENGEM = "I'm absolutely green with envy.",
		MULTITOOL_AXE_PICKAXE = "Double duty.",
		ORANGESTAFF = "Teleportation? Where?",
		YELLOWAMULET = "Nice and glowy.",
		GREENAMULET = "Time to build!",
		SLURPERPELT = "It's like a tiny rug.",

		SLURPER = "Hairy tongue thing!",
		SLURPER_PELT = "It's like a tiny rug.",
		ARMORSLURPER = "Squeeze my tummy tight!",
		ORANGEAMULET = "How does this even work?",
		YELLOWSTAFF = "I summon you, warm ball of light!",
		YELLOWGEM = "Yellow-bellied gem.",
		ORANGEGEM = "Orange you glad I found you, gem?",
        OPALSTAFF = "Whew. Gotta be careful where you point it!",
        OPALPRECIOUSGEM = "I see a million eyes reflecting back at me. Neat!",
        TELEBASE =
		{
			VALID = "Seems ready to use.",
			GEMS = "It needs something to focus the power.",
		},
		GEMSOCKET =
		{
			VALID = "Looks good.",
			GEMS = "Looks empty.",
		},
		STAFFLIGHT = "Cozy.",
        STAFFCOLDLIGHT = "Woah! The cold makes all my hairs stand up!",

        ANCIENT_ALTAR = "Old and full of mysteries.",

        ANCIENT_ALTAR_BROKEN = "It's been busted up.",

        ANCIENT_STATUE = "It's throbbing strangely.",

        LICHEN = "It likes it down here.",
		CUTLICHEN = "I like me a lichen.",

		CAVE_BANANA = "A bundle of bananas.",
		CAVE_BANANA_COOKED = "Hot mush.",
		CAVE_BANANA_TREE = "It's a tropical cave tree, of course.",
		ROCKY = "Snip snap!",

		COMPASS =
		{
			GENERIC="No reading!",
			N = "North!",
			S = "South!",
			E = "East!",
			W = "West!",
			NE = "Northeast!",
			SE = "Southeast!",
			NW = "Northwest!",
			SW = "Southwest!",
		},

        HOUNDSTOOTH = "It's the perfect tooth to gnash.",
        ARMORSNURTLESHELL = "It didn't protect the last guy.",
        BAT = "Screechy mean guy!",
        BATBAT = "Flap that bat like you were born to do it.",
        BATWING = "This thing drives me batty.",
        BATWING_COOKED = "Tastes like chicken.",
        BATCAVE = "Oooh they're hiding in there!",
        BEDROLL_FURRY = "I miss being able to properly feel a nice bedroll.",
        BUNNYMAN = "Hop along, lil bunny.",
        FLOWER_CAVE = "Oooh, a glowing ball of flower!",
        GUANO = "Bat doodoo.",
        LANTERN = "The sun's trapped in there.",
        LIGHTBULB = "Bright and delicious.",
        MANRABBIT_TAIL = "I feel lucky, oh so lucky.",
        MUSHROOMHAT = "It's a cap cap!",
        MUSHROOM_LIGHT2 =
        {
            ON = "I love all the colors!",
            OFF = "Maybe the night won't be as scary now.",
            BURNT = "Aw. It was kinda growing on me.",
        },
        MUSHROOM_LIGHT =
        {
            ON = "It's giving off a nice light.",
            OFF = "It still needs to be turned on.",
            BURNT = "Well that's no fun-gus.",
        },
        SLEEPBOMB = "Throwable nap time!",
        MUSHROOMBOMB = "Explodey fungus!",
        SHROOM_SKIN = "Haha! Yuck!",
        TOADSTOOL_CAP =
        {
            EMPTY = "Do you think I'd fit?",
            INGROUND = "I think it needs help getting out.",
            GENERIC = "Mushroom! It's a mushroom!",
        },
        TOADSTOOL =
        {
            GENERIC = "Yikes! That's a big frog!",
            RAGE = "Toadally terrifying!",
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "I think it's doing something bad!",
            BURNT = "I should have chopped it!",
        },
        MUSHTREE_TALL =
        {
            GENERIC = "How did it get so big?",
            BLOOM = "It sounds so funny!",
            ACIDCOVERED = "Smells funny.",
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "It's upsettingly large.",
            BLOOM = "Hahah! Wow, it smells so bad!",
            ACIDCOVERED = "Smells funny.",
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "Bigger than a normal mushroom.",
            BLOOM = "It's all round and squishy now!",
            ACIDCOVERED = "Smells funny.",
        },
        MUSHTREE_TALL_WEBBED =
        {
            GENERIC = "This one looks friendly!",
            ACIDCOVERED = "Smells funny.",
        },
        SPORE_TALL =
        {
            GENERIC = "Blue huh? We'll see about that...",
            HELD = "If I eat it I'll turn to water!",
        },
        SPORE_MEDIUM =
        {
            GENERIC = "Red huh? Seems evil...",
            HELD = "If I stare at it I'll turn to stone!",
        },
        SPORE_SMALL =
        {
            GENERIC = "Greeeeeennnn.",
            HELD = "If I lick it I'll turn to wood!",
        },
        RABBITHOUSE =
        {
            GENERIC = "Just like grandpa said, \"You live in what you eat.\"",
            BURNT = "A little overdone and overlarge.",
        },
        SLURTLE = "I'll slaughter that slurtle.",
        SLURTLE_SHELLPIECES = "Maybe that was a little too rough.",
        SLURTLEHAT = "A solid helmet.",
        SLURTLEHOLE = "Slimy and rocky.",
        SLURTLESLIME = "Slime-time!",
        SNURTLE = "Snuff out that snurtle!",
        SPIDER_HIDER = "Scary!",
        SPIDER_SPITTER = "Is it spitting?",
        SPIDERHOLE = "Nope.",
        SPIDERHOLE_ROCK = "Nope.",
        STALAGMITE = "Rocks, underground?! Shocking.",
        STALAGMITE_TALL = "Pointy rocks, underground?! Simply stunning.",

        TURF_CARPETFLOOR = "Carpets! Just like in my old house.",
        TURF_CHECKERFLOOR = "Fancy.",
        TURF_DIRT = "Some ground that I dug up.",
        TURF_FOREST = "Some ground that I dug up.",
        TURF_GRASS = "Some ground that I dug up.",
        TURF_MARSH = "Some ground that I dug up.",
        TURF_METEOR = "Some ground that I dug up.",
        TURF_PEBBLEBEACH = "Some ground that I dug up.",
        TURF_ROAD = "Some ground that I dug up.",
        TURF_ROCKY = "Some ground that I dug up.",
        TURF_SAVANNA = "Some grassy dirt.",
        TURF_WOODFLOOR = "If I put these on the ground I'll have a floor!",

		TURF_CAVE="Some pretty average earth.",
		TURF_FUNGUS="Some pretty average earth.",
		TURF_FUNGUS_MOON = "Some pretty average earth.",
		TURF_ARCHIVE = "Some very old stones.",
		TURF_SINKHOLE="Some pretty average earth.",
		TURF_UNDERROCK="Some pretty average earth.",
		TURF_MUD="Some pretty average earth.",

		TURF_DECIDUOUS = "Some ground that I dug up.",
		TURF_SANDY = "Some ground that I dug up.",
		TURF_BADLANDS = "Some ground that I dug up.",
		TURF_DESERTDIRT = "Some ground that I dug up.",
		TURF_FUNGUS_GREEN = "Some ground that I dug up.",
		TURF_FUNGUS_RED = "Some ground that I dug up.",
		TURF_DRAGONFLY = "Warm and cozy ground!",

        TURF_SHELLBEACH = "Some ground that I dug up.",

		TURF_RUINSBRICK = "Some very old stones.",
		TURF_RUINSBRICK_GLOW = "It looks old, but it's not really.",
		TURF_RUINSTILES = "Some very old stones.",
		TURF_RUINSTILES_GLOW = "It looks old, but it's not really.",
		TURF_RUINSTRIM = "Some very old stones.",
		TURF_RUINSTRIM_GLOW = "It looks old, but it's not really.",

        TURF_MONKEY_GROUND = "It kinda smells like bananas!",

        TURF_CARPETFLOOR2 = "Rosy cozy carpet!",
        TURF_MOSAIC_GREY = "Some ground that I dug up.",
        TURF_MOSAIC_RED = "Some ground that I dug up.",
        TURF_MOSAIC_BLUE = "Some ground that I dug up.",

        TURF_BEARD_RUG = "It tickles!",

		POWCAKE = "I've never liked these.",
        CAVE_ENTRANCE = "It's plugged up.",
        CAVE_ENTRANCE_RUINS = "It's plugged up.",

       	CAVE_ENTRANCE_OPEN =
        {
            GENERIC = "Blow it up! With bombs!",
            OPEN = "Whatever's down there isn't friendly.",
            FULL = "I'll explore when everyone else has had their turn!",
        },
        CAVE_EXIT =
        {
            GENERIC = "I like it down here.",
            OPEN = "It leads back to the light.",
            FULL = "They don't have enough space for me!",
        },

		MAXWELLPHONOGRAPH = "I could listen to that forever!",--single player
		BOOMERANG = "Boomerangarangarang!",
		PIGGUARD = "I wouldn't want to cross that one.",
		ABIGAIL =
		{
            LEVEL1 =
            {
                "I'm a bit old for playing peek-a-boo.",
                "I'm a bit old for playing peek-a-boo.",
            },
            LEVEL2 =
            {
                "I'm a bit old for playing peek-a-boo.",
                "I'm a bit old for playing peek-a-boo.",
            },
            LEVEL3 =
            {
                "I'm a bit old for playing peek-a-boo.",
                "I'm a bit old for playing peek-a-boo.",
            },
        },

		ADVENTURE_PORTAL = "Something wicked this way comes.",
		AMULET = "It's a fine necklace, I suppose.",
		ANIMAL_TRACK = "Whatever it is, it travels single file.",
		ARMORGRASS = "It just feels like more hair.",
		ARMORMARBLE = "Marbelous protection!",
		ARMORWOOD = "Wood you like to fight?",
		ARMOR_SANITY = "It's a bit uneasy wearing this, but so effective.",
		ASH =
		{
			GENERIC = "Funk to funky.",
			REMAINS_GLOMMERFLOWER = "The flower didn't make it.",
			REMAINS_EYE_BONE = "The eyebone didn't survive the trip.",
			REMAINS_THINGIE = "Whatever it was, it's gone back to the earth.",
		},
		AXE = "Chop and chop.",
		BABYBEEFALO =
		{
			GENERIC = "Get busy, child.",
		    SLEEPING = "That's the opposite of busy.",
        },
        BUNDLE = "That's one of my favorite things!",
        BUNDLEWRAP = "I'll save something for later!",
		BACKPACK = "It's like a second abdomen I can store things in.",
		BACONEGGS = "No gears?",
		BANDAGE = "Bandages for booboos.",
		BASALT = "Impenetrable.", --removed
		BEARDHAIR = "In another life, I could've grown this.",
		BEARGER = "Run for the hills!",
		BEARGERVEST = "I'll be the super fuzziest kid ever.",
		ICEPACK = "It's fuzzy!",
		BEARGER_FUR = "It's so thick!",
		BEDROLL_STRAW = "Musty but relaxing.",
		BEEQUEEN = "Bees aren't my friends!",
		BEEQUEENHIVE =
		{
			GENERIC = "I'm sure Webber disapproves.",
			GROWING = "I wonder what the bees are making!",
		},
        BEEQUEENHIVEGROWN = "Oh, bother!",
        BEEGUARD = "So fluffy but so mean!!",
        HIVEHAT = "I could be part bee now too!",
        MINISIGN =
        {
            GENERIC = "That looks nice!",
            UNDRAWN = "Can someone lend me a pencil?",
        },
        MINISIGN_ITEM = "Where should I put it?",
		BEE =
		{
			GENERIC = "Always Be Pollinating.",
			HELD = "Mine now!",
		},
		BEEBOX =
		{
			READY = "It's full to brimming.",
			FULLHONEY = "It's full to brimming.",
			GENERIC = "It's a box with bees in it.",
			NOHONEY = "There's no honey inside.",
			SOMEHONEY = "Work faster, bees!",
			BURNT = "The site of The Great Honey Fire.",
		},
		MUSHROOM_FARM =
		{
			STUFFED = "Wow! So many mushrooms!",
			LOTS = "They look happy.",
			SOME = "Aw, they're so little.",
			EMPTY = "There aren't any mushrooms.",
			ROTTEN = "It's all yucky.",
			BURNT = "Fire's dangerous, I guess.",
			SNOWCOVERED = "You look chilly.",
		},
		BEEFALO =
		{
			FOLLOWER = "He seems to want to stick around.",
			GENERIC = "Big big beefalo!",
			NAKED = "Shaved you good!",
			SLEEPING = "Slumber deep, beefalo.",
            --Domesticated states:
            DOMESTICATED = "This one likes me!",
            ORNERY = "I'm kind of scared of this one.",
            RIDER = "This one looks fast.",
            PUDGY = "I like to cuddle this one!",
            MYPARTNER = "That's my friend!",
            DEAD = "I saw it walking around a minute ago.",
            DEAD_MYPARTNER = "My poor beefalo! It's not fair!",
		},

		BEEFALOHAT = "The wearer will blend in perfectly.",
		BEEFALOWOOL = "Thick fur.",
		BEEHAT = "It's a face fortress!",
        BEESWAX = "This stuff gives me hives.",
		BEEHIVE = "It's a hive of activity.",
		BEEMINE = "Would you bee mine?",
		BEEMINE_MAXWELL = "I just can't mosquito you.",--removed
		BERRIES = "Juice sacks.",
		BERRIES_COOKED = "Warm juice sacks.",
        BERRIES_JUICY = "Yum! I should find more!",
        BERRIES_JUICY_COOKED = "They're so filling!",
		BERRYBUSH =
		{
			BARREN = "It's run out of plant food.",
			WITHERED = "Heat too intense for ya?",
			GENERIC = "Ripe for the pickin'.",
			PICKED = "See you soon, berries!",
			DISEASED = "Maybe it needs some chicken soup?",--removed
			DISEASING = "Are you okay, lil bush?",--removed
			BURNING = "Uh-oh! Burnies!",
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "It needs some poops!",
			WITHERED = "Aww, are you sad?",
			GENERIC = "Those berries look so juicy!",
			PICKED = "It's taking a nap.",
			DISEASED = "Maybe it needs some chicken soup?",--removed
			DISEASING = "Are you okay, lil bush?",--removed
			BURNING = "Uh-oh! Burnies!",
		},
		BIGFOOT = "AAAAAAAAAAH!",--removed
		BIRDCAGE =
		{
			GENERIC = "It's the jail.",
			OCCUPIED = "Jailbird.",
			SLEEPING = "You have to sleep to survive in the jail.",
			HUNGRY = "He looks hungry.",
			STARVING = "I need to feed him.",
			DEAD = "I wasn't a very good warden.",
			SKELETON = "Eww.",
		},
		BIRDTRAP = "Come on birds!",
		CAVE_BANANA_BURNT = "Oopsie doodle.",
		BIRD_EGG = "A hard shelled egg.",
		BIRD_EGG_COOKED = "Tasty!",
		BISHOP = "You don't play by the chess rules grandpa taught me.",
		BLOWDART_FIRE = "One step above blowing hot air.",
		BLOWDART_SLEEP = "Airborne sleeping agent.",
		BLOWDART_PIPE = "Same as blowing bubbles.",
		BLOWDART_YELLOW = "It's a shock to the system.",
		BLUEAMULET = "I guess it's nice.",
		BLUEGEM = "Glittering and cool.",
		BLUEPRINT =
		{
            COMMON = "I could learn something from this...",
            RARE = "This one feels special.",
        },
        SKETCH = "I need somewhere to make it!",
		COOKINGRECIPECARD =
		{
			GENERIC = "I can't read what it says!",
		},
		BLUE_CAP = "You'd have to be crazy...",
		BLUE_CAP_COOKED = "Good thing I'm feeling healthy.",
		BLUE_MUSHROOM =
		{
			GENERIC = "Vroom vroom, mushroom.",
			INGROUND = "Hiding, are we?",
			PICKED = "Maybe it will regrow.",
		},
		BOARDS = "Logs, but flat.",
		BONESHARD = "Boney bits.",
		BONESTEW = "Smells like Sunday supper.",
		BUGNET = "I'm not a bug! I'm an arachnid!",
		BUSHHAT = "For looking bushier!",
		BUTTER = "Butter is better.",
		BUTTERFLY =
		{
			GENERIC = "Look at it, flitting around happily.",
			HELD = "Not so happy now, are we?",
		},
		BUTTERFLYMUFFIN = "Do you know the muffin hat?",
		BUTTERFLYWINGS = "Pick my teeth with butterfly bones.",
		BUZZARD = "You won't find any carrion here. I'm stuck like this.",

		SHADOWDIGGER = "Sometimes scary things are nice.",
        SHADOWDANCER = "I'll dance with you, Mr. Shadow!",

		CACTUS =
		{
			GENERIC = "It's got more things coming out of it than I do.",
			PICKED = "It's got no meat left in it.",
		},
		CACTUS_MEAT_COOKED = "Take that, pokey things!",
		CACTUS_MEAT = "Haven't had enough, huh?",
		CACTUS_FLOWER = "This part is nice.",

		COLDFIRE =
		{
			EMBERS = "I should put something on the fire before it goes out.",
			GENERIC = "Sure beats the heat. And darkness.",
			HIGH = "That fire is huge!",
			LOW = "The fire's getting a touch low.",
			NORMAL = "Nice and cool.",
			OUT = "Well, that's done.",
		},
		CAMPFIRE =
		{
			EMBERS = "I should put something on the fire before it goes out.",
			GENERIC = "Sure beats the cold. And darkness.",
			HIGH = "That fire is huge!",
			LOW = "The fire's getting a touch low.",
			NORMAL = "Nice and warm.",
			OUT = "Well, that's done.",
		},
		CANE = "One more point of contact couldn't slow me down.",
		CATCOON = "A bit more feral than grandpa's cat.",
		CATCOONDEN =
		{
			GENERIC = "Trunk house.",
			EMPTY = "The nine lives thing is true!",
		},
		CATCOONHAT = "Hat of a cat.",
		COONTAIL = "I always liked pulling Whiskers' tail.",
		CARROT = "I sort of miss being forced to eat these.",
		CARROT_COOKED = "Easier for me.",
		CARROT_PLANTED = "Bury your head, carrot.",
		CARROT_SEEDS = "I could grow something with these.",
		CARTOGRAPHYDESK =
		{
			GENERIC = "Heh heh. I was never allowed in father's study.",
			BURNING = "Ohh no, uh, oh no!",
			BURNT = "That's probably why I wasn't allowed in father's study.",
		},
		WATERMELON_SEEDS = "If I eat these will they grow inside me?",
		CAVE_FERN = "Swirly plants.",
		CHARCOAL = "Hard and black, like my better half.",
        CHESSPIECE_PAWN = "Pawns are just as important as the rest of the pieces.",
        CHESSPIECE_ROOK =
        {
            GENERIC = "Where's the king of the castle?",
            STRUGGLE = "It's... alive?!",
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "I could sculpt a stallion battalion!",
            STRUGGLE = "It's... alive?!",
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "I've never seen toys so big.",
            STRUGGLE = "It's... alive?!",
        },
        CHESSPIECE_MUSE = "I'm sure she's nicer than she looks.",
        CHESSPIECE_FORMAL = "Reminds me of grandpa.",
        CHESSPIECE_HORNUCOPIA = "Boy, I wish I could eat it.",
        CHESSPIECE_PIPE = "Bubbles!",
        CHESSPIECE_DEERCLOPS = "This is a really good sculpture.",
        CHESSPIECE_BEARGER = "The fur looks so real!",
        CHESSPIECE_MOOSEGOOSE =
        {
            "She doesn't look so mean.",
        },
        CHESSPIECE_DRAGONFLY = "I can practically feel the fire!",
		CHESSPIECE_MINOTAUR = "I feel a bit bad for stealing their treasure.",
        CHESSPIECE_BUTTERFLY = "It looks kinda yummy, doesn't it?",
        CHESSPIECE_ANCHOR = "Anchors away!",
        CHESSPIECE_MOON = "Almost as pretty as the real thing.",
        CHESSPIECE_CARRAT = "It makes me feel content.",
        CHESSPIECE_MALBATROSS = "Not such a big bad bird now!",
        CHESSPIECE_CRABKING = "He didn't seem very happy.",
        CHESSPIECE_TOADSTOOL = "Now I can play leap frog with it!",
        CHESSPIECE_STALKER = "Still kind of spooky.",
        CHESSPIECE_KLAUS = "Can I decorate it?",
        CHESSPIECE_BEEQUEEN = "Sweet!",
        CHESSPIECE_ANTLION = "It's so life-like the mane looks fluffy!",
        CHESSPIECE_BEEFALO = "Now I want to go for a beefalo ride!",
		CHESSPIECE_KITCOON = "Woah! I hope they don't fall over...",
		CHESSPIECE_CATCOON = "I respect the butterfly hunter.",
        CHESSPIECE_MANRABBIT = "It's my most huggable statue.",
        CHESSPIECE_GUARDIANPHASE3 = "It can't still see me... right?",
        CHESSPIECE_EYEOFTERROR = "I think I could've been friends.",
        CHESSPIECE_TWINSOFTERROR = "Now they'll always be together.",
        CHESSPIECE_DAYWALKER = "He wasn't very nice to me...",
        CHESSPIECE_DAYWALKER2 = "This guy keeps coming back!",
        CHESSPIECE_DEERCLOPS_MUTATED = "It looks so real, it gives me the shivers!",
        CHESSPIECE_WARG_MUTATED = "I thought only cats had nine lives!",
        CHESSPIECE_BEARGER_MUTATED = "Those teeth look just as sharp as I remember.",
        CHESSPIECE_SHARKBOI = "They weren't so bad after I got to know them.",
        CHESSPIECE_WORMBOSS = "That big worm had a big mouth.",
        CHESSPIECE_YOTS = "I can play with this worm!",

        CHESSJUNK1 = "A mess of chess.",
        CHESSJUNK2 = "A mess of chess.",
        CHESSJUNK3 = "A mess of chess.",
		CHESTER = "Haha. You make all my stuff slobbery.",
		CHESTER_EYEBONE =
		{
			GENERIC = "Peekaboo.",
			WAITING = "I spy a tired eye.",
		},
		COOKEDMANDRAKE = "Cooked to death.",
		COOKEDMEAT = "Can't have any pudding if I don't eat it.",
		COOKEDMONSTERMEAT = "I don't know what everyone's complaining about.",
		COOKEDSMALLMEAT = "Meat treat.",
		COOKPOT =
		{
			COOKING_LONG = "It won't be done for a while.",
			COOKING_SHORT = "Almost ready!",
			DONE = "Supper is served.",
			EMPTY = "Food goes in, other food comes out.",
			BURNT = "Someone must have left the fire going.",
		},
		CORN = "Corn in the raw.",
		CORN_COOKED = "Popping corn.",
		CORN_SEEDS = "I could grow something with these.",
        CANARY =
		{
			GENERIC = "That's a yellow bird.",
			HELD = "Caught you!",
		},
        CANARY_POISONED = "Uh, are you feeling okay?",

		CRITTERLAB = "It looks warm in there.",
        CRITTER_GLOMLING = "He gives the fuzziest hugs.",
        CRITTER_DRAGONLING = "She's a monster!",
		CRITTER_LAMB = "Father taught me how to take care of goats!",
        CRITTER_PUPPY = "We're best friends.",
        CRITTER_KITTEN = "You look like grandpa's cat!",
        CRITTER_PERDLING = "Gobble gobble!",
		CRITTER_LUNARMOTHLING = "Are you some kind of bug?",

		CROW =
		{
			GENERIC = "Oh, you look like you're having a grand time, flying about.",
			HELD = "I all want a bit of freedom.",
		},
		CUTGRASS = "I should be able to weave this, too.",
		CUTREEDS = "Sugar cane! Wait, no. Reeds.",
		CUTSTONE = "Squared rocks.",
		DEADLYFEAST = "Scent of doom.", --unimplemented
		DEER =
		{
			GENERIC = "It looks soft.",
			ANTLER = "Did you change your hair? Looks good!",
		},
        DEER_ANTLER = "Haha, weird.",
        DEER_GEMMED = "Don't hurt me and I won't hurt you!",
		DEERCLOPS = "He might be able to digest me!",
		DEERCLOPS_EYEBALL = "Yucktastic.",
		EYEBRELLAHAT =	"Disturbing, but it'll keep me dry.",
		DEPLETED_GRASS =
		{
			GENERIC = "It was once grass.",
		},
        GOGGLESHAT = "Makes me see funny.",
        DESERTHAT = "Makes me see funny, but it works.",
        ANTLIONHAT = "I can pretend I'm an Antlion!",
		DEVTOOL = "Axe me a question!",
		DEVTOOL_NODEV = "I can't wield that.",
		DIRTPILE = "A pile of dirt. I bet it's hiding something.",
		DIVININGROD =
		{
			COLD = "Nothing nearby.", --singleplayer
			GENERIC = "Lead and I shall follow.", --singleplayer
			HOT = "I am close!", --singleplayer
			WARM = "Going the right way.", --singleplayer
			WARMER = "Something must be near.", --singleplayer
		},
		DIVININGRODBASE =
		{
			GENERIC = "It's a mystery.", --singleplayer
			READY = "Looks like there's a hole for an oversized key.", --singleplayer
			UNLOCKED = "It's ready to go.", --singleplayer
		},
		DIVININGRODSTART = "Radical rod!", --singleplayer
		DRAGONFLY = "Oh, don't you just drag on.",
		ARMORDRAGONFLY = "Another creature casing.",
		DRAGON_SCALES = "They don't weigh much for scales.",
		DRAGONFLYCHEST =
		{
			GENERIC = "It looks like my old toy chest!",
            UPGRADED_STACKSIZE = "It's way bigger and better than my old toy chest!",
		},
		DRAGONFLYFURNACE =
		{
			HAMMERED = "What happened to your face?",
			GENERIC = "It's a fancy furnace!", --no gems
			NORMAL = "Warmish furnace.", --one gem
			HIGH = "Hot hot furnace!", --two gems
		},

        HUTCH = "Give me a Huggy!",
        HUTCH_FISHBOWL =
        {
            GENERIC = "He's my new friend.",
            WAITING = "He was my new friend.",
        },
		LAVASPIT =
		{
			HOT = "Too hot for me!",
			COOL = "Looks safe now.",
		},
		LAVA_POND = "Ouch! Burnies!",
		LAVAE = "Sizzling hot!",
		LAVAE_COCOON = "Being all froze up probably isn't comfy.",
		LAVAE_PET =
		{
			STARVING = "It looks starving!",
			HUNGRY = "Poor hungry lavae.",
			CONTENT = "Happy lavae!",
			GENERIC = "It's my friend.",
		},
		LAVAE_EGG =
		{
			GENERIC = "Maybe I can make it hatch?",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "Poor egg. It looks cold.",
			COMFY = "The egg seems happy.",
		},
		LAVAE_TOOTH = "What a weird tooth.",

		DRAGONFRUIT = "It looks suspect.",
		DRAGONFRUIT_COOKED = "It looks tastier now.",
		DRAGONFRUIT_SEEDS = "I could grow something with these.",
		DRAGONPIE = "Oh! Sweet and tasty!!",
		DRUMSTICK = "I just want to bang on my drum.",
		DRUMSTICK_COOKED = "I love finger food.",
		DUG_BERRYBUSH = "Into the ground with you!",
		DUG_BERRYBUSH_JUICY = "Into the ground with you!",
		DUG_GRASS = "Into the ground with you!",
		DUG_MARSH_BUSH = "Into the ground with you!",
		DUG_SAPLING = "Into the ground with you!",
		DURIAN = "Pungent.",
		DURIAN_COOKED = "No sir, I don't like it.",
		DURIAN_SEEDS = "I could grow something with these.",
		EARMUFFSHAT = "Strap some rabbits to your head, good idea.",
		EGGPLANT = "Blech, eggplant.",
		EGGPLANT_COOKED = "Smells yummy.",
		EGGPLANT_SEEDS = "I could grow something with these.",

		ENDTABLE =
		{
			BURNT = "Antiques are dumb, anyway.",
			GENERIC = "Looks great!",
			EMPTY = "It's empty.",
			WILTED = "They look sad.",
			FRESHLIGHT = "Nice and bright!",
			OLDLIGHT = "It's gonna go out soon.", -- will be wilted soon, light radius will be very small at this point
		},
		DECIDUOUSTREE =
		{
			BURNING = "What a senseless waste of firewood.",
			BURNT = "Only I can prevent forest fires.",
			CHOPPED = "Would a cool bandage make it better, Mr. Tree?",
			POISON = "What're you so mad about?",
			GENERIC = "My, what nice foliage you have.",
		},
		ACORN = "Tree or food, there's something inside.",
        ACORN_SAPLING = "May you have a long and free life.",
		ACORN_COOKED = "Roasted on an open fire.",
		BIRCHNUTDRAKE = "So that's what's inside!",
		EVERGREEN =
		{
			BURNING = "What a senseless waste of firewood.",
			BURNT = "Only I can prevent forest fires.",
			CHOPPED = "Would a cool bandage make it better, Mr. Tree?",
			GENERIC = "Pines are always greener on the other side of the fence.",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "What a senseless waste of firewood.",
			BURNT = "Only I can prevent forest fires.",
			CHOPPED = "Would a cool bandage make it better, Mr. Tree?",
			GENERIC = "A dying breed.",
		},
		TWIGGYTREE =
		{
			BURNING = "What a senseless waste of firewood.",
			BURNT = "Only I can prevent forest fires.",
			CHOPPED = "Would a cool bandage make you feel better, Mr. Tree?",
			GENERIC = "I want to climb it!",
			DISEASED = "Maybe it needs some chicken soup?", --unimplemented
		},
		TWIGGY_NUT_SAPLING = "Little tree!",
        TWIGGY_OLD = "It's too flimsy to climb.",
		TWIGGY_NUT = "The tree wants to come out and play!",
		EYEPLANT = "Ever vigilant.",
		INSPECTSELF = "Is my hat on right?",
		FARMPLOT =
		{
			GENERIC = "I'll have a go at this farming thing.",
			GROWING = "C'mooon, plants!",
			NEEDSFERTILIZER = "The soil is dried up.",
			BURNT = "A razed farm is no farm at all.",
		},
		FEATHERHAT = "It looks like it took a whole flock to make that hat!",
		FEATHER_CROW = "Feather of black.",
		FEATHER_ROBIN = "Feather of red.",
		FEATHER_ROBIN_WINTER = "Feather of white.",
		FEATHER_CANARY = "Feather of yellow.",
		FEATHERPENCIL = "Haha! It tickles!",
        COOKBOOK = "Now I'll never forget a recipe!",
		FEM_PUPPET = "She's locked up!", --single player
		FIREFLIES =
		{
			GENERIC = "Elusive little buggies.",
			HELD = "Going on an adventure, got some fireflies in my pocket!",
		},
		FIREHOUND = "He's got a fire under his feet. And all inside him.",
		FIREPIT =
		{
			EMBERS = "I should put something on the fire before it goes out.",
			GENERIC = "Sure beats the cold. And darkness.",
			HIGH = "That fire is huge!",
			LOW = "The fire's getting a touch low.",
			NORMAL = "Nice and warm.",
			OUT = "Well, that's done. But not forever!",
		},
		COLDFIREPIT =
		{
			EMBERS = "I should put something on the fire before it goes out.",
			GENERIC = "Sure beats the heat. And darkness.",
			HIGH = "That fire is huge!",
			LOW = "The fire's getting a touch low.",
			NORMAL = "Nice and cool.",
			OUT = "Well, that's done. But not forever!",
		},
		FIRESTAFF = "I didn't start the fire.",
		FIRESUPPRESSOR =
		{
			ON = "This would come in handy in a snowball fight.",
			OFF = "It's off.",
			LOWFUEL = "Running low on fuel.",
		},

		FISH = "It could stand to be fried.",
		FISHINGROD = "I miss grandpa's fishing trips.",
		FISHSTICKS = "Not the same fish from Mafia Town.",
		FISHTACOS = "Taco Tuesday!",
		FISH_COOKED = "Flaky and moist. Delicious.",
		FLINT = "Oh, to feel a sharp edge against my skin.",
		FLOWER =
		{
            GENERIC = "I agree that flowers are nice.",
            ROSE = "Bright red petals! I love it!",
        },
        FLOWER_WITHERED = "Aww so sad!",
		FLOWERHAT = "Colorful crown.",
		FLOWER_EVIL = "This flower is decidedly not nice!",
		FOLIAGE = "Soft and leafy.",
		FOOTBALLHAT = "I could be good at football, much better than I was!",
        FOSSIL_PIECE = "I want to play archaeologist!",
        FOSSIL_STALKER =
        {
			GENERIC = "Needs more bones!",
			FUNNY = "Maybe I shouldn't play with bones.",
			COMPLETE = "That looks real good!",
        },
        STALKER = "I don't think it's friendly.",
        STALKER_ATRIUM = "I'll defend myself if I have to.",
        STALKER_MINION = "Creepy!",
        THURIBLE = "It gets really hot.",
        ATRIUM_OVERGROWTH = "I never learned those letters.",
		FROG =
		{
			DEAD = "A hop too far.",
			GENERIC = "Ack! Sticky tongue!",
			SLEEPING = "Oblivious amphibious.",
		},
		FROGGLEBUNWICH = "Sandwich for me, frog legs for him.",
		FROGLEGS = "A fraction of a frog.",
		FROGLEGS_COOKED = "I admit, I've acquired a taste for those.",
		FRUITMEDLEY = "Pile o'fruit.",
		FURTUFT = "Fluffy!",
		GEARS = "WX eats them by the fistful!",
		GHOST = "That's not a fun ghost!",
		GOLDENAXE = "Life is okay when you've got a golden axe.",
		GOLDENPICKAXE = "The finest pickaxe of them all.",
		GOLDENPITCHFORK = "I can do some fancy forking with this.",
		GOLDENSHOVEL = "I'm gonna dig so many holes.",
		GOLDNUGGET = "I definitely like shiny.",
		GRASS =
		{
			BARREN = "It could use some perking up.",
			WITHERED = "The heat wave bested it.",
			BURNING = "Fire, fire, fire!",
			GENERIC = "Grass, next best thing to silk.",
			PICKED = "Picked down to the stems.",
			DISEASED = "Maybe it needs some chicken soup?", --unimplemented
			DISEASING = "Are you okay, lil tuft?", --unimplemented
		},
		GRASSGEKKO =
		{
			GENERIC = "Hey! You dropped something!",
			DISEASED = "It's got ouchies in its tummy.", --unimplemented
		},
		GREEN_CAP = "Smells really earthy.",
		GREEN_CAP_COOKED = "Heat really brings out the juices.",
		GREEN_MUSHROOM =
		{
			GENERIC = "Ready for harvest.",
			INGROUND = "I can't get at it!",
			PICKED = "It's gone now.",
		},
		GUNPOWDER = "This black powder stuff packs a punch.",
		HAMBAT = "An interesting way to use food.",
		HAMMER = "Chaos and destruction!",
		HEALINGSALVE = "Soothing.",
		HEATROCK =
		{
			FROZEN = "It's cold to the touch.",
			COLD = "It's getting chilly.",
			GENERIC = "It's a rock.",
			WARM = "It's getting hot!",
			HOT = "It's hot to the touch!",
		},
		HOME = "Hellooo? I'm here!",
		HOMESIGN =
		{
			GENERIC = "I could write on that if only I had a pen!",
            UNWRITTEN = "Ooooh, what should I say?",
			BURNT = "The lettering burnt off.",
		},
		ARROWSIGN_POST =
		{
			GENERIC = "I could write on that if only I had a pen!",
            UNWRITTEN = "Ooooh, what should I say?",
			BURNT = "The lettering burnt off.",
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "I could write on that if only I had a pen!",
            UNWRITTEN = "Ooooh, what should I say?",
			BURNT = "The lettering burnt off.",
		},
		HONEY = "Sticky and sweet.",
		HONEYCOMB = "Honey pods!",
		HONEYHAM = "Ooo, tasty!",
		HONEYNUGGETS = "I wish they were shaped like dinosaurs.",
		HORN = "If this makes a mating call I'm all in trouble.",
		HOUND = "That's an angry puppy!",
		HOUNDCORPSE =
		{
			GENERIC = "Poor puppy.",
			BURNING = "I miss the puppy, but I don't want it to come back.",
			REVIVING = "Make it stop, make it stop!",
		},
		HOUNDBONE = "There isn't much left.",
		HOUNDMOUND = "This place scares me.",
		ICEBOX = "Spoil not, food supplies!",
		ICEHAT = "This should keep me cool.",
		ICEHOUND = "He has a chilling look in his eyes.",
		INSANITYROCK =
		{
			ACTIVE = "Move, stupid rock!",
			INACTIVE = "I wonder what that does.",
		},
		JAMMYPRESERVES = "Ew... sticky fingies.",

		KABOBS = "Foods on a stick!",
		KILLERBEE =
		{
			GENERIC = "Uh oh, run!",
			HELD = "I hope it doesn't escape.",
		},
		KNIGHT = "Wow! That's complicated clockwork.",
		KOALEFANT_SUMMER = "Maybe it's lost.",
		KOALEFANT_WINTER = "I finally found it!",
		KOALEFANT_CARCASS = "This makes me sad.",
		KRAMPUS = "Give me back my things!",
		KRAMPUS_SACK = "I could put more in but I'm scared to touch the stuff he left inside.",
		LEIF = "Where did that come from?!",
		LEIF_SPARSE = "Where did that come from?!",
		LIGHTER  = "Lighter than what?",
		LIGHTNING_ROD =
		{
			CHARGED = "It looks all glowy!",
			GENERIC = "This might keep me safe.",
		},
		LIGHTNINGGOAT =
		{
			GENERIC = "My father kept goats.",
			CHARGED = "It's all glowy.",
		},
		LIGHTNINGGOATHORN = "This might make a good weapon.",
		GOATMILK = "A glass of milk with every supper.",
		LITTLE_WALRUS = "He has anger in his eyes.",
		LIVINGLOG = "This log has a face.",
		LOG =
		{
			BURNING = "So much for my arts and crafts!",
			GENERIC = "That's a log of wood.",
		},
		LUCY = "If I talk to it will it talk back?",
		LUREPLANT = "What a colorful plant.",
		LUREPLANTBULB = "I wish I could learn to generate meat.",
		MALE_PUPPET = "He doesn't look like he's having much fun.", --single player

		MANDRAKE_ACTIVE = "You're a bad friend!",
		MANDRAKE_PLANTED = "That's a funny looking plant.",
		MANDRAKE = "The skin is all seared.",

        MANDRAKESOUP = "I fall asleep in the bath too!",
        MANDRAKE_COOKED = "The meeping had to stop.",
        MAPSCROLL = "There's nothing on it.",
        MARBLE = "Maybe I should take up sculpting.",
        MARBLEBEAN = "Bean there, done that!",
        MARBLEBEAN_SAPLING = "You can plant anything in the ground!",
        MARBLESHRUB = "That's a weird shape for a bush.",
        MARBLEPILLAR = "Nothing lasts forever on its own.",
        MARBLETREE = "I hope it doesn't fall on me.",
        MARSH_BUSH =
        {
			BURNT = "Extra crispy!",
            BURNING = "It will be gone soon!",
            GENERIC = "Hope I don't fall on that.",
            PICKED = "That hurt my hands.",
        },
        BURNT_MARSH_BUSH = "All burned up.",
        MARSH_PLANT = "That's a thirsty plant.",
        MARSH_TREE =
        {
            BURNING = "It's extra dangerous now!",
            BURNT = "Its growing days are over.",
            CHOPPED = "Axes can solve all tree-related problems!",
            GENERIC = "A harsh tree for harsh conditions.",
        },
        MAXWELL = "That jerk tricked me.",--single player
        MAXWELLHEAD = "Imagine the trouble he has buying hats!",--removed
        MAXWELLLIGHT = "Well, these would've been handy before.",--single player
        MAXWELLLOCK = "It's missing something.",--single player
        MAXWELLTHRONE = "That throne makes my skin crawl.",--single player
        MEAT = "Some fire would spice this up.",
        MEATBALLS = "I used to make these with grandpa!",
        MEATRACK =
        {
            DONE = "Food time!",
            DRYING = "Is it done yet? I'm hungry.",
            DRYINGINRAIN = "It's hard to dry when it's raining.",
            GENERIC = "It's not doing me much good empty!",
            BURNT = "Fire takes all.",
            DONE_NOTMEAT = "Food time!",
            DRYING_NOTMEAT = "Is it done yet? I'm hungry.",
            DRYINGINRAIN_NOTMEAT = "It's hard to dry when it's raining.",
        },
        MEAT_DRIED = "That worked better than expected.",
        MERM = "I would've thought they would bathe more often!",
        MERMHEAD =
        {
            GENERIC = "A waste of food.",
            BURNT = "I wonder who that was.",
        },
        MERMHOUSE =
        {
            GENERIC = "Smells fishy.",
            BURNT = "It's in worse shape than before!",
        },
        MINERHAT = "A handy light for my head.",
        MONKEY = "He just wants to learn!",
        MONKEYBARREL = "Did you hear something?",
        MONSTERLASAGNA = "Mmm!",
        FLOWERSALAD = "Five servings a day.",
        ICECREAM = "I dream of ice cream.",
        WATERMELONICLE = "Just the thing for a hot summer day.",
        TRAILMIX = "Crunchy and healthy.",
        HOTCHILI = "Flavor bombs!",
        GUACAMOLE = "Holy moley, this is tasty.",
        MONSTERMEAT = "Smells bad.",
        MONSTERMEAT_DRIED = "It's really chewy.",
        MOOSE = "She doesn't look at all pleased to see me.",
        MOOSE_NESTING_GROUND = "For its babies' sleepytime.",
        MOOSEEGG = "That would make a huge breakfast!",
        MOSSLING = "Hungry little guys.",
        FEATHERFAN = "This thing is huge!",
        MINIFAN = "It cools me when I run, how nice.",
        GOOSE_FEATHER = "Tickle torture.",
        STAFF_TORNADO = "I'll huff and I'll puff.",
        MOSQUITO =
        {
            GENERIC = "Shoo!",
            HELD = "I should just squish you.",
        },
        MOSQUITOSACK = "Maybe I can put the blood back in?",
        MOUND =
        {
            DUG = "Maybe that was too mean.",
            GENERIC = "My loot sense is tingling.",
        },
        NIGHTLIGHT = "It makes my skin crawl.",
        NIGHTMAREFUEL = "It's cold and slippery.",
        NIGHTSWORD = "Are you seeing this too?",
        NITRE = "What are I supposed to do with this?",
        ONEMANBAND = "I need to practice more.",
        OASISLAKE =
		{
			GENERIC = "That's a pretty lake!",
			EMPTY = "I can make mud pies!",
		},
        PANDORASCHEST = "Stylish storage.",
        PANFLUTE = "A well constructed instrument.",
        PAPYRUS = "I could do my homework.",
        WAXPAPER = "Why have paper you can't draw on?",
        PENGUIN = "Where do they live the rest of the year?",
        PERD = "Come back! I just want to eat you!",
        PEROGIES = "It does not look like pie...",
        PETALS = "How colorful.",
        PETALS_EVIL = "They make my head hurt.",
        PHLEGM = "It's a boogie!",
        PICKAXE = "Rocks will be mine!",
        PIGGYBACK = "It holds so much stuff!",
        PIGHEAD =
        {
            GENERIC = "I just wanted to be friends.",
            BURNT = "Gross.",
        },
        PIGHOUSE =
        {
            FULL = "I can see a pig through the window!",
            GENERIC = "A tall skinny house for a short fat pig.",
            LIGHTSOUT = "I don't mean you any harm!",
            BURNT = "Not so fancy now, pig!",
        },
        PIGKING = "King of the bullies!",
        PIGMAN =
        {
            DEAD = "He won't bully me any more.",
            FOLLOWER = "I never knew we could be friends!",
            GENERIC = "Aw, you're no fun.",
            GUARD = "They look angry.",
            WEREPIG = "He's all furry now!",
        },
        PIGSKIN = "Take that!",
        PIGTENT = "Little pig, little pig, let me in!",
        PIGTORCH = "If only I could get closer.",
        PINECONE = "It's bursting with life.",
        PINECONE_SAPLING = "Grow, grow!",
        LUMPY_SAPLING = "Weird little plant.",
        PITCHFORK = "A good tool to play in the dirt.",
        PLANTMEAT = "It's all squishy.",
        PLANTMEAT_COOKED = "It smells kind of rotten.",
        PLANT_NORMAL =
        {
            GENERIC = "What will blossom?",
            GROWING = "Is it done yet?",
            READY = "I grew it together!",
            WITHERED = "It's all dried out and dead.",
        },
        POMEGRANATE = "I didn't expect this to grow.",
        POMEGRANATE_COOKED = "It's good for me!",
        POMEGRANATE_SEEDS = "I could grow something with these.",
        POND = "Water doesn't go well with my hats.",
        POOP = "Doodoo.",
        FERTILIZER = "Smells awful, but might make stuff grow!",
        PUMPKIN = "That's a huge pumpkin!",
        PUMPKINCOOKIE = "Yum!",
        PUMPKIN_COOKED = "It's all warm now.",
        PUMPKIN_LANTERN = "Just like I used to make at home!",
        PUMPKIN_SEEDS = "I could grow something with these.",
        PURPLEAMULET = "Did you hear something?",
        PURPLEGEM = "I can see knowledge swimming inside.",
        RABBIT =
        {
            GENERIC = "I just want to play!",
            HELD = "He's mine now.",
        },
        RABBITHOLE =
        {
            GENERIC = "Come out! I just want to be friends.",
            SPRING = "I hope they're okay in there.",
        },
        RAINOMETER =
        {
            GENERIC = "It must be powered by magic.",
            BURNT = "I don't think that's accurate.",
        },
        RAINCOAT = "Gotta keep dry.",
        RAINHAT = "It'll keep the water out of your hair.",
        RATATOUILLE = "Do I have to eat my veggies?",
        RAZOR = "I watched my father use one of these.",
        REDGEM = "It feels warm, even on the coldest nights.",
        RED_CAP = "It smells funny.",
        RED_CAP_COOKED = "It smells better now.",
        RED_MUSHROOM =
        {
            GENERIC = "Ready for the taking!",
            INGROUND = "I can't get at it like that.",
            PICKED = "I think some spores remain.",
        },
        REEDS =
        {
            BURNING = "Those burn quickly!",
            GENERIC = "I bet those would be useful.",
            PICKED = "Only stems remain.",
        },
        RELIC = "These haven't been used in a while.",
        RUINS_RUBBLE = "It looks broken.",
        RUBBLE = "Rocks from an old city.",
        RESEARCHLAB =
        {
            GENERIC = "It's like a science lab in here!",
            BURNT = "I think it's broken.",
        },
        RESEARCHLAB2 =
        {
            GENERIC = "Father used to work on something like that.",
            BURNT = "All my work... gone.",
        },
        RESEARCHLAB3 =
        {
            GENERIC = "I should be careful around that.",
            BURNT = "The fires care not for magic.",
        },
        RESEARCHLAB4 =
        {
            GENERIC = "Did I just hear a squeak?",
            BURNT = "Smells like cooking.",
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "It's a giant statue thing!",
            BURNT = "That won't work...",
        },
        RESURRECTIONSTONE = "Some sort of religious monument maybe?",
        ROBIN =
        {
            GENERIC = "Bad experiences...",
            HELD = "Held snug in my pockets.",
        },
        ROBIN_WINTER =
        {
            GENERIC = "What pretty white feathers.",
            HELD = "I should name it \"Francis\".",
        },
        ROBOT_PUPPET = "I don't think they're having fun.", --single player
        ROCK_LIGHT =
        {
            GENERIC = "This lava's all dried up.",--removed
            OUT = "It looks like it might break.",--removed
            LOW = "It's a little less cozy.",--removed
            NORMAL = "Cozy!",--removed
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "I'll need to mine it down, I guess.",
            RAISED = "Gotta get rid of the other boulders first.",
        },
        ROCK = "I'll need to mine it before I can use it.",
        PETRIFIED_TREE = "It's all stone and no bark.",
        ROCK_PETRIFIED_TREE = "It's all stone and no bark.",
        ROCK_PETRIFIED_TREE_OLD = "It's all stone and no bark.",
        ROCK_ICE =
        {
            GENERIC = "Ice can be useful.",
            MELTED = "Puddle!",
        },
        ROCK_ICE_MELTED = "Puddle!",
        ICE = "Chilling.",
        ROCKS = "None of these look like they would skip well.",
        ROOK = "Who made these things!?",
        ROPE = "I could tie stuff up with this.",
        ROTTENEGG = "Ew!",
        ROYAL_JELLY = "It's goopy.",
        JELLYBEAN = "Will they grow into candy beanstalks?",
        SADDLE_BASIC = "I ride!",
        SADDLE_RACE = "It's a saddle, I think?",
        SADDLE_WAR = "I'll have lots of fun riding on this.",
        SADDLEHORN = "Leaves the beast nakey.",
        SALTLICK = "I really regret licking it. Blech.",
        BRUSH = "It's more scratchy than anything.",
		SANITYROCK =
		{
			ACTIVE = "It's in my way.",
			INACTIVE = "Something about this rock feels off.",
		},
		SAPLING =
		{
			BURNING = "So bright!",
			WITHERED = "I think the heat broke it.",
			GENERIC = "These sure grow slowly.",
			PICKED = "Don't worry lil guy, it'll grow back!",
			DISEASED = "Maybe it needs some chicken soup?", --removed
			DISEASING = "Are you okay, lil sapling?", --removed
		},
   		SCARECROW =
   		{
			GENERIC = "I should play dress up!",
			BURNING = "Someone should address this.",
			BURNT = "He got dressed down.",
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "I always wanted pottery lessons!",
			BLOCK = "Oh! There's so many possibilities!",
			SCULPTURE = "Wow! It looks great!",
			BURNT = "Aww. Can I make another one?",
   		},
        SCULPTURE_KNIGHTHEAD = "Did someone lose this?",
		SCULPTURE_KNIGHTBODY =
		{
			COVERED = "I think it really ties the island together.",
			UNCOVERED = "Peekaboo, monster!",
			FINISHED = "You look great!",
			READY = "I think it's stuck in there.",
		},
        SCULPTURE_BISHOPHEAD = "I think it's looking at me!",
		SCULPTURE_BISHOPBODY =
		{
			COVERED = "That looks really nice!",
			UNCOVERED = "Where's your head, mister?",
			FINISHED = "There! All better!",
			READY = "I think it's stuck in there.",
		},
        SCULPTURE_ROOKNOSE = "Looks like a... cactus? No, that's not right.",
		SCULPTURE_ROOKBODY =
		{
			COVERED = "It's a bit scary, but I don't like to judge.",
			UNCOVERED = "It was hiding!",
			FINISHED = "Oh! That piece was his nose.",
			READY = "I think it's stuck in there.",
		},
        GARGOYLE_HOUND = "Haha. I can stack things on its head and it won't even move.",
        GARGOYLE_WEREPIG = "Yikes.",
		SEEDS = "A small life trapped within. My sympathies.",
		SEEDS_COOKED = "Their growing days are over.",
		SEWING_KIT = "Not my usual yarn, but I can make it work!",
		SEWING_TAPE = "Not how I'd fix stuff, but it works.",
		SHOVEL = "Maybe I can tunnel my way out?",
		SILK = "It's so smooth!",
		SKELETON = "Hello? Are you alright?",
		SCORCHED_SKELETON = "They're probably fine.",
        SKELETON_NOTPLAYER = "It makes me a little sad.",
		SKULLCHEST = "Who knows what could be hiding in there!", --removed
		SMALLBIRD =
		{
			GENERIC = "Could this be a friend for me?",
			HUNGRY = "I can see its tummy rumble.",
			STARVING = "Poor thing. It looks so hungry!",
			SLEEPING = "Shhh! It's dreaming.",
		},
		SMALLMEAT = "A couple more'll make a morsel meal!",
		SMALLMEAT_DRIED = "It'll keep longer this way.",
		SPAT = "Maybe it just needs a cuddle!",
		SPEAR = "I should stick things with the pointy part.",
		SPEAR_WATHGRITHR = "Pointy ouchies!",
		WATHGRITHRHAT = "Haha! It's way too big for me!",
		SPIDER =
		{
			DEAD = "I guess that's fine.",
			GENERIC = "Hello, scary big spider.",
			SLEEPING = "I'd best not disturb it.",
		},
		SPIDERDEN = "Nope.",
		SPIDEREGGSACK = "Eww, what is this thing?",
		SPIDERGLAND = "I wish it wasn't good.",
		SPIDERHAT = "Now I can join Webber!",
		SPIDERQUEEN = "Mommy-Longlegs?",
		SPIDER_WARRIOR =
		{
			DEAD = "It's dead.",
			GENERIC = "Run away!",
			SLEEPING = "I'd best not disturb it.",
		},
		SPOILED_FOOD = "Blech!",
        STAGEHAND =
        {
			AWAKE = "WHAT!",
			HIDING = "What is this thing?",
        },
        STATUE_MARBLE =
        {
            GENERIC = "Solid marble!",
            TYPE1 = "Nice sword!",
            TYPE2 = "It looks real lifelike, but it's all cold to touch.",
            TYPE3 = "I've broken so many vases...", --bird bath type statue
        },
		STATUEHARP = "Someone took the head.",
		STATUEMAXWELL = "I'm still a little mad at him. But only a little.",
		STEELWOOL = "Scratchy, like father's beard!",
		STINGER = "I should be careful, I could poke an eye out!",
		STRAWHAT = "I guess it's alright.",
		STUFFEDEGGPLANT = "I will stuff myself with eggyplants!",
		SWEATERVEST = "It itches and fits funny.",
		REFLECTIVEVEST = "Safety first!",
		HAWAIIANSHIRT = "Grandpa's style, definitely.",
		TAFFY = "Candy!",
		TALLBIRD = "Look at those legs!",
		TALLBIRDEGG = "Did I hear a meep?",
		TALLBIRDEGG_COOKED = "Smells great!",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "It's shivering!",
			GENERIC = "I think it's hatching!",
			HOT = "It'll boil if it doesn't cool down soon.",
			LONG = "Looks like an egg.",
			SHORT = "Did that egg just move?",
		},
		TALLBIRDNEST =
		{
			GENERIC = "This could feed me for days!",
			PICKED = "Where is the egg?",
		},
		TEENBIRD =
		{
			GENERIC = "It's getting old so fast!",
			HUNGRY = "It looks hungry!",
			STARVING = "I think it's starving!",
			SLEEPING = "Must've had a busy day.",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "I could use this to visit new worlds!", --single player
			GENERIC = "I can hear the sounds of another world!", --single player
			LOCKED = "It still won't work!", --single player
			PARTIAL = "I don't think I'm done yet!", --single player
		},
		TELEPORTATO_BOX = "The power in this box is unimaginable.", --single player
		TELEPORTATO_CRANK = "A crank that will stand up to punishment.", --single player
		TELEPORTATO_POTATO = "It looks like this goes with something...", --single player
		TELEPORTATO_RING = "I think there are more parts.", --single player
		TELESTAFF = "Just looking at it makes my brain feel fuzzy.",
		TENT =
		{
			GENERIC = "It's way past my bedtime!",
			BURNT = "The fire destroyed it.",
		},
		SIESTAHUT =
		{
			GENERIC = "Is it nap time?",
			BURNT = "I can't take a nap in that!",
		},
		TENTACLE = "I would be mad if something stepped on me, too.",
		TENTACLESPIKE = "I could hit stuff with the pointy bits!",
		TENTACLESPOTS = "Spotty!",
		TENTACLE_PILLAR = "It's huge!",
        TENTACLE_PILLAR_HOLE = "Oooh I should jump in!",
		TENTACLE_PILLAR_ARM = "Aw, it's just a baby!",
		TENTACLE_GARDEN = "It's huge!",
		TOPHAT = "Like father used to wear.",
		TORCH = "This should keep me safe.",
		TRANSISTOR = "A very well crafted doodad!",
		TRAP = "Now I can catch some food!",
		TRAP_TEETH = "This will hurt my enemies.",
		TRAP_TEETH_MAXWELL = "Who would put this here? I could get hurt!", --single player
		TREASURECHEST =
		{
			GENERIC = "I could keep my toys in it!",
			BURNT = "It won't be very useful to me now.",
            UPGRADED_STACKSIZE = "Think of all the toys I could fit in there!",
		},
		TREASURECHEST_TRAP = "It couldn't hurt to take a peek inside...",
        CHESTUPGRADE_STACKSIZE = "Will this make my toy chest bigger?", -- Describes the kit upgrade item.
		COLLAPSEDCHEST = "Can I dig for treasure?",
		SACRED_CHEST =
		{
			GENERIC = "I feel cold.",
			LOCKED = "It's judging me.",
		},
		TREECLUMP = "It's in my way!", --removed

		TRINKET_1 = "I could still play with these, if I'm extra creative.", --Melted Marbles
		TRINKET_2 = "A voiceless instrument.", --Fake Kazoo
		TRINKET_3 = "It won't come undone!", --Gord's Knot
		TRINKET_4 = "It's watching me.", --Gnome
		TRINKET_5 = "Yay, a new toy!", --Toy Rocketship
		TRINKET_6 = "Maybe I'll find a use for these.", --Frazzled Wires
		TRINKET_7 = "Another toy!", --Ball and Cup
		TRINKET_8 = "I miss bath toys.", --Rubber Bung
		TRINKET_9 = "None of them match!", --Mismatched Buttons
		TRINKET_10 = "Just like grandpa wears!", --Dentures
		TRINKET_11 = "Beep boop!", --Lying Robot
		TRINKET_12 = "Feels leathery.", --Dessicated Tentacle
		TRINKET_13 = "It's watching me.", --Gnomette
		TRINKET_14 = "I want some hot cocoa.", --Leaky Teacup
		TRINKET_15 = "I don't know how to play this game.", --Pawn
		TRINKET_16 = "I don't know how to play this game.", --Pawn
		TRINKET_17 = "Spork. Spork. Spork. Hahaha!", --Bent Spork
		TRINKET_18 = "I like toys.", --Trojan Horse
		TRINKET_19 = "This toy doesn't work very well.", --Unbalanced Top
		TRINKET_20 = "Can I dig in the dirt with this?", --Backscratcher
		TRINKET_21 = "What even is this thing?", --Egg Beater
		TRINKET_22 = "It's kinda like my webbing!", --Frayed Yarn
		TRINKET_23 = "Are I supposed to blow on it?", --Shoehorn
		TRINKET_24 = "No cookies. Yet!", --Lucky Cat Jar
		TRINKET_25 = "It's stinky.", --Air Unfreshener
		TRINKET_26 = "You're my cuppy cup!", --Potato Cup
		TRINKET_27 = "This is stupid.", --Coat Hanger
		TRINKET_28 = "Maybe Maxwell will teach me how to play.", --Rook
        TRINKET_29 = "Maybe Maxwell will teach me how to play.", --Rook
        TRINKET_30 = "I can't follow the rules if I don't know them.", --Knight
        TRINKET_31 = "I can't follow the rules if I don't know them.", --Knight
        TRINKET_32 = "It's not bouncy. What's the point?", --Cubic Zirconia Ball
        TRINKET_33 = "It's a tiny spider for my finger!!", --Spider Ring
        TRINKET_34 = "The monkey probably needed that.", --Monkey Paw
        TRINKET_35 = "I kinda wanna drink what's left, but he won't let me.", --Empty Elixir
        TRINKET_36 = "I've already got some, thanks.", --Faux fangs
        TRINKET_37 = "Maybe I should hide this before someone gets hurt.", --Broken Stake
        TRINKET_38 = "Haha! Everything looks so small!", -- Binoculars Griftlands trinket
        TRINKET_39 = "That's boring.", -- Lone Glove Griftlands trinket
        TRINKET_40 = "Haha, it looks like a snail shell.", -- Snail Scale Griftlands trinket
        TRINKET_41 = "Haha! Weird!", -- Goop Canister Hot Lava trinket
        TRINKET_42 = "Neat!!", -- Toy Cobra Hot Lava trinket
        TRINKET_43= "C'mon little croc! Let's adventure!", -- Crocodile Toy Hot Lava trinket
        TRINKET_44 = "The plant is so pretty!", -- Broken Terrarium ONI trinket
        TRINKET_45 = "It doesn't get any good channels.", -- Odd Radio ONI trinket
        TRINKET_46 = "What's it for?", -- Hairdryer ONI trinket

        -- The numbers align with the trinket numbers above.
        LOST_TOY_1  = "I think those might belong to someone else.",
        LOST_TOY_2  = "I think those might belong to someone else.",
        LOST_TOY_7  = "I think those might belong to someone else.",
        LOST_TOY_10 = "I think those might belong to someone else.",
        LOST_TOY_11 = "I think those might belong to someone else.",
        LOST_TOY_14 = "I think those might belong to someone else.",
        LOST_TOY_18 = "I think those might belong to someone else.",
        LOST_TOY_19 = "I think those might belong to someone else.",
        LOST_TOY_42 = "I think those might belong to someone else.",
        LOST_TOY_43 = "I think those might belong to someone else.",

        HALLOWEENCANDY_1 = "Oh, Wendy! I'll trade you for your choco pigs!",
        HALLOWEENCANDY_2 = "Haha ew! It's weird!",
        HALLOWEENCANDY_3 = "Haha, that's not candy!",
        HALLOWEENCANDY_4 = "I aren't totally comfortable with this.",
        HALLOWEENCANDY_5 = "I forgot what good things tasted like!",
        HALLOWEENCANDY_6 = "No worse than the other stuff I've eaten out here!",
        HALLOWEENCANDY_7 = "Oh, Ms. Wicker! I saved these for you!",
        HALLOWEENCANDY_8 = "Candy candy candy!",
        HALLOWEENCANDY_9 = "Gummy worms, yummy worms!",
        HALLOWEENCANDY_10 = "Candy candy candy!",
        HALLOWEENCANDY_11 = "Mmm! Sweet revenge!",
        HALLOWEENCANDY_12 = "Wriggly, yet satisfying.", --ONI meal lice candy
        HALLOWEENCANDY_13 = "I like these a lot.", --Griftlands themed candy
        HALLOWEENCANDY_14 = "Gosh, it's spicy.", --Hot Lava pepper candy
        CANDYBAG = "Treats, treats, treats!",

		HALLOWEEN_ORNAMENT_1 = "Oooh. Spooky. I should decorate!",
		HALLOWEEN_ORNAMENT_2 = "Gosh. That almost looks real.",
		HALLOWEEN_ORNAMENT_3 = "Aw. It's not real. I should hang it somewhere.",
		HALLOWEEN_ORNAMENT_4 = "I should hang it somewhere for Halloween!",
		HALLOWEEN_ORNAMENT_5 = "I should put this guy in a tree!",
		HALLOWEEN_ORNAMENT_6 = "If I put it in a tree it'd look almost real.",

		HALLOWEENPOTION_DRINKS_WEAK = "It's only a little powerful.",
		HALLOWEENPOTION_DRINKS_POTENT = "It's pretty powerful.",
        HALLOWEENPOTION_BRAVERY = "Makes me feel big and strong!",
		HALLOWEENPOTION_MOON = "Should I drink it? Nah, probably not.",
		HALLOWEENPOTION_FIRE_FX = "Neat! It's like firecrackers.",
		MADSCIENCE_LAB = "Wow. Look at it bubble.",
		LIVINGTREE_ROOT = "I should plant this somewhere.",
		LIVINGTREE_SAPLING = "Little monster!",

        DRAGONHEADHAT = "The front part's sort of scary.",
        DRAGONBODYHAT = "I'm not sure I want to be in *another* belly.",
        DRAGONTAILHAT = "I like the tail!",
        PERDSHRINE =
        {
            GENERIC = "I wanna give it something!",
            EMPTY = "The pot's empty.",
            BURNT = "The fire destroyed it.",
        },
        REDLANTERN = "My own personal night light!",
        LUCKY_GOLDNUGGET = "So shiny!",
        FIRECRACKERS = "Don't worry Ms. Wicker, I'll be careful.",
        PERDFAN = "It's so big!!",
        REDPOUCH = "I'm so lucky!",
        WARGSHRINE =
        {
            GENERIC = "It wants to give me presents!",
            EMPTY = "I could put the torch in, maybe.",
--fallback to speech_wilson.lua             BURNING = "I should make something fun.", --for willow to override
            BURNT = "The fire destroyed it.",
        },
        CLAYWARG =
        {
            GENERIC = "N-nice puppy!",
            STATUE = "It's got no eyes. Creepy!",
        },
        CLAYHOUND =
        {
            GENERIC = "Sit! Stay?",
            STATUE = "It looks like a big puppy.",
        },
        HOUNDWHISTLE = "My head buzzes when I blow it.",
        CHESSPIECE_CLAYHOUND = "Puppy!",
        CHESSPIECE_CLAYWARG = "That's a big, bad dog.",

		PIGSHRINE =
		{
            GENERIC = "I can make some fun stuff now!",
            EMPTY = "I should find some meat for it.",
            BURNT = "Aww... that's too bad.",
		},
		PIG_TOKEN = "Neat! The Pig King would like that.",
		PIG_COIN = "Wow! I have my very own pig friend!",
		YOTP_FOOD1 = "Yummy!",
		YOTP_FOOD2 = "Mmmmmm.",
		YOTP_FOOD3 = "Smells good.",

		PIGELITE1 = "Cool tattoos!", --BLUE
		PIGELITE2 = "Yikes! He's angry.", --RED
		PIGELITE3 = "Leave me alone!", --WHITE
		PIGELITE4 = "Wish he wouldn't hit me so much.", --GREEN

		PIGELITEFIGHTER1 = "Cool tattoos!", --BLUE
		PIGELITEFIGHTER2 = "Yikes! He's angry.", --RED
		PIGELITEFIGHTER3 = "Leave me alone!", --WHITE
		PIGELITEFIGHTER4 = "Wish he wouldn't hit me so much.", --GREEN

		CARRAT_GHOSTRACER = "That one looks kind of spooky...",

        YOTC_CARRAT_RACE_START = "I'll win for sure!",
        YOTC_CARRAT_RACE_CHECKPOINT = "Check out this checkpoint!",
        YOTC_CARRAT_RACE_FINISH =
        {
            GENERIC = "I hope my little friend doesn't get lost on the way.",
            BURNT = "The firecrackers might have been a bad idea after all...",
            I_WON = "I did it! I won!!",
            SOMEONE_ELSE_WON = "Woah, {winner}! How did you teach your Carrat to race like that?",
        },

		YOTC_CARRAT_RACE_START_ITEM = "Where should the race start?",
        YOTC_CARRAT_RACE_CHECKPOINT_ITEM = "Might get lost without these markers.",
		YOTC_CARRAT_RACE_FINISH_ITEM = "I can't wait to see who crosses the finish line first!",

		YOTC_SEEDPACKET = "Hm, where should I plant them?",
		YOTC_SEEDPACKET_RARE = "I wonder what's gonna grow!",

		MINIBOATLANTERN = "I like to watch it paddle around.",

        YOTC_CARRATSHRINE =
        {
            GENERIC = "Do you have any fun things for me?",
            EMPTY = "I should give it a present!",
            BURNT = "That's no good...",
        },

        YOTC_CARRAT_GYM_DIRECTION =
        {
            GENERIC = "I'm gonna be the very best trainer!",
            RAT = "They're getting the hang of it!",
            BURNT = "Uh oh...",
        },
        YOTC_CARRAT_GYM_SPEED =
        {
            GENERIC = "\"The wheel on the gym goes round and round.\"",
            RAT = "Look at it go!",
            BURNT = "Uh oh...",
        },
        YOTC_CARRAT_GYM_REACTION =
        {
            GENERIC = "I need to be ready for anything.",
            RAT = "That looks kind of fun!",
            BURNT = "Uh oh...",
        },
        YOTC_CARRAT_GYM_STAMINA =
        {
            GENERIC = "Look! It's got a little jump rope!",
            RAT = "Aww, it's so cute!",
            BURNT = "Uh oh...",
        },

        YOTC_CARRAT_GYM_DIRECTION_ITEM = "I should find someplace to put this.",
        YOTC_CARRAT_GYM_SPEED_ITEM = "This should help make my Carrat faster!",
        YOTC_CARRAT_GYM_STAMINA_ITEM = "This'll be fun!",
        YOTC_CARRAT_GYM_REACTION_ITEM = "All the things I need to build a gym for my Carrat.",

        YOTC_CARRAT_SCALE_ITEM = "I can't wait to see how good my Carrat is.",
        YOTC_CARRAT_SCALE =
        {
            GENERIC = "I already know my Carrat's the best!",
            CARRAT = "I still believe in you, no matter what the scale says.",
            CARRAT_GOOD = "Wow! You've been training hard!",
            BURNT = "I don't think I can use it anymore...",
        },

        YOTB_BEEFALOSHRINE =
        {
            GENERIC = "Let's make things!",
            EMPTY = "I should give it something. Maybe something fluffy!",
            BURNT = "That isn't good...",
        },

        BEEFALO_GROOMER =
        {
            GENERIC = "I want my beefalo to look its best!",
            OCCUPIED = "You're going to look so good when I'm finished!",
            BURNT = "Aww...",
        },
        BEEFALO_GROOMER_ITEM = "I'd better get it set up.",

        YOTR_RABBITSHRINE =
        {
            GENERIC = "Do you have any fun things for me to play with?",
            EMPTY = "Please don't bite me, I'll find something tastier for you to eat!",
            BURNT = "Oh no!",
        },

        NIGHTCAPHAT = "Father used to wear a nightcap just like that.",

        YOTR_FOOD1 = "It looks like cake, but it smells like veggies...",
        YOTR_FOOD2 = "Mmm, the moon is tasty!",
        YOTR_FOOD3 = "I kinda want to poke it.",
        YOTR_FOOD4 = "I can eat one puff, and share the rest with my friends!",

        YOTR_TOKEN = "I shouldn't start fights... but do pillow fights count?",

        COZY_BUNNYMAN = "Can I join your slumber party?",

        HANDPILLOW_BEEFALOWOOL = "A fluffy puffy pillow!",
        HANDPILLOW_KELP = "Is that pillow... dripping?",
        HANDPILLOW_PETALS = "It's the nicest pillow I've ever smelled!",
        HANDPILLOW_STEELWOOL = "Ah! This one's really scratchy...",

        BODYPILLOW_BEEFALOWOOL = "A fluffy puffy pillow!",
        BODYPILLOW_KELP = "Is that pillow... dripping?",
        BODYPILLOW_PETALS = "It's the nicest pillow I've ever smelled!",
        BODYPILLOW_STEELWOOL = "Ah! This one's really scratchy...",

		BISHOP_CHARGE_HIT = "Owie!",
		TRUNKVEST_SUMMER = "It's so puffy!",
		TRUNKVEST_WINTER = "You're always supposed to wear a jacket!",
		TRUNK_COOKED = "Looks filling!",
		TRUNK_SUMMER = "I took his nose!",
		TRUNK_WINTER = "He blue his nose.",
		TUMBLEWEED = "Who knows what that tumbleweed has picked up.",
		TURKEYDINNER = "Like Cooking Cat would make!",
		TWIGS = "Does anyone want to play stick swords with me??",
		UMBRELLA = "Should keep some of the rain out.",
		GRASS_UMBRELLA = "Rain won't keep me from playing in puddles!",
		UNIMPLEMENTED = "What a crummy item.",
		WAFFLES = "Yummy!",
		WALL_HAY =
		{
			GENERIC = "This will keep all sorts of things out!",
			BURNT = "It didn't keep the fire out.",
		},
		WALL_HAY_ITEM = "Some grass tied together.",
		WALL_STONE = "Bow to the base-building masters!",
		WALL_STONE_ITEM = "These should come in handy.",
		WALL_RUINS = "Looks sturdy.",
		WALL_RUINS_ITEM = "Wow, these are really heavy.",
		WALL_WOOD =
		{
			GENERIC = "Like a pillow fort, but wood!",
			BURNT = "Turns out wood burns really well.",
		},
		WALL_WOOD_ITEM = "They won't keep me safe if I keep holding them.",
		WALL_MOONROCK = "I feel safe behind this wall... it makes me sleepy...",
		WALL_MOONROCK_ITEM = "I thought \"moon\" meant something totally different!",
		WALL_DREADSTONE = "It looks kinda scary...",
		WALL_DREADSTONE_ITEM = "Do I have to build it?",
        WALL_SCRAP = "Junk, junk, junk!",
        WALL_SCRAP_ITEM = "Junk, junk, junk!",
		FENCE = "I don't think I can jump over that.",
        FENCE_ITEM = "I'll build a fence!",
        FENCE_GATE = "The hinges are a little squeaky.",
        FENCE_GATE_ITEM = " build a gate!",
		WALRUS = "I don't think he wants to be friends with me.",
		WALRUSHAT = "Reminds me of grandpa.",
		WALRUS_CAMP =
		{
			EMPTY = "I think someone was here.",
			GENERIC = "Maybe they'll invite me in?",
		},
		WALRUS_TUSK = "Maybe I can use it for arts and crafts.",
		WARDROBE =
		{
			GENERIC = "I like to pop out and scare my friends sometimes. Haha!",
            BURNING = "Fire fire fire!",
			BURNT = "I can't hide in there any more.",
		},
		WARG = "I don't think that puppy is very happy.",
        WARGLET = "N-nice puppy...",

		WASPHIVE = "Sounds like anger!",
		WATERBALLOON = "I'll be careful not to throw it... On \"accident\"...",
		WATERMELON = "Looks tasty!",
		WATERMELON_COOKED = "Anything can be cooked!",
		WATERMELONHAT = "This is the best idea anyone's ever had.",
		WAXWELLJOURNAL =
		{
			GENERIC = "I don't think I should play with that...",
--fallback to speech_wilson.lua 			NEEDSFUEL = "only_used_by_waxwell",
		},
		WETGOOP = "Experimenting is fun!",
        WHIP = "Oooh, it makes so much noise!",
		WINTERHAT = "I could do better.",
		WINTEROMETER =
		{
			GENERIC = "How hot is it, Mr. Thermal Measurer?",
			BURNT = "How come everything turns to ashes? It's sad.",
		},

        WINTER_TREE =
        {
            BURNT = "Aw... Why...",
            BURNING = "Nooo! The tree!",
            CANDECORATE = "Winter's Feast! It's Winter's Feast!",
            YOUNG = "It still needs to grow some more.",
        },
		WINTER_TREESTAND =
		{
			GENERIC = "It's just a boring planter without a tree.",
            BURNT = "Aw... Why...",
		},
        WINTER_ORNAMENT = "Can I get a boost? I can't reach the treetop.",
        WINTER_ORNAMENTLIGHT = "I want to keep one for myself.",
        WINTER_ORNAMENTBOSS = "Wow, that one looks great!",
		WINTER_ORNAMENTFORGE = "Not so scary when they're like this.",
		WINTER_ORNAMENTGORGE = "Huh. It kinda looks...goaty!",

        WINTER_FOOD1 = "I won't eat it. It's my friend now.", --gingerbread cookie
        WINTER_FOOD2 = "Icy icy icing!", --sugar cookie
        WINTER_FOOD3 = "Eat twenty candy canes! There's no candy shame!", --candy cane
        WINTER_FOOD4 = "Yuck! What is that??", --fruitcake
        WINTER_FOOD5 = "Haha, Wendy! Watch my Woodie impression!", --yule log cake
        WINTER_FOOD6 = "Where are the plums?", --plum pudding
        WINTER_FOOD7 = "Apple juice?! Yes!!", --apple cider
        WINTER_FOOD8 = "It makes my hands and tummy so warm.", --hot cocoa
        WINTER_FOOD9 = "It's really, really good!", --eggnog

		WINTERSFEASTOVEN =
		{
			GENERIC = "Woah, that oven's huge!",
			COOKING = "Should I set the table while it's cooking?",
			ALMOST_DONE_COOKING = "I can't wait til it's done!",
			DISH_READY = "It's ready to eat!",
		},
		BERRYSAUCE = "It's so sweet, it almost tastes like candy!",
		BIBINGKA = "Huh, it's like a sweet bread!",
		CABBAGEROLLS = "I hope Ms. Wickerbottom doesn't find out I didn't eat the cabbage...",
		FESTIVEFISH = "Mmm, tasty!",
		GRAVY = "I like lots of gravy!",
		LATKES = "They're like pancakes made out of potatoes!",
		LUTEFISK = "It looks weird... but tastes great!",
		MULLEDDRINK = "Warms me right up!",
		PANETTONE = "Are I sure that isn't a fruitcake in disguise?",
		PAVLOVA = "I love anything with sugar!",
		PICKLEDHERRING = "It looks tasty but... pickled fish?",
		POLISHCOOKIE = "Yay! I love cookies!",
		PUMPKINPIE = "I'd like a big slice, please!",
		ROASTTURKEY = "Can I have the wishbone?",
		STUFFING = "It smells so good!",
		SWEETPOTATO = "Are those marshmallows on top?",
		TAMALES = "Mmm, spicy!",
		TOURTIERE = "I've never had meat in a pie before.",

		TABLE_WINTERS_FEAST =
		{
			GENERIC = "So big it could fit everyone!",
			HAS_FOOD = "Enough food for everyone!",
			WRONG_TYPE = "Not the season for this.",
			BURNT = "Aww, someone ruined it.",
		},

		GINGERBREADWARG = "Aaah! A gingerbread nightmare!",
		GINGERBREADHOUSE = "I'm gonna eat ALL OF IT!!",
		GINGERBREADPIG = "Come back! Come back!!!",
		CRUMBS = "That gingerbread guy has been here.",
		WINTERSFEASTFUEL = "It fills me with peace and joy!",

        KLAUS = "That meanie imprisoned those deer!",
        KLAUS_SACK = "Presents?!",
		KLAUSSACKKEY = "I think maybe this goes somewhere.",
		WORMHOLE =
		{
			GENERIC = "I think that thing is alive.",
			OPEN = "I've been in worse.",
		},
		WORMHOLE_LIMITED = "Gross, that one looks sick!",
		ACCOMPLISHMENT_SHRINE = "It gives me a goal in life.", --single player
		LIVINGTREE = "Hello, Mr. Tree!",
		ICESTAFF = "It makes me feel funny.",
		REVIVER = "I think it loves me.",
		SHADOWHEART = "Why does it make me feel so bad?",
        ATRIUM_RUBBLE =
        {
			LINE_1 = "It's a picture of some bug people.",
			LINE_2 = "This picture's all messed up.",
			LINE_3 = "There's a lot of black goop in this picture.",
			LINE_4 = "A picture of bug people escaping their bug outsides!",
			LINE_5 = "A picture of a city. It looks like a nice place to live.",
		},
        ATRIUM_STATUE = "They look sick.",
        ATRIUM_LIGHT =
        {
			ON = "I don't like it.",
			OFF = "No light.",
		},
        ATRIUM_GATE =
        {
			ON = "Does this mean I get to go home?",
			OFF = "I need another piece to turn it on.",
			CHARGING = "What's it doing?",
			DESTABILIZING = "It looks like it's gonna blow up!",
			COOLDOWN = "It wasn't a way home, anyway.",
        },
        ATRIUM_KEY = "This key is REALLY old.",
		LIFEINJECTOR = "I hate taking my medicine!",
		SKELETON_PLAYER =
		{
			MALE = "Oh no, %s! %s must have really hurt him!",
			FEMALE = "Oh no, %s! %s must have really hurt her!",
			ROBOT = "Oh no, %s! %s must have really hurt them!",
			DEFAULT = "Oh no, %s! %s must have really hurt them!",
		},
--fallback to speech_wilson.lua 		HUMANMEAT = "Flesh is flesh. Where do I draw the line?",
--fallback to speech_wilson.lua 		HUMANMEAT_COOKED = "Cooked nice and pink, but still morally gray.",
--fallback to speech_wilson.lua 		HUMANMEAT_DRIED = "Letting it dry makes it not come from a human, right?",
		ROCK_MOON = "Neat!",
		MOONROCKNUGGET = "Neat!",
		MOONROCKCRATER = "Haha. It's heavy!",
		MOONROCKSEED = "Neat, it's a ball that floats by itself!",

        REDMOONEYE = "That rock needs a nap. Its eye is all red!",
        PURPLEMOONEYE = "Now I won't need to leave a trail of breadcrumbs!",
        GREENMOONEYE = "I could always use more eyes!",
        ORANGEMOONEYE = "This rock helps me find my friends!",
        YELLOWMOONEYE = "Even with my expertise, I'd still lose in a staring contest.",
        BLUEMOONEYE = "Hey! Did anyone lose an eye?",

        --Arena Event
        LAVAARENA_BOARLORD = "Maybe he's nice?",
        BOARRIOR = "You don't look so tough!",
        BOARON = "Leave me alone!",
        PEGHOOK = "Wouldn't you rather be friends with me?",
        TRAILS = "No monkey business, mister!",
        TURTILLUS = "That turtle's huge!",
        SNAPPER = "Don't bite me!",
		RHINODRILL = "Looks like a big bully!",
		BEETLETAUR = "All that armor must be heavy.",

        LAVAARENA_PORTAL =
        {
            ON = "Time to go... \"home\".",
            GENERIC = "This isn't home!",
        },
        LAVAARENA_KEYHOLE = "It doesn't have its key.",
		LAVAARENA_KEYHOLE_FULL = "That looks much better!",
        LAVAARENA_BATTLESTANDARD = "Hey, help me break this Battle Standard!",
        LAVAARENA_SPAWNER = "That's the bad guy portal!",

        HEALINGSTAFF = "That uses magic to hurt people.",
        FIREBALLSTAFF = "It hurts people with magic.",
        HAMMER_MJOLNIR = "I'm not strong enough to use it.",
        SPEAR_GUNGNIR = "Wigfrid makes it look so cool!",
        BLOWDART_LAVA = "I like fighting from far away.",
        BLOWDART_LAVA2 = "Those look like fun!",
        LAVAARENA_LUCY = "You look different, Lucy. Did you get a haircut?",
        WEBBER_SPIDER_MINION = "I'll protect you, spider babies!",
        BOOK_FOSSIL = "I can read the words but I can't make them work.",
		LAVAARENA_BERNIE = "Oh! Willow brought Bernie!",
		SPEAR_LANCE = "I don't really want it.",
		BOOK_ELEMENTAL = "Are those even words in there?",
		LAVAARENA_ELEMENTAL = "Hey hi, rock-person!",

   		LAVAARENA_ARMORLIGHT = "Uhh, I don't think that's very safe.",
		LAVAARENA_ARMORLIGHTSPEED = "I'd skitter really fast with that.",
		LAVAARENA_ARMORMEDIUM = "Safety first!",
		LAVAARENA_ARMORMEDIUMDAMAGER = "I like this armor a lot.",
		LAVAARENA_ARMORMEDIUMRECHARGER = "This armor seems pretty good!",
		LAVAARENA_ARMORHEAVY = "A little heavy, but at least I'm safe!",
		LAVAARENA_ARMOREXTRAHEAVY = "Maybe I should let someone tougher have it.",

		LAVAARENA_FEATHERCROWNHAT = "That might make me scuttle faster.",
        LAVAARENA_HEALINGFLOWERHAT = "It makes your day a little brighter.",
        LAVAARENA_LIGHTDAMAGERHAT = "Scarcely lethal.",
        LAVAARENA_STRONGDAMAGERHAT = "I like that hat!",
        LAVAARENA_TIARAFLOWERPETALSHAT = "I don't think I should wear that.",
        LAVAARENA_EYECIRCLETHAT = "It looks neat, but I don't want it.",
        LAVAARENA_RECHARGERHAT = "It sure is sparkly.",
        LAVAARENA_HEALINGGARLANDHAT = "It makes you feel a little better when you wear it.",
        LAVAARENA_CROWNDAMAGERHAT = "That helmet is really something!",

		LAVAARENA_ARMOR_HP = "I should armor up to be safe.",

		LAVAARENA_FIREBOMB = "It's like fiery spit balls.",
		LAVAARENA_HEAVYBLADE = "That sword is too big for me to carry!",

        --Quagmire
        QUAGMIRE_ALTAR =
        {
        	GENERIC = "I think it's hungry.",
        	FULL = "I hope it's good.",
    	},
		QUAGMIRE_ALTAR_STATUE1 = "It looks like the friendly goat I met.",
		QUAGMIRE_PARK_FOUNTAIN = "No coins in it. I guess no one made wishes.",

        QUAGMIRE_HOE = "I know how to use this!",

        QUAGMIRE_TURNIP = "Wow! It's a turnip!",
        QUAGMIRE_TURNIP_COOKED = "I cooked the turnip.",
        QUAGMIRE_TURNIP_SEEDS = "I can find out what they are by planting them.",

        QUAGMIRE_GARLIC = "Maxwell says you ward monsters away with it.",
        QUAGMIRE_GARLIC_COOKED = "It didn't ward me off!",
        QUAGMIRE_GARLIC_SEEDS = "I can find out what they are by planting them.",

        QUAGMIRE_ONION = "It makes my eyes water!",
        QUAGMIRE_ONION_COOKED = "My eyes don't water any more.",
        QUAGMIRE_ONION_SEEDS = "I can find out what they are by planting them.",

        QUAGMIRE_POTATO = "Woah! A potato!",
        QUAGMIRE_POTATO_COOKED = "It's a cooked potato now.",
        QUAGMIRE_POTATO_SEEDS = "I can find out what they are by planting them.",

        QUAGMIRE_TOMATO = "Is it a fruit or a vegetable?",
        QUAGMIRE_TOMATO_COOKED = "It's a cooked fregetable. Vruit?",
        QUAGMIRE_TOMATO_SEEDS = "I can find out what they are by planting them.",

        QUAGMIRE_FLOUR = "It's no good by itself.",
        QUAGMIRE_WHEAT = "If only I were back at the mill.",
        QUAGMIRE_WHEAT_SEEDS = "I can find out what they are by planting them.",
        --NOTE: raw/cooked carrot uses regular carrot strings
        QUAGMIRE_CARROT_SEEDS = "I can find out what they are by planting them.",

        QUAGMIRE_ROTTEN_CROP = "That one got a bit squishy.",

		QUAGMIRE_SALMON = "Cooking Cat said fish oil is good for my brain.",
		QUAGMIRE_SALMON_COOKED = "Smells good!",
		QUAGMIRE_CRABMEAT = "Everything evolves to you eventually...",
		QUAGMIRE_CRABMEAT_COOKED = "I don't want to eat it.",
		QUAGMIRE_SUGARWOODTREE =
		{
			GENERIC = "I wonder why the people left this nice place.",
			STUMP = "Why would anyone do that?",
			TAPPED_EMPTY = "There isn't any sap yet.",
			TAPPED_READY = "Sticky, sticky sap!",
			TAPPED_BUGS = "Ew... The bugs got in it.",
			WOUNDED = "Aw, now it's not as pink.",
		},
		QUAGMIRE_SPOTSPICE_SHRUB =
		{
			GENERIC = "What a cool purple shrub.",
			PICKED = "All the good stuff's gone.",
		},
		QUAGMIRE_SPOTSPICE_SPRIG = "It doesn't taste very good on its own.",
		QUAGMIRE_SPOTSPICE_GROUND = "I ground it all up.",
		QUAGMIRE_SAPBUCKET = "It's a big ol'bucket.",
		QUAGMIRE_SAP = "Sticky, gooey sap.",
		QUAGMIRE_SALT_RACK =
		{
			READY = "Salt's ready.",
			GENERIC = "I have to wait for more salt.",
		},

		QUAGMIRE_POND_SALT = "It's all crusty around the edges.",
		QUAGMIRE_SALT_RACK_ITEM = "I should set it up at the crusty pond.",

		QUAGMIRE_SAFE =
		{
			GENERIC = "Well, it wouldn't hurt to take a look.",
			LOCKED = "Someone's precious things are probably inside.",
		},

		QUAGMIRE_KEY = "Cool! I wonder what it unlocks?",
		QUAGMIRE_KEY_PARK = "I wanna go to the park.",
        QUAGMIRE_PORTAL_KEY = "I wonder where this takes me.",


		QUAGMIRE_MUSHROOMSTUMP =
		{
			GENERIC = "Those mushrooms are tiny.",
			PICKED = "No more little mushrooms.",
		},
		QUAGMIRE_MUSHROOMS = "I don't like mushrooms.",
        QUAGMIRE_MEALINGSTONE = "I want to do the grinding!",
		QUAGMIRE_PEBBLECRAB = "Don't be afraid!",


		QUAGMIRE_RUBBLE_CARRIAGE = "I wish I could ride in that.",
        QUAGMIRE_RUBBLE_CLOCK = "Does it still tell the right time?",
        QUAGMIRE_RUBBLE_CATHEDRAL = "I can't even fix it.",
        QUAGMIRE_RUBBLE_PUBDOOR = "It doesn't lead anywhere anymore.",
        QUAGMIRE_RUBBLE_ROOF = "Too bad.",
        QUAGMIRE_RUBBLE_CLOCKTOWER = "I don't think that clock works anymore.",
        QUAGMIRE_RUBBLE_BIKE = "Aww... It's broken.",
        QUAGMIRE_RUBBLE_HOUSE =
        {
            "Where did everyone go?",
            "I wonder what happened here?",
            "Looks like everyone left.",
        },
        QUAGMIRE_RUBBLE_CHIMNEY = "Bummer.",
        QUAGMIRE_RUBBLE_CHIMNEY2 = "Aw. That's too bad.",
        QUAGMIRE_MERMHOUSE = "It doesn't look very cozy.",
        QUAGMIRE_SWAMPIG_HOUSE = "I've never seen their houses up close!",
        QUAGMIRE_SWAMPIG_HOUSE_RUBBLE = "No one lives in it anymore.",
        QUAGMIRE_SWAMPIGELDER =
        {
            GENERIC = "Hi, Mr. Pig!",
            SLEEPING = "It's sleeping.",
        },
        QUAGMIRE_SWAMPIG = "They're not afraid of me!!",

        QUAGMIRE_PORTAL = "At least it took me somewhere different.",
        QUAGMIRE_SALTROCK = "I'm gonna crunch them all up.",
        QUAGMIRE_SALT = "I don't use a lot of salt on my food.",
        --food--
        QUAGMIRE_FOOD_BURNT = "It's okay. The next one will be better.",
        QUAGMIRE_FOOD =
        {
        	GENERIC = "I can put it on the altar now.",
            MISMATCH = "I think the Gnaw wants something different.",
            MATCH = "The goat lady said this was what the Gnaw wanted.",
            MATCH_BUT_SNACK = "This is what it wants, but it's kinda puny.",
        },

        QUAGMIRE_FERN = "Maybe I could make a salad.",
        QUAGMIRE_FOLIAGE_COOKED = "This probably doesn't count as a salad, huh.",
        QUAGMIRE_COIN1 = "I could trade it for something small.",
        QUAGMIRE_COIN2 = "I wonder what I can buy with this.",
        QUAGMIRE_COIN3 = "I can buy a whole bunch of stuff with this.",
        QUAGMIRE_COIN4 = "The nice lady said I need three of them.",
        QUAGMIRE_GOATMILK = "Milk is good for my bones. Endo and exo!",
        QUAGMIRE_SYRUP = "Sweet!",
        QUAGMIRE_SAP_SPOILED = "Aw... It's no good anymore.",
        QUAGMIRE_SEEDPACKET = "I can plant a whole bunch of food with this.",

        QUAGMIRE_POT = "This pot's a bit bigger than the other one.",
        QUAGMIRE_POT_SMALL = "You cook stuff in it.",
        QUAGMIRE_POT_SYRUP = "Sweet pot!",
        QUAGMIRE_POT_HANGER = "I can hang a pot off this.",
        QUAGMIRE_POT_HANGER_ITEM = "I should put it together.",
        QUAGMIRE_GRILL = "I have to be careful when I cook.",
        QUAGMIRE_GRILL_ITEM = "I could use it to make yummy food.",
        QUAGMIRE_GRILL_SMALL = "What should I cook?",
        QUAGMIRE_GRILL_SMALL_ITEM = "I should find a place to put it.",
        QUAGMIRE_OVEN = "Cooking Cat said I should be careful around the oven.",
        QUAGMIRE_OVEN_ITEM = "I gotta set this up.",
        QUAGMIRE_CASSEROLEDISH = "I can cooks stuff in it.",
        QUAGMIRE_CASSEROLEDISH_SMALL = "It's kinda small.",
        QUAGMIRE_PLATE_SILVER = "Now I don't have to eat off the floor.",
        QUAGMIRE_BOWL_SILVER = "Now I have somewhere to put food.",
--fallback to speech_wilson.lua         QUAGMIRE_CRATE = "Kitchen stuff.",

        QUAGMIRE_MERM_CART1 = "Do they have any toys?", --sammy's wagon
        QUAGMIRE_MERM_CART2 = "That's full of good stuff.", --pipton's cart
        QUAGMIRE_PARK_ANGEL = "I think it's sort of pretty.",
        QUAGMIRE_PARK_ANGEL2 = "It almost looks real.",
        QUAGMIRE_PARK_URN = "Aw. Someone died.",
        QUAGMIRE_PARK_OBELISK = "It's a monument or something.",
        QUAGMIRE_PARK_GATE =
        {
            GENERIC = "Park. Park. Park!",
            LOCKED = "It's locked. I think I need a key.",
        },
        QUAGMIRE_PARKSPIKE = "It looks sharp.",
        QUAGMIRE_CRABTRAP = "I can trap little crabs in this.",
        QUAGMIRE_TRADER_MERM = "Hi there! Wanna trade?",
        QUAGMIRE_TRADER_MERM2 = "Hey. You look nice.",

        QUAGMIRE_GOATMUM = "Does your kid want to play?",
        QUAGMIRE_GOATKID = "Oh, hi there!",
        QUAGMIRE_PIGEON =
        {
            DEAD = "It's not moving.",
            GENERIC = "I should leave it alone.",
            SLEEPING = "It's sleeping.",
        },
        QUAGMIRE_LAMP_POST = "It's the kind of lamp they have in the city.",

        QUAGMIRE_BEEFALO = "Take it easy, grandpa.",
        QUAGMIRE_SLAUGHTERTOOL = "I don't wanna use this.",

        QUAGMIRE_SAPLING = "It's gonna take too long to grow back.",
        QUAGMIRE_BERRYBUSH = "Aww... all the berries are gone now.",

        QUAGMIRE_ALTAR_STATUE2 = "A lotta goat statues around here.",
        QUAGMIRE_ALTAR_QUEEN = "Wow. She looks beautiful.",
        QUAGMIRE_ALTAR_BOLLARD = "It's nice enough.",
        QUAGMIRE_ALTAR_IVY = "Ivy grows everywhere.",

        QUAGMIRE_LAMP_SHORT = "I'm almost as tall as this lamp.",

        --v2 Winona
        WINONA_CATAPULT =
        {
        	GENERIC = "I feel safer already!",
        	OFF = "How come it's not on?",
        	BURNING = "Oh, oh!",
        	BURNT = "Oh no! It got burnt!",
			SLEEP = "I feel safer already!",
        },
        WINONA_SPOTLIGHT =
        {
        	GENERIC = "She made me a nightlight!",
        	OFF = "How come it's not on?",
        	BURNING = "Oh, oh!",
        	BURNT = "Oh no! It got burnt!",
			SLEEP = "She made me a nightlight!",
        },
        WINONA_BATTERY_LOW =
        {
        	GENERIC = "It feeds hungry machines.",
        	LOWPOWER = "I think it's running low.",
        	OFF = "Hey Winona! How do I fix it?",
        	BURNING = "Oh, oh!",
        	BURNT = "Oh no! It got burnt!",
        },
        WINONA_BATTERY_HIGH =
        {
			GENERIC = "Machines think gem power is really tasty.",
			LOWPOWER = "I think it's running low.",
			OFF = "Winoooona! The thing broke!",
			BURNING = "Oh, oh!",
			BURNT = "Oh no! It got burnt!",
			OVERLOADED = "Hello?",
        },
		--v3 Winona
		WINONA_REMOTE =
		{
			GENERIC = "I didn't play with it. I swear.",
			OFF = "How come it's not on?",
			CHARGING = "I didn't play with it. I swear.",
			CHARGED = "I didn't play with it. I swear.",
		},
		WINONA_TELEBRELLA =
		{
			GENERIC = "I don't think it would work very well in the rain.",
--fallback to speech_wilson.lua             MISSINGSKILL = "only_used_by_winona",
			OFF = "Hey Winona! How do I fix it?",
			CHARGING = "I don't think it would work very well in the rain.",
			CHARGED = "I don't think it would work very well in the rain.",
		},
		WINONA_TELEPORT_PAD_ITEM =
		{
			GENERIC = "Aww, it won't work on me.",
--fallback to speech_wilson.lua             MISSINGSKILL = "only_used_by_winona",
			OFF = "How come it's not on?",
			BURNING = "Oh, oh!",
			BURNT = "Oh no! It got burnt!",
		},
		WINONA_STORAGE_ROBOT =
		{
			GENERIC = "Winona makes the best toys!",
			OFF = "Hello?",
			SLEEP = "Winona makes the best toys!",
			CHARGING = "Hello?",
			CHARGED = "Hello?",
		},
		INSPECTACLESBOX = "only_used_by_winona",
		INSPECTACLESBOX2 = "only_used_by_winona",
		INSPECTACLESHAT = 
        {
            GENERIC = "Winona's been using those funny glasses a lot lately.",
            MISSINGSKILL = "only_used_by_winona",
        },
		ROSEGLASSESHAT =
        {
            GENERIC = "Winona wouldn't let me play with them. I've never seen her so stern...",
            MISSINGSKILL = "only_used_by_winona",
        },
		CHARLIERESIDUE = "only_used_by_winona",
		CHARLIEROSE = "only_used_by_winona",
        WINONA_MACHINEPARTS_1 = "only_used_by_winona",
        WINONA_MACHINEPARTS_2 = "only_used_by_winona",
		WINONA_RECIPESCANNER = "only_used_by_winona",
		WINONA_HOLOTELEPAD = "only_used_by_winona",
		WINONA_HOLOTELEBRELLA = "only_used_by_winona",

        --Wormwood
        COMPOSTWRAP = "Double doodoo.",
        ARMOR_BRAMBLE = "I'm ready to let spikes fly!",
        TRAP_BRAMBLE = "It's a very pointy planty trap!",

        BOATFRAGMENT03 = "Oh no, someone had an accident!",
        BOATFRAGMENT04 = "Oh no, someone had an accident!",
        BOATFRAGMENT05 = "Oh no, someone had an accident!",
		BOAT_LEAK = "Quick, plug it up!",
        MAST = "Wow, it's MASTive!",
        SEASTACK = "I hope no one crashes their boat on that!",
        FISHINGNET = "Maybe I'll catch some antchovies!", --unimplemented
        ANTCHOVIES = "Not my favorite but I'll eat it.", --unimplemented
        STEERINGWHEEL = "Oh, oh, I want to steer!",
        ANCHOR = "It's really, really heavy.",
        BOATPATCH = "It makes the boat feel better.",
        DRIFTWOOD_TREE =
        {
            BURNING = "It's getting all burned up!",
            BURNT = "All burned up.",
            CHOPPED = "Chopped all up.",
            GENERIC = "They're fun to climb on.",
        },

        DRIFTWOOD_LOG = "Easy piece-y.",

        MOON_TREE =
        {
            BURNING = "I hope trees don't feel pain.",
            BURNT = "It's dead now.",
            CHOPPED = "Sorry, tree.",
            GENERIC = "What a pretty tree!",
        },
		MOON_TREE_BLOSSOM = "I like this flower!",

        MOONBUTTERFLY =
        {
        	GENERIC = "What a pretty moth!",
        	HELD = "Don't worry, I won't eat you.",
        },
		MOONBUTTERFLYWINGS = "Poor moth.",
        MOONBUTTERFLY_SAPLING = "It'll be a big tree one day.",
        ROCK_AVOCADO_FRUIT = "I have to wait for it to ripen.",
        ROCK_AVOCADO_FRUIT_RIPE = "I cracked it open.",
        ROCK_AVOCADO_FRUIT_RIPE_COOKED = "No more pit!",
        ROCK_AVOCADO_FRUIT_SPROUT = "Oh wow, it's growing!",
        ROCK_AVOCADO_BUSH =
        {
        	BARREN = "I don't think it can make fruit anymore.",
			WITHERED = "Too hot.",
			GENERIC = "There's rocks growing out of that bush!",
			PICKED = "It doesn't have anything good.",
			DISEASED = "It's really sick.", --unimplemented
            DISEASING = "It looks a little pale.", --unimplemented
			BURNING = "It's burning!",
		},
        DEAD_SEA_BONES = "Yuck! Dead stuff.",
        HOTSPRING =
        {
        	GENERIC = "Splish splash.",
        	BOMBED = "It smells nice and looks pretty.",
        	GLASS = "I could crack it open.",
			EMPTY = "Aw, it's all dried up.",
        },
        MOONGLASS = "It came from the moon. Wow!",
        MOONGLASS_CHARGED = "There's still lightning stuck in it!",
        MOONGLASS_ROCK = "Is the moon green, too?",
        BATHBOMB = "I miss bubble baths.",
        TRAP_STARFISH =
        {
            GENERIC = "What a cute starfish!",
            CLOSED = "Yikes, that thing was hungry!",
        },
        DUG_TRAP_STARFISH = "Now nobody will hurt themselves on it.",
        SPIDER_MOON =
        {
        	GENERIC = "These spiders look... weird.",
        	SLEEPING = "Night-night.",
        	DEAD = "Die, spider!",
        },
        MOONSPIDERDEN = "Eww, but different eww.",
		FRUITDRAGON =
		{
			GENERIC = "It smells like yummy fruit.",
			RIPE = "It looks kinda yummy.",
			SLEEPING = "Night night!",
		},
        PUFFIN =
        {
            GENERIC = "It looks like a nice bird.",
            HELD = "I got you now.",
            SLEEPING = "Nighty night.",
        },

		MOONGLASSAXE = "I think it cuts better than a regular axe.",
		GLASSCUTTER = "It's sharp enough to split a hair!",

        ICEBERG =
        {
            GENERIC = "I hope my boat doesn't run into it.", --unimplemented
            MELTED = "I guess it's too hot out.", --unimplemented
        },
        ICEBERG_MELTED = "I guess it's too hot out.", --unimplemented

        MINIFLARE = "Just in case someone's lost and lonely.",
        MEGAFLARE = "Ms. Wickerbottom says I shouldn't pick fights...",

		MOON_FISSURE =
		{
			GENERIC = "It's trying to talk, I think!",
			NOLIGHT = "Don't step on a crack!",
		},
        MOON_ALTAR =
        {
            MOON_ALTAR_WIP = "Don't worry, you'll be together again soon.",
            GENERIC = "Hm? Do you need something from me?",
        },

        MOON_ALTAR_IDOL = "It doesn't want to be here. I don't either.",
        MOON_ALTAR_GLASS = "It can't talk like I do, but it's a friend.",
        MOON_ALTAR_SEED = "It wants to go to one of those cracks in the ground.",

        MOON_ALTAR_ROCK_IDOL = "Oh no, someone's trapped inside that rock!",
        MOON_ALTAR_ROCK_GLASS = "Oh no, someone's trapped inside that rock!",
        MOON_ALTAR_ROCK_SEED = "Oh no, someone's trapped inside that rock!",

        MOON_ALTAR_CROWN = "It wants to go back home.",
        MOON_ALTAR_COSMIC = "I think it says I'm getting closer.",

        MOON_ALTAR_ASTRAL = "All together again!",
        MOON_ALTAR_ICON = "It wants to be back with the others.",
        MOON_ALTAR_WARD = "It's lonely, it wants its friends.",

        SEAFARING_PROTOTYPER =
        {
            GENERIC = "There's all kinds of fun things you can do at sea.",
            BURNT = "Fire is very dangerous.",
        },
        BOAT_ITEM = "That's for building a boat.",
        BOAT_GRASS_ITEM = "Weaving a grass boat probably isn't much harder than weaving webs.",
        STEERINGWHEEL_ITEM = "That's for making a steering wheel.",
        ANCHOR_ITEM = "That's for making an anchor.",
        MAST_ITEM = "That's for building a mast.",
        MUTATEDHOUND =
        {
        	DEAD = "It's dead!",
        	GENERIC = "Woah! How'd you get rid of your outside skin?",
        	SLEEPING = "Night night, gross puppy.",
        },

        MUTATED_PENGUIN =
        {
			DEAD = "It's dead!",
			GENERIC = "It's even more monstrous than me!",
			SLEEPING = "I don't want to get closer.",
		},
        CARRAT =
        {
        	DEAD = "Oh no!",
        	GENERIC = "Awesome.",
        	HELD = "All mine!",
        	SLEEPING = "Night night.",
        },

		BULLKELP_PLANT =
        {
            GENERIC = "There's some kelp floating in the water!",
            PICKED = "I gave it a haircut.",
        },
		BULLKELP_ROOT = "It would be happier if I planted it.",
        KELPHAT = "Why did I make this?",
		KELP = "Slimy, yet satisfying.",
		KELP_COOKED = "He doesn't like it very much, but I think it's okay.",
		KELP_DRIED = "Mmm, salty and flaky!",

		GESTALT = "They want to talk, but they don't know how!",
        GESTALT_GUARD = "They don't seem very friendly.",

		COOKIECUTTER = "My boat's not a cookie!",
		COOKIECUTTERSHELL = "Ouch! It's spiky!",
		COOKIECUTTERHAT = "I look like a hermit crab!",
		SALTSTACK =
		{
			GENERIC = "They're kind of spooky.",
			MINED_OUT = "Someone already took all the salt.",
			GROWING = "Hey, it's growing back!",
		},
		SALTROCK = "What a weird rock.",
		SALTBOX = "Makes my food last longer.",

		TACKLESTATION = "Father used to take me fishing sometimes.",
		TACKLESKETCH = "It has fishing secrets!",

        MALBATROSS = "Woah! That's a big bird!",
        MALBATROSS_FEATHER = "Tickly!",
        MALBATROSS_BEAK = "It could've eaten me in one bite!",
        MAST_MALBATROSS_ITEM = "This will look great on my boat!",
        MAST_MALBATROSS = "My boat looks ready to fly away!",
		MALBATROSS_FEATHERED_WEAVE = "I used my nicest yarn!",

        GNARWAIL =
        {
            GENERIC = "Woah, it's got a spear on its head!",
            BROKENHORN = "Still looks pretty dangerous.",
            FOLLOWER = "I'm glad you're my friend now!",
            BROKENHORN_FOLLOWER = "I feel a bit bad about your horn...",
        },
        GNARWAIL_HORN = "Maybe it's magic?",

        WALKINGPLANK = "It's the least fun diving board.",
        WALKINGPLANK_GRASS = "It's the least fun diving board.",
        OAR = "Row, row, row!",
		OAR_DRIFTWOOD = "Rowing is kinda fun!",

		OCEANFISHINGROD = "Wonder what kind of fish I'll catch!",
		OCEANFISHINGBOBBER_NONE = "It's missing a bobber.",
        OCEANFISHINGBOBBER_BALL = "It's a bobbin' bobber!",
        OCEANFISHINGBOBBER_OVAL = "It's a bobbin' bobber!",
		OCEANFISHINGBOBBER_CROW = "I turned a feather into a float!",
		OCEANFISHINGBOBBER_ROBIN = "I turned a feather into a float!",
		OCEANFISHINGBOBBER_ROBIN_WINTER = "I turned a feather into a float!",
		OCEANFISHINGBOBBER_CANARY = "I turned a feather into a float!",
		OCEANFISHINGBOBBER_GOOSE = "I made this float extra fancy.",
		OCEANFISHINGBOBBER_MALBATROSS = "I made this float extra fancy.",

		OCEANFISHINGLURE_SPINNER_RED = "Ouch! It's sharp!",
		OCEANFISHINGLURE_SPINNER_GREEN = "Ouch! It's sharp!",
		OCEANFISHINGLURE_SPINNER_BLUE = "Ouch! It's sharp!",
		OCEANFISHINGLURE_SPOON_RED = "Ouch! It's sharp!",
		OCEANFISHINGLURE_SPOON_GREEN = "Ouch! It's sharp!",
		OCEANFISHINGLURE_SPOON_BLUE = "Ouch! It's sharp!",
		OCEANFISHINGLURE_HERMIT_RAIN = "Do fish know when it's raining?",
		OCEANFISHINGLURE_HERMIT_SNOW = "Fishing in the snow might be fun!",
		OCEANFISHINGLURE_HERMIT_DROWSY = "It makes my head feel fuzzy...",
		OCEANFISHINGLURE_HERMIT_HEAVY = "I'm gonna catch the biggest fish with this!",

		OCEANFISH_SMALL_1 = "It's so little!",
		OCEANFISH_SMALL_2 = "Aww, just a little guy.",
		OCEANFISH_SMALL_3 = "It's kind of cute. Too bad I'm gonna eat it.",
		OCEANFISH_SMALL_4 = "I know I can catch a bigger fish!",
		OCEANFISH_SMALL_5 = "Woah, this fish is weird!",
		OCEANFISH_SMALL_6 = "What if I got a pile of these and jumped in it?",
		OCEANFISH_SMALL_7 = "Wendy got mad when I said it reminded me of her...",
		OCEANFISH_SMALL_8 = "Ow! Owie! Hot!!",
        OCEANFISH_SMALL_9 = "Haha, it spits!",

		OCEANFISH_MEDIUM_1 = "Eww, it'd covered in mud!",
		OCEANFISH_MEDIUM_2 = "You'd be pretty tasty with some chips.",
		OCEANFISH_MEDIUM_3 = "Yikes, this one's all prickly!",
		OCEANFISH_MEDIUM_4 = "This one was really tough to catch.",
		OCEANFISH_MEDIUM_5 = "Does this count as eating my vegetables?",
		OCEANFISH_MEDIUM_6 = "It looks like it has whiskers!",
		OCEANFISH_MEDIUM_7 = "It looks like it has whiskers!",
		OCEANFISH_MEDIUM_8 = "It's a fishsicle!",
        OCEANFISH_MEDIUM_9 = "Look, it has a little mustache!",

		PONDFISH = "It could stand to be fried.",
		PONDEEL = "Fresh water-snake.",

        FISHMEAT = "It would probably be better cooked.",
        FISHMEAT_COOKED = "Mmm, delicious!",
        FISHMEAT_SMALL = "It's a little fishy.",
        FISHMEAT_SMALL_COOKED = "Boney.",
		SPOILED_FISH = "It's no good to anyone now.",

		FISH_BOX = "It's like an aquarium! Except I eat the fish...",
        POCKET_SCALE = "Wonder how heavy my fish is!",

		TACKLECONTAINER = "It's like a toybox, but for fishing stuff!",
		SUPERTACKLECONTAINER = "I can put way more fishing stuff in there!",

		TROPHYSCALE_FISH =
		{
			GENERIC = "Woah! I should find a big fish to put in there!",
			HAS_ITEM = "Weight: {weight}\nCaught by: {owner}",
			HAS_ITEM_HEAVY = "Weight: {weight}\nCaught by: {owner}\nI've never seen such a heavy fish!",
			BURNING = "Oh no oh no!",
			BURNT = "Aww...",
			OWNER = "Weight: {weight}\nCaught by: {owner}\nI did it!",
			OWNER_HEAVY = "Weight: {weight}\nCaught by: {owner}\nI caught it all by myself!",
		},

		OCEANFISHABLEFLOTSAM = "Yuck, it's just a big chunk of mud!",

		CALIFORNIAROLL = "Hmm, something smells fishy about this!",
		SEAFOODGUMBO = "I could eat it forever!",
		SURFNTURF = "Eww, healthy!",

        WOBSTER_SHELLER = "I'd better stay away from the pinchy bits.",
        WOBSTER_DEN = "Wonder what lives in there?",
        WOBSTER_SHELLER_DEAD = "It's not moving anymore.",
        WOBSTER_SHELLER_DEAD_COOKED = "Yum, yum, yum!",

        LOBSTERBISQUE = "I want to pour it all over my tongues!",
        LOBSTERDINNER = "I have to eat it with my eyes closed. It's weird.",

        WOBSTER_MOONGLASS = "That's not how they usually look, is it?",
        MOONGLASS_WOBSTER_DEN = "I hear something tip-tapping in there.",

		TRIDENT = "I don't know how to play, but I can try!",

		WINCH =
		{
			GENERIC = "I'm going hunting for treasure!",
			RETRIEVING_ITEM = "I got something!",
			HOLDING_ITEM = "Is it something good?",
		},

        HERMITHOUSE = {
            GENERIC = "I hope this makes her feel happier!",
            BUILTUP = "She must be sad living here all alone...",
        },

        SHELL_CLUSTER = "Any pretty shells in there?",
        --
		SINGINGSHELL_OCTAVE3 =
		{
			GENERIC = "I thought I saw something skitter inside it!",
		},
		SINGINGSHELL_OCTAVE4 =
		{
			GENERIC = "It makes me want to hum along.",
		},
		SINGINGSHELL_OCTAVE5 =
		{
			GENERIC = "Do you know any songs?",
        },

        CHUM = "I like feeding the fish!",

        SUNKENCHEST =
        {
            GENERIC = "Whew... I thought there might be an angry clam inside.",
            LOCKED = "It won't let me in!",
        },

        HERMIT_BUNDLE = "It's always fun to unwrap a package!",
        HERMIT_BUNDLE_SHELLS = "I have so many shells to play with!",

        RESKIN_TOOL = "Awww do I have to clean?",
        MOON_FISSURE_PLUGGED = "Woah! Why didn't I think of that?",


		----------------------- ROT STRINGS GO ABOVE HERE ------------------

		-- Walter
        WOBYBIG =
        {
            "Woby's so big and fuzzy and perfect for hugging!",
            "Woby's so big and fuzzy and perfect for hugging!",
        },
        WOBYSMALL =
        {
            "Pet pet!",
            "Awesome.",
        },
		WALTERHAT = "Can I be a Pioneer too?",
		SLINGSHOT = "Can I play with it?",
		SLINGSHOTAMMO_ROCK = "Do you want me to help clean up?",
		SLINGSHOTAMMO_MARBLE = "Do you want me to help clean up?",
		SLINGSHOTAMMO_THULECITE = "Do you want me to help clean up?",
        SLINGSHOTAMMO_GOLD = "Do you want me to help clean up?",
        SLINGSHOTAMMO_SLOW = "Do you want me to help clean up?",
        SLINGSHOTAMMO_FREEZE = "Do you want me to help clean up?",
		SLINGSHOTAMMO_POOP = "Haha, ew!",
        PORTABLETENT = "Yay, I'm camping!",
        PORTABLETENT_ITEM = "Let me help!",

        -- Wigfrid
        BATTLESONG_DURABILITY = "I like singing songs!",
        BATTLESONG_HEALTHGAIN = "I like singing songs!",
        BATTLESONG_SANITYGAIN = "I like singing songs!",
        BATTLESONG_SANITYAURA = "I like singing songs!",
        BATTLESONG_FIRERESISTANCE = "I like singing songs!",
        BATTLESONG_INSTANT_TAUNT = "I probably shouldn't repeat this one. It sounds rude.",
        BATTLESONG_INSTANT_PANIC = "The characters talk just like Wigfrid!",

        -- Webber
        MUTATOR_WARRIOR = "I think it's yummy, Webber!",
        MUTATOR_DROPPER = "I think it's yummy, Webber!",
        MUTATOR_HIDER = "I think it's yummy, Webber!",
        MUTATOR_SPITTER = "I think it's yummy, Webber!",
        MUTATOR_MOON = "I think it's yummy, Webber!",
        MUTATOR_HEALER = "I think it's yummy, Webber!",
        SPIDER_WHISTLE = "Spider party!",
        SPIDERDEN_BEDAZZLER = "Hey! It's pretty!",
        SPIDER_HEALER = "They're a little mean.",
        SPIDER_REPELLENT = "I wish he used it more often.",
        SPIDER_HEALER_ITEM = "I don't think that'll work for me.",

		-- Wendy
		GHOSTLYELIXIR_SLOWREGEN = "Hey, you didn't tell me you were making crafts!",
		GHOSTLYELIXIR_FASTREGEN = "Hey, you didn't tell me you were making crafts!",
		GHOSTLYELIXIR_SHIELD = "Hey, you didn't tell me you were making crafts!",
		GHOSTLYELIXIR_ATTACK = "Hey, you didn't tell me you were making crafts!",
		GHOSTLYELIXIR_SPEED = "Hey, you didn't tell me you were making crafts!",
		GHOSTLYELIXIR_RETALIATION = "Hey, you didn't tell me you were making crafts!",
		SISTURN =
		{
			GENERIC = "It's a little Abigail house!",
			SOME_FLOWERS = "I can find more flowers!",
			LOTS_OF_FLOWERS = "I feel warm and fuzzy...",
		},

        --Wortox
--fallback to speech_wilson.lua         WORTOX_SOUL = "only_used_by_wortox", --only wortox can inspect souls

        PORTABLECOOKPOT_ITEM =
        {
            GENERIC = "Makes yummies!",
            DONE = "Mmmm! Look's good!",

			COOKING_LONG = "This is taking so loooong!",
			COOKING_SHORT = "Food'll be ready soon!",
			EMPTY = "Aw, there's nothing in there.",
        },

        PORTABLEBLENDER_ITEM = "Shake-a, shake-a, shake-a!",
        PORTABLESPICER_ITEM =
        {
            GENERIC = "Oh! Can I grind it, please?",
            DONE = "All done.",
        },
        SPICEPACK = "I'm sure Mr. Warly won't mind if I use this!",
        SPICE_GARLIC = "My breath will smell stinky. Yay!",
        SPICE_SUGAR = "It turns everything into dessert!",
        SPICE_CHILI = "Ho! Ha! That's spicy!",
        SPICE_SALT = "Mmm, salty!",
        MONSTERTARTARE = "Looks amazing!",
        FRESHFRUITCREPES = "Cripes! I can't wait for these crepes!",
        FROGFISHBOWL = "Thanks Warly!",
        POTATOTORNADO = "Woah! It's cool, AND edible!",
        DRAGONCHILISALAD = "Okay, I'll eat a salad.",
        GLOWBERRYMOUSSE = "Mmm, mousse!",
        VOLTGOATJELLY = "WOW! Gelatin!",
        NIGHTMAREPIE = "It's scary, but tasty.",
        BONESOUP = "Warly makes really good stuff.",
        MASHEDPOTATOES = "Just like grandma used to make!",
        POTATOSOUFFLE = "It looks so fancy.",
        MOQUECA = "I love when Warly cooks for me.",
        GAZPACHO = "I don't wanna eat it, but Warly was nice to make it for me.",
        ASPARAGUSSOUP = "Mmmm...warms my tummy.",
        VEGSTINGER = "It's a drink with vegetables in it.",
        BANANAPOP = "Yaaay! Popsicle, popsicle!",
        CEVICHE = "Yucky!",
        SALSA = "Yummy but... spicy!!",
        PEPPERPOPPER = "I'm so stuffed I'll pop!",

        TURNIP = "Wow! It's a turnip!",
        TURNIP_COOKED = "I cooked the turnip.",
        TURNIP_SEEDS = "I can find out what they are by planting them.",

        GARLIC = "Maxwell says you ward monsters away with it.",
        GARLIC_COOKED = "It didn't ward me off!",
        GARLIC_SEEDS = "I can find out what they are by planting them.",

        ONION = "It makes my eyes water!",
        ONION_COOKED = "My eyes don't water any more.",
        ONION_SEEDS = "I can find out what they are by planting them.",

        POTATO = "Woah! A potato!",
        POTATO_COOKED = "It's a cooked potato now.",
        POTATO_SEEDS = "I can find out what they are by planting them.",

        TOMATO = "Is it a fruit or a vegetable?",
        TOMATO_COOKED = "It's a cooked fregetable. Vruit?",
        TOMATO_SEEDS = "I can find out what they are by planting them.",

        ASPARAGUS = "I know it's good for me, but...",
        ASPARAGUS_COOKED = "Asparagus makes my pee smell funny.",
        ASPARAGUS_SEEDS = "Do I have a garden to plant this?",

        PEPPER = "It's so small and cute!",
        PEPPER_COOKED = "I bet it's spicy.",
        PEPPER_SEEDS = "I should plant these and see what grows.",

        WEREITEM_BEAVER = "It looks just like you, Mr. Woodie!",
        WEREITEM_GOOSE = "Mr. Woodie, are you alright?",
        WEREITEM_MOOSE = "Can you make a toy without meat in it?",

        MERMHAT = "Not my style, but if I have to...",        
        MERMTHRONE =
        {
            GENERIC = "Hey, can I be the king? I can take turns!",
            BURNT = "Yikes! What happened?",
        },
        MOSQUITOMUSK = "Can I keep it?",
        MOSQUITOBOMB = "It looks gross and yummy at the same time.",
        MOSQUITOFERTILIZER = "It will make the little plants grow big and strong!",
        MOSQUITOMERMSALVE = "I'm just glad it's not for me.",

        MERMTHRONE_CONSTRUCTION =
        {
            GENERIC = "Can I help?",
            BURNT = "It's burnt up!",
        },
        MERMHOUSE_CRAFTED =
        {
            GENERIC = "What a funny little house.",
            BURNT = "Oh no!",
        },

        MERMWATCHTOWER_REGULAR = "Cool fort!",
        MERMWATCHTOWER_NOKING = "I better not get too close...",
        MERMKING = "He looks pretty important.",
        MERMGUARD = "They look pretty scary!",
        MERM_PRINCE = "Wow, becoming a king looks easy!",

        SQUID = "Wish I had eyes like that!",

		GHOSTFLOWER = "This seems like something Wendy would like.",
        SMALLGHOST = "Hey little guy! Wanna play?",

        CRABKING =
        {
            GENERIC = "He looks pretty crabby!",
            INERT = "Someone forgot to decorate their sandcastle.",
        },
		CRABKING_CLAW = "Aaah! Leave me alone!",

		MESSAGEBOTTLE = "There's something inside!",
		MESSAGEBOTTLEEMPTY = "It's like the jars grandma used for her preserves.",

        MEATRACK_HERMIT =
        {
            DONE = "Ma'am! It's food time!",
            DRYING = "Is it done yet?",
            DRYINGINRAIN = "It's hard to dry when it's raining.",
            GENERIC = "Maybe I could share some meat?",
            BURNT = "It burned away.",
            DONE_NOTMEAT = "Ma'am! It's food time!",
            DRYING_NOTMEAT = "Is it done yet? I'm hungry.",
            DRYINGINRAIN_NOTMEAT = "It's hard to dry when it's raining.",
        },
        BEEBOX_HERMIT =
        {
            READY = "Hey Ms. Old Lady! Look at all the honey they made!",
            FULLHONEY = "Hey Ms. Old Lady! Look at all the honey they made!",
            GENERIC = "I hear a lot of buzzing inside...",
            NOHONEY = "There's no honey inside.",
            SOMEHONEY = "Work faster, bees!",
            BURNT = "The site of The Great Honey Fire.",
        },

        HERMITCRAB = "She reminds me of grandma... but meaner.",

        HERMIT_PEARL = "I'll take really good care of it!",
        HERMIT_CRACKED_PEARL = "I hope Ms. Pearl isn't too mad at me...",

        -- DSEAS
        WATERPLANT = "Did I shrink? Or is this flower really big?",
        WATERPLANT_BOMB = "I'm sorry! I didn't mean it!",
        WATERPLANT_BABY = "Grow big and tall!",
        WATERPLANT_PLANTER = "Where should I put you?",

        SHARK = "Shark attack!",

        MASTUPGRADE_LAMP_ITEM = "Now my boat has a light!",
        MASTUPGRADE_LIGHTNINGROD_ITEM = "I feel safer already!",

        WATERPUMP = "Hey... is that a fish inside?",

        BARNACLE = "I found them in the sea!",
        BARNACLE_COOKED = "I've never eaten barnacles before.",

        BARNACLEPITA = "It's a little pocket of chewiness!",
        BARNACLESUSHI = "Wow, fancy!",
        BARNACLINGUINE = "Watch how fast I can slurp it up!",
        BARNACLESTUFFEDFISHHEAD = "Yuck!",

        LEAFLOAF = "Not quite what I expected...",
        LEAFYMEATBURGER = "This hamburger tastes kind of... grassy?",
        LEAFYMEATSOUFFLE = "I'm not sure about this one...",
        MEATYSALAD = "Is it meat or salad?",

        -- GROTTO

		MOLEBAT = "Don't look! It's not wearing any clothes!",
        MOLEBATHILL = "Yuck, did that all come from its nose?",

        BATNOSE = "A rosy pink nosey",
        BATNOSE_COOKED = "It looks very chewy.",
        BATNOSEHAT = "A rosy nosey cap",

        MUSHGNOME = "What a funny guy.",

        SPORE_MOON = "They pop like balloons! Not as fun, though.",

        MOON_CAP = "It looks weird.",
        MOON_CAP_COOKED = "I'm not sure about this...",

        MUSHTREE_MOON = "It's big and weird!",

        LIGHTFLIER = "I think it's probably too big to fit in a jar.",

        GROTTO_POOL_BIG = "Isn't it dangerous to have glass in the pool?",
        GROTTO_POOL_SMALL = "Isn't it dangerous to have glass in the pool?",

        DUSTMOTH = "Maybe it will help me tidy my things if I ask nicely.",

        DUSTMOTHDEN = "I never kept my room this clean.",

        ARCHIVE_LOCKBOX = "How will I get it open?",
        ARCHIVE_CENTIPEDE = "I made it angry!",
        ARCHIVE_CENTIPEDE_HUSK = "Someone left these parts lying around.",

        ARCHIVE_COOKPOT =
        {
            COOKING_LONG = "It won't be done for a while.",
            COOKING_SHORT = "Almost ready!",
            DONE = "Supper is served.",
            EMPTY = "Bugs get hungry too! I should know!",
            BURNT = "Someone must have left the fire going.",
        },

        ARCHIVE_MOON_STATUE = "Maybe the moon was important to them?",
        ARCHIVE_RUNE_STATUE =
        {
            LINE_1 = "I sure wish I knew what it says!",
            LINE_2 = "It's very pretty.",
            LINE_3 = "I sure wish I knew what it says!",
            LINE_4 = "It's very pretty.",
            LINE_5 = "I sure wish I knew what it says!",
        },

        ARCHIVE_RESONATOR = {
            GENERIC = "It's taking me on a treasure hunt!",
            IDLE = "Aw, I guess I found them all.",
        },

        ARCHIVE_RESONATOR_ITEM = "I think it's for finding something.",

        ARCHIVE_LOCKBOX_DISPENCER = {
          POWEROFF = "I think it's broken.",
          GENERIC =  "Can I press all the buttons?",
        },

        ARCHIVE_SECURITY_DESK = {
            POWEROFF = "Aw, it doesn't do anything.",
            GENERIC = "It's got a little night light inside!",
        },

        ARCHIVE_SECURITY_PULSE = "Wait for me!",

        ARCHIVE_SWITCH = {
            VALID = "This one's all ready.",
            GEMS = "It needs something shiny!",
        },

        ARCHIVE_PORTAL = {
            POWEROFF = "Maybe it used to go somewhere?",
            GENERIC = "Aw, this one didn't turn back on.",
        },

        WALL_STONE_2 = "Bow to the base-building masters!",
        WALL_RUINS_2 = "Looks sturdy.",

        REFINED_DUST = "It's a good thing neither of me are allergic.",
        DUSTMERINGUE = "It doesn't taste as good as it looks.",

        SHROOMCAKE = "Hey, this isn't real cake!",
        SHROOMBAIT = "I'm not afraid to try it.",

        NIGHTMAREGROWTH = "Um... I don't think the ground was like that before.",

        TURFCRAFTINGSTATION = "I always liked playing with dirt! Just remember to wash up before dinner.",

        MOON_ALTAR_LINK = "What could be in there?",

        -- FARMING
        COMPOSTINGBIN =
        {
            GENERIC = "It'll make food for the plants!",
            WET = "It's all wet and goopy.",
            DRY = "It's like sand!",
            BALANCED = "I think it's ready!",
            BURNT = "Uh oh...",
        },
        COMPOST = "Yucky muck!",
        SOIL_AMENDER =
		{
			GENERIC = "Wendy dared me to drink it...",
			STALE = "Is it going bad? Is that good?",
			SPOILED = "It's gotten really rotten looking... yay!",
		},

		SOIL_AMENDER_FERMENTED = "It smells done to me!",

        WATERINGCAN =
        {
            GENERIC = "I'm going to go water the garden now!",
            EMPTY = "Hey, there's no water in it!",
        },
        PREMIUMWATERINGCAN =
        {
            GENERIC = "My watering can back home didn't look anything like that.",
            EMPTY = "I'll have to fill it up somewhere.",
        },

		FARM_PLOW = "Yay! I'm making a garden!",
		FARM_PLOW_ITEM = "I'll find a good spot for the garden.",
		FARM_HOE = "I need that to plant the seeds.",
		GOLDEN_FARM_HOE = "Gardening's more fun when you get to play with something shiny!",
		NUTRIENTSGOGGLESHAT = "It shows me how good the dirt is, and lots of other stuff too!",
		PLANTREGISTRYHAT = "It's teaching me so much about plants!",

        FARM_SOIL_DEBRIS = "I should clean that up.",

		FIRENETTLES = "A bad, stinging weed.",
		FORGETMELOTS = "This one has pretty flowers.",
		SWEETTEA = "Tastes sweet, warms me up!",
		TILLWEED = "It likes to make a mess of my garden.",
		TILLWEEDSALVE = "It helps get rid of booboos.",
        WEED_IVY = "This one's got lots of thorns.",
        IVY_SNARE = "It really doesn't like when I pick the other plants!",

		TROPHYSCALE_OVERSIZEDVEGGIES =
		{
			GENERIC = "I used to see these at the fair!",
			HAS_ITEM = "Weight: {weight}\nHarvested on day: {day}\nThat's pretty good!",
			HAS_ITEM_HEAVY = "Weight: {weight}\nHarvested on day: {day}\nWow, I've never seen one so big!",
            HAS_ITEM_LIGHT = "I guess it's a bit on the small side...",
			BURNING = "Uh oh...",
			BURNT = "All burnt up.",
        },

        CARROT_OVERSIZED = "It's so big!",
        CORN_OVERSIZED = "Can I make giant popcorn?",
        PUMPKIN_OVERSIZED = "I should carve a big scary face into it!",
        EGGPLANT_OVERSIZED = "It's either extra eggy or extra planty.",
        DURIAN_OVERSIZED = "Eww... it has a bigger stink too.",
        POMEGRANATE_OVERSIZED = "I can't even wrap all my arms around it!",
        DRAGONFRUIT_OVERSIZED = "Extra big and extra tasty.",
        WATERMELON_OVERSIZED = "I want giant watermelon slices!",
        TOMATO_OVERSIZED = "Big and juicy.",
        POTATO_OVERSIZED = "Mr. Wolfgang will be so happy!",
        ASPARAGUS_OVERSIZED = "Oh... that's a lot of asparagus...",
        ONION_OVERSIZED = "It's making my eyes tear up!",
        GARLIC_OVERSIZED = "What do I do with all this garlic?",
        PEPPER_OVERSIZED = "That looks pretty spicy.",

        VEGGIE_OVERSIZED_ROTTEN = "Blech, no thank you.",

		FARM_PLANT =
		{
			GENERIC = "It's a plant!",
			SEED = "Grow seed, grow!",
			GROWING = "It'll be big in no time!",
			FULL = "Yay, it's ready to be picked!",
			ROTTEN = "Uh oh... I probably should've picked it earlier.",
			FULL_OVERSIZED = "Wow, look how big it got!",
			ROTTEN_OVERSIZED = "Blech, no thank you.",
			FULL_WEED = "Hey, you're not a fruit or a veggie!",

			BURNING = "That probably isn't good for it.",
		},

        FRUITFLY = "Stop messing up my garden!",
        LORDFRUITFLY = "He's a big meanie!",
        FRIENDLYFRUITFLY = "This one's nice!",
        FRUITFLYFRUIT = "Now the Fruit Flies listen to me!",

        SEEDPOUCH = "I'm gonna fill it with seeds!",

		-- Crow Carnival
		CARNIVAL_HOST = "That's the biggest crow I've ever seen!",
		CARNIVAL_CROWKID = "Are you a boy who was eaten by a crow?",
		CARNIVAL_GAMETOKEN = "Wow, it's so shiny!",
		CARNIVAL_PRIZETICKET =
		{
			GENERIC = "I won a ticket!",
			GENERIC_SMALLSTACK = "Maybe now I can go get a prize!",
			GENERIC_LARGESTACK = "It's a good thing I have extra arms to carry all these tickets!",
		},

		CARNIVALGAME_FEEDCHICKS_NEST = "It's a little bird door.",
		CARNIVALGAME_FEEDCHICKS_STATION =
		{
			GENERIC = "It'll let me play if I give it something shiny.",
			PLAYING = "Don't worry bird mom, all your babies will get fed.",
		},
		CARNIVALGAME_FEEDCHICKS_KIT = "I can help the birds set up.",
		CARNIVALGAME_FEEDCHICKS_FOOD = "I think Wurt might eat these too.",

		CARNIVALGAME_MEMORY_KIT = "I always wondered what it would be like to run away and join a carnival.",
		CARNIVALGAME_MEMORY_STATION =
		{
			GENERIC = "It'll let me play if I give it something shiny.",
			PLAYING = "It's that one over there! Or... was it the other one...",
		},
		CARNIVALGAME_MEMORY_CARD =
		{
			GENERIC = "It's a little bird door.",
			PLAYING = "I'm pretty sure it's this one! Or maybe that one.",
		},

		CARNIVALGAME_HERDING_KIT = "I can help the birds set up.",
		CARNIVALGAME_HERDING_STATION =
		{
			GENERIC = "It'll let me play if I give it something shiny.",
			PLAYING = "I'm really good at herding things!",
		},
		CARNIVALGAME_HERDING_CHICK = "Come back, eggy!",

		CARNIVALGAME_SHOOTING_KIT = "I can help the birds set up.",
		CARNIVALGAME_SHOOTING_STATION =
		{
			GENERIC = "It'll let me play if I give it something shiny.",
			PLAYING = "Watch out for the baby bird!",
		},
		CARNIVALGAME_SHOOTING_TARGET =
		{
			GENERIC = "It's a little bird door.",
			PLAYING = "Are the bugs the bad guys?",
		},

		CARNIVALGAME_SHOOTING_BUTTON =
		{
			GENERIC = "It'll let me play if I give it something shiny.",
			PLAYING = "I wanna press the big button!",
		},

		CARNIVALGAME_WHEELSPIN_KIT = "I can help the birds set up.",
		CARNIVALGAME_WHEELSPIN_STATION =
		{
			GENERIC = "It'll let me play if I give it something shiny.",
			PLAYING = "I'm winning!",
		},

		CARNIVALGAME_PUCKDROP_KIT = "I can help the birds set up.",
		CARNIVALGAME_PUCKDROP_STATION =
		{
			GENERIC = "It'll let me play if I give it something shiny.",
			PLAYING = "I could watch the little ball bounce around all day.",
		},

		CARNIVAL_PRIZEBOOTH_KIT = "I can't wait to see what kind of prizes they have!",
		CARNIVAL_PRIZEBOOTH =
		{
			GENERIC = "I'm saving up my tickets for that one in the back!",
		},

		CARNIVALCANNON_KIT = "I can't wait to play with it!",
		CARNIVALCANNON =
		{
			GENERIC = "Can I turn it on? Pretty please?",
			COOLDOWN = "Yay!!",
		},

		CARNIVAL_PLAZA_KIT = "I need to find a good planting spot.",
		CARNIVAL_PLAZA =
		{
			GENERIC = "It would look better with more decorations around.",
			LEVEL_2 = "I'm pretty sure I can fit even more decorations around it!",
			LEVEL_3 = "It's perfect!",
		},

		CARNIVALDECOR_EGGRIDE_KIT = "I can put it together!",
		CARNIVALDECOR_EGGRIDE = "I wish it was a little bigger so I could ride too!",

		CARNIVALDECOR_LAMP_KIT = "I can put it together!",
		CARNIVALDECOR_LAMP = "Night lights make the dark a little less scary.",
		CARNIVALDECOR_PLANT_KIT = "I can put it together!",
		CARNIVALDECOR_PLANT = "This tree is so small!",
		CARNIVALDECOR_BANNER_KIT = "I can put it together!",
		CARNIVALDECOR_BANNER = "Crows sure like shiny things, don't they?",

		CARNIVALDECOR_FIGURE =
		{
			RARE = "Oooh, I got an extra special one!",
			UNCOMMON = "I'm going to collect all of them!",
			GENERIC = "It's a little wooden statue.",
		},
		CARNIVALDECOR_FIGURE_KIT = "I can't wait to see what's inside!",
		CARNIVALDECOR_FIGURE_KIT_SEASON2 = "I can't wait to see what's inside!",

        CARNIVAL_BALL = "I wanna play with it!", --unimplemented
		CARNIVAL_SEEDPACKET = "I should've gotten the popcorn instead...",
		CARNIVALFOOD_CORNTEA = "Is Ms. Wickerbottom trying to trick me into eating my vegetables again?",

        CARNIVAL_VEST_A = "I can look just like a crow now! Caw Caw!",
        CARNIVAL_VEST_B = "I always wanted a cape!",
        CARNIVAL_VEST_C = "Did they forget to add the bottom half?",

        -- YOTB
        YOTB_SEWINGMACHINE = "I'm really good with silk and threads!",
        YOTB_SEWINGMACHINE_ITEM = "I just need to set it up first.",
        YOTB_STAGE = "Hello Mr. Judge? Can I start the contest now?",
        YOTB_POST =  "Is my beefalo ready for the contest?",
        YOTB_STAGE_ITEM = "I need to find a good spot for the contest.",
        YOTB_POST_ITEM =  "I should build it over... there!",


        YOTB_PATTERN_FRAGMENT_1 = "It tells me how to make a beefalo costume. Well, part of one...",
        YOTB_PATTERN_FRAGMENT_2 = "It tells me how to make a beefalo costume. Well, part of one...",
        YOTB_PATTERN_FRAGMENT_3 = "It tells me how to make a beefalo costume. Well, part of one...",

        YOTB_BEEFALO_DOLL_WAR = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },
        YOTB_BEEFALO_DOLL_DOLL = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },
        YOTB_BEEFALO_DOLL_FESTIVE = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },
        YOTB_BEEFALO_DOLL_NATURE = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },
        YOTB_BEEFALO_DOLL_ROBOT = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },
        YOTB_BEEFALO_DOLL_ICE = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },
        YOTB_BEEFALO_DOLL_FORMAL = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },
        YOTB_BEEFALO_DOLL_VICTORIAN = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },
        YOTB_BEEFALO_DOLL_BEAST = {
            GENERIC = "So soft and cuddly!",
            YOTB = "I should show it to the judge!",
        },

        WAR_BLUEPRINT = "My beefalo might look scary in this, but I know they're really a big softy!",
        DOLL_BLUEPRINT = "So many ruffles...",
        FESTIVE_BLUEPRINT = "This is going to be so much fun!",
        ROBOT_BLUEPRINT = "I hope it's not too heavy for the beefalo.",
        NATURE_BLUEPRINT = "Flowers are always nice.",
        FORMAL_BLUEPRINT = "My beefalo might look even more dapper than Maxwell!",
        VICTORIAN_BLUEPRINT = "It's so fancy! I hope it's not too hard to make...",
        ICE_BLUEPRINT = "Brrr, maybe I should wear gloves for this.",
        BEAST_BLUEPRINT = "Another costume for my lucky beefalo!",

        BEEF_BELL = "The beefalo really like this bell, and whoever rings it!",

		-- YOT Catcoon
		KITCOONDEN =
		{
			GENERIC = "A nice safe place for kitcoons to rest after playing.",
            BURNT = "I hope it was evacuated...",
			PLAYING_HIDEANDSEEK = "They're hiding...",
			PLAYING_HIDEANDSEEK_TIME_ALMOST_UP = "I'm almost out of time to find all of the babies...",
		},

		KITCOONDEN_KIT = "I can use this to build a little house for the kitcoons.",

		TICOON =
		{
			GENERIC = "Your majesty!",
			ABANDONED = "I'll try my best to find them on my own.",
			SUCCESS = "Wow! Good work, your highness!",
			LOST_TRACK = "Aw, I wasn't quick enough.",
			NEARBY = "Is there a kit nearby, my liege?",
			TRACKING = "He's onto something!",
			TRACKING_NOT_MINE = "He's helping someone else right now.",
			NOTHING_TO_TRACK = "It doesn't look like there's anything around here...",
			TARGET_TOO_FAR_AWAY = "Maybe the kit's out of his sniffing range?",
		},

		YOT_CATCOONSHRINE =
        {
            GENERIC = "What a nice tribute!",
            EMPTY = "What could I offer it? Something from a bird?",
            BURNT = "I guess not everyone likes catcoons...",
        },

		KITCOON_FOREST = "The minister's kit is an arborous kit!",
		KITCOON_SAVANNA = "The minister's kit is a beastly kit!",
		KITCOON_MARSH = "The minister's kit is a comfy kit!",
		KITCOON_DECIDUOUS = "The minister's kit is a dastardly kit!",
		KITCOON_GRASS = "The minister's kit is an eager kit!",
		KITCOON_ROCKY = "The minister's kit is a ferrous kit!",
		KITCOON_DESERT = "The minister's kit is a golden kit!",
		KITCOON_MOON = "The minister's kit is a husky kit!",
		KITCOON_YOT = "The minister's kit is an icy kit!",

        -- Moon Storm
        ALTERGUARDIAN_PHASE1 = {
            GENERIC = "Aah! It looks mad!",
            DEAD = "Whew, that was scary!",
        },
        ALTERGUARDIAN_PHASE2 = {
            GENERIC = "Uh oh... I think I just made it madder...",
            DEAD = "Is it over now?",
        },
        ALTERGUARDIAN_PHASE2SPIKE = "Yikes, those are sharp!",
        ALTERGUARDIAN_PHASE3 = "I'm sorry! I'm sorry!",
        ALTERGUARDIAN_PHASE3TRAP = "Now would be a really bad time to fall asleep.",
        ALTERGUARDIAN_PHASE3DEADORB = "Watch out! It might get back up!",
        ALTERGUARDIAN_PHASE3DEAD = "I'm not sure what he did, but it doesn't look like it's getting up again!",

        ALTERGUARDIANHAT = "I see things when I put it on...",
        ALTERGUARDIANHATSHARD = "Uh oh... maybe I can paste them back together?",

        MOONSTORM_GLASS = {
            GENERIC = "Aw, it's not glowy anymore.",
            INFUSED = "Oh! It's so pretty!"
        },

        MOONSTORM_STATIC = "That looks kinda dangerous...",
        MOONSTORM_STATIC_ITEM = "It's like a big lightning bug stuck in a jar.",
        MOONSTORM_SPARK = "It makes my spine chill!",

        BIRD_MUTANT = "I think there might be something wrong with that bird...",
        BIRD_MUTANT_SPITTER = "Stop spitting at me!",

        WAGSTAFF_NPC = "Should I help him? I don't mind, but he's not so sure...",

        WAGSTAFF_NPC_MUTATIONS = "Hi Mister, do you have any games I can play instead?",
        WAGSTAFF_NPC_WAGPUNK = "Should I play follow the leader?",

        ALTERGUARDIAN_CONTAINED = "It's sucking up all the glowy stuff!",

        WAGSTAFF_TOOL_1 = "Is that the thing I'm looking for?",
        WAGSTAFF_TOOL_2 = "It looks like some kind of tool... maybe it's what he was looking for!",
        WAGSTAFF_TOOL_3 = "I found it! He'll be so happy!",
        WAGSTAFF_TOOL_4 = "I found a tool! Maybe it's the one he's looking for?",
        WAGSTAFF_TOOL_5 = "Maybe this is what he was looking for?",

        MOONSTORM_GOGGLESHAT = "Will these goggles be able to protect my eyes from the storm?",

        MOON_DEVICE = {
            GENERIC = "It looks pretty impressive... whatever it is!",
            CONSTRUCTION1 = "There's so much building to do, can't I go play instead?",
            CONSTRUCTION2 = "It's coming along!",
        },

		-- Wanda
        POCKETWATCH_HEAL = {
			GENERIC = "Would I change anything if I could go back in time?",
			RECHARGING = "It's resting.",
		},

        POCKETWATCH_REVIVE = {
			GENERIC = "Would I change anything if I could go back in time?",
			RECHARGING = "It's resting.",
		},

        POCKETWATCH_WARP = {
			GENERIC = "Would I change anything if I could go back in time?",
			RECHARGING = "It's resting.",
		},

        POCKETWATCH_RECALL = {
			GENERIC = "Would I change anything if I could go back in time?",
			RECHARGING = "It's resting.",
			UNMARKED = "Interesting...",
			MARKED_SAMESHARD = "Time to go already?",
			MARKED_DIFFERENTSHARD = "I set this one a while ago, but I can make it!",
		},

        POCKETWATCH_PORTAL = {
			GENERIC = "Would I change anything if I could go back in time?",
			RECHARGING = "It's resting.",
			UNMARKED = "Interesting...",
			MARKED_SAMESHARD = "Time to go already?",
			MARKED_DIFFERENTSHARD = "I set this one a while ago, but I can make it!",
		},

        POCKETWATCH_WEAPON = {
			GENERIC = "Clocks can be dangerous.",
			DEPLETED = "I need to get more of that dark fuel...",
		},

        POCKETWATCH_PARTS = "Little clock bits.",
        POCKETWATCH_DISMANTLER = "Can I play with your tools, Ms. Wanda? I'll be careful!",

        POCKETWATCH_PORTAL_ENTRANCE =
		{
			GENERIC = "It looks a bit scary...",
			DIFFERENTSHARD = "It looks a bit scary...",
		},
        POCKETWATCH_PORTAL_EXIT = "That looks like a long fall.",

        -- Waterlog
        WATERTREE_PILLAR = "Can I make a big swing to hang from it?",
        OCEANTREE = "The water made it all pruney!",
        OCEANTREENUT = "It's almost as big as I am!",
        WATERTREE_ROOT = "Tree toesies.",

        OCEANTREE_PILLAR = "Now I have my own big tree!",

        OCEANVINE = "Maybe I could use that for a swing!",
        FIG = "This fruit is kinda weird, but tasty!",
        FIG_COOKED = "Now it's hot fruit.",

        SPIDER_WATER = "Maybe they can teach Webber how to swim.",
        MUTATOR_WATER = "This one turned out really good!",
        OCEANVINE_COCOON = "Oooh, can I come play in your tree house?",
        OCEANVINE_COCOON_BURNT = "Oh no! Your tree house!",

        GRASSGATOR = "I don't think it wants to be friends with me.",

        TREEGROWTHSOLUTION = "If only I had some peanut butter.",

        FIGATONI = "I've never had sweet pasta before!",
        FIGKABAB = "I like to play swords with the stick when I'm done.",
        KOALEFIG_TRUNK = "That looks extra filling!",
        FROGNEWTON = "Kinda weird, but I like it!",

        -- The Terrorarium
        TERRARIUM = {
            GENERIC = "So pretty! I want to shake it!",
            CRIMSON = "Uh oh... is the tree sick?",
            ENABLED = "I DIDN'T SHAKE IT, I PROMISE!!",
			WAITING_FOR_DARK = "I could give it just a little shake, couldn't I?",
			COOLDOWN = "Oh no! Did I lose the little tree somewhere?",
			SPAWN_DISABLED = "I think I'm done playing with Mr. Eyeball.",
        },

        -- Wolfgang
        MIGHTY_GYM =
        {
            GENERIC = "Can I try, Mr. Wolfgang? I've got extra arms to lift with!",
            BURNT = "Uh oh... Mr. Wolfgang won't be very happy...",
        },

        DUMBBELL = "It looks so easy when Mr. Wolfgang does it...",
        DUMBBELL_GOLDEN = "It looks so easy when Mr. Wolfgang does it...",
		DUMBBELL_MARBLE = "It looks so easy when Mr. Wolfgang does it...",
        DUMBBELL_GEM = "It looks so easy when Mr. Wolfgang does it...",
        POTATOSACK = "I peeked inside, some of them looked more like rocks than potatoes...",

        DUMBBELL_HEAT = "Mr. Wolfgang says it's for warming up.",
        DUMBBELL_REDGEM = "Ouch! It's hot!",
        DUMBBELL_BLUEGEM = "Oh! It's so cold!",

        TERRARIUMCHEST =
		{
			GENERIC = "I didn't find any toys inside.",
			BURNT = "Aww, it was such a pretty chest.",
			SHIMMER = "I bet there are plenty of toys inside!",
		},

		EYEMASKHAT = "I have scary eyes and teeth!",

        EYEOFTERROR = "I don't like the look of that...",
        EYEOFTERROR_MINI = "Scary, but tiny.",
        EYEOFTERROR_MINI_GROUNDED = "A baby eye is about to be born.",

        FROZENBANANADAIQUIRI = "I can pretend it's a milkshake!",
        BUNNYSTEW = "I was told I can't lick it clean...",
        MILKYWHITES = "Yummy looking!",

        CRITTER_EYEOFTERROR = "They're really good at hide and seek!",

        SHIELDOFTERROR ="Ms. Wickerbottom says I shouldn't bite.",
        TWINOFTERROR1 = "Aww, they brought a friend!",
        TWINOFTERROR2 = "Aww, they brought a friend!",

		-- Cult of the Lamb
		COTL_TRINKET = "Is it looking at me?",
		TURF_COTL_GOLD = "I can make the ground shiny!",
		TURF_COTL_BRICK = "Don't step on the cracks!",
		COTL_TABERNACLE_LEVEL1 =
		{
			LIT = "Maybe I should try to fix it up.",
			GENERIC = "I should make a little fire.",
		},
		COTL_TABERNACLE_LEVEL2 =
		{
			LIT = "I like to imagine the little lamb is smiling at me!",
			GENERIC = "I should make a little fire.",
		},
		COTL_TABERNACLE_LEVEL3 =
		{
			LIT = "It shines so bright, it almost hurts my eyes.",
			GENERIC = "I should make a little fire.",
		},

        -- Year of the Catcoon
        CATTOY_MOUSE = "Run little mouse, run!",
        KITCOON_NAMETAG = "I always wanted a pet!",

		KITCOONDECOR1 =
        {
            GENERIC = "I hope the kitcoons like it!",
            BURNT = "Oh no!",
        },
		KITCOONDECOR2 =
        {
            GENERIC = "I like watching the kitcoons play with it!",
            BURNT = "Aww...",
        },

		KITCOONDECOR1_KIT = "I'll have it done right away!",
		KITCOONDECOR2_KIT = "Where should I put it?",

        -- WX78
        WX78MODULE_MAXHEALTH = "Huh. Is that what robot insides look like?",
        WX78MODULE_MAXSANITY1 = "Huh. Is that what robot insides look like?",
        WX78MODULE_MAXSANITY = "Huh. Is that what robot insides look like?",
        WX78MODULE_MOVESPEED = "Huh. Is that what robot insides look like?",
        WX78MODULE_MOVESPEED2 = "Huh. Is that what robot insides look like?",
        WX78MODULE_HEAT = "Huh. Is that what robot insides look like?",
        WX78MODULE_NIGHTVISION = "Huh. Is that what robot insides look like?",
        WX78MODULE_COLD = "Huh. Is that what robot insides look like?",
        WX78MODULE_TASER = "Huh. Is that what robot insides look like?",
        WX78MODULE_LIGHT = "Huh. Is that what robot insides look like?",
        WX78MODULE_MAXHUNGER1 = "Huh. Is that what robot insides look like?",
        WX78MODULE_MAXHUNGER = "Huh. Is that what robot insides look like?",
        WX78MODULE_MUSIC = "Huh. Is that what robot insides look like?",
        WX78MODULE_BEE = "Huh. Is that what robot insides look like?",
        WX78MODULE_MAXHEALTH2 = "Huh. Is that what robot insides look like?",

        WX78_SCANNER =
        {
            GENERIC ="Watch out for my webs when you're flying!",
            HUNTING = "Watch out for my webs when you're flying!",
            SCANNING = "Watch out for my webs when you're flying!",
        },

        WX78_SCANNER_ITEM = "Is your name really Jimmy?",
        WX78_SCANNER_SUCCEEDED = "WX! I think Jimmy's trying to get your attention!",

        WX78_MODULEREMOVER = "I'm not sure that's safe...",

        SCANDATA = "Wow, it learned all that just by looking really hard?",

		-- QOL 2022
		JUSTEGGS = "Can I have pancakes instead?",
		VEGGIEOMLET = "Stop trying to trick me into eating my veggies!",
		TALLEGGS = "Crunchy!",
		BEEFALOFEED = "I take good care of my beefalo.",
		BEEFALOTREAT = "Good beefalo deserve treats.",

        -- Pirates
        BOAT_ROTATOR = "I can turn the boat like a merry-go-round!",
        BOAT_ROTATOR_KIT = "I'm good at spinning things!",
        BOAT_BUMPER_KELP = "It keeps the boat from getting hurt.",
        BOAT_BUMPER_KELP_KIT = "Now I can play bumper boats!",
		BOAT_BUMPER_SHELL = "It keeps the boat from getting hurt.",
        BOAT_BUMPER_SHELL_KIT = "Now I can play bumper boats!",
        BOAT_BUMPER_CRABKING = "Now I will win bumper boats!",
        BOAT_BUMPER_CRABKING_KIT = "Now I can play bumper boats!",

        BOAT_CANNON = {
            GENERIC = "Ms. Wickerbottom said I could play with it as long as there's no cannonballs inside.",
            AMMOLOADED = "I know I shouldn't play with it, but Willow says it's so much fun...",
            NOAMMO = "Oh, I forgot to bring the cannonballs!",
        },
        BOAT_CANNON_KIT = "If I build it, can I play with it?",
        CANNONBALL_ROCK_ITEM = "Mr. Wolfgang says to lift with your legs, easy for him!",

        OCEAN_TRAWLER = {
            GENERIC = "It's a net for catching fish!",
            LOWERED = "I hope it catches lots of fish.",
            CAUGHT = "Look at all those fish!",
            ESCAPED = "Awww, they got away...",
            FIXED = "All fixed!",
        },
        OCEAN_TRAWLER_KIT = "I can build it all by myself.",

        BOAT_MAGNET =
        {
            GENERIC = "I didn't know magnets grew that big!",
            ACTIVATED = "Wheee!",
        },
        BOAT_MAGNET_KIT = "Now how did Mr. Wilson say those pieces went together...?",

        BOAT_MAGNET_BEACON =
        {
            GENERIC = "What a funny little machine.",
            ACTIVATED = "It's blinking! That's good, right?",
        },
        DOCK_KIT = "I've decided I'm going to be a dock kid now.",
        DOCK_WOODPOSTS_ITEM = "I almost forgot the posts!",

        MONKEYHUT =
        {
            GENERIC = "I don't want to play in those jerks' tree house! Even if it does look like fun...",
            BURNT = "That's what happens when you don't play nice!",
        },
        POWDER_MONKEY = "Hey, Ms. Wickerbottom says I shouldn't take things that don't belong to me!",
        PRIME_MATE = "He's a big bully!",
		LIGHTCRAB = "Aww don't be shy, I'm friendly!",
        CUTLESS = "Does anyone wanna play pirates with me?",
        CURSED_MONKEY_TOKEN = "Maybe it's a monkey friendship bracelet?",
        OAR_MONKEY = "Please don't squash me!",
        BANANABUSH = "I didn't know bananas could grow outside!",
        DUG_BANANABUSH = "I didn't know bananas could grow outside!",
        PALMCONETREE = "It looks hard to climb.",
        PALMCONE_SEED = "Aww, it's a baby tree!",
        PALMCONE_SAPLING = "It hasn't grown up yet.",
        PALMCONE_SCALE = "Can I use it for arts and crafts?",
        MONKEYTAIL = "Fuzzy!",
        DUG_MONKEYTAIL = "Fuzzy!",

        MONKEY_MEDIUMHAT = "Wearing a fancy hat definitely makes you better at sailing.",
        MONKEY_SMALLHAT = "It's a bit itchy.",
        POLLY_ROGERSHAT = "I'm the famous pirate Webbeard! Arr!",
        POLLY_ROGERS = "She's my friend!",

        MONKEYISLAND_PORTAL = "It doesn't look like it can take me home.",
        MONKEYISLAND_PORTAL_DEBRIS = "What's that metal stuff?",
        MONKEYQUEEN = "She looks pretty important.",
        MONKEYPILLAR = "How far up does it go?",
        PIRATE_FLAG_POLE = "It's a pirate flag!",

        BLACKFLAG = "I drew a scary skull on it! But I used black ink...",
        PIRATE_STASH = "I found the treasure!",
        STASH_MAP = "It's a real treasure map!",

        BANANAJUICE = "Mmmm, cold and banana-y.",

        FENCE_ROTATOR = "I'm allowed to hit fence posts with it, just not too hard.",

        CHARLIE_STAGE_POST = "Oooh! I should put on a play!",
        CHARLIE_LECTURN = "Maybe I can play one of the characters!",

        CHARLIE_HECKLER = "I don't like those birds very much.",

        PLAYBILL_THE_DOLL = "What a funny play!",
        PLAYBILL_THE_VEIL = "It's not scary. I won't cover my eyes.",
        STATUEHARP_HEDGESPAWNER = "Something's not right...",
        HEDGEHOUND = "Did I say something wrong?!",
        HEDGEHOUND_BUSH = "Look at all those pretty red roses.",

        MASK_DOLLHAT = "I can pretend to be somebody else!",
        MASK_DOLLBROKENHAT = "I can pretend to be somebody else!",
        MASK_DOLLREPAIREDHAT = "I can pretend to be somebody else!",
        MASK_BLACKSMITHHAT = "I can pretend to be somebody else!",
        MASK_MIRRORHAT = "I can pretend to be somebody else!",
        MASK_QUEENHAT = "I can pretend to be somebody else!",
        MASK_KINGHAT = "I can pretend to be somebody else!",
        MASK_TREEHAT = "I can pretend to be somebody else!",
        MASK_FOOLHAT = "I can pretend to be somebody else!",

        COSTUME_DOLL_BODY = "I can wear it in the play!",
        COSTUME_QUEEN_BODY = "I can wear it in the play!",
        COSTUME_KING_BODY = "I can wear it in the play!",
        COSTUME_BLACKSMITH_BODY = "I can wear it in the play!",
        COSTUME_MIRROR_BODY = "I can wear it in the play!",
        COSTUME_TREE_BODY = "I can wear it in the play!",
        COSTUME_FOOL_BODY = "I can wear it in the play!",

        STAGEUSHER =
        {
            STANDING = "Definitely not a friend!",
            SITTING = "What's even under there?",
        },
        SEWING_MANNEQUIN =
        {
            GENERIC = "Can we play dress up?",
            BURNT = "Aww, I wanted to play dress-up...",
        },

		-- Waxwell
		MAGICIAN_CHEST = "Could I borrow it for hide-and-seek?",
		TOPHAT_MAGICIAN = "Not quite like father used to wear.",

        -- Year of the Rabbit
        YOTR_FIGHTRING_KIT = "It's okay Ms. Wickerbottom, I'll only be fighting with pillows!",
        YOTR_FIGHTRING_BELL =
        {
            GENERIC = "PILLOW FIGHT!",
            PLAYING = "I want to play too!",
        },

        YOTR_DECOR_1 = {
            GENERAL = "It makes me feel safe and cozy.",
            OUT = "I still like it, even without the light!",
        },
        YOTR_DECOR_2 = {
            GENERAL = "It makes me feel safe and cozy.",
            OUT = "I still like it, even without the light!",
        },

        HAREBALL = "Yuck! What a mean dare!",
        YOTR_DECOR_1_ITEM = "It'd be a good night light.",
        YOTR_DECOR_2_ITEM = "It'd be a good night light.",

		--
		DREADSTONE = "I'm not sure if I like that rock.",
		HORRORFUEL = "This isn't snatcher's stuff...",
		DAYWALKER =
		{
			GENERIC = "Hey! I was just trying to help!!",
			IMPRISONED = "He doesn't look like a normal pig. Or even a normal werepig.",
		},
		DAYWALKER_PILLAR =
		{
			GENERIC = "I feel bad just leaving him like that...",
			EXPOSED = "I can't break through it!",
		},
		DAYWALKER2 =
		{
			GENERIC = "Does he want to play with me?",
			BURIED = "Oh. That's why I don't play in the big junk pile.",
			HOSTILE = "I don't think he's playing.",
		},
		ARMORDREADSTONE = "It's kinda scary, but it keeps me safe!",
		DREADSTONEHAT = "A pointy helmet to match my pointy teeth!",

        -- Rifts 1
        LUNARRIFT_PORTAL = "Aww, it won't let me in.",
        LUNARRIFT_CRYSTAL = "They look like candy, but they're just rocks.",

        LUNARTHRALL_PLANT = "That plant's kinda spooky...",
        LUNARTHRALL_PLANT_VINE_END = "Hey, leave me alone!",

		LUNAR_GRAZER = "It's trying to make me take a nap!",

        PUREBRILLIANCE = "It's blinding me!",
        LUNARPLANT_HUSK = "That was one mean plant. I'm glad it's gone!",

		LUNAR_FORGE = "Can I use it to make crafts?",
		LUNAR_FORGE_KIT = "I can build it, with the power of my hats!",

		LUNARPLANT_KIT = "I'm pretty good at this!",
		ARMOR_LUNARPLANT = "I'm gonna look so tough!",
		LUNARPLANTHAT = "I'm gonna be a little knight!",
		BOMB_LUNARPLANT = "Catch!",
		STAFF_LUNARPLANT = "I can hit things far away.",
		SWORD_LUNARPLANT = "It's a magic sword!",
		PICKAXE_LUNARPLANT = "I'm coming to get you, rocks!",
		SHOVEL_LUNARPLANT = "Two things in one.",

		BROKEN_FORGEDITEM = "Oh no! Maybe I can fix it?",

        PUNCHINGBAG = "Wigfrid's teaching me how to spar with it!",

        -- Rifts 2
        SHADOWRIFT_PORTAL = "I- I don't think I want to look down there...",

		SHADOW_FORGE = "I'd rather do crafts with paper and glue...",
		SHADOW_FORGE_KIT = "Where should I put it?",

        FUSED_SHADELING = "Ouchie! It bites!",
        FUSED_SHADELING_BOMB = "Definitely not a present!",

		VOIDCLOTH = "It's definitely not my yarn.",
		VOIDCLOTH_KIT = "I'm pretty good at this!",
		VOIDCLOTHHAT = "It makes me look pretty spooky.",
		ARMOR_VOIDCLOTH = "It makes it look like my tummy's smiling!",

        VOIDCLOTH_UMBRELLA = "It keeps me dry, and gives me lots of shade!",
        VOIDCLOTH_SCYTHE = "He never used anything like this back on the farm.",

		SHADOWTHRALL_HANDS = "I wonder if they get dizzy walking like that...",
		SHADOWTHRALL_HORNS = "I don't want to get gobbled up again!",
		SHADOWTHRALL_WINGS = "Aww, no fair, I wish I had wings!",
		SHADOWTHRALL_MOUTH = "It's smiling at me! Maybe it wants to play!",

        CHARLIE_NPC = "Are you the lady from the dark?",
        CHARLIE_HAND = "I think it wants something!",

        NITRE_FORMATION = "It's a big stack of rock stuff!",
        DREADSTONE_STACK = "More of that scary rock...",
        
        SCRAPBOOK_PAGE = "Oooh, I found a page!",

        LEIF_IDOL = "Aww, it's a little angry tree!",
        WOODCARVEDHAT = "A cozy hollow for my head.",
        WALKING_STICK = "What's brown and sticky? Not this stick...",

        IPECACSYRUP = "Wormwood's nice, but he's not very good at cooking.",
        BOMB_LUNARPLANT_WORMWOOD = "Wormwood did something special to it!", -- Unused
        WORMWOOD_MUTANTPROXY_CARRAT =
        {
        	DEAD = "Oh no!",
        	GENERIC = "Hey, little friend!",
        	HELD = "I'll keep you safe.",
        	SLEEPING = "Night night.",
        },
        WORMWOOD_MUTANTPROXY_LIGHTFLIER = "I think it's probably too big to fit in a jar.",
		WORMWOOD_MUTANTPROXY_FRUITDRAGON =
		{
			GENERIC = "It smells like yummy fruit.",
			RIPE = "It looks kinda yummy.",
			SLEEPING = "Night night!",
		},

        SUPPORT_PILLAR_SCAFFOLD = "What's hiding under there?",
        SUPPORT_PILLAR = "Uh oh, those cracks are looking bigger...",
        SUPPORT_PILLAR_COMPLETE = "It'll keep me safe!",
        SUPPORT_PILLAR_BROKEN = "Oh no, it broke!",

		SUPPORT_PILLAR_DREADSTONE_SCAFFOLD = "What's hiding under there?",
		SUPPORT_PILLAR_DREADSTONE = "Uh oh, those cracks are looking bigger...",
		SUPPORT_PILLAR_DREADSTONE_COMPLETE = "Thanks for keeping me safe, pillar!",
		SUPPORT_PILLAR_DREADSTONE_BROKEN = "Aww, poor pillar.",

        WOLFGANG_WHISTLE = "Mr. Wolfgang likes to play with whistles.",

        -- Rifts 3

        MUTATEDDEERCLOPS = "Aah! I'm sorry!",
        MUTATEDWARG = "That's not a nice puppy!",
        MUTATEDBEARGER = "It got scarier!",

        LUNARFROG = "Is that frog sick?",

        DEERCLOPSCORPSE =
        {
            GENERIC  = "Looking at it makes me feel kind of sad.",
            BURNING  = "I guess it's better this way.",
            REVIVING = "T-that's not good!",
        },

        WARGCORPSE =
        {
            GENERIC  = "I shouldn't just leave him like that...",
            BURNING  = "Good-bye puppy.",
            REVIVING = "I- I don't think that's supposed to happen!",
        },

        BEARGERCORPSE =
        {
            GENERIC  = "At least he won't try to stomp on me anymore.",
            BURNING  = "Now he won't come back.",
            REVIVING = "Aah! He's coming back!",
        },

        BEARGERFUR_SACK = "I like my snacks cold.",
        HOUNDSTOOTH_BLOWPIPE = "I can shoot dog teeth!",
        DEERCLOPSEYEBALL_SENTRYWARD =
        {
            GENERIC = "Brrr, I don't like it chilly.",    -- Enabled.
            NOEYEBALL = "Isn't it supposed to have an eye?",  -- Disabled.
        },
        DEERCLOPSEYEBALL_SENTRYWARD_KIT = "I can build this!",

        SECURITY_PULSE_CAGE = "I wonder what goes in there.",
        SECURITY_PULSE_CAGE_FULL = "Oooh it glows. Can I touch it?",

		CARPENTRY_STATION =
        {
            GENERIC = "I'll be careful with the saw!",
            BURNT = "Oops...",
        },

        WOOD_TABLE = -- Shared between the round and square tables.
        {
            GENERIC = "I remember drawing at the table.",
            HAS_ITEM = "I remember drawing at the table.",
            BURNT = "Too bad.",
        },

        WOOD_CHAIR =
        {
            GENERIC = "Snatcher said I could never sit still.",
            OCCUPIED = "Snatcher said I could never sit still.",
            BURNT = "I thought I smelled burning.",
        },

        DECOR_CENTERPIECE = "Is it a toy for me?",
        DECOR_LAMP = "It's so bright for my eyes.",
        DECOR_FLOWERVASE =
        {
            GENERIC = "I like it!",
            EMPTY = "Empty and sad.",
            WILTED = "They look sad.",
            FRESHLIGHT = "Nice and bright!",
            OLDLIGHT = "It's gonna go out soon.",
        },
        DECOR_PICTUREFRAME =
        {
            GENERIC = "I can paint better.",
            UNDRAWN = "I don't feel like painting right now.",
        },
        DECOR_PORTRAITFRAME = "Are I handsome?",

        PHONOGRAPH = "I could listen to that forever.",
        RECORD = "It's a real earworm!",
        RECORD_CREEPYFOREST = "It's his favorite song!",
        RECORD_DANGER = "It's his favorite song!", -- Unused.
        RECORD_DAWN = "It makes me want to do a little dance!", -- Unused.
        RECORD_DRSTYLE = "It makes me want to do a little dance!",
        RECORD_DUSK = "It makes me want to do a little dance!", -- Unused.
        RECORD_EFS = "This one's kind of scary.",
        RECORD_END = "It makes me want to do a little dance!", -- Unused.
        RECORD_MAIN = "It makes me want to do a little dance!", -- Unused.
        RECORD_WORKTOBEDONE = "It makes me want to do a little dance!", -- Unused.
        RECORD_HALLOWEDNIGHTS = "I want candy.",

        ARCHIVE_ORCHESTRINA_MAIN = "I love puzzles!",

        WAGPUNKHAT = "What's one more voice in my head?",
        ARMORWAGPUNK = "Ms. Wickerbottom said to keep my fingers away from the gears.",
        WAGSTAFF_MACHINERY = "I'm not supposed to play in scrap piles, no matter how much I want to.",
        WAGPUNK_BITS = "I love puzzles!",
        WAGPUNKBITS_KIT = "I want to play with the toy!",

        WAGSTAFF_MUTATIONS_NOTE = "Is it a story?",

        -- Meta 3

        BATTLESONG_INSTANT_REVIVE = "I like singing songs!",

        WATHGRITHR_IMPROVEDHAT = "Can I wear it? Pleeeaaase?",
        SPEAR_WATHGRITHR_LIGHTNING = "It gets me all full of static!",

        BATTLESONG_CONTAINER = "Remember to put all the songs away when you're done!",

        SADDLE_WATHGRITHR = "Wigfrid takes good care of her steed.",

        WATHGRITHR_SHIELD = "Will it protect me from getting squashed?",

        BATTLESONG_SHADOWALIGNED = "I like singing songs!",
        BATTLESONG_LUNARALIGNED = "I like singing songs!",

		SHARKBOI = "Maybe it just wants to play with me.",
        BOOTLEG = "Someone forgot their foot inside!",
        OCEANWHIRLPORTAL = "I love spinny boat rides!",

        EMBERLIGHT = "I like it warm and toasty!",
        WILLOW_EMBER = "only_used_by_willow",

        -- Year of the Dragon
        YOTD_DRAGONSHRINE =
        {
            GENERIC = "I love making things!",
            EMPTY = "I think it wants burnt stuff!",
            BURNT = "This makes me sad.",
        },

        DRAGONBOAT_KIT = "I can help build it!",
        DRAGONBOAT_PACK = "It's got everything a boat needs!",

        BOATRACE_CHECKPOINT = "Check! It's a checkpoint!",
        BOATRACE_CHECKPOINT_THROWABLE_DEPLOYKIT = "I get to decide where it goes?",
        BOATRACE_START = "Last one back here is a rotten egg!",
        BOATRACE_START_THROWABLE_DEPLOYKIT = "Should I start here? How about there? Or there?",

        BOATRACE_PRIMEMATE = "Hi! Wanna race?",
        BOATRACE_SPECTATOR_DRAGONLING = "It's nice of him to cheer me on.",

        YOTD_STEERINGWHEEL = "Can I steer for the race? Pleeeaase?",
        YOTD_STEERINGWHEEL_ITEM = "That's for making a steering wheel.",
        YOTD_OAR = "I wish my hands were this big.",
        YOTD_ANCHOR = "Grab onto the sea floor real tight, okay?",
        YOTD_ANCHOR_ITEM = "That's for making an anchor.",
        MAST_YOTD = "I could look at those shimmery scales all day!",
        MAST_YOTD_ITEM = "That's for building a mast.",
        BOAT_BUMPER_YOTD = "Now my boat has fangs too!",
        BOAT_BUMPER_YOTD_KIT = "Now I can play bumper boats!",
        BOATRACE_SEASTACK = "Careful! Don't hit the floaty!",
        BOATRACE_SEASTACK_THROWABLE_DEPLOYKIT = "Where should I throw the floaty?",
        BOATRACE_SEASTACK_MONKEY = "Careful! Don't hit the floaty!",
        BOATRACE_SEASTACK_MONKEY_THROWABLE_DEPLOYKIT = "Where should I throw the floaty?",
        MASTUPGRADE_LAMP_YOTD = "I feel a lot better having a night light around.",
        MASTUPGRADE_LAMP_ITEM_YOTD = "Now my boat can have a light!",
        WALKINGPLANK_YOTD = "It's not much fun, but at least it's pretty.",
        CHESSPIECE_YOTD = "I had a lot of fun that day!",

        -- Rifts / Meta QoL

        HEALINGSALVE_ACID = "Not just for booboos!",

        BEESWAX_SPRAY = "I'm only allowed to spray it on plants.",
        WAXED_PLANT = "It'll stay like that forever!", -- Used for all waxed plants, from farm plants to trees.

        STORAGE_ROBOT = {
            GENERIC = "It works while I play!",
            BROKEN = "Someone fix it so I can play with it.",
        },

        SCRAP_MONOCLEHAT = "I can see extra far with that on!",
        SCRAPHAT = "It still smells like pig sweat!",

        FENCE_JUNK = "It's not the nicest-looking fence.",
        JUNK_PILE = "There might be something fun to play with in there!",
        JUNK_PILE_BIG = "I don't want to get squashed!",

        ARMOR_LUNARPLANT_HUSK = "I aren't allowed to play with that. It's just for Wormwood.",

        -- Meta 4 / Ocean QoL

        OTTER = "Hey don't touch my stuff!",
        OTTERDEN = {
            GENERIC = "I don't see anything.",
            HAS_LOOT = "I see treats inside!",
        },
        OTTERDEN_DEAD = "I'm in trouble.",

        BOAT_ANCIENT_ITEM = "Building a new boat to look old? I don't get it...",
        BOAT_ANCIENT_CONTAINER = "That's where I hide all my favorite toys.",
        WALKINGPLANK_ANCIENT = "It's the least fun diving board.",

        ANCIENTTREE_SEED = "I want to see what it grows into!",

        ANCIENTTREE_GEM = {
            GENERIC = "Aww, it's too hot to climb.",
            STUMP = "Poor Mr. Tree.",
        },

        ANCIENTTREE_SAPLING_ITEM = "I'm going to find a good home for you!",

        ANCIENTTREE_SAPLING = {
            GENERIC = "I think it likes its new home.",
            WRONG_TILE = "What's wrong? Don't you like it there?",
            WRONG_SEASON = "It's okay, you can grow when you're ready.",
        },
 
        ANCIENTTREE_NIGHTVISION = {
            GENERIC = "It looks scary, but that doesn't mean it's bad!",
            STUMP = "Poor Mr. Tree.",
        },

        ANCIENTFRUIT_GEM = "It's too hard to take a bite out of.",
        ANCIENTFRUIT_NIGHTVISION = "Um... are I sure it's not full of fruit flies?",
        ANCIENTFRUIT_NIGHTVISION_COOKED = "It doesn't help my eyes, but it also doesn't hurt my tummy as much.",

        BOATPATCH_KELP = "It's for fixing up boat booboos!",

        CRABKING_MOB = "We really should be friends.",
        CRABKING_MOB_KNIGHT = "Not very friendly.",
        CRABKING_CANNONTOWER = "Oooh fun! Heads up!",
        CRABKING_ICEWALL = "Why can't I climb it?",

        SALTLICK_IMPROVED = "I know it's gross but I want to lick it anyway.",

        OFFERING_POT =
        {
            GENERIC = "They need kelp!",
            SOME_KELP = "I can get more!",
            LOTS_OF_KELP = "That's a lot of kelp!",
        },

        OFFERING_POT_UPGRADED =
        {
            GENERIC = "They need kelp!",
            SOME_KELP = "I can get more!",
            LOTS_OF_KELP = "That's a lot of kelp!",
        },

        MERM_ARMORY = "They don't seem to like sharing their toys.",
        MERM_ARMORY_UPGRADED = "They don't seem to like sharing their toys.",
        MERM_TOOLSHED = "Aww, how come I'm not allowed inside?",
        MERM_TOOLSHED_UPGRADED = "Aww, how come I'm not allowed inside?",
        MERMARMORHAT = "Merms only? No fair.",
        MERMARMORUPGRADEDHAT = "Merms only? No fair.",
        MERM_TOOL = "Wow, it does everything! Sort of.",
        MERM_TOOL_UPGRADED = "Wow, it does everything! Sort of.",

        WURT_SWAMPITEM_SHADOW = "Wurt won't let me play with her mud wand, even after I shared my snacks!",
        WURT_SWAMPITEM_LUNAR = "Wurt won't let me play with her mud wand, even after I shared my snacks!",

        MERM_SHADOW = "I've been starting to get a little worried about Wurt...",
        MERMGUARD_SHADOW = "I've been starting to get a little worried about Wurt...",

        MERM_LUNAR = "Um, Wurt? Are the merms sick?",
        MERMGUARD_LUNAR = "Um, Wurt? Are the merms sick?",

        -- Rifts 4

        SHADOW_BEEF_BELL = "I can save my beefalo!",
        SADDLE_SHADOW = "I love riding beefalo! Wheee!",
        SHADOW_BATTLEAXE = "I'll be careful. Promise!",
        VOIDCLOTH_BOOMERANG = "Oooh, fun!",
		ROPE_BRIDGE_KIT = "I can help!",
		GELBLOB =
		{
			GENERIC = "Can I play with it?",
			HAS_ITEM = "There's a prize inside!",
			HAS_CHARACTER = "Are you stuck?",
		},
        RABBITKING_AGGRESSIVE = "What a grouchy ol' rabbit!",
        RABBITKING_PASSIVE = "Hello, Mister Rabbit!",
        RABBITKING_LUCKY = "I'll catch it!",
        RABBITKINGMINION_BUNNYMAN = "Nasty rabbit.",
        ARMOR_CARROTLURE = "Does this count as eating my vegetables?",
        RABBITKINGHORN = "What kind of music do rabbits like?",
        RABBITKINGHORN_CHEST = "I can hide things with the rabbits!",
        RABBITKINGSPEAR = "It's a little fuzzy.",
        RABBITHAT = "Haha!",
        WORM_BOSS = "Wow.",

        STONE_TABLE = -- Shared between the round and square tables.
        {
            GENERIC = "I remember drawing at the table.",
            HAS_ITEM = "I remember drawing at the table.",
        },

        STONE_CHAIR =
        {
            GENERIC = "Snatcher said I could never sit still.",
            OCCUPIED = "Snatcher said I could never sit still.",
        },

        CARPENTRY_BLADE_MOONGLASS = "Ms. Wickerbottom said I should be extra careful with that.",

        CHEST_MIMIC_REVEALED = "I didn't touch it!",

        GELBLOB_STORAGE = { 
            GENERIC  = "Looks like jelly.",
            FULL = "Yummy!",
        },
        GELBLOB_STORAGE_KIT = "I can build it!",
        GELBLOB_BOTTLE = "It's sticky like my webs!",

        PLAYER_HOSTED =
        {        
            GENERIC = "Remember me?",
            ME = "Gonna be my own best friend!",
        },

        MASK_SAGEHAT = "Ooooh, they'll never guess it's me!",
        MASK_HALFWITHAT = "Hehe, what a funny face.",
        MASK_TOADYHAT = "I wanna try this one.",

        SHADOWTHRALL_PARASITE = "Maybe it just wants a friend to play with.",

        PUMPKINCARVER = "Fun fun fun fun fun.",
		SNOWMAN =
		{
			GENERIC = "I love it!",
			SNOWBALL = "It's so... round!",
		},
        SNOWBALL_ITEM = "Snowball fight!",

        -- Year of the Snake
        YOTS_SNAKESHRINE =
        {
            GENERIC = "A surprise for me!",
            EMPTY = "What do I give it?",
            BURNT = "It wasn’t me.",
        },
        YOTS_WORM = "You’ll never catch me, worm!",
        YOTS_LANTERN_POST = 
        {
            GENERIC = "Fancy!",
            BURNT = "Aw. It burned.",
        },
        YOTS_LANTERN_POST_ITEM = "I can build it!",
        CHESSPIECE_DEPTHWORM  = "Can I play with this worm?",
    },

    DESCRIBE_GENERIC = "Can I play with it?",
    DESCRIBE_TOODARK = "It's too dark!",
    DESCRIBE_SMOLDERING = "Uh-oh. I smell burning!",

    DESCRIBE_PLANTHAPPY = "A happy plant.",
    DESCRIBE_PLANTVERYSTRESSED = "This plant looks miserable!",
    DESCRIBE_PLANTSTRESSED = "Aw, this plant doesn't look very happy...",
    DESCRIBE_PLANTSTRESSORKILLJOYS = "I should do some weeding... even if I don't like to.",
    DESCRIBE_PLANTSTRESSORFAMILY = "Maybe it would be happier if it wasn't alone?",
    DESCRIBE_PLANTSTRESSOROVERCROWDING = "I packed too many plants too close together!",
    DESCRIBE_PLANTSTRESSORSEASON = "I don't think it likes this weather very much.",
    DESCRIBE_PLANTSTRESSORMOISTURE = "I should give it some water.",
    DESCRIBE_PLANTSTRESSORNUTRIENTS = "Maybe it needs some better dirt?",
    DESCRIBE_PLANTSTRESSORHAPPINESS = "Aww, do you need someone to talk to?",

    EAT_FOOD =
    {
        TALLBIRDEGG_CRACKED = "What if it hatches in my belly?",
		WINTERSFEASTFUEL = "Not that tasty after all...",
    },
}
