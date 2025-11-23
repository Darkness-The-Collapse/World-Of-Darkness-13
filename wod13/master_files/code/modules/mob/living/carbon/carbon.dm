/mob/living/carbon
	//imported from other areas around the code
	var/last_moon_look = 0
	var/last_rage_from_attack = 0

	var/last_jump_time = 0
	var/jump_range = 1

	var/last_gnosis_buff = 0
	var/last_rage_gain = 0
	var/last_veil_restore = 0

	var/next_veil_time = 0

	var/celerity_visual = FALSE
	var/potential = 0

	var/obfuscate_level = 0

	var/in_frenzy = FALSE
	var/frenzy_hardness = 6
	var/last_frenzy_check = 0
	var/atom/frenzy_target = null
	var/last_experience = 0

	var/last_rage_hit = 0

	var/list/beastmaster = list()
	var/list/puppets = list()

	var/datum/relationship/Myself

	var/datum/relationship/MyRelationships

	var/inspired = FALSE

	var/wolf_recov = FALSE

	var/melee_damage_type

	var/armour_penetration = 0

	var/tox_damage_plus = 0
	var/agg_damage_plus = 0
	var/stam_damage_plus = 0

	var/lock_on_by_mannequin = FALSE

	var/diablerist = FALSE
	var/antifrenzy = FALSE
	var/fakediablerist = FALSE

	var/active_blush = FALSE
