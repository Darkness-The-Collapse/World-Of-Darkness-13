/obj/item/clothing
	//These allow head/mask items to dynamically alter the user's hair
	// and facial hair, checking hair_extensions.dmi and facialhair_extensions.dmi
	// for a state matching hair_state+dynamic_hair_suffix
	// THESE OVERRIDE THE HIDEHAIR FLAGS
	var/dynamic_hair_suffix = ""//head > mask for head hair
	var/dynamic_fhair_suffix = ""//mask > head for facial hair

/obj/item/clothing/head
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/Initialize(mapload)
	. = ..()
	if(ishuman(loc) && dynamic_hair_suffix)
		var/mob/living/carbon/human/H = loc
		H.update_hair()

/obj/item/clothing/head/nursehat
	dynamic_hair_suffix = ""

/obj/item/clothing/head/rabbitears
	dynamic_hair_suffix = ""

/obj/item/clothing/head/chefhat
	dynamic_hair_suffix = ""

/obj/item/clothing/head/beret
	dynamic_hair_suffix = ""

/obj/item/clothing/head/hos
	dynamic_hair_suffix = ""

/obj/item/clothing/head/hardhat
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/helmet/police
	dynamic_hair_suffix = ""

/obj/item/clothing/head/bomb_hood
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/chaplain/cage
	dynamic_hair_suffix = ""


/obj/item/clothing/head/peaceflower
	dynamic_hair_suffix = ""

	/*

	I guess this proc was removed in newTG and transform into some else
/datum/species/handle_hair(mob/living/carbon/human/H, forced_colour)
	. = ..()
	var/dynamic_hair_suffix = "" //if this is non-null, and hair+suffix matches an iconstate, then we render that hair instead
	var/dynamic_fhair_suffix = ""

	if(H.head)
		var/obj/item/I = H.head
		if(isclothing(I))
			var/obj/item/clothing/C = I
			dynamic_hair_suffix = C.dynamic_hair_suffix
		if(I.flags_inv & HIDEHAIR)
			hair_hidden = TRUE

	if(H.wear_mask)
		var/obj/item/I = H.wear_mask
		if(!dynamic_hair_suffix && isclothing(I)) //head > mask in terms of head hair
			var/obj/item/clothing/C = I
			dynamic_hair_suffix = C.dynamic_hair_suffix
		if(I.flags_inv & HIDEHAIR)
			hair_hidden = TRUE

	if(!hair_hidden || dynamic_hair_suffix)
		var/mutable_appearance/hair_overlay = mutable_appearance(layer = -HAIR_LAYER)
		if(!hair_hidden && !H.getorgan(/obj/item/organ/brain)) //Applies the debrained overlay if there is no brain
			if(!(NOBLOOD in species_traits))
				hair_overlay.icon = 'icons/mob/human_face.dmi'
				hair_overlay.icon_state = "debrained"

		else if(H.hairstyle && (HAIR in species_traits))
			S = GLOB.hairstyles_list[H.hairstyle]
			if(S)

				//List of all valid dynamic_hair_suffixes
				var/static/list/extensions
				if(!extensions)
					var/icon/hair_extensions = icon('icons/mob/hair_extensions.dmi') //hehe
					extensions = list()
					for(var/s in hair_extensions.IconStates(1))
						extensions[s] = TRUE
					qdel(hair_extensions)

				//Is hair+dynamic_hair_suffix a valid iconstate?
				var/hair_state = S.icon_state
				var/hair_file = S.icon
				if(extensions[hair_state+dynamic_hair_suffix])
					hair_state += dynamic_hair_suffix
					hair_file = 'icons/mob/hair_extensions.dmi'


					*/

