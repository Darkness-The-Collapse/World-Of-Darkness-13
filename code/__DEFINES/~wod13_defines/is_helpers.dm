#define isnpc(A) (istype(A, /mob/living/carbon/human/npc))

#define iskindred(A) (is_species(A,/datum/species/human/kindred))
#define iscathayan(A) (is_species(A,/datum/species/kuei_jin))
#define isghoul(A) (is_species(A,/datum/species/ghoul))
#define isgarou(A) (is_species(A,/datum/species/garou))

#define iswerewolf(A) (istype(A, /mob/living/carbon/werewolf))

#define iscrinos(A) (istype(A, /mob/living/carbon/werewolf/crinos))

#define islupus(A) (istype(A, /mob/living/carbon/werewolf/lupus))

#define iscorax(A) (istype(A, /mob/living/carbon/werewolf/corax))

#define iscorvid(A) (istype(A, /mob/living/carbon/werewolf/lupus/corvid))

#define iscoraxcrinos(A) (istype(A, /mob/living/carbon/werewolf/corax/corax_crinos)) //not sure if necessary, not taking chances
