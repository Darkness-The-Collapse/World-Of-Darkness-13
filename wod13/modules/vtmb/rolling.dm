/mob/living
	var/datum/attributes/attributes

/mob/living/Initialize(mapload)
	. = ..()
	attributes = new ()
	attributes.randomize()

/datum/attributes
	var/strength = 1
	var/dexterity = 1
	var/stamina = 1

	var/strength_bonus = 0
	var/dexterity_bonus = 0
	var/stamina_bonus = 0

	var/strength_reagent = 0
	var/dexterity_reagent = 0
	var/stamina_reagent = 0

	var/charisma = 1
	var/manipulation = 1
	var/appearance = 1

	var/charisma_bonus = 0
	var/manipulation_bonus = 0
	var/appearance_bonus = 0

	var/charisma_reagent = 0
	var/manipulation_reagent = 0
	var/appearance_reagent = 0

	var/perception = 1
	var/intelligence = 1
	var/wits = 1

	var/perception_bonus = 0
	var/intelligence_bonus = 0
	var/wits_bonus = 0

	var/perception_reagent = 0
	var/intelligence_reagent = 0
	var/wits_reagent = 0

	var/Alertness = 0
	var/Athletics = 0
	var/Brawl = 0
	var/Empathy = 0
	var/Intimidation = 0
	var/Expression = 0

	var/Crafts = 0
	var/Melee = 0
	var/Firearms = 0
	var/Drive = 0
	var/Security = 0
	var/Fleshcraft = 0
	var/Performance = 0

	var/Finance = 0
	var/Investigation = 0
	var/Medicine = 0
	var/Linguistics = 0
	var/Occult = 0

	var/fortitude_bonus = 0
	var/passive_fortitude = 0
	var/potence_bonus = 0
	var/celerity_bonus = 0
	var/visceratika_bonus = 0
	var/bloodshield_bonus = 0
	var/lasombra_shield = 0
	var/tzimisce_bonus = 0
	var/auspex_buff = 0

	var/diff_curse = 0

/datum/attributes/proc/randomize()
	strength = rand(1, 3)
	dexterity = rand(1, 3)
	stamina = rand(1, 3)

	charisma = rand(1, 3)
	manipulation = rand(1, 3)
	appearance = rand(1, 3)

	perception = rand(1, 3)
	intelligence = rand(1, 3)
	wits = rand(1, 3)

	Alertness = rand(0, 4)
	Athletics = rand(0, 4)
	Brawl = rand(0, 4)
	Empathy = rand(0, 4)
	Intimidation = rand(0, 4)
	Expression = rand(0, 4)

	Crafts = rand(0, 4)
	Melee = rand(0, 4)
	Firearms = rand(0, 4)
	Drive = rand(0, 4)
	Security = rand(0, 4)
	Performance = rand(0, 4)

	Finance = rand(0, 4)
	Investigation = rand(0, 4)
	Medicine = rand(0, 4)
	Linguistics = rand(0, 4)
	Occult = rand(0, 4)

/proc/get_fortitude_dices(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.fortitude_bonus+Living.attributes.passive_fortitude
	else
		return 0

/proc/get_potence_dices(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.potence_bonus
	else
		return 0

/proc/get_celerity_dices(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.celerity_bonus
	else
		return 0

/proc/get_visceratika_dices(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.visceratika_bonus
	else
		return 0

/proc/get_tzimisce_dices(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.tzimisce_bonus
	else
		return 0

/proc/get_bloodshield_dices(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.bloodshield_bonus
	else
		return 0

/proc/get_lasombra_dices(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.lasombra_shield
	else
		return 0

/proc/get_a_alertness(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Alertness
	else
		return 0

/proc/get_a_athletics(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Athletics
	else
		return 0

/proc/get_a_brawl(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Brawl
	else
		return 0

/proc/get_a_empathy(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Empathy
	else
		return 0

/proc/get_a_intimidation(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Intimidation
	else
		return 0

/proc/get_a_expression(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Expression
	else
		return 0

/proc/get_a_crafts(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Crafts
	else
		return 0

/proc/get_a_melee(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Melee
	else
		return 0

/proc/get_a_firearms(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Firearms+Living.attributes.auspex_buff
	else
		return 0

/proc/get_a_drive(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Drive
	else
		return 0

/proc/get_a_security(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Security
	else
		return 0

/proc/get_a_performance(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Performance
	else
		return 0

/proc/get_a_fleshcraft(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Fleshcraft
	else
		return 0

/proc/get_a_finance(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Finance
	else
		return 0

/proc/get_a_investigation(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Investigation+Living.attributes.auspex_buff
	else
		return 0

/proc/get_a_medicine(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Medicine
	else
		return 0

/proc/get_a_linguistics(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Linguistics
	else
		return 0

/proc/get_a_occult(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.Occult
	else
		return 0

/proc/get_a_strength(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.strength+Living.attributes.strength_bonus+Living.attributes.strength_reagent+get_potence_dices(Living)
	else
		return 3

/proc/get_a_dexterity(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.dexterity+Living.attributes.dexterity_bonus+Living.attributes.dexterity_reagent
	else
		return 3

/proc/get_a_stamina(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.stamina+Living.attributes.stamina_bonus+Living.attributes.stamina_reagent
	else
		return 3

/proc/get_a_manipulation(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.manipulation+Living.attributes.manipulation_bonus+Living.attributes.manipulation_reagent
	else
		return 3

/proc/get_a_charisma(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.charisma+Living.attributes.charisma_bonus+Living.attributes.charisma_reagent
	else
		return 3

/proc/get_a_appearance(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.appearance+Living.attributes.appearance_bonus+Living.attributes.appearance_reagent
	else
		return 3

/proc/get_a_perception(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.perception+Living.attributes.perception_bonus+Living.attributes.perception_reagent
	else
		return 3

/proc/get_a_intelligence(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.intelligence+Living.attributes.intelligence_bonus+Living.attributes.intelligence_reagent
	else
		return 3

/proc/get_a_wits(mob/living/Living)
	if(Living.attributes)
		return Living.attributes.wits+Living.attributes.wits_bonus+Living.attributes.wits_reagent
	else
		return 3

/proc/get_dice_image(input, diff)
	var/dat = ""
	var/span_end = ""
	if((input >= diff && input != 1) || input == 10)
		dat += "<span class='nicegreen'>"
		span_end = "</span>"
	if(input == 1)
		dat += "<span class='danger'>"
		span_end = "</span>"
	switch(input)
		if(1)
			dat += "❶"
		if(2)
			dat += "❷"
		if(3)
			dat += "❸"
		if(4)
			dat += "❹"
		if(5)
			dat += "❺"
		if(6)
			dat += "❻"
		if(7)
			dat += "❼"
		if(8)
			dat += "❽"
		if(9)
			dat += "❾"
		if(10)
			dat += "❿"
		else
			dat += "⓿"
	dat += span_end
	return dat
