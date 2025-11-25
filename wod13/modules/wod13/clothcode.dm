/obj/item/clothing/under/vampire
	desc = "Some clothes."
	name = "clothes"
	icon_state = "error"
	has_sensor = NO_SENSORS
	random_sensor = FALSE
	can_adjust = FALSE
	icon = 'code/modules/wod13/clothing.dmi'
	worn_icon = 'code/modules/wod13/worn.dmi'
	armor = list(BASHING = 0, LETHAL = 0, AGGRAVATED = 0, MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0, WOUND = 15)
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	body_worn = TRUE
	female_sprite_flags = NO_FEMALE_UNIFORM

/obj/item/clothing/suit/vampire
	icon = 'code/modules/wod13/clothing.dmi'
	worn_icon = 'code/modules/wod13/worn.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	body_parts_covered = CHEST
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	max_integrity = 250
	resistance_flags = NONE
	armor = list(BASHING = 1, LETHAL = 1, AGGRAVATED = 0, MELEE = 10, BULLET = 0, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 0, RAD = 0, FIRE = 0, ACID = 10, WOUND = 10)
	body_worn = TRUE
	vampire_cost = 15

/obj/item/clothing/suit/vampire/coat
	name = "coat"
	desc = "Warm and heavy clothing."
	icon_state = "coat1"

/obj/item/clothing/suit/vampire/coat/alt
	icon_state = "coat2"

/obj/item/clothing/suit/vampire/coat/winter
	name = "coat"
	desc = "Warm and heavy clothing."
	icon_state = "winter1"

/obj/item/clothing/suit/vampire/coat/winter/alt
	icon_state = "winter2"

/obj/item/clothing/neck/vampire
	icon = 'code/modules/wod13/clothing.dmi'
	worn_icon = 'code/modules/wod13/worn.dmi'
	onflooricon = 'code/modules/wod13/onfloor.dmi'
	inhand_icon_state = ""
	w_class = WEIGHT_CLASS_SMALL
	body_worn = TRUE

/obj/item/clothing/neck/vampire/scarf
	name = "black scarf"
	desc = "Provides protection against cold."
	icon_state = "scarf"

/obj/item/clothing/neck/vampire/scarf/red
	name = "red scarf"
	icon_state = "scarf_red"

/obj/item/clothing/neck/vampire/scarf/blue
	name = "blue scarf"
	icon_state = "scarf_blue"

/obj/item/clothing/neck/vampire/scarf/green
	name = "green scarf"
	icon_state = "scarf_green"

/obj/item/clothing/neck/vampire/scarf/white
	name = "white scarf"
	icon_state = "scarf_white"
