/obj/structure/bury_pit
	name = "bury pit"
	desc = "You can bury someone here."
	icon = 'code/modules/wod13/props.dmi'
	icon_state = "pit0"
	plane = GAME_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	density = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/burying = FALSE
	var/supernatural = FALSE

/obj/structure/bury_pit/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/melee/vampirearms/shovel))
		if(supernatural)
			user.visible_message("<span class='warning'>[user] пытается вскопать твердую землю.</span>", "<span class='warning'>Земля слишком.. плотная. Ты не можешь её вскопать</span>")
			return
		if(!burying)
			burying = TRUE
			user.visible_message("<span class='warning'>[user] starts to dig [src]</span>", "<span class='warning'>You start to dig [src].</span>")
			if(do_mob(user, src, 10 SECONDS))
				burying = FALSE
				if(icon_state == "pit0")
					var/dead_amongst = FALSE
					for(var/mob/living/L in get_turf(src))
						L.forceMove(src)
						if(L.stat == DEAD)
							dead_amongst = TRUE
						icon_state = "pit1"
						user.visible_message("<span class='warning'>[user] digs a hole in [src].</span>", "<span class='warning'>You dig a hole in [src].</span>")
						if(dead_amongst)
							call_dharma("respect", user)
				else
					var/dead_amongst = FALSE
					for(var/mob/living/L in src)
						L.forceMove(get_turf(src))
						if(L.stat == DEAD)
							dead_amongst = TRUE
					icon_state = "pit0"
					user.visible_message("<span class='warning'>[user] digs a hole in [src].</span>", "<span class='warning'>You dig a hole in [src].</span>")
					if(dead_amongst)
						call_dharma("disrespect", user)
			else
				burying = FALSE

/obj/structure/bury_pit/container_resist_act(mob/living/user)
	if(!burying && !supernatural)
		burying = TRUE
		if(do_mob(user, src, 30 SECONDS))
			for(var/mob/living/L in src)
				L.forceMove(get_turf(src))
			icon_state = "pit0"
			burying = FALSE
		else
			burying = FALSE
	if(supernatural)
		if(do_mob(user, src, 10 SECONDS))
			for(var/mob/living/L in src)
				L.forceMove(get_turf(src))
			qdel(src)