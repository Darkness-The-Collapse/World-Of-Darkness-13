/datum/species/kindred
	name = "Vampire"
	plural_form = "Vampires"
	id = SPECIES_VAMPIRE
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutantbrain = /obj/item/organ/brain/zombie/vampire
	mutanttongue = /obj/item/organ/tongue/vampire
	heatmod = 1
	var/datum/vampireclane/clane
	var/list/datum/discipline/disciplines = list()
	selectable = TRUE
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/vampire,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/vampire,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/vampire,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/vampire,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/vampire,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/vampire,
	)

	COOLDOWN_DECLARE(torpor_timer)

/datum/species/kindred/on_species_gain(mob/living/carbon/human/C, datum/species/old_species, pref_load, regenerate_icons)
	. = ..()
	C.update_body(is_creating = FALSE)
	C.last_experience = world.time + 5 MINUTES
	var/datum/action/aboutme/infor = new()
	infor.host = C
	infor.Grant(C)
	var/datum/action/give_vitae/vitae = new()
	vitae.Grant(C)
	if(C.MyPath.dot >= 7)
		var/datum/action/blush_of_life/blush = new()
		blush.Grant(C)

	//this needs to be adjusted to be more accurate for blood spending rates
	var/datum/discipline/bloodheal/giving_bloodheal = new(clamp(11 - C.generation, 1, 10))
	C.give_discipline(giving_bloodheal)

	var/datum/action/blood_power/bloodpower = new()
	bloodpower.Grant(C)
	add_verb(C, /mob/living/carbon/human/verb/teach_discipline)

	C.yang_chi = 0
	C.max_yang_chi = 0
	C.yin_chi = 6
	C.max_yin_chi = 6

	//vampires go to -200 damage before dying
	for (var/obj/item/bodypart/bodypart in C.bodyparts)
		bodypart.max_damage *= 1.5

	//vampires die instantly upon having their heart removed
	RegisterSignal(C, COMSIG_CARBON_LOSE_ORGAN, PROC_REF(lose_organ))

	//vampires don't die while in crit, they just slip into torpor after 2 minutes of being critted
	RegisterSignal(C, SIGNAL_ADDTRAIT(TRAIT_CRITICAL_CONDITION), PROC_REF(slip_into_torpor))

	//vampires resist vampire bites better than mortals
	RegisterSignal(C, COMSIG_MOB_VAMPIRE_SUCKED, PROC_REF(on_vampire_bitten))

/datum/species/kindred/on_species_loss(mob/living/carbon/human/C, datum/species/new_species, pref_load)
	. = ..()
	for(var/datum/action/aboutme/VI in C.actions)
		if(VI)
			VI.Remove(C)
	for(var/datum/action/A in C.actions)
		if(A)
			if(A.vampiric)
				A.Remove(C)

	UnregisterSignal(C, COMSIG_MOB_VAMPIRE_SUCKED)
	UnregisterSignal(C, SIGNAL_ADDTRAIT(TRAIT_CRITICAL_CONDITION))
	UnregisterSignal(C, COMSIG_MOB_VAMPIRE_SUCKED)

/**
 * On being bit by a vampire
 *
 * This handles vampire bite sleep immunity and any future special interactions.
 */
/datum/species/kindred/proc/on_vampire_bitten(datum/source, mob/living/carbon/being_bitten)
	SIGNAL_HANDLER

	if(iskindred(being_bitten))
		return COMPONENT_RESIST_VAMPIRE_KISS

/**
 * Accesses a certain Discipline that a Kindred has. Returns false if they don't.
 *
 * Arguments:
 * * searched_discipline - Name or typepath of the Discipline being searched for.
 */
/datum/species/kindred/proc/get_discipline(searched_discipline)
	for(var/datum/discipline/discipline in disciplines)
		if (ispath(searched_discipline, /datum/discipline))
			if (istype(discipline, searched_discipline))
				return discipline
		else if (istext(searched_discipline))
			if (discipline.name == searched_discipline)
				return discipline

	return FALSE

/**
 * Signal handler for lose_organ to near-instantly kill Kindred whose hearts have been removed.
 *
 * Arguments:
 * * source - The Kindred whose organ has been removed.
 * * organ - The organ which has been removed.
 */
/datum/species/kindred/proc/lose_organ(mob/living/carbon/human/source, obj/item/organ/organ)
	SIGNAL_HANDLER

	if (istype(organ, /obj/item/organ/heart))
		spawn()
			if (!source.get_organ_slot(ORGAN_SLOT_HEART))
				source.death()

