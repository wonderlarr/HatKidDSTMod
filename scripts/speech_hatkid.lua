return {

	ACTIONFAIL =
	{
        REPAIR =
        {
            WRONGPIECE = "Did I do that right?",
        },
        BUILD =
        {
            MOUNTED = "I don't think I should try that.",
            HASPET = "I've already got a pet.",
        },
		SHAVE =
		{
			AWAKEBEEFALO = "That would be crazy!",
			GENERIC = "That would be weird.",
			NOBITS = "That would be like me shaving myself!",
		},
		STORE =
		{
			GENERIC = "It's full.",
			NOTALLOWED = "That can't go in there",
			
			INUSE = "I should wait my turn.",
		},
		RUMMAGE =
		{	
			GENERIC = "I can't do that.",
			INUSE = "They're elbow deep in junk right now.",
		},
		USEKLAUSSACKKEY =
        {
        	WRONGKEY = "Whoops! That wasn't right.",
        	KLAUS = "I think there's too much going on!!",
        },
        COOK =
        {
            GENERIC = "I'll punish the food later.",
            INUSE = "I hope it's tasty.",
            TOOFAR = "It's a little far.",
        },
        GIVE =
        {
            GENERIC = "I can't do it!",
            DEAD = "I don't think they'll need this.",
            SLEEPING = "Shhh, they're napping!",
            BUSY = "I'll try again in a second.",
            ABIGAILHEART = "It was worth a shot.",
            GHOSTHEART = "Maybe this is a bad idea.",
            NOTGEM = "I'm not sticking that in there!",
            WRONGGEM = "This gem won't work here.",
            NOTSTAFF = "It's not quite the right shape.",
            MUSHROOMFARM_NEEDSSHROOM = "A mushroom would probably be of more use.",
            MUSHROOMFARM_NEEDSLOG = "A living log would probably be of more use.",
            SLOTFULL = "We already put something there.",
            DUPLICATE = "We already know that one.",
            NOTSCULPTABLE = "I wonder how that would work?",
            NOTATRIUMKEY = "It's not quite the right shape.",
            CANTSHADOWREVIVE = "It won't resurrect.",
            WRONGSHADOWFORM = "It's not put together right.",
        },
        GIVETOPLAYER =
        {
            FULL = "Your pockets are too full!",
            DEAD = "Maybe I'll just hold on to this.",
            SLEEPING = "I could use a nap too.",
            BUSY = "I'll try again in a second.",
        },
        GIVEALLTOPLAYER =
        {
            FULL = "Your pockets are too full!",
            DEAD = "Maybe I'll just hold on to this.",
            SLEEPING = "I could use a nap too.",
            BUSY = "I'll try again in a second.",
        },
        WRITE =
        {
            GENERIC = "I think it's fine as is.",
            INUSE = "There's only room for one scribbler.",
        },
        DRAW =
        {
            NOIMAGE = "This would be easier if I had the item in front of me.",
        },
        CHANGEIN =
        {
            GENERIC = "I don't want to change right now.",
            BURNING = "It's too dangerous right now!",
            INUSE = "It can only handle one style change at a time.",
        },
        ATTUNE =
        {
            NOHEALTH = "I don't feel well enough.",
        },
        MOUNT =
        {
            TARGETINCOMBAT = "I know better than to bother an angry beefalo!",
            INUSE = "Someone beat me to the saddle!",
        },
        SADDLE =
        {
            TARGETINCOMBAT = "It won't let me do that while it's angry.",
        },
        TEACH =
        {
            --Recipes/Teacher
            KNOWN = "I already know that one.",
            CANTLEARN = "I can't learn that one.",

            --MapRecorder/MapExplorer
            WRONGWORLD = "I don't think this is the right map.",
        },
        WRAPBUNDLE =
        {
            EMPTY = "I can't wrap nothing!",
        },
	},
	ACTIONFAIL_GENERIC = "Nope!",
	ANNOUNCE_DIG_DISEASE_WARNING = "It looks a little better now.",
	ANNOUNCE_PICK_DISEASE_WARNING = "That's not too good.",
	ANNOUNCE_ADVENTUREFAIL = "That didn't go well. I'll have to try again.",
    ANNOUNCE_MOUNT_LOWHEALTH = "Oh no! It's hurt!",
	ANNOUNCE_BEES = "I enjoy jazz.",
	ANNOUNCE_BOOMERANG = "PECK!",
	ANNOUNCE_CHARLIE = "What is that?",
	ANNOUNCE_CHARLIE_ATTACK = "OW! Something bit me!",
	ANNOUNCE_HOT = "I could use a pool of water right about now",
	ANNOUNCE_COLD = "Brrrrr!",
	ANNOUNCE_CRAFTING_FAIL = "I don't have enough stuff.",
	ANNOUNCE_DEERCLOPS = "Something big and bad's coming.",
	ANNOUNCE_CAVEIN = "The roof is shaking!",
	ANNOUNCE_ANTLION_SINKHOLE = 
	{
		"That can't be good.",
		"Is that a hole?",
		"Looks like that will be there for a while.",
	},
	ANNOUNCE_ANTLION_TRIBUTE =
	{
        "Here's this thing I guess.",
        "How do you even use these thingies?",
        "I'd rather just do a contract...",
	},
	ANNOUNCE_SACREDCHEST_YES = "I guess I'm worthy.",
	ANNOUNCE_SACREDCHEST_NO = "It didn't like that.",
	ANNOUNCE_DUSK = "It's almost nighttime!",
	ANNOUNCE_EAT =
	{
		GENERIC = "Tasty!",
		PAINFUL = "Oww!",
		SPOILED = "Eww!",
		STALE = "Not so tasty.",
		INVALID = "That's too icky.",
		YUCKY = "I don't wanna eat that.",
	},
    ANNOUNCE_ENCUMBERED =
    {
        "Huff... Pant...",
        "I... might be... too small for this...",
        "I... can't... lift this...",
        "This isn't... kid's work...",
        "Why... do I... have to do this...",
        "Is this... messing up my hat?",
        "Hngh...!",
        "Pant... Pant...",
        "Isn't this... child labor?",
    },
    ANNOUNCE_ATRIUM_DESTABILIZING = 
    {
		"We should go.",
		"What's that?!",
		"Look for somewhere to leave!",
	},
    ANNOUNCE_RUINS_RESET = "Well... They're back.",
    ANNOUNCE_SNARED = "Sharp! Sharp bones!!",
    ANNOUNCE_REPELLED = "It's shielded!",
	ANNOUNCE_ENTER_DARK = "A little too spooky for me.",
	ANNOUNCE_ENTER_LIGHT = "I can see again!",
	ANNOUNCE_FREEDOM = "Yay! I'm free!",
	ANNOUNCE_HIGHRESEARCH = "I feel so smart!",
	ANNOUNCE_HOUNDS = "Did you hear that?",
	ANNOUNCE_WORMS = "Did you feel that?",
	ANNOUNCE_HUNGRY = "I'm really hungry!",
	ANNOUNCE_HUNT_BEAST_NEARBY = "My detective skills say it's close.",
	ANNOUNCE_HUNT_LOST_TRAIL = "I'm not as good at this as I thought.",
	ANNOUNCE_HUNT_LOST_TRAIL_SPRING = "Too wet to be a detective.",
	ANNOUNCE_INV_FULL = "I can't carry any more stuff!",
	ANNOUNCE_KNOCKEDOUT = "Ugh, my head!",
	ANNOUNCE_LOWRESEARCH = "I didn't learn very much from that.",
	ANNOUNCE_MOSQUITOS = "Aaah! Bug off!",
    ANNOUNCE_NOWARDROBEONFIRE = "I can't change while it's on fire!",
    ANNOUNCE_NODANGERGIFT = "I can't open presents with monsters about!",
    ANNOUNCE_NOMOUNTEDGIFT = "I should get off my beefalo first.",
	ANNOUNCE_NODANGERSLEEP = "I'm too scared of dying to sleep right now!",
	ANNOUNCE_NODAYSLEEP = "It's bedtime already?",
	ANNOUNCE_NODAYSLEEP_CAVE = "I'm not tired yet!",
	ANNOUNCE_NOHUNGERSLEEP = "I'm too hungry to sleep, my growling tummy will keep me up!",
	ANNOUNCE_NOSLEEPONFIRE = "I don't exactly have a burning desire to sleep in that.",
	ANNOUNCE_NODANGERSIESTA = "It's too dangerous to siesta right now!",
	ANNOUNCE_NONIGHTSIESTA = "Night is for sleeping, not taking siestas.",
	ANNOUNCE_NONIGHTSIESTA_CAVE = "I don't think I could really relax down here.",
	ANNOUNCE_NOHUNGERSIESTA = "I'm too hungry for a siesta!",
	ANNOUNCE_NODANGERAFK = "Now's not the time to flee this fight!",
	ANNOUNCE_NO_TRAP = "Well, that was easy.",
	ANNOUNCE_PECKED = "Peck me? PECK YOU!",
	ANNOUNCE_QUAKE = "That doesn't sound good.",
	ANNOUNCE_RESEARCH = "Never stop learning!",
	ANNOUNCE_SHELTER = "Thanks tree!",
	ANNOUNCE_THORNS = "Ow!",
	ANNOUNCE_BURNT = "Yikes! That was hot!",
	ANNOUNCE_TORCH_OUT = "My light just ran out!",
	ANNOUNCE_THURIBLE_OUT = "It's been thuribly depleted.",
	ANNOUNCE_FAN_OUT = "My fan is gone with the wind.",
    ANNOUNCE_COMPASS_OUT = "This compass doesn't point anymore.",
	ANNOUNCE_TRAP_WENT_OFF = "Oops.",
	ANNOUNCE_UNIMPLEMENTED = "OW! I don't think it's ready yet.",
	ANNOUNCE_WORMHOLE = "That was not a sane thing to do.",
	ANNOUNCE_TOWNPORTALTELEPORT = "I don't know about that...",
	ANNOUNCE_CANFIX = "\nI think I can fix this!",
	ANNOUNCE_ACCOMPLISHMENT = "I feel so accomplished!",
	ANNOUNCE_ACCOMPLISHMENT_DONE = "If only my friends could see me now...",	
	ANNOUNCE_INSUFFICIENTFERTILIZER = "Are you still hungry, plant?",
	ANNOUNCE_TOOL_SLIP = "Wow, that tool is slippery!",
	ANNOUNCE_LIGHTNING_DAMAGE_AVOIDED = "Safe from that frightening lightning!",
	ANNOUNCE_TOADESCAPING = "The toad is losing interest.",
	ANNOUNCE_TOADESCAPED = "The toad got away.",

	ANNOUNCE_DAMP = "I'm a little damp.",
	ANNOUNCE_WET = "I need my rain coat!",
	ANNOUNCE_WETTER = "Should I try opening the umbrella?",
	ANNOUNCE_SOAKED = "Too late for the raincoat now.",
	
	ANNOUNCE_BECOMEGHOST = "oOooOooo!!",
	ANNOUNCE_GHOSTDRAIN = "Too spooky for me...",
	ANNOUNCE_PETRIFED_TREES = "They lived before.",
	ANNOUNCE_KLAUS_ENRAGE = "It's unbeatable!",
	ANNOUNCE_KLAUS_UNCHAINED = "Its chains came off!",
	ANNOUNCE_KLAUS_CALLFORHELP = "Be careful!",

    ANNOUNCE_ROYALTY = 
    {
    	"Your majesty.",
    	"Your highness.",
    	"My liege!",
    },

	BATTLECRY =
	{
		GENERIC = "HAYA!",
		PIG = "Here piggy piggy!",
		PREY = "BLAM!",
		SPIDER = "STOMP!",
		SPIDER_WARRIOR = "Better you than me!",
		DEER = "Die!",
	},
	COMBAT_QUIT =
	{
		GENERIC = "I sure showed him!",
		PIG = "I'll let him go. This time.",
		PREY = "He's too fast!",
		SPIDER = "He's too gross, anyway.",
		SPIDER_WARRIOR = "Shoo, you nasty thing!",
	},
	DESCRIBE =
	{
		MULTIPLAYER_PORTAL = "What even is that thing?",
		ANTLION = 
		{
			GENERIC = "It better not want my hat!",
			VERYHAPPY = "I think we're best friends!",
			UNHAPPY = "That's not good.",
		},
		ANTLIONTRINKET = "Someone might be interested in this.",
		SANDSPIKE = "I could've been stabbed!",
        SANDBLOCK = "It's so gritty!",
        GLASSSPIKE = "Memories of the time I wasn't stabbed.",
        GLASSBLOCK = "Pretty!",
		ABIGAIL_FLOWER = 
		{ 
			GENERIC ="Spooky, but pretty.",
			LONG = "I almost feel soulless again.",
			MEDIUM = "It's giving me the creeps.",
			SOON = "A little strange for a flower.",
			HAUNTED_POCKET = "I don't think I should hang on to this.",
			HAUNTED_GROUND = "What does it do?",
		},

		BALLOONS_EMPTY = "It looks like clown currency.",
		BALLOON = "How are they floating?",

		BERNIE_INACTIVE =
		{
			BROKEN = "It finally fell apart.",
			GENERIC = "It's all scorched.",
		},

		BERNIE_ACTIVE = "A big huge teddy bear is fighting... okay.",
		
		BOOK_BIRDS = "No point studying when I can just wing it.",
		BOOK_TENTACLES = "Someone'll get suckered into reading this.",
		BOOK_GARDENING = "I see no farm in reading that.",
		BOOK_SLEEP = "Strange, it's just 500 pages of telegraph codes.",
		BOOK_BRIMSTONE = "The beginning was dull, but got better near the end.",

        PLAYER =
        {
            GENERIC = "Hi, %s!",
            ATTACKER = "%s might be scary...",
            MURDERER = "MYURRDERR!!",
            REVIVER = "%s, the unmurderer.",
            GHOST = "%s could use a little love.",
            FIRESTARTER = "Burning that wasn't very nice, %s.",
        },
		WILSON = 
		{
			GENERIC = "Oh hi there, %s.",
			ATTACKER = "Yeesh. Do you always look that creepy?",
			MURDERER = "You're worse than the conductor!",
			REVIVER = "Good job reviving %s",
			GHOST = "I better find a way to revive you.",
			FIRESTARTER = "Burning that wasn't very nice, %s.",
		},
		WOLFGANG = 
		{
			GENERIC = "Oh hi there, %s!",
			ATTACKER = "Let's not start a fight with the strongman...",
			MURDERER = "MYURRDERR!! I can take you!",
			REVIVER = "%s is just a big teddy bear.",
			GHOST = "I told you you couldn't deadlift that boulder, %s. The numbers were all wrong.",
			FIRESTARTER = "You can't actually \"fight\" fire, %s!",
		},
		WAXWELL = 
		{
			GENERIC = "Oh hi there, %s!",
			ATTACKER = "Seems you've gone from \"dapper\" to \"slapper\".",
			MURDERER = "I'll show you Logic and Reason... those're my fists!",
			REVIVER = "%s is using his powers for good.",
			GHOST = "Don't look at me like that, %s! I'm working on it!",
			FIRESTARTER = "%s's just asking to get roasted.",
		},
		WX78 = 
		{
			GENERIC = "Hi, %s!",
			ATTACKER = "I think we need to tweak your primary directive, %s...",
			MURDERER = "%s! You've violated the first law!",
			REVIVER = "I guess %s got that empathy module up and running.",
			GHOST = "I always thought %s could use a heart. Now I'm certain!",
			FIRESTARTER = "You look like you're gonna melt, %s. What happened?",
		},
		WILLOW = 
		{
			GENERIC = "Good day to you, %s!",
			ATTACKER = "%s is holding that lighter pretty tightly...",
			MURDERER = "MYURRDERR! Arsonist!",
			REVIVER = "%s, friend of ghosts.",
			GHOST = "I bet you're just burning for a heart, %s.",
			FIRESTARTER = "Again?",
		},
		WENDY = 
		{
			GENERIC = "Oh hi there, %s!",
			ATTACKER = "%s doesn't have any sharp objects, does she?",
			MURDERER = "MYURRDERR!",
			REVIVER = "%s treats ghosts like family.",
			GHOST = "Maybe I can save %s, she was a girl like me!",
			FIRESTARTER = "I know you set those flames, %s.",
		},
		WOODIE = 
		{
			GENERIC = "Oh hi there, %s!",
			ATTACKER = "%s has been a bit of a sap lately...",
			MURDERER = "MYURRDERR! Bring me an axe and we'll get in the swing of things!",
			REVIVER = "%s saved everyone's backbacon.",
			GHOST = "Does \"universal\" coverage include the void, %s?",
			BEAVER = "%s's gone on a wood chucking rampage!",
			BEAVERGHOST = "Will you bea-very mad if I don't revive you, %s?",
			FIRESTARTER = "Don't burn yourself out, %s.",
		},
		WICKERBOTTOM = 
		{
			GENERIC = "Oh hi there, %s!",
			ATTACKER = "I think %s's planning to throw the book at me.",
			MURDERER = "Here comes my peer review!",
			REVIVER = "I have deep respect for %s's practical theorems.",
			GHOST = "How'd this happen, %s?",
			FIRESTARTER = "I'm sure you had a very clever reason for that fire.",
		},
		WES = 
		{
			GENERIC = "Oh hi there, %s!",
			ATTACKER = "%s is silent, but deadly...",
			MURDERER = "Mime this!",
			REVIVER = "%s thinks outside the invisible box.",
			GHOST = "How do you say \"I'll conduct a revival device\" in mime?",
			FIRESTARTER = "Wait, don't tell me. You lit a fire.",
		},
		WEBBER = 
		{
			GENERIC = "Oh hi there, %s!",
			ATTACKER = "I'm gonna roll up a piece of papyrus newspaper, just in case.",
			MURDERER = "MYURRDERR! I'll squash you, %s!",
			REVIVER = "%s is playing well with others.",
			GHOST = "%s is really buggin' me for a heart.",
			FIRESTARTER = "We need to have a group meeting about fire safety.",
		},
		WATHGRITHR = 
		{
			GENERIC = "Oh hi there, %s!",
			ATTACKER = "I'd like to avoid a punch from %s, if possible.",
			MURDERER = "%s's gone berserk!",
			REVIVER = "%s has full command of spirits.",
			GHOST = "Nice try. You're not escaping to Valhalla yet, %s.",
			FIRESTARTER = "%s is really heating things up today.",
		},
        WINONA =
        {
            GENERIC = "Oh hi there, %s!",
            ATTACKER = "%s is a safety hazard.",
            MURDERER = "It ends here, %s!",
            REVIVER = "It's pretty handy having you around, %s.",
            GHOST = "That probably threw a wrench into her plans.",
            FIRESTARTER = "Things are burning up at the factory today.",
        },
        MIGRATION_PORTAL = 
        {
            GENERIC = "If I had any friends, this could take me to them.",
            OPEN = "If I step through, will I still be me?",
            FULL = "It seems to be popular over there.",
        },
		GLOMMER = "It's cute, in a gross kind of way.",
		GLOMMERFLOWER = 
		{
			GENERIC = "The petals shimmer in the light.",
			DEAD = "The petals droop and shimmer in the light.",
		},
		GLOMMERWINGS = "These would look empirically amazing on a helmet!",
		GLOMMERFUEL = "This goop smells foul.",
		BELL = "Dingalingaling.",
		STATUEGLOMMER = 
		{	
			GENERIC = "I'm not sure what that's supposed to be.",
			EMPTY = "I broke it. For fun.",
		},

        LAVA_POND_ROCK = "As gneiss a place as any.",

		WEBBERSKULL = "Poor little guy. He deserves a proper funeral.",
		WORMLIGHT = "Looks delicious.",
		WORMLIGHT_LESSER = "Kinda wrinkled.",
		WORM =
		{
		    PLANT = "Seems safe to me.",
		    DIRT = "Just looks like a pile of dirt.",
		    WORM = "It's a worm!",
		},
        WORMLIGHT_PLANT = "Seems safe to me.",
		MOLE =
		{
			HELD = "Nowhere left to dig, my friend.",
			UNDERGROUND = "Something's under there, searching for minerals.",
			ABOVEGROUND = "I'd sure like to whack that mole... thing.",
		},
		MOLEHILL = "What a nice, homey hole in the ground!",
		MOLEHAT = "A wretched stench, but excellent visibility.",

		EEL = "This will make a delicious meal.",
		EEL_COOKED = "Smells great!",
		UNAGI = "I hope this doesn't make anyone eel!",
		EYETURRET = "I hope it doesn't turn on me.",
		EYETURRET_ITEM = "I think it's sleeping.",
		MINOTAURHORN = "Wow! I'm glad that didn't gore me!",
		MINOTAURCHEST = "It may contain a bigger something fantastic! Or horrible.",
		THULECITE_PIECES = "It's some smaller chunks of Thulecite.",
		POND_ALGAE = "Some algae by a pond.",
		GREENSTAFF = "This will come in handy.",
		GIFT = "Is that for me?",
        GIFTWRAP = "That's a wrap!",
		POTTEDFERN = "A fern in a pot.",
        SUCCULENT_POTTED = "A succulent in a pot.",
		SUCCULENT_PLANT = "Aloe there.",
		SUCCULENT_PICKED = "I could eat that, but I'd rather not.",
		SENTRYWARD = "Seems like a weird map thing.",
        TOWNPORTAL =
        {
			GENERIC = "This pyramid controls the sands.",
			ACTIVE = "Ready for departiculation.",
		},
        TOWNPORTALTALISMAN = 
        {
			GENERIC = "A mini departiculator.",
			ACTIVE = "A more sane person would walk.",
		},
        WETPAPER = "I hope it dries off soon.",
        WETPOUCH = "This package is barely holding together.",
        MOONROCK_PIECES = "I could probably break that.",
        MOONBASE =
        {
            GENERIC = "There's a hole in the middle for something to go in.",
            BROKEN = "It's all smashed up.",
            STAFFED = "Now what?",
            WRONGSTAFF = "I have a distinct feeling this isn't right.",
            MOONSTAFF = "The stone lit it up somehow.",
        },
        MOONDIAL = 
        {
			GENERIC = "It looks like a big cup.",
			NIGHT_NEW = "It's a new moon.",
			NIGHT_WAX = "The moon is waxing.",
			NIGHT_FULL = "It's a full moon.",
			NIGHT_WANE = "The moon is waning.",
			CAVE = "There's no moon down here to measure.",
        },
 		--MOWER = "I like the cut of this blade.",
		--MACHETE = "I like the cut of this blade.",
		--GOLDENMACHETE = "Hack in style!",
		--OBSIDIANMACHETE = "It's hot to the touch.",
		--BOOK_METEOR = "The foreword just says \"Hope you like dragoons.\"",
		THULECITE = "I wonder where this is from?",
		ARMORRUINS = "It's oddly light.",
		ARMORSKELETON = "No bones about it.",
		SKELETONHAT = "It gives me terrible visions.",
		RUINS_BAT = "It has quite a heft to it.",
		RUINSHAT = "How's my hair?",
		NIGHTMARE_TIMEPIECE =
		{
            CALM = "All is well.",
            WARN = "Getting pretty magical around here.",
            WAXING = "It's becoming more concentrated!",
            STEADY = "It seems to be staying steady.",
            WANING = "Feels like it's receding.",
            DAWN = "The nightmare is almost gone!",
            NOMAGIC = "There's no magic around here.",
		},
		BISHOP_NIGHTMARE = "It's falling apart!",
		ROOK_NIGHTMARE = "Terrifying!",
		KNIGHT_NIGHTMARE = "It's a knightmare!",
		MINOTAUR = "That thing doesn't look happy.",
		SPIDER_DROPPER = "Note to self: Don't look up.",
		NIGHTMARELIGHT = "I wonder what function this served.",
		NIGHTSTICK = "It's electric!",
		GREENGEM = "It's green and gemmy.",
		MULTITOOL_AXE_PICKAXE = "It's brilliant!",
		ORANGESTAFF = "This beats walking.",
		YELLOWAMULET = "Warm to the touch.",
		GREENAMULET = "No base should be without one!",
		SLURPERPELT = "Doesn't look all that much different dead.",	

		SLURPER = "It's so hairy!",
		SLURPER_PELT = "Doesn't look all that much different dead.",
		ARMORSLURPER = "A soggy, sustaining, succulent suit.",
		ORANGEAMULET = "Teleportation can be so useful.",
		YELLOWSTAFF = "A genius invention... a gem on a stick.",
		YELLOWGEM = "This gem is yellow.",
		ORANGEGEM = "It's an orange gem.",
        OPALSTAFF = "Cool looking magicy-thing!",
        OPALPRECIOUSGEM = "This gem seems special.",
        TELEBASE = 
		{
			VALID = "It's ready to go.",
			GEMS = "It needs more purple gems.",
		},
		GEMSOCKET = 
		{
			VALID = "Looks ready.",
			GEMS = "It needs a gem.",
		},
		STAFFLIGHT = "That seems really dangerous.",
        STAFFCOLDLIGHT = "Brr! Chilling.",

        ANCIENT_ALTAR = "An ancient and mysterious structure.",

        ANCIENT_ALTAR_BROKEN = "This seems to be broken.",

        ANCIENT_STATUE = "It seems to throb out of tune with the world.",

        LICHEN = "Only a cyanobacteria could grow in this light.",
		CUTLICHEN = "Nutritious, but it won't last long.",

		CAVE_BANANA = "It's mushy.",
		CAVE_BANANA_COOKED = "Yum!",
		CAVE_BANANA_TREE = "It's dubiously photosynthetical.",
		ROCKY = "It has terrifying claws.",
		
		COMPASS =
		{
			GENERIC="Which way am I facing?",
			N = "North.",
			S = "South.",
			E = "East.",
			W = "West.",
			NE = "Northeast.",
			SE = "Southeast.",
			NW = "Northwest.",
			SW = "Southwest.",
		},

        HOUNDSTOOTH = "It's sharp!",
        ARMORSNURTLESHELL = "It sticks to your back when you wear it.",
        BAT = "Eek! Run!",
        BATBAT = "I bet I could fly if I held two of them.",
        BATWING = "Those things are scary, when they're alive.",
        BATWING_COOKED = "At least it's not coming back.",
        BATCAVE = "I don't want to wake them.",
        BEDROLL_FURRY = "It's so warm and comfy.",
        BUNNYMAN = "It's so big and fluffy!",
        FLOWER_CAVE = "It looks pretty when it's glowing.",
        GUANO = "Ewww!",
        LANTERN = "A more civilized light.",
        LIGHTBULB = "It's strangely tasty looking.",
        MANRABBIT_TAIL = "I feel a lil better when I hold one.",
        MUSHROOMHAT = "Makes the wearer look like a fun guy.",
        MUSHROOM_LIGHT2 =
        {
            ON = "Blue, like my ice hat!",
            OFF = "That could be super cool for a light.",
            BURNT = "I didn't mildew it, I swear.",
        },
        MUSHROOM_LIGHT =
        {
            ON = "Is that a mushroom made into a lamp?",
            OFF = "Weird looking mushroomy thing.",
            BURNT = "Awhh.",
        },
        SLEEPBOMB = "It makes snooze circles when I throw it.",
        MUSHROOMBOMB = "A mushroom cloud in the making!",
        SHROOM_SKIN = "Warts and all!",
        TOADSTOOL_CAP =
        {
            EMPTY = "Just a hole in the ground.",
            INGROUND = "There's something poking out.",
            GENERIC = "That toadstool's just asking to be cut down.",
        },
        TOADSTOOL =
        {
            GENERIC = "Yeesh! I'm not kissing that!",
            RAGE = "He's hopping mad now!",
        },
        MUSHROOMSPROUT =
        {
            GENERIC = "Cute!",
            BURNT = "How im-morel!",
        },
        MUSHTREE_TALL =
        {
            GENERIC = "That mushroom got too big for its own good.",
            BLOOM = "You can't tell from far away, but it's quite smelly.",
        },
        MUSHTREE_MEDIUM =
        {
            GENERIC = "These used to grow in my bathroom.",
            BLOOM = "I'm mildly offended by this.",
        },
        MUSHTREE_SMALL =
        {
            GENERIC = "A magic mushroom?",
            BLOOM = "It's trying to reproduce.",
        },
        MUSHTREE_TALL_WEBBED = "The spiders thought this one was important.",
        SPORE_TALL =
        {
            GENERIC = "It's just drifting around.",
            HELD = "I'll keep a little light in my pocket.",
        },
        SPORE_MEDIUM =
        {
            GENERIC = "Hasn't a care in the world.",
            HELD = "I'll keep a little light in my pocket.",
        },
        SPORE_SMALL =
        {
            GENERIC = "That's a sight for spore eyes.",
            HELD = "I'll keep a little light in my pocket.",
        },
        RABBITHOUSE =
        {
            GENERIC = "That's not a real carrot.",
            BURNT = "That's not a real roasted carrot.",
        },
        SLURTLE = "Ew. Just ew.",
        SLURTLE_SHELLPIECES = "A puzzle with no solution.",
        SLURTLEHAT = "That would mess up my hair.",
        SLURTLEHOLE = "A den of \"ew\".",
        SLURTLESLIME = "If it wasn't useful, I wouldn't touch it.",
        SNURTLE = "He's less gross, but still gross.",
        SPIDER_HIDER = "Gah! More spiders!",
        SPIDER_SPITTER = "Those things are scary!",
        SPIDERHOLE = "It's encrusted with old webbing.",
        SPIDERHOLE_ROCK = "It's encrusted with old webbing.",
        STALAGMITE = "Looks like a rock to me.",
        STALAGMITE_TALL = "Rocks, rocks, rocks, rocks...",
        TREASURECHEST_TRAP = "How convenient!",

        TURF_CARPETFLOOR = "It's surprisingly scratchy.",
        TURF_CHECKERFLOOR = "These are pretty snazzy.",
        TURF_DIRT = "A chunk of ground.",
        TURF_FOREST = "A chunk of ground.",
        TURF_GRASS = "A chunk of ground.",
        TURF_MARSH = "A chunk of ground.",
        TURF_ROAD = "Hastily cobbled stones.",
        TURF_ROCKY = "A chunk of ground.",
        TURF_SAVANNA = "A chunk of ground.",
        TURF_WOODFLOOR = "These are floorboards.",

		TURF_CAVE="Yet another ground type.",
		TURF_FUNGUS="Yet another ground type.",
		TURF_SINKHOLE="Yet another ground type.",
		TURF_UNDERROCK="Yet another ground type.",
		TURF_MUD="Yet another ground type.",

		TURF_DECIDUOUS = "Yet another ground type.",
		TURF_SANDY = "Yet another ground type.",
		TURF_BADLANDS = "Yet another ground type.",
		TURF_DESERTDIRT = "A chunk of ground.",
		TURF_FUNGUS_GREEN = "A chunk of ground.",
		TURF_FUNGUS_RED = "A chunk of ground.",
		TURF_DRAGONFLY = "Do you want proof that it's fireproof?",

		POWCAKE = "Eek! Disgusting!",
        CAVE_ENTRANCE = "I wonder if that rock could be moved.",
        CAVE_ENTRANCE_RUINS = "It's probably hiding something.",
       
       	CAVE_ENTRANCE_OPEN = 
        {
            GENERIC = "The earth itself rejects me!",
            OPEN = "I bet there's all sorts of things to discover down there.",
            FULL = "I'll have to wait until someone leaves to enter.",
        },
        CAVE_EXIT = 
        {
            GENERIC = "I'll just stay down here, I suppose.",
            OPEN = "I've had enough discovery for now.",
            FULL = "The surface is too crowded!",
        },

		MAXWELLPHONOGRAPH = "So that's where the music was coming from.",
		BOOMERANG = "Aerodynamical!",
		PIGGUARD = "He doesn't look as friendly as the others.",
		ABIGAIL = "Awww, she has a cute little bow.",
		ADVENTURE_PORTAL = "I'm not sure I want to fall for that a second time.",
		AMULET = "I feel so safe when I get to wear it.",
		ANIMAL_TRACK = "Tracks left by food. I mean... an animal.",
		ARMORGRASS = "Hopefully there aren't any bugs in it.",
		ARMORMARBLE = "That looks really heavy.",
		ARMORWOOD = "That is a perfectly reasonable piece of clothing.",
		ARMOR_SANITY = "Wearing that makes me feel safe and insecure.",
		ASH =
		{
			GENERIC = "All that's left after the fire has done its job.",
			REMAINS_GLOMMERFLOWER = "Oh no! Not the weird flying thing's flower!",
			REMAINS_EYE_BONE = "Oh no! Not the chest thing's eye!",
			REMAINS_THINGIE = "What is that thingie?",
		},
		AXE = "A trusty axe.",
		BABYBEEFALO = 
		{
			GENERIC = "Awwww. So cute!",
		    SLEEPING = "Sweet dreams, smelly.",
        },
        BUNDLE = "Our supplies are in there!",
        BUNDLEWRAP = "Wrapping things up should make them easier to carry.",
		BACKPACK = "I could use it for my badges and stuff!",
		BACONEGGS = "Bacon and Eggs, seems like a good combo.",
		BANDAGE = "Seems sterile enough.",
		BASALT = "That's too strong to break through!",
		BEARDHAIR = "It's gross.",
		BEARGER = "What a bear of a badger.",
		BEARGERVEST = "Welcome to the hibernation station!",
		ICEPACK = "The fur keeps the temperature inside stable.",
		BEARGER_FUR = "A mat of thick fur.",
		BEDROLL_STRAW = "Looks comfy, but it smells like mildew.",
		BEEQUEEN = "Keep that stinger away from me!",
		BEEQUEENHIVE = 
		{
			GENERIC = "It's too sticky to walk on.",
			GROWING = "Was that there before?",
		},
        BEEQUEENHIVEGROWN = "That's pretty big.",
        BEEGUARD = "It's guarding the queen.",
        HIVEHAT = "The world seems less a little crazy when I wear it.",
        MINISIGN =
        {
            GENERIC = "I could draw better than that!",
            UNDRAWN = "We should draw something on there.",
        },
        MINISIGN_ITEM = "It's not much use like this. We should place it.",
		BEE =
		{
			GENERIC = "To bee or not to bee.",
			HELD = "Careful!",
		},
		BEEBOX =
		{
			READY = "It's full of honey.",
			FULLHONEY = "It's full of honey.",
			GENERIC = "Bees!",
			NOHONEY = "It's empty.",
			SOMEHONEY = "Need to wait a bit.",
			BURNT = "How did it get burned?!!",
		},
		MUSHROOM_FARM =
		{
			STUFFED = "That's a lot of mushrooms!",
			LOTS = "The mushrooms have really taken to the log.",
			SOME = "It should keep growing now.",
			EMPTY = "It could use a spore. Or a mushroom transplant.",
			ROTTEN = "The log is dead. We should replace it with a live one.",
			BURNT = "No more mushrooms to bounce on I guess.",
			SNOWCOVERED = "I don't think it can grow in this cold.",
		},
		BEEFALO =
		{
			FOLLOWER = "He's coming along peacefully.",
			GENERIC = "It's a beefalo!",
			NAKED = "Aww, he's so sad.",
			SLEEPING = "These guys are really heavy sleepers.",
            --Domesticated states:
            DOMESTICATED = "This one is slightly less smelly than the others.",
            ORNERY = "It looks deeply angry.",
            RIDER = "This fellow appears quite ridable.",
            PUDGY = "Hmmm, there may be too much food inside it.",
		},

		BEEFALOHAT = "That's a case of hat-hair waiting to happen.",
		BEEFALOWOOL = "It smells like beefalo tears.",
		BEEHAT = "Protects your skin, but squashes your meticulous coiffure.",
        BEESWAX = "None of my what?",
		BEEHIVE = "It's buzzing with activity.",
		BEEMINE = "It buzzes when shaken.",
		BEEMINE_MAXWELL = "Bottled mosquito rage!",
		BERRIES = "Red berries taste the best.",
		BERRIES_COOKED = "I don't think heat improved them.",
        BERRIES_JUICY = "Extra tasty, though they won't last long.",
        BERRIES_JUICY_COOKED = "Better eat them before they spoil!",
		BERRYBUSH =
		{
			BARREN = "I think it needs to be fertilized.",
			WITHERED = "Nothing will grow in this heat.",
			GENERIC = "I think those are the edible kind.",
			PICKED = "Maybe they'll grow back?",
			DISEASED = "It looks pretty sick.",
			DISEASING = "Err, something's not right.",
			BURNING = "It's very much on fire.",
		},
		BERRYBUSH_JUICY =
		{
			BARREN = "It won't make any berries in this state.",
			WITHERED = "The heat even dehydrated the juicy berries!",
			GENERIC = "I should leave them there until it's time to eat.",
			PICKED = "The bush is working hard on the next batch.",
			DISEASED = "It looks pretty sick.",
			DISEASING = "Err, something's not right.",
			BURNING = "It's very much on fire.",
		},
		BIGFOOT = "That is one biiig foot.",
		BIRDCAGE =
		{
			GENERIC = "Now it just needs a bird.",
			OCCUPIED = "Who's a good bird?",
			SLEEPING = "Awwww, he's asleep.",
			HUNGRY = "He's looking a bit peckish.",
			STARVING = "Has no one fed you in awhile?",
			DEAD = "Maybe he's just resting?",
			SKELETON = "That bird is definitely deceased.",
		},
		BIRDTRAP = "Gives me a net advantage!",
		CAVE_BANANA_BURNT = "Not my fault!",
		BIRD_EGG = "A small, normal egg.",
		BIRD_EGG_COOKED = "Sunny side yum!",
		BISHOP = "Back off, preacherman!",
		BLOWDART_FIRE = "This seems fundamentally unsafe.",
		BLOWDART_SLEEP = "Just don't breathe in.",
		BLOWDART_PIPE = "Good practice for my birthday cake!",
		BLOWDART_YELLOW = "It has shocking accuracy.",
		BLUEAMULET = "Cool as ice!",
		BLUEGEM = "It sparkles with cold energy.",
		BLUEPRINT = 
		{ 
            COMMON = "Looks cool!",
            RARE = "Super cool!",
        },
        SKETCH = "A picture of a sculpture. We'll need somewhere to make it.",
		--BELL_BLUEPRINT = "There's HAT afoot!",
		BLUE_CAP = "It's weird and gooey.",
		BLUE_CAP_COOKED = "It's different now...",
		BLUE_MUSHROOM =
		{
			GENERIC = "It's a mushroom.",
			INGROUND = "It's sleeping.",
			PICKED = "I wonder if it will come back?",
		},
		BOARDS = "Boards.",
		BONESHARD = "Bits of bone.",
		BONESTEW = "A stew to put some meat on your bones.",
		BUGNET = "For catching bugs.",
		BUSHHAT = "It's kind of scratchy.",
		BUTTER = "I can't believe it's butter!",
		BUTTERFLY =
		{
			GENERIC = "Butterfly, flutter by.",
			HELD = "Now I have you!",
		},
		BUTTERFLYMUFFIN = "We threw the recipe away and just kind of winged it.",
		BUTTERFLYWINGS = "Without these, it's just a butter.",
		BUZZARD = "What a bizarre buzzard!",

		SHADOWDIGGER = "Oh good. Now there's more of him.",

		CACTUS = 
		{
			GENERIC = "Sharp but delicious.",
			PICKED = "Deflated, but still spiny.",
		},
		CACTUS_MEAT_COOKED = "Grilled fruit of the desert.",
		CACTUS_MEAT = "There are still some spines between me and a tasty meal.",
		CACTUS_FLOWER = "A pretty flower from a prickly plant.",

		COLDFIRE =
		{
			EMBERS = "That fire needs more fuel or it's going to go out.",
			GENERIC = "Sure beats darkness.",
			HIGH = "That fire is getting out of hand!",
			LOW = "The fire's getting a bit low.",
			NORMAL = "Nice and comfy.",
			OUT = "Well, that's over.",
		},
		CAMPFIRE =
		{
			EMBERS = "That fire needs more fuel or it's going to go out.",
			GENERIC = "Sure beats darkness.",
			HIGH = "That fire is getting out of hand!",
			LOW = "The fire's getting a bit low.",
			NORMAL = "Nice and comfy.",
			OUT = "Well, that's over.",
		},
		CANE = "Technically walking is just controlled falling.",
		CATCOON = "KITTY!",
		CATCOONDEN = 
		{
			GENERIC = "I bet a cute ktity lives there!",
			EMPTY = "I hope the kitty is okay.",
		},
		CATCOONHAT = "KITTY!",
		COONTAIL = "I think it's still swishing.",
		CARROT = "I'll eat it, I guess.",
		CARROT_COOKED = "Tastes a little better when it's cooked.",
		CARROT_PLANTED = "The earth is making plantbabies.",
		CARROT_SEEDS = "It's a carrot seed.",
		CARTOGRAPHYDESK =
		{
			GENERIC = "Now I can show everyone what I found!",
			BURNING = "So much for that.",
			BURNT = "Nothing but ash now.",
		},
		WATERMELON_SEEDS = "It's a melon seed.",
		CAVE_FERN = "It's a fern.",
		CHARCOAL = "It's small, dark, and smells like burnt wood.",
        CHESSPIECE_PAWN = "I can relate.",
        CHESSPIECE_ROOK =
        {
            GENERIC = "It's even heavier than it looks.",
            STRUGGLE = "The chess pieces are moving themselves!",
        },
        CHESSPIECE_KNIGHT =
        {
            GENERIC = "It's a horse, of course.",
            STRUGGLE = "The chess pieces are moving themselves!",
        },
        CHESSPIECE_BISHOP =
        {
            GENERIC = "It's a stone bishop.",
            STRUGGLE = "The chess pieces are moving themselves!",
        },
        CHESSPIECE_MUSE = "Hmm... Looks familiar.",
        CHESSPIECE_FORMAL = "Doesn't seem very \"kingly\" to me.",
        CHESSPIECE_HORNUCOPIA = "Makes my stomach rumble just looking at it.",
        CHESSPIECE_PIPE = "That was never really my thing.",
        CHESSPIECE_DEERCLOPS = "It feels like its eye follows you.",
        CHESSPIECE_BEARGER = "It was a lot bigger up close.",
        CHESSPIECE_MOOSEGOOSE = "Eurgh. It's so lifelike.",
        CHESSPIECE_DRAGONFLY = "Ah, that brings back memories. Bad ones.",
        CHESSJUNK1 = "A pile of broken chess pieces.",
        CHESSJUNK2 = "Another pile of broken chess pieces.",
        CHESSJUNK3 = "Even more broken chess pieces.",
		CHESTER = "Otto von Chesterfield, Esq.",
		CHESTER_EYEBONE =
		{
			GENERIC = "It's looking at me.",
			WAITING = "It went to sleep.",
		},
		COOKEDMANDRAKE = "Poor little guy.",
		COOKEDMEAT = "Bet it's tasty.",
		COOKEDMONSTERMEAT = "That's only somewhat more appetizing than when it was raw.",
		COOKEDSMALLMEAT = "Now there's no reason to worry about getting worms!",
		COOKPOT =
		{
			COOKING_LONG = "I'm just like Cooking Cat!",
			COOKING_SHORT = "It's almost done!",
			DONE = "The food has been punished because it was bad.",
			EMPTY = "It makes me hungry just to look at it.",
			BURNT = "Did the food fight back?",
		},
		CORN = "High in fructose!",
		CORN_COOKED = "Cooked and high in fructose!",
		CORN_SEEDS = "It's a corn seed.",
        CANARY =
		{
			GENERIC = "Pretty yellow bird!",
			HELD = "I hope you're okay birdy.",
		},
        CANARY_POISONED = "It's probably fine.",

		CRITTERLAB = "Is there something in there?",
        CRITTER_GLOMLING = "What an aerodynamical creature!",
        CRITTER_DRAGONLING = "It's wyrmed its way into my heart.",
		CRITTER_LAMB = "Much less mucusy than its momma.",
        CRITTER_PUPPY = "Pretty cute for a lil monster!",
        CRITTER_KITTEN = "You'd make a good lab assistant.",
        CRITTER_PERDLING = "My feathered friend.",

		CROW =
		{
			GENERIC = "Creepy!",
			HELD = "He's not very happy in there.",
		},
		CUTGRASS = "Cut grass, ready for arts and crafts.",
		CUTREEDS = "Cut reeds, ready for crafting and hobbying.",
		CUTSTONE = "Seductively smooth.",
		DEADLYFEAST = "A most potent dish.",
		DEER =
		{
			GENERIC = "Is it staring at me? ...No, I guess not.",
			ANTLER = "What an impressive antler!",
		},
        DEER_ANTLER = "Was that supposed to come off?",
        DEER_GEMMED = "It's being controlled by that beast!",
		DEERCLOPS = "It's enormous!!",
		DEERCLOPS_EYEBALL = "This is really gross.",
		EYEBRELLAHAT =	"It watches over the wearer.",
		DEPLETED_GRASS =
		{
			GENERIC = "It's probably a tuft of grass.",
		},
        GOGGLESHAT = "What a stylish pair of goggles.",
        DESERTHAT = "Quality eye protection.",
		DEVTOOL = "It smells of bacon!",
		DEVTOOL_NODEV = "I'm not strong enough to wield it.",
		DIRTPILE = "It's a pile of dirt... or IS it?",
		DIVININGROD =
		{
			COLD = "The signal is very faint.",
			GENERIC = "It's some kind of homing device.",
			HOT = "This thing's going crazy!",
			WARM = "I'm headed in the right direction.",
			WARMER = "Must be getting pretty close.",
		},
		DIVININGRODBASE =
		{
			GENERIC = "I wonder what it does.",
			READY = "It looks like it needs a large key.",
			UNLOCKED = "Now the machine can work!",
		},
		DIVININGRODSTART = "That rod looks useful!",
		DRAGONFLY = "That's one fly dragon!",
		ARMORDRAGONFLY = "Hot mail!",
		DRAGON_SCALES = "They're still warm.",
		DRAGONFLYCHEST = "Next best thing to a lockbox!",
		DRAGONFLYFURNACE = 
		{
			HAMMERED = "I don't think it's supposed to look like that.",
			GENERIC = "Produces a lot of heat, but not much light.", --no gems
			NORMAL = "Is it winking at me?", --one gem
			HIGH = "It's scalding!", --two gems
		},
        
        HUTCH = "Hutch Danglefish, P.I.",
        HUTCH_FISHBOWL =
        {
            GENERIC = "I always wanted one of these.",
            WAITING = "Hope it comes back.",
        },
		LAVASPIT = 
		{
			HOT = "Hot spit!",
			COOL = "I like to call it \"Basaliva\".",
		},
		LAVA_POND = "Magmificent!",
		LAVAE = "Too hot to handle.",
		LAVAE_COCOON = "Cooled off and chilled out.",
		LAVAE_PET = 
		{
			STARVING = "Poor thing must be starving.",
			HUNGRY = "I hear a tiny stomach grumbling.",
			CONTENT = "It seems happy.",
			GENERIC = "Aww. Who's a good monster?",
		},
		LAVAE_EGG = 
		{
			GENERIC = "There's a faint warmth coming from inside.",
		},
		LAVAE_EGG_CRACKED =
		{
			COLD = "I don't think that egg is warm enough.",
			COMFY = "I never thought I would see a happy egg.",
		},
		LAVAE_TOOTH = "It's an egg tooth!",

		DRAGONFRUIT = "What a weird fruit.",
		DRAGONFRUIT_COOKED = "The fruit's still weird.",
		DRAGONFRUIT_SEEDS = "It's a weird fruit seed.",
		DRAGONPIE = "The dragonfruit is very filling.",
		DRUMSTICK = "Ready for gobbling.",
		DRUMSTICK_COOKED = "Even better for gobbling!",
		DUG_BERRYBUSH = "Now it can be taken anywhere.",
		DUG_BERRYBUSH_JUICY = "This could be replanted closer to home.",
		DUG_GRASS = "It can be planted anywhere now.",
		DUG_MARSH_BUSH = "This needs to be planted.",
		DUG_SAPLING = "This needs to be planted.",
		DURIAN = "Oh, it smells!",
		DURIAN_COOKED = "Now it smells even worse!",
		DURIAN_SEEDS = "It's a durian seed.",
		EARMUFFSHAT = "Makes you warm and fuzzy inside. Outside, too.",
		EGGPLANT = "It doesn't look like an egg.",
		EGGPLANT_COOKED = "It's even less eggy.",
		EGGPLANT_SEEDS = "It's an eggplant seed.",
		
		ENDTABLE = 
		{
			BURNT = "A burnt vase on a burnt table.",
			GENERIC = "A flower in a vase on a table.",
			EMPTY = "I should put something in there.",
			WILTED = "Not looking too fresh.",
			FRESHLIGHT = "It's nice to have a little light.",
			OLDLIGHT = "Did we remember to pick up new bulbs?", -- will be wilted soon, light radius will be very small at this point
		},
		DECIDUOUSTREE = 
		{
			BURNING = "What a waste of wood.",
			BURNT = "I feel like I could have prevented that.",
			CHOPPED = "Take that, nature!",
			POISON = "It looks unhappy about me stealing those birchnuts!",
			GENERIC = "It's all leafy. Most of the time.",
		},
		ACORN = "There's definitely something inside there.",
        ACORN_SAPLING = "It'll be a tree soon!",
		ACORN_COOKED = "Roasted to perfection.",
		BIRCHNUTDRAKE = "A mad little nut.",
		EVERGREEN =
		{
			BURNING = "What a waste of wood.",
			BURNT = "I feel like I could have prevented that.",
			CHOPPED = "Take that, nature!",
			GENERIC = "It's all piney.",
		},
		EVERGREEN_SPARSE =
		{
			BURNING = "What a waste of wood.",
			BURNT = "I feel like I could have prevented that.",
			CHOPPED = "Take that, nature!",
			GENERIC = "This sad tree has no cones.",
		},
		TWIGGYTREE = 
		{
			BURNING = "What a waste of wood.",
			BURNT = "I feel like I could have prevented that.",
			CHOPPED = "Take that, nature!",
			GENERIC = "It's all stick-y.",			
			DISEASED = "It looks sick. More so than usual.",
		},
		TWIGGY_NUT_SAPLING = "It doesn't need any help to grow.",
        TWIGGY_OLD = "That tree looks pretty wimpy.",
		TWIGGY_NUT = "There's a stick-y tree inside it that wants to get out.",
		EYEPLANT = "I think I'm being watched.",
		INSPECTSELF = "Am I still in one piece?",
		FARMPLOT =
		{
			GENERIC = "I should try planting some crops.",
			GROWING = "Go plants go!",
			NEEDSFERTILIZER = "I think it needs to be fertilized.",
			BURNT = "I don't think anything will grow in a pile of ash.",
		},
		FEATHERHAT = "BECOME THE OWL!",
		FEATHER_CROW = "A crow feather.",
		FEATHER_ROBIN = "A redbird feather.",
		FEATHER_ROBIN_WINTER = "A snowbird feather.",
		FEATHER_CANARY = "A canary feather.",
		FEATHERPENCIL = "How I sign contracts.",
		FEM_PUPPET = "She's trapped!",
		FIREFLIES =
		{
			GENERIC = "If only I could catch them!",
			HELD = "They make my pocket glow!",
		},
		FIREHOUND = "That one is glowy.",
		FIREPIT =
		{
			EMBERS = "I should put something on the fire before it goes out.",
			GENERIC = "Sure beats darkness.",
			HIGH = "Good thing it's contained!",
			LOW = "The fire's getting a bit low.",
			NORMAL = "Nice and comfy.",
			OUT = "At least I can start it up again.",
		},
		COLDFIREPIT =
		{
			EMBERS = "I should put something on the fire before it goes out.",
			GENERIC = "Sure beats darkness.",
			HIGH = "Good thing it's contained!",
			LOW = "The fire's getting a bit low.",
			NORMAL = "Nice and comfy.",
			OUT = "At least I can start it up again.",
		},
		FIRESTAFF = "I don't want to set the world on fire.",
		FIRESUPPRESSOR = 
		{	
			ON = "Fling on!",
			OFF = "All quiet on the flinging front.",
			LOWFUEL = "The fuel tank is getting a bit low.",
		},

		FISH = "Now I shall eat for a day.",
		FISHINGROD = "Hook, line and stick!",
		FISHSTICKS = "Sticks to your ribs.",
		FISHTACOS = "Crunchy and delicious!",
		FISH_COOKED = "Grilled to perfection.",
		FLINT = "It's a very sharp rock.",
		FLOWER = 
		{
            GENERIC = "It's pretty, but it smells like a common laborer.",
            ROSE = "To match my rosy cheeks.",
        },
        FLOWER_WITHERED = "I don't think it got enough sun.",
		FLOWERHAT = "It smells like prettiness.",
		FLOWER_EVIL = "Augh! It's so evil!",
		FOLIAGE = "Some leafy greens.",
		FOOTBALLHAT = "I don't like sports.",
        FOSSIL_PIECE = "Dino bones! Cool!",
        FOSSIL_STALKER =
        {
			GENERIC = "Still missing some pieces.",
			FUNNY = "What? How!",
			COMPLETE = "A whole dinosaur! Almost.",
        },
        STALKER = "The skeleton fused with the shadows!",
        STALKER_ATRIUM = "Why'd it have to be so big?",
        STALKER_MINION = "Anklebiters!",
        THURIBLE = "It smells like chemicals.",
        ATRIUM_OVERGROWTH = "I don't recognize any of these symbols.",
		FROG =
		{
			DEAD = "He's croaked.",
			GENERIC = "He's so cute!",
			SLEEPING = "Aww, look at him sleep!",
		},
		FROGGLEBUNWICH = "A very leggy sandwich.",
		FROGLEGS = "I've heard it's a delicacy.",
		FROGLEGS_COOKED = "Tastes like chicken.",
		FRUITMEDLEY = "Fruity.",
		FURTUFT = "Black and white fur.", 
		GEARS = "I want to eat these... for breakfast.",
		GHOST = "I've seen scarier things.",
		GOLDENAXE = "That's one fancy axe.",
		GOLDENPICKAXE = "Hey, isn't gold really soft?",
		GOLDENPITCHFORK = "Why did I even make a pitchfork this fancy?",
		GOLDENSHOVEL = "I can't wait to dig holes.",
		GOLDNUGGET = "I can't eat it, but it sure is shiny.",
		GRASS =
		{
			BARREN = "It needs poop.",
			WITHERED = "It's not going to grow back while it's so hot.",
			BURNING = "That's burning fast!",
			GENERIC = "It's a tuft of grass.",
			PICKED = "It was cut down in the prime of its life.",
			DISEASED = "It looks pretty sick.",
			DISEASING = "Err, something's not right.",
		},
		GRASSGEKKO = 
		{
			GENERIC = "It's an extra leafy lizard.",	
			DISEASED = "It looks really sick.",
		},
		GREEN_CAP = "It seems pretty normal.",
		GREEN_CAP_COOKED = "It's different now...",
		GREEN_MUSHROOM =
		{
			GENERIC = "It's a mushroom.",
			INGROUND = "It's sleeping.",
			PICKED = "I wonder if it will come back?",
		},
		GUNPOWDER = "It looks like pepper.",
		HAMBAT = "This seems unsanitary.",
		HAMMER = "Stop! It's time! To hammer things!",
		HEALINGSALVE = "The stinging means that it's working.",
		HEATROCK =
		{
			FROZEN = "It's colder than ice.",
			COLD = "That's a cold stone.",
			GENERIC = "I could manipulate its temperature.",
			WARM = "It's quite warm and cuddly... for a rock!",
			HOT = "Nice and toasty hot!",
		},
		HOME = "Someone must live here.",
		HOMESIGN =
		{
			GENERIC = "It says \"You are here\".",
            UNWRITTEN = "The sign is currently blank.",
			BURNT = "\"Don't play with matches.\"",
		},
		ARROWSIGN_POST =
		{
			GENERIC = "It says \"Thataway\".",
            UNWRITTEN = "The sign is currently blank.",
			BURNT = "\"Don't play with matches.\"",
		},
		ARROWSIGN_PANEL =
		{
			GENERIC = "It says \"Thataway\".",
            UNWRITTEN = "The sign is currently blank.",
			BURNT = "\"Don't play with matches.\"",
		},
		HONEY = "Looks delicious!",
		HONEYCOMB = "Bees used to live in this.",
		HONEYHAM = "Sweet and savory.",
		HONEYNUGGETS = "Tastes like chicken, but I don't think it is.",
		HORN = "It sounds like a beefalo field in there.",
		HOUND = "You ain't nothing, hound dog!",
		HOUNDBONE = "Creepy.",
		HOUNDMOUND = "I've got no bones to pick with the owner. Really.",
		ICEBOX = "I have harnessed the power of cold!",
		ICEHAT = "Stay cool, boy.",
		ICEHOUND = "Are there hounds for every season?",
		INSANITYROCK =
		{
			ACTIVE = "TAKE THAT, SANE SELF!",
			INACTIVE = "It's more of a pyramid than an obelisk.",
		},
		JAMMYPRESERVES = "Probably should have made a jar.",

		KABOBS = "Lunch on a stick.",
		KILLERBEE =
		{
			GENERIC = "Oh no! It's a killer bee!",
			HELD = "This seems dangerous.",
		},
		KNIGHT = "Check it out!",
		KOALEFANT_SUMMER = "Adorably delicious.",
		KOALEFANT_WINTER = "It looks warm and full of meat.",
		KRAMPUS = "He's going after my stuff!",
		KRAMPUS_SACK = "Ew. It has Krampus slime all over it.",
		LEIF = "He's huge!",
		LEIF_SPARSE = "He's huge!",
		LIGHTER  = "It's her lucky lighter.",
		LIGHTNING_ROD =
		{
			CHARGED = "The power is mine!",
			GENERIC = "To harness the heavens!",
		},
		LIGHTNINGGOAT = 
		{
			GENERIC = "\"Baaaah\" yourself!",
			CHARGED = "I don't think it liked being struck by lightning.",
		},
		LIGHTNINGGOATHORN = "It's like a miniature lightning rod.",
		GOATMILK = "It's buzzing with tastiness!",
		LITTLE_WALRUS = "He won't be cute and cuddly forever.",
		LIVINGLOG = "It looks worried.",
		LOG =
		{
			BURNING = "That's some hot wood!",
			GENERIC = "It's big, it's heavy, and it's wood.",
		},
		LUCY = "That's a prettier axe than I'm used to.",
		LUREPLANT = "It's so alluring.",
		LUREPLANTBULB = "Now I can start my very own meat farm.",
		MALE_PUPPET = "He's trapped!",

		MANDRAKE_ACTIVE = "Cut it out!",
		MANDRAKE_PLANTED = "I've heard strange things about those plants.",
		MANDRAKE = "Mandrake roots have strange properties.",

        MANDRAKESOUP = "Well, he won't be waking up again.",
        MANDRAKE_COOKED = "It doesn't seem so strange anymore.",
        MAPSCROLL = "A blank map. Doesn't seem very useful.",
        MARBLE = "Fancy!",
        MARBLEBEAN = "I traded the old family cow for it.",
        MARBLEBEAN_SAPLING = "It looks carved.",
        MARBLESHRUB = "Makes sense to me.",
        MARBLEPILLAR = "I think I could use that.",
        MARBLETREE = "I don't think an axe will cut it.",
        MARSH_BUSH =
        {
            BURNING = "That's burning fast!",
            GENERIC = "It looks thorny.",
            PICKED = "Ouch.",
        },
        BURNT_MARSH_BUSH = "It's all burnt up.",
        MARSH_PLANT = "It's a plant.",
        MARSH_TREE =
        {
            BURNING = "Spikes and fire!",
            BURNT = "Now it's burnt and spiky.",
            CHOPPED = "Not so spiky now!",
            GENERIC = "Those spikes look sharp!",
        },
        MAXWELL = "Weird looking guy.",
        MAXWELLHEAD = "I can see into his pores.",
        MAXWELLLIGHT = "I wonder how they work.",
        MAXWELLLOCK = "Looks almost like a key hole.",
        MAXWELLTHRONE = "That doesn't look very comfortable.",
        MEAT = "It's a bit gamey, but it'll do.",
        MEATBALLS = "It's just a big wad of meat.",
        MEATRACK =
        {
            DONE = "Jerky time!",
            DRYING = "Meat takes a while to dry.",
            DRYINGINRAIN = "Meat takes even longer to dry in rain.",
            GENERIC = "I should dry some meats.",
            BURNT = "The rack got dried.",
        },
        MEAT_DRIED = "Just jerky enough.",
        MERM = "Smells fishy!",
        MERMHEAD =
        {
            GENERIC = "The stinkiest thing I'll smell all day.",
            BURNT = "Burnt merm flesh somehow smells even worse.",
        },
        MERMHOUSE =
        {
            GENERIC = "Who would live here?",
            BURNT = "Nothing to live in, now.",
        },
        MINERHAT = "A hands-free way to brighten your day.",
        MONKEY = "Curious little guy.",
        MONKEYBARREL = "Did that just move?",
        MONSTERLASAGNA = "Eek! Disgusting!",
        FLOWERSALAD = "A bowl of foliage.",
        ICECREAM = "I scream for ice cream!",
        WATERMELONICLE = "Cryogenic watermelon.",
        TRAILMIX = "A healthy, natural snack.",
        HOTCHILI = "Five alarm!",
        GUACAMOLE = "Avogadro's favorite dish.",
        MONSTERMEAT = "Ugh. I don't think I should eat that.",
        MONSTERMEAT_DRIED = "Strange-smelling jerky.",
        MOOSE = "I don't exactly know what that thing is.",
        MOOSE_NESTING_GROUND = "It puts its babies there.",
        MOOSEEGG = "The babies are like excited electrons trying to escape.",
        MOSSLING = "Aaah! You are definitely not an electron!",
        FEATHERFAN = "Down, to bring the temperature down.",
        MINIFAN = "Somehow the breeze comes out the back twice as fast.",
        GOOSE_FEATHER = "Fluffy!",
        STAFF_TORNADO = "Spinning doom.",
        MOSQUITO =
        {
            GENERIC = "Disgusting little bloodsucker.",
            HELD = "Hey, is that my blood?",
        },
        MOSQUITOSACK = "It's probably someone else's blood...",
        MOUND =
        {
            DUG = "He probably deserved it.",
            GENERIC = "I bet there's all sorts of good stuff down there!",
        },
        NIGHTLIGHT = "It gives off a spooky light.",
        NIGHTMAREFUEL = "This stuff is creepy!",
        NIGHTSWORD = "Why would anyone make this? It's terrifying.",
        NITRE = "I'm not a geologist.",
        ONEMANBAND = "We should add a beefalo bell.",
        OASISLAKE = "Is that a mirage?",
        PANDORASCHEST = "It may contain something fantastic! Or horrible.",
        PANFLUTE = "To serenade the animals.",
        PAPYRUS = "Some sheets of paper.",
        WAXPAPER = "Some sheets of wax paper.",
        PENGUIN = "Must be breeding season.",
        PERD = "Stupid bird! Stay away from those berries!",
        PEROGIES = "These turned out pretty good.",
        PETALS = "Sure showed those flowers who's boss!",
        PETALS_EVIL = "I'm not sure I want to hold those.",
        PHLEGM = "It's thick and pliable. And salty.",
        PICKAXE = "Iconic, isn't it?",
        PIGGYBACK = "This little piggy's gone... \"home\".",
        PIGHEAD =
        {
            GENERIC = "Looks like an offering to the beast.",
            BURNT = "Crispy.",
        },
        PIGHOUSE =
        {
            FULL = "I can see a snout pressed up against the window.",
            GENERIC = "These pigs have pretty fancy houses.",
            LIGHTSOUT = "Come ON! I know you're home!",
            BURNT = "Not so fancy now, pig!",
        },
        PIGKING = "Ewwww, he smells!",
        PIGMAN =
        {
            DEAD = "Someone should tell its family.",
            FOLLOWER = "You're part of my entourage.",
            GENERIC = "They kind of creep me out.",
            GUARD = "Looks serious.",
            WEREPIG = "Not a friendly pig!!",
        },
        PIGSKIN = "It still has the tail on it.",
        PIGTENT = "Smells like bacon.",
        PIGTORCH = "Sure looks cozy.",
        PINECONE = "I can hear a tiny tree inside it, trying to get out.",
        PINECONE_SAPLING = "It'll be a tree soon!",
        LUMPY_SAPLING = "How did this tree even reproduce?",
        PITCHFORK = "Now I just need an angry mob to join.",
        PLANTMEAT = "That doesn't look very appealing.",
        PLANTMEAT_COOKED = "At least it's warm now.",
        PLANT_NORMAL =
        {
            GENERIC = "Leafy!",
            GROWING = "Guh! It's growing so slowly!",
            READY = "Mmmm. Ready to harvest.",
            WITHERED = "The heat killed it.",
        },
        POMEGRANATE = "It looks like the inside of an alien's brain.",
        POMEGRANATE_COOKED = "Haute Cuisine!",
        POMEGRANATE_SEEDS = "It's a pome-whatsit seed.",
        POND = "I can't see the bottom!",
        POOP = "I should fill my pockets!",
        --PORTABLECOOKPOT_ITEM = "Now we're cookin'!",
        FERTILIZER = "That is definitely a bucket full of poop.",
        PUMPKIN = "It's as big as my head!",
        PUMPKINCOOKIE = "I love these things",
        PUMPKIN_COOKED = "How did it not turn into a pie?",
        PUMPKIN_LANTERN = "Spooky!",
        PUMPKIN_SEEDS = "It's a pumpkin seed.",
        PURPLEAMULET = "It's whispering to me.",
        PURPLEGEM = "It contains the mysteries of the universe.",
        RABBIT =
        {
            GENERIC = "He's looking for carrots.",
            HELD = "I hope I'm not hurting you.",
        },
        RABBITHOLE =
        {
            GENERIC = "That must lead to the Kingdom of the Bunnymen.",
            SPRING = "The Kingdom of the Bunnymen is closed for the season.",
        },
        RAINOMETER =
        {
            GENERIC = "It measures cloudiness.",
            BURNT = "The measuring parts went up in a cloud of smoke.",
        },
        RAINCOAT = "My Raincoat fits me better.",
        RAINHAT = "How didn't I think of this before?",
        RATATOUILLE = "I'll eat it reluctantly.",
        RAZOR = "A sharpened rock tied to a stick. For hygiene!",
        REDGEM = "It sparkles with inner warmth.",
        RED_CAP = "It smells funny.",
        RED_CAP_COOKED = "It's different now...",
        RED_MUSHROOM =
        {
            GENERIC = "It's a mushroom.",
            INGROUND = "It's sleeping.",
            PICKED = "I wonder if it will come back?",
        },
        REEDS =
        {
            BURNING = "That's really burning!",
            GENERIC = "It's a clump of reeds.",
            PICKED = "All the useful reeds have already been picked.",
        },
        RELIC = "Ancient household goods.",
        RUINS_RUBBLE = "This can be fixed.",
        RUBBLE = "Just bits and pieces of rock.",
        --RUINSRELIC_PLATE = "I find the shards get in my food.",
        RESEARCHLAB =
        {
            GENERIC = "Cool sciency thing!",
            BURNT = "Burnt sciency stuff isn't as cool.",
        },
        RESEARCHLAB2 =
        {
            GENERIC = "Rounder and cooler sciency thing!",
            BURNT = "I hope we can make a new one!",
        },
        RESEARCHLAB3 =
        {
            GENERIC = "Bigger than my shadow.",
            BURNT = "How did that even burn?",
        },
        RESEARCHLAB4 =
        {
            GENERIC = "Good thing it's not my hat!",
            BURNT = "A perfectly good hat lost to the fire.",
        },
        RESURRECTIONSTATUE =
        {
            GENERIC = "The Queen was creepier",
            BURNT = "Still creepy.",
        },
        RESURRECTIONSTONE = "It's always a good idea to touch base.",
        ROBIN =
        {
            GENERIC = "Does that mean winter is gone?",
            HELD = "He likes my hat.",
        },
        ROBIN_WINTER =
        {
            GENERIC = "Life in the frozen wastes.",
            HELD = "It's so soft.",
        },
        ROBOT_PUPPET = "They're trapped!",
        ROCK_LIGHT =
        {
            GENERIC = "A crusted over lava pit.",
            OUT = "Looks fragile.",
            LOW = "The lava's crusting over.",
            NORMAL = "Nice and comfy.",
        },
        CAVEIN_BOULDER =
        {
            GENERIC = "I think I can lift this one.",
            RAISED = "It's out of reach.",
        },
        ROCK = "It wouldn't fit in my pocket.",
        PETRIFIED_TREE = "It looks scared stiff.",
        ROCK_PETRIFIED_TREE = "It looks scared stiff.",
        ROCK_PETRIFIED_TREE_OLD = "It looks scared stiff.",
        ROCK_ICE =
        {
            GENERIC = "Ice to meet you.",
            MELTED = "Won't be useful until it freezes again.",
        },
        ROCK_ICE_MELTED = "Won't be useful until it freezes again.",
        ICE = "Ice to meet you.",
        ROCKS = "We could make stuff with these.",
        ROOK = "Storm the castle!",
        ROPE = "Some short lengths of rope.",
        ROTTENEGG = "Eek! Disgusting!",
        ROYAL_JELLY = "Looks tasty.",
        JELLYBEAN = "One part jelly, one part bean.",
        SADDLE_BASIC = "That'll allow the mounting of some smelly animal.",
        SADDLE_RACE = "This saddle really flies!",
        SADDLE_WAR = "The only problem is the saddle sores.",
        SADDLEHORN = "This could take a saddle off.",
        SALTLICK = "How many licks does it take to get to the center?",
        BRUSH = "I bet the beefalo really like this.",
		SANITYROCK =
		{
			ACTIVE = "That's a CRAZY looking rock!",
			INACTIVE = "Where did the rest of it go?",
		},
		SAPLING =
		{
			BURNING = "That's burning fast!",
			WITHERED = "It might be okay if it cooled down.",
			GENERIC = "Baby trees are so cute!",
			PICKED = "That'll teach him.",
			DISEASED = "It looks pretty sick.",
			DISEASING = "Err, something's not right.",
		},
   		SCARECROW = 
   		{
			GENERIC = "All dressed up and no where to crow.",
			BURNING = "Someone made that strawman eat crow.",
			BURNT = "Must have been the agenets.",
   		},
   		SCULPTINGTABLE=
   		{
			EMPTY = "We can make stone sculptures with this.",
			BLOCK = "Ready for sculpting.",
			SCULPTURE = "A masterpiece!",
			BURNT = "Burnt right down.",
   		},
        SCULPTURE_KNIGHTHEAD = "Where's the rest of it?",
		SCULPTURE_KNIGHTBODY = 
		{
			COVERED = "It's an odd marble statue.",
			UNCOVERED = "I guess he cracked under the pressure.",
			FINISHED = "At least it's back in one piece now.",
			READY = "Something's moving inside.",
		},
        SCULPTURE_BISHOPHEAD = "Is that a head?",
		SCULPTURE_BISHOPBODY = 
		{
			COVERED = "It looks old, but it feels new.",
			UNCOVERED = "There's a big piece missing.",
			FINISHED = "Now what?",
			READY = "Something's moving inside.",
		},
        SCULPTURE_ROOKNOSE = "Where did this come from?",
		SCULPTURE_ROOKBODY = 
		{
			COVERED = "It's some sort of marble statue.",
			UNCOVERED = "It's not in the best shape.",
			FINISHED = "All patched up.",
			READY = "Something's moving inside.",
		},
        GARGOYLE_HOUND = "I don't like how it's looking at me.",
        GARGOYLE_WEREPIG = "It looks very lifelike.",
		SEEDS = "Each one is a tiny mystery.",
		SEEDS_COOKED = "That cooked the life right out of 'em!",
		SEWING_KIT = "Darn it! Darn it all to heck!",
		SEWING_TAPE = "Good for mending.",
		SHOVEL = "There's a lot going on underground.",
		SILK = "It comes from a spider's butt.",
		SKELETON = "Better you than me.",
		SCORCHED_SKELETON = "Spooky.",
		SKULLCHEST = "I'm not sure if I want to open it.",
		SMALLBIRD =
		{
			GENERIC = "That's a rather small bird.",
			HUNGRY = "It looks hungry.",
			STARVING = "It must be starving.",
		},
		SMALLMEAT = "A tiny chunk of dead animal.",
		SMALLMEAT_DRIED = "A little jerky.",
		SPAT = "What a crusty looking animal.",
		SPEAR = "That's one pointy stick.",
		SPEAR_WATHGRITHR = "It feels very stabby.",
		WATHGRITHRHAT = "Pretty fancy hat, that.",
		SPIDER =
		{
			DEAD = "Ewwww!",
			GENERIC = "Hope they don't razor me.",
			SLEEPING = "I'd better not be here when he wakes up.",
		},
		SPIDERDEN = "Sticky!",
		SPIDEREGGSACK = "I hope these don't hatch. Period.",
		SPIDERGLAND = "It has a tangy, antiseptic smell.",
		SPIDERHAT = "I hope I got all of the spider goo out of it.",
		SPIDERQUEEN = "AHHHHHHHH! That spider is huge!",
		SPIDER_WARRIOR =
		{
			DEAD = "Good riddance!",
			GENERIC = "Looks even meaner than usual.",
			SLEEPING = "I should keep my distance.",
		},
		SPOILED_FOOD = "It's a furry ball of rotten food.",
        STAGEHAND =
        {
			AWAKE = "Just keep your hand to yourself, alright?",
			HIDING = "Something's odd here, but I can't put my finger on it.",
        },
        STATUE_MARBLE = 
        {
            GENERIC = "It's a fancy marble statue.",
            TYPE1 = "Don't lose your head now!",
            TYPE2 = "Statuesque.",
        },
		STATUEHARP = "What happened to the head?",
		STATUEMAXWELL = "He's a lot shorter in person.",
		STEELWOOL = "Scratchy metal fibers.",
		STINGER = "Looks sharp!",
		STRAWHAT = "Hats always ruin my hair.",
		STUFFEDEGGPLANT = "It's really stuffing!",
		--SUNKBOAT = "It's no use out there!",
		SWEATERVEST = "This vest is dapper as all get-out.",
		REFLECTIVEVEST = "Keep off, evil sun!",
		HAWAIIANSHIRT = "It's not lab-safe!",
		TAFFY = "If I had a dentist they'd be mad I ate stuff like that.",
		TALLBIRD = "That's a tall bird!",
		TALLBIRDEGG = "Will it hatch?",
		TALLBIRDEGG_COOKED = "Delicious and nutritious.",
		TALLBIRDEGG_CRACKED =
		{
			COLD = "Is it shivering or am I?",
			GENERIC = "Looks like it's hatching!",
			HOT = "Are eggs supposed to sweat?",
			LONG = "I have a feeling this is going to take a while...",
			SHORT = "It should hatch any time now.",
		},
		TALLBIRDNEST =
		{
			GENERIC = "That's quite an egg!",
			PICKED = "The nest is empty.",
		},
		TEENBIRD =
		{
			GENERIC = "Not a very tall bird.",
			HUNGRY = "You need some food and quick, huh?",
			STARVING = "It has a dangerous look in its eye.",
		},
		TELEPORTATO_BASE =
		{
			ACTIVE = "With this I can surely pass through space and time!",
			GENERIC = "This appears to be a nexus to another world!",
			LOCKED = "There's still something missing.",
			PARTIAL = "Soon, the invention will be complete!",
		},
		TELEPORTATO_BOX = "This may control the polarity of the whole universe.",
		TELEPORTATO_CRANK = "Tough enough to handle the most intense experiments.",
		TELEPORTATO_POTATO = "This metal potato contains great and fearful power...",
		TELEPORTATO_RING = "A ring that could focus dimensional energies.",
		TELESTAFF = "That could reveal the world.",
		TENT = 
		{
			GENERIC = "I get sort of crazy when I don't sleep.",
			BURNT = "Nothing left to sleep in.",
		},
		SIESTAHUT = 
		{
			GENERIC = "A nice place for an afternoon rest, safely out of the heat.",
			BURNT = "It won't provide much shade now.",
		},
		TENTACLE = "That looks dangerous.",
		TENTACLESPIKE = "It's pointy and slimy.",
		TENTACLESPOTS = "I think these were its genitalia.",
		TENTACLE_PILLAR = "A slimy pole.",
        TENTACLE_PILLAR_HOLE = "Seems stinky, but worth exploring.",
		TENTACLE_PILLAR_ARM = "Little slippery arms.",
		TENTACLE_GARDEN = "Yet another slimy pole.",
		TOPHAT = "This thing is a bit big for me.",
		TORCH = "I've gotta be careful with this.",
		TRANSISTOR = "What even is this thing?",
		TRAP = "Hope I made this thing right.",
		TRAP_TEETH = "They won't expect it!",
		TRAP_TEETH_MAXWELL = "I'll want to avoid stepping on that!",
		TREASURECHEST = 
		{
			GENERIC = "It's a tickle trunk!",
			BURNT = "Oh.",
		},
		SACRED_CHEST = 
		{
			GENERIC = "I hear whispers. It wants something.",
			LOCKED = "It's passing its judgment.",
		},
		TREECLUMP = "It's almost like someone is trying to prevent me from going somewhere.",
		
		TRINKET_1 = "They used to be fun.", --Melted Marbles
		TRINKET_2 = "What's kazoo with you?", --Fake Kazoo
		TRINKET_3 = "Woah, how did someone tie this?!", --Gord's Knot
		TRINKET_4 = "Mafia-like construction. This must be a relic!", --Gnome
		TRINKET_5 = "No time to play, sadly.", --Toy Rocketship
		TRINKET_6 = "I'll keep my hands away from the ends.", --Frazzled Wires
		TRINKET_7 = "Interesting... toy thing?", --Ball and Cup
		TRINKET_8 = "Perfect for bath time!", --Rubber Bung
		TRINKET_9 = "I prefer my giant zipper.", --Mismatched Buttons
		TRINKET_10 = "Gross.", --Dentures
		TRINKET_11 = "Telling lies?", --Lying Robot
		TRINKET_12 = "Mushy and gross.", --Dessicated Tentacle
		TRINKET_13 = "Mafia-like construction. This must be a relic!", --Gnomette
		TRINKET_14 = "It doesn't work very well.", --Leaky Teacup
		TRINKET_15 = "Silver, sunny memories.", --Pawn
		TRINKET_16 = "Silver, sunny memories. ", --Pawn
		TRINKET_17 = "I'll take you.", --Bent Spork
		TRINKET_18 = "It could have been prevented...", --Trojan Horse
		TRINKET_19 = "Not a very fun toy.", --Unbalanced Top
		TRINKET_20 = "Woah, I can finally scratch myself!", --Backscratcher
		TRINKET_21 = "What is this relic?", --Egg Beater
		TRINKET_22 = "Plenty of fun for a cat!", --Frayed Yarn
		TRINKET_23 = "My feet fit just fine in my boots.", --Shoehorn
		TRINKET_24 = "Kitty!", --Lucky Cat Jar
		TRINKET_25 = "My nose doesn't like this thing.", --Air Unfreshener
		TRINKET_26 = "A little sticky.", --Potato Cup
		TRINKET_27 = "I keep these above the skeletons.", --Coat Hanger
		TRINKET_28 = "Is this for a game?", --Rook
        TRINKET_29 = "Is this for a game?", --Rook
        TRINKET_30 = "Horse to C-4.", --Knight
        TRINKET_31 = "Horse to C-4.", --Knight
        TRINKET_32 = "Strange thing. What does it do?", --Cubic Zirconia Ball
        TRINKET_33 = "I wonder if Webber would like this?", --Spider Ring
        TRINKET_34 = "You better not touch my hat!", --Monkey Paw
        TRINKET_35 = "I could brew up a mad concoction!", --Empty Elixir
        TRINKET_36 = "No tricks, only treats!", --Faux fangs
        TRINKET_37 = "I probably shouldn't have this.", --Broken Stake

        HALLOWEENCANDY_1 = "The cavities are probably worth it, right?",
        HALLOWEENCANDY_2 = "Tasty, I hope.",
        HALLOWEENCANDY_3 = "It's... corn.",
        HALLOWEENCANDY_4 = "They wriggle on the way down.",
        HALLOWEENCANDY_5 = "My teeth are going to have something to say about this tomorrow.",
        HALLOWEENCANDY_6 = "I... don't think I'll be eating those.",
        HALLOWEENCANDY_7 = "Everyone'll be raisin' a fuss over these.",
        HALLOWEENCANDY_8 = "Only a sucker wouldn't love this.",
        HALLOWEENCANDY_9 = "Sticks to your teeth.",
        HALLOWEENCANDY_10 = "Only a sucker wouldn't love this.",
        HALLOWEENCANDY_11 = "Much better tasting than the real thing.",
        CANDYBAG = "No tricks. Only treats!",

        DRAGONHEADHAT = "So who gets to be the head?",
        DRAGONBODYHAT = "I'm middling on this middle piece.",
        DRAGONTAILHAT = "Someone has to bring up the rear.",
        PERDSHRINE =
        {
            GENERIC = "I feel like it wants something.",
            EMPTY = "I've got to plant something there.",
            BURNT = "That won't do at all.",
        },
        REDLANTERN = "This lantern feels more special than the others.",
        LUCKY_GOLDNUGGET = "What a lucky find!",
        FIRECRACKERS = "These things scare me.",
        PERDFAN = "It's inordinately large.",
        REDPOUCH = "Is there something inside that?",

		BISHOP_CHARGE_HIT = "Ow!",
		TRUNKVEST_SUMMER = "Wilderness casual.",
		TRUNKVEST_WINTER = "Winter survival gear.",
		TRUNK_COOKED = "Somehow even more nasal than before.",
		TRUNK_SUMMER = "A light breezy trunk.",
		TRUNK_WINTER = "A thick, hairy trunk.",
		TUMBLEWEED = "Who knows what that tumbleweed has picked up.",
		TURKEYDINNER = "Mmmm.",
		TWIGS = "It's a bunch of small twigs.",
		UMBRELLA = "I have my own, but this one works. For now.",
		GRASS_UMBRELLA = "My hair looks good wet... it's when it dries that's the problem.",
		UNIMPLEMENTED = "It doesn't look finished! It could be dangerous.",
		WAFFLES = "I'm waffling on whether it needs more syrup.",
		WALL_HAY = 
		{	
			GENERIC = "Hmmmm. I guess that'll have to do.",
			BURNT = "That won't do at all.",
		},
		WALL_HAY_ITEM = "This seems like a bad idea.",
		WALL_STONE = "That's a nice wall.",
		WALL_STONE_ITEM = "They make me feel so safe.",
		WALL_RUINS = "An ancient piece of wall.",
		WALL_RUINS_ITEM = "A solid piece of history.",
		WALL_WOOD = 
		{
			GENERIC = "Pointy!",
			BURNT = "Burnt!",
		},
		WALL_WOOD_ITEM = "Pickets!",
		WALL_MOONROCK = "Spacey and smooth!",
		WALL_MOONROCK_ITEM = "Very light, but surprisingly tough.",
		FENCE = "It's just a wood fence.",
        FENCE_ITEM = "All we need to build a nice, sturdy fence.",
        FENCE_GATE = "It opens. And closes sometimes, too.",
        FENCE_GATE_ITEM = "All we need to build a nice, sturdy gate.",
		WALRUS = "Walruses are natural predators.",
		WALRUSHAT = "It's covered with walrus hairs.",
		WALRUS_CAMP =
		{
			EMPTY = "Looks like somebody was camping here.",
			GENERIC = "It looks warm and cozy inside.",
		},
		WALRUS_TUSK = "I'm sure I'll find a use for it eventually.",
		WARDROBE = 
		{
			GENERIC = "It holds dark, forbidden secrets...",
            BURNING = "That's burning fast!",
			BURNT = "It's outta style now.",
		},
		WARG = "You might be something to reckon with, big dog.",
		WASPHIVE = "I think those bees are mad.",
		WATERBALLOON = "WATERBALLOON FIGHT!",
		WATERMELON = "Sticky sweet.",
		WATERMELON_COOKED = "Juicy and warm.",
		WATERMELONHAT = "Let the juice run down your face.",
		WAXWELLJOURNAL = "Spooky.",
		WETGOOP = "It tastes like nothing.",
        WHIP = "Nothing like loud noises to help keep the peace.",
		WINTERHAT = "It'll be good for when winter comes.",
		WINTEROMETER = 
		{
			GENERIC = "Mercurial.",
			BURNT = "Its measuring days are over.",
		},

        WINTER_TREE =
        {
            BURNT = "That puts a damper on the festivities.",
            BURNING = "That was a mistake, I think.",
            CANDECORATE = "Happy Winter's Feast!",
            YOUNG = "It's almost Winter's Feast!",
        },
		WINTER_TREESTAND = 
		{
			GENERIC = "I need a pine cone for that.",
            BURNT = "That puts a damper on the festivities.",
		},
        WINTER_ORNAMENT = "Pretty thing.",
        WINTER_ORNAMENTLIGHT = "A tree's not complete without some electricity.",
        WINTER_ORNAMENTBOSS = "This one is especially impressive.",

        WINTER_FOOD1 = "The anatomy's not right, but I'll overlook it.", --gingerbread cookie
        WINTER_FOOD2 = "Tasty! I want MORE!", --sugar cookie
        WINTER_FOOD3 = "A Yuletide toothache waiting to happen.", --candy cane
        WINTER_FOOD4 = "That experiment may have been a tiny bit unethical.", --fruitcake
        WINTER_FOOD5 = "It's nice to eat something other than berries for once.", --yule log cake
        WINTER_FOOD6 = "I'm puddin' that straight in my mouth!", --plum pudding
        WINTER_FOOD7 = "It's a hollowed apple filled with yummy juice.", --apple cider
        WINTER_FOOD8 = "How does it stay warm? A thermodynamical mug?", --hot cocoa
        WINTER_FOOD9 = "Mmm, tasty!", --eggnog

        KLAUS = "What on earth is that thing!",
        KLAUS_SACK = "We should definitely open that.",
		KLAUSSACKKEY = "It's really fancy for a deer antler.",
		WORMHOLE =
		{
			GENERIC = "Soft and undulating.",
			OPEN = "Maybe I should stay away, for my own sanity.",
		},
		WORMHOLE_LIMITED = "Guh, that thing looks worse off than usual.",
		ACCOMPLISHMENT_SHRINE = "I want to use it, and I want the world to know that I did.",        
		LIVINGTREE = "Is it watching me?",
		ICESTAFF = "It's cold to the touch.",
		REVIVER = "The beating of this hideous heart will bring a ghost back to life!",
		SHADOWHEART = "How is it alive?!",
        ATRIUM_RUBBLE = 
        {
			LINE_1 = "It depicts an old civilization. The people look hungry and scared.",
			LINE_2 = "This tablet is too worn to make out.",
			LINE_3 = "Something dark creeps over the city and its people.",
			LINE_4 = "The people are shedding their skins. They look different underneath.",
			LINE_5 = "It shows a massive, technologically advanced city.",
		},
        ATRIUM_STATUE = "It doesn't seem fully real.",
        ATRIUM_LIGHT = 
        {
			ON = "A truly unsettling light.",
			OFF = "Something must power it.",
		},
        ATRIUM_GATE =
        {
			ON = "Back in working order.",
			OFF = "The essential components are still intact.",
			CHARGING = "It's gaining power.",
			DESTABILIZING = "The gateway is destabilizing.",
			COOLDOWN = "It needs time to recover. Me too.",
        },
        ATRIUM_KEY = "There is power emanating from it.",
		LIFEINJECTOR = "Don't touch me with that thing! IT'S EVIL!",
		SKELETON_PLAYER =
		{
			MALE = "%s must've died performing an experiment with %s.",
			FEMALE = "%s must've died performing an experiment with %s.",
			ROBOT = "%s must've died performing an experiment with %s.",
			DEFAULT = "%s must've died performing an experiment with %s.",
		},
		HUMANMEAT = "Flesh is flesh. Where do I draw the line?",
		HUMANMEAT_COOKED = "Cooked nice and pink, but still morally gray.",
		HUMANMEAT_DRIED = "Letting it dry makes it not come from a human, right?",
		ROCK_MOON = "That rock came from the moon.",
		MOONROCKNUGGET = "That rock came from the moon.",
		MOONROCKCRATER = "I should stick something shiny in it. For research.",

        REDMOONEYE = "It can see and be seen for miles!",
        PURPLEMOONEYE = "Makes a good marker, but I wish it'd stop looking at me.",
        GREENMOONEYE = "That'll keep a watchful eye on the place.",
        ORANGEMOONEYE = "No one could get lost with that thing looking out for them.",
        YELLOWMOONEYE = "That ought to show everyone the way.",
        BLUEMOONEYE = "It's always smart to keep an eye out.",
	},
	DESCRIBE_GENERIC = "Woah, What's that?",
	DESCRIBE_TOODARK = "I wish I could see in the dark.",
	DESCRIBE_SMOLDERING = "Is that smoking?",
	EAT_FOOD =
	{
		TALLBIRDEGG_CRACKED = "Mmm. Beaky.",
	},
	
	HAT_ONCOOLDOWN = "Not yet!"
}
