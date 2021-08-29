Rotations = Rotations or {}

Rotations.Target = {
	61919,			--	Nightblade	- 	Assassination		-	Merciless Resolve
	61930,			--	Nightblade	-	Assassination		-	Merciless Resolve Proc
	
	39053,			--	Weapon		-	Destruction Staff	-	Unstable Wall of Fire
	39052,			--	Weapon		-	Destruction Staff	-	Unstable Wall of Elements

	22095,			--	Templar		-	Dawn's Wrath		-	Solar Barrage
	26869,			--	Templar		-	Aedric Spear		-	Blazing Spear
	36049,			--	Nightblade	-	Shadow				-	Twisting Path
	24328,			--	Sorcerer	-	Daedric Summoning	-	Daedric Prey
	114716,			--	Sorcerer	-	Dark Magic			-	Crystal Shards Proc
	42028,			--	Guild		-	Undaunted			-	Mystic Orb
	35434,			--	Nightblade	-	Shadow				-	Dark Shade
	40382,			--	Guild		-	Fighters' Guild		-	Barbed trap
	36943,			--	Nightblade	-	Siphoning			-	Debilitate
	77182,			--	Sorcerer	-	Daedric Summoning	-	Summon Volatile Familiar
	40457,			--	Guild		-	Mages Guild			-	Degeneration
	22259,			--	Templar		-	Restoring Light		-	Ritual of Retribution
	
	36935,			--	Nightblade	-	Siphoning			-	Siphoning Attacks
	22240,			--	Templar		-	Restoring Light		-	Channeled Focus

	21765			--	Templar		-	Dawn's Wrath		-	Purifying Light 			(low priority to make sure that at least 1 spammable gets casted after this)
}

Rotations.Spammables = {
	25267,			--	Nightblade	-	Shadow				-	Concealed Weapon
	34851,			--	Nightblade	-	Assassination		-	Impale
	46324,			--	Sorcerer	-	Dark Magic			-	Crystal Shards
	26797,			--	Templar		-	Aedric Spear		-	Puncturing Sweeps
	63046			--	Templar		-	Dawn's Wrath		-	Radiant Oppression
}

Rotations.SkillsToDropAtHpPercent = {
	[25267] = 0.25,	--	Nightblade	-	Shadow				-	Concealed Weapon
	[61919] = 0.25,	--	Nightblade	- 	Assassination		-	Merciless Resolve
	[61930] = 0.25,	--	Nightblade	-	Assassination		-	Merciless Resolve Proc
	[36943] = 0.25,	--	Nightblade	-	Siphoning			-	Debilitate
	[40457] = 0.25,	--	Guild		-	Mages Guild			-	Degeneration
	[36935] = 0.25,	--	Nightblade	-	Siphoning			-	Siphoning Attacks
	[26797] = 0.25,	--	Templar		-	Aedric Spear		-	Puncturing Sweeps
	
	[22095] = 0.2,	--	Templar		-	Dawn's Wrath		-	Solar Barrage
	
	[42028] = 0.1,	--	Guild		-	Undaunted			-	Mystic Orb
	
	[26869] = 0.05,	--	Templar		-	Aedric Spear		-	Blazing Spear
	[22240] = 0.05,	--	Templar		-	Restoring Light		-	Channeled Focus
	[22259] = 0.05,	--	Templar		-	Restoring Light		-	Ritual of Retribution
	[35434] = 0.05,	--	Nightblade	-	Shadow				-	Dark Shade
	[40382] = 0.05,	--	Guild		-	Fighters' Guild		-	Barbed trap
	[39053] = 0.05,	--	Weapon		-	Destruction Staff	-	Unstable Wall of Fire
	[36049] = 0.05,	--	Nightblade	-	Shadow				-	Twisting Path
	[21765] = 0.05	--	Templar		-	Dawn's Wrath		-	Purifying Light
}
