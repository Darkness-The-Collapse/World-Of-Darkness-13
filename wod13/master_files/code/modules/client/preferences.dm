/datum/preferences
	var/datum/species/pref_species = new /datum/species/human()	//Mutant race
	// Generation
	var/generation = 13
	var/generation_bonus = 0

	// Diablerie
	var/know_diablerie = 0

	// Renown
	var/renownrank = 0
	var/honor = 0
	var/glory = 0
	var/wisdom = 0

	// Masquerade
	var/masquerade = 5

	var/enlightenment = FALSE
	var/humanity = 7

	// Legacy
	var/exper = 1440
	var/exper_plus = 0

	var/discipline1level = 1
	var/discipline2level = 1
	var/discipline3level = 1
	var/discipline4level = 1

	var/discipline1type
	var/discipline2type
	var/discipline3type
	var/discipline4type

	// Character sheet stats
	var/true_experience = 50
	var/torpor_count = 0

	/// linked lists determining known Disciplines and their known ranks
	/// Datum types of the Disciplines this character knows.
	var/list/discipline_types = list()
	/// Ranks of the Disciplines this character knows, corresponding to discipline_types.
	var/list/discipline_levels = list()

	//// Skills
	var/lockpicking = 0
	var/athletics = 0

	var/info_known = INFO_KNOWN_UNKNOWN

	var/friend = FALSE
	var/enemy = FALSE
	var/lover = FALSE

	var/ambitious = FALSE
	var/flavor_text
	var/headshot
	var/headshot_link
	var/friend_text
	var/enemy_text
	var/lover_text

	var/diablerist = 0

	var/reason_of_death = "None"
	var/breed = BREED_HOMID
	var/werewolf_color = "black"
	var/werewolf_scar = 0
	var/werewolf_hair = 0
	var/werewolf_hair_color = "#000000"
	var/werewolf_eye_color = "#FFFFFF"
	var/werewolf_apparel

	var/werewolf_name
	var/auspice_level = 1

	var/clane_accessory

	var/dharma_level = 1
	var/po_type = "Rebel"
	var/po = 5
	var/hun = 5
	var/yang = 5
	var/yin = 5
	var/list/chi_types = list()
	var/list/chi_levels = list()

	var/list/priorities = list("Physical" = 1, "Social" = 2, "Mental" = 3)
	var/list/languages = list()
	var/list/loadout = list()

	var/Strength = 1
	var/Dexterity = 1
	var/Stamina = 1
	var/Manipulation = 1
	var/Charisma = 1
	var/Appearance = 1
	var/Perception = 1
	var/Intelligence = 1
	var/Wits = 1

	//// TALENTS
	var/Alertness = 0
	var/Athletics = 0
	var/Brawl = 0
	var/Empathy = 0
	var/Intimidation = 0
	var/Expression = 0

	//// SKILLS
	var/Crafts = 0
	var/Melee = 0
	var/Firearms = 0
	var/Drive = 0
	var/Security = 0
	var/Fleshcraft = 0
	var/Performance = 0

	//// KNOWELEDGE
	var/Finance = 0
	var/Investigation = 0
	var/Medicine = 0
	var/Linguistics = 0
	var/Occult = 0

	var/consience = 4
	var/selfcontrol = 3
	var/courage = 3

	var/main_physical_attribute = "Strength"
	var/main_social_attribute = "Charisma"
	var/main_mental_attribute = "Perception"

	var/secondary_physical_attribute = "Dexterity"
	var/secondary_social_attribute = "Manipulation"
	var/secondary_mental_attribute = "Intelligence"

	var/old_enough_to_get_exp = FALSE

/datum/preferences/proc/add_experience(amount)
	true_experience = clamp(true_experience + amount, 0, 1000)

/proc/reset_shit(mob/M)
	if(M.key)
		var/datum/preferences/P = GLOB.preferences_datums[ckey(M.key)]
		if(P)
			P.reset_character()

/datum/preferences/proc/verify_attributes()
	Strength = min(Strength, get_gen_attribute_limit("Strength"))
	Dexterity = min(Dexterity, get_gen_attribute_limit("Dexterity"))
	Stamina = min(Stamina, get_gen_attribute_limit("Stamina"))

	Charisma = min(Charisma, get_gen_attribute_limit("Charisma"))
	Manipulation = min(Manipulation, get_gen_attribute_limit("Manipulation"))
	Appearance = min(Appearance, get_gen_attribute_limit("Appearance"))

	Perception = min(Perception, get_gen_attribute_limit("Perception"))
	Intelligence = min(Intelligence, get_gen_attribute_limit("Intelligence"))
	Wits = min(Wits, get_gen_attribute_limit("Wits"))

/datum/preferences/proc/get_gen_attribute_limit(attribute)
	var/level

	if(pref_species.name == "Vampire")
		level = generation - generation_bonus
	else if(pref_species.name == "Werewolf")
		level = auspice_level
	else if(pref_species.name == "Kuei-Jin")
		level = dharma_level
	else
		level = 13

	if(pref_species.name == "Vampire")
		switch(level)
			if(9)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 6
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 4
				else
					return 3
			if(8)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 7
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 5
				else
					return 3
			if(7)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 8
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 6
				else
					return 4
			if(6)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 9
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 7
				else
					return 5
		if(level > 9)
			if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
				return 5
			else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
				return 4
			else
				return 3
		if(level < 6)
			if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
				return 10
			else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
				return 8
			else
				return 6

	if(pref_species.name == "Kuei-Jin")
		switch(level)
			if(1)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 5
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 4
				else
					return 3
			if(2)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 6
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 4
				else
					return 3
			if(3)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 7
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 5
				else
					return 3
			if(4)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 8
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 6
				else
					return 4
			if(5)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 9
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 7
				else
					return 5
			if(6)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 10
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 8
				else
					return 6

	if(pref_species.name == "Werewolf")
		switch(level)
			if(1)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 5
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 4
				else
					return 3
			if(2)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 6
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 4
				else
					return 3
			if(3)
				if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
					return 7
				else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
					return 5
				else
					return 3

	if(attribute == main_physical_attribute || attribute == main_social_attribute || attribute == main_mental_attribute)
		return 5
	else if(attribute == secondary_physical_attribute || attribute == secondary_social_attribute || attribute == secondary_mental_attribute)
		return 4
	else
		return 3