/datum/species/kindred/proc/slip_into_torpor(mob/living/carbon/human/source)
	SIGNAL_HANDLER

	to_chat(source, "<span class='warning'>You can feel yourself slipping into Torpor. You can use succumb to immediately sleep...</span>")
	spawn(2 MINUTES)
		if (source.stat >= SOFT_CRIT)
			source.torpor("damage")

/datum/species/kindred/check_roundstart_eligible()
	return TRUE

/datum/species/kindred/get_physical_attributes()
	return "Kindred, or Vampires, have pale skin, sharp fangs, and often possess an otherworldly beauty. Their eyes can glow with supernatural intensity, and they have heightened senses and agility."

/datum/species/kindred/get_species_description()
	return "A Kindred, or Vampire, is a creature of the night that subsists by feeding on the blood of the living. \
		They possess supernatural abilities known as Disciplines, which grant them powers beyond those of mortals. \
		Vampires are organized into clans, each with its own unique traits and characteristics. \
		They navigate a complex society filled with politics, alliances, and rivalries, all while struggling to maintain their humanity amidst their predatory nature."

/datum/species/kindred/get_species_lore()
	return list(
		"Vampires are immortal beings that feed on the blood of the living to sustain themselves.",
	)

/datum/species/kindred/get_scream_sound(mob/living/carbon/human/vampire)
	return 'sound/mobs/humanoids/human/scream/malescream_1.ogg'

/datum/species/kindred/get_cough_sound(mob/living/carbon/human/vampire)
	if(vampire.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cough/female_cough1.ogg',
			'sound/mobs/humanoids/human/cough/female_cough2.ogg',
			'sound/mobs/humanoids/human/cough/female_cough3.ogg',
			'sound/mobs/humanoids/human/cough/female_cough4.ogg',
			'sound/mobs/humanoids/human/cough/female_cough5.ogg',
			'sound/mobs/humanoids/human/cough/female_cough6.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cough/male_cough1.ogg',
		'sound/mobs/humanoids/human/cough/male_cough2.ogg',
		'sound/mobs/humanoids/human/cough/male_cough3.ogg',
		'sound/mobs/humanoids/human/cough/male_cough4.ogg',
		'sound/mobs/humanoids/human/cough/male_cough5.ogg',
		'sound/mobs/humanoids/human/cough/male_cough6.ogg',
	)


/datum/species/kindred/get_cry_sound(mob/living/carbon/human/vampire)
	if(vampire.physique == FEMALE)
		return pick(
			'sound/mobs/humanoids/human/cry/female_cry1.ogg',
			'sound/mobs/humanoids/human/cry/female_cry2.ogg',
		)
	return pick(
		'sound/mobs/humanoids/human/cry/male_cry1.ogg',
		'sound/mobs/humanoids/human/cry/male_cry2.ogg',
		'sound/mobs/humanoids/human/cry/male_cry3.ogg',
	)


/datum/species/kindred/get_sneeze_sound(mob/living/carbon/human/vampire)
	if(vampire.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sneeze/female_sneeze1.ogg'
	return 'sound/mobs/humanoids/human/sneeze/male_sneeze1.ogg'


/datum/species/kindred/get_laugh_sound(mob/living/carbon/human/vampire)
	if(vampire.physique == FEMALE)
		return 'sound/mobs/humanoids/human/laugh/womanlaugh.ogg'
	return 'sound/mobs/humanoids/human/laugh/manlaugh1.ogg'

/datum/species/kindred/get_sigh_sound(mob/living/carbon/human/vampire)
	if(vampire.physique == FEMALE)
		return SFX_FEMALE_SIGH
	return SFX_MALE_SIGH

/datum/species/kindred/get_sniff_sound(mob/living/carbon/human/vampire)
	if(vampire.physique == FEMALE)
		return 'sound/mobs/humanoids/human/sniff/female_sniff.ogg'
	return 'sound/mobs/humanoids/human/sniff/male_sniff.ogg'

/datum/species/kindred/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "drop",
			SPECIES_PERK_NAME = "Blood",
			SPECIES_PERK_DESC = "Vampires can subsist on blood alone, gaining nourishment from it.",
		),

		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "fire",
			SPECIES_PERK_NAME = "Fire Vulnerability",
			SPECIES_PERK_DESC = "Vampires are vulnerable to fire, taking increased damage from it.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "sun",
			SPECIES_PERK_NAME = "Bright Lights",
			SPECIES_PERK_DESC =  "Vampires are sensitive to sunlight, taking damage when exposed to it.",
		),
	)

	return to_add
