DisplayEffectiveness:
	ldh a, [hWhoseTurn]
	and a
	jr nz, .chooseText
	ld hl, wEnemyBattleStatus3
	set SUPER_AFFECTED, [hl]
.chooseText
	ld a, [wDamageMultipliers]
	and $7F
	cp $0A
	jr z, .resolve
	ld hl, SuperEffectiveText
	jr nc, .done
	ld hl, wEnemyBattleStatus3
	res SUPER_AFFECTED, [hl]
	ld hl, NotVeryEffectiveText
.done
	jp PrintText
.resolve
	ld hl, wEnemyBattleStatus3
	res SUPER_AFFECTED, [hl]
	ret

SuperEffectiveText:
	text_far _SuperEffectiveText
	text_end

NotVeryEffectiveText:
	text_far _NotVeryEffectiveText
	text_end
