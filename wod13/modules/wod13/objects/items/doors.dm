#define LOCKDIFFICULTY_1 1
#define LOCKTIMER_1 4 SECONDS
#define LOCKDIFFICULTY_2 2
#define LOCKTIMER_2 5 SECONDS
#define LOCKDIFFICULTY_3 3
#define LOCKTIMER_3 6 SECONDS
#define LOCKDIFFICULTY_4 4
#define LOCKTIMER_4 7 SECONDS
#define LOCKDIFFICULTY_5 5
#define LOCKTIMER_5 8 SECONDS
#define LOCKDIFFICULTY_6 6 //originally should have been 10, but that wouldn't work unless locktimer is explicitly declared beforehand, which it won't be
#define LOCKTIMER_6 9 SECONDS
#define LOCKDIFFICULTY_7 7
#define LOCKTIMER_7 10 SECONDS

/obj/item/vamp/keys
	name = "\improper keys"
	desc = "Those can open some doors."
	icon = 'code/modules/wod13/items.dmi'
	icon_state = "keys"
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FIRE_PROOF | ACID_PROOF
	onflooricon = 'code/modules/wod13/onfloor.dmi'

	var/list/accesslocks = list(
		"nothing"
	)
	var/roundstart_fix = FALSE

#undef LOCKDIFFICULTY_1
#undef LOCKTIMER_1
#undef LOCKDIFFICULTY_2
#undef LOCKTIMER_2
#undef LOCKDIFFICULTY_3
#undef LOCKTIMER_3
#undef LOCKDIFFICULTY_4
#undef LOCKTIMER_4
#undef LOCKDIFFICULTY_5
#undef LOCKTIMER_5
#undef LOCKDIFFICULTY_6
#undef LOCKTIMER_6
#undef LOCKDIFFICULTY_7
#undef LOCKTIMER_7
