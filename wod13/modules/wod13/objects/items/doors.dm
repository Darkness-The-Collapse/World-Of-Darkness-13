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

/obj/structure/vampdoor
	name = "\improper door"
	desc = "It opens and closes."
	icon = 'code/modules/wod13/doors.dmi'
	icon_state = "door-1"
	plane = GAME_PLANE
	layer = ABOVE_ALL_MOB_LAYER
	pixel_w = -16
	anchored = TRUE
	density = TRUE
	opacity = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF

	var/baseicon = "door"

	var/magic_lock = FALSE
	var/closed = TRUE
	var/locked = FALSE
	var/lock_id = "nothing"
	var/glass = FALSE
	var/hacking = FALSE
	var/lockpick_timer = 5 SECONDS //[Lucifernix] - Never have the lockpick timer lower than 7. At 7 it will unlock instantly!!
	var/lockpick_difficulty = 2

	var/open_sound = 'code/modules/wod13/sounds/door_open.ogg'
	var/close_sound = 'code/modules/wod13/sounds/door_close.ogg'
	var/lock_sound = 'code/modules/wod13/sounds/door_locked.ogg'
	var/burnable = FALSE

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
