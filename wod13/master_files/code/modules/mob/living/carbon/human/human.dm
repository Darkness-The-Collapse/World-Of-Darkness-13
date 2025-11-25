/mob/living/carbon/human
	//Shitty VtM vars I'm moving here so they're not strewn around the codebase
	var/datum/vampireclane/clane

	var/last_repainted_mark

	var/phonevoicetag = 10

	var/image/suckbar
	var/atom/suckbar_loc

	var/killed_count = 0

	var/roundstart_vampire = FALSE

	var/base_body_mod = ""
	var/icon/body_sprite

	var/bank_id

/mob/living/carbon/human/Initialize(mapload)
	. = ..()
	phonevoicetag = length(GLOB.human_list)+10

/mob/living/carbon/human/update_body(is_creating = FALSE)
	. = ..()
	for(var/obj/item/I in get_all_gear())
		if(I)
			I.update_bodyfied(src)
