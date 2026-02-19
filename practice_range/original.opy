#!mainFile "main.opy"

rule "Global Variables":
    Z[0] = 0
    Z[1] = 0
    Z[2] = 0
    Z[3] = 0
    Z[4] = 0
    Z[5] = 0
    Z[6] = 0
    Z[7] = 0
    Z[8] = 0
    Z[9] = 0
    Z[10] = 0
    Z[11] = 0
    T = 0

rule "Effects":
    createEffect(getAllPlayers(), Effect.RING, Color.GREEN, vect(56.613, -0.574, -7.1), 1, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.PURPLE, vect(51.968, -0.233, 11.827), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.SKY_BLUE, vect(55.217, 8.879, -22.137), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.BLUE, vect(85.085, -0.776, 10.119), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, vect(77.125, -2.827, 35.112), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.ORANGE, vect(36.464, 3.17, 19.845), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, vect(53.486, -1.176, -8.062), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, vect(70.697, -0.826, -21.162), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.BLUE, vect(75.968, -0.826, -17.423), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.BLUE, vect(62.112, 8.413, -30.584), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.PURPLE, vect(83.29, -2.824, 48.24), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.WHITE, vect(60.024, 2.550, 38.255), 0.3, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


rule "Widow Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(51.968, -0.233, 11.827)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[0] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    destroyDummy(Team.2, 0)
    wait(0.05)
    lbl_1:
    createDummy(Hero.WIDOWMAKER, Team.2, -1, vect(51.237, 1.486, 14.057), vect(0.29, 0.88, -0.38))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(51.97, -0.233, 11.824), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(51.97, -0.233, 11.824), 1)
    Z[0] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.WIDOWMAKER, Team.2).getSlot())
    Z[0] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(51.97, -0.233, 11.824), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(51.97, -0.233, 11.824), 1)


rule "Symmetra Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(55.233, 8.882, -22.158)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[1] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    destroyDummy(Team.2, 0)
    wait(0.05)
    lbl_1:
    createDummy(Hero.SYMMETRA, Team.2, -1, vect(68.073, 7.673, -13.132), vect(-0.58, 0, 0.81))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(55.217, 8.879, -22.137), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(55.217, 8.879, -22.137), 1)
    Z[1] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.SYMMETRA, Team.2).getSlot())
    Z[1] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(55.217, 8.879, -22.137), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(55.217, 8.879, -22.137), 1)


rule "Pharah Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(85.085, -0.776, 10.119)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[2] != 0:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    destroyDummy(Team.2, 0)
    wait(0.05)
    lbl_1:
    createDummy(Hero.PHARAH, Team.2, -1, vect(84.571, 0.076, 7.529), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(85.085, -0.776, 10.119), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(85.085, -0.776, 10.119), 1)
    Z[2] = 1
    return
    lbl_0:
    if Z[2] != 1:
        goto lbl_2
    destroyDummy(Team.2, getPlayersOnHero(Hero.PHARAH, Team.2).getSlot())
    destroyDummy(Team.2, getPlayersOnHero(Hero.MERCY, Team.2).getSlot())
    createDummy(Hero.PHARAH, Team.1, -1, vect(84.571, 0.076, 7.529), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.YELLOW, vect(85.085, -0.776, 10.119), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.YELLOW, vect(85.085, -0.776, 10.119), 1)
    Z[2] = 2
    return
    lbl_2:
    destroyDummy(Team.1, getPlayersOnHero(Hero.PHARAH, Team.1).getSlot())
    Z[2] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(85.085, -0.776, 10.119), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(85.085, -0.776, 10.119), 1)


rule "Reaper Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(77.125, -2.827, 35.112)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[3] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    destroyDummy(Team.2, 0)
    wait(0.05)
    lbl_1:
    createDummy(Hero.REAPER, Team.2, -1, vect(77.884, 3.813, 35.699), vect(0.81, -0.18, 0.56))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(77.125, -2.827, 35.112), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(77.125, -2.827, 35.112), 1)
    Z[3] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.REAPER, Team.2).getSlot())
    Z[3] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(77.125, -2.827, 35.112), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(77.125, -2.827, 35.112), 1)


rule "Tracer Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(36.464, 3.17, 19.845)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[5] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    destroyDummy(Team.2, 0)
    wait(0.05)
    lbl_1:
    createDummy(Hero.TRACER, Team.2, -1, vect(43.229, 3.173, 11.398), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(36.464, 3.17, 19.845), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(36.464, 3.17, 19.845), 1)
    Z[5] = 1
    getLastCreatedEntity().I = true
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.TRACER, Team.2).getSlot())
    Z[5] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(36.464, 3.17, 19.845), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(36.464, 3.17, 19.845), 1)


rule "Lucio Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(53.486, -1.176, -8.062)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[6] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    wait(0.05)
    destroyDummy(Team.2, 0)
    lbl_1:
    createDummy(Hero.LUCIO, Team.2, -1, vect(52.437, -0.827, -15.581), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(53.486, -1.176, -8.062), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(53.486, -1.176, -8.062), 1)
    Z[6] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.LUCIO, Team.2).getSlot())
    Z[6] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(53.486, -1.176, -8.062), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(53.486, -1.176, -8.062), 1)


rule "Genji Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(70.371, -0.827, -20.78)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[8] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    wait(0.05)
    destroyDummy(Team.2, 0)
    lbl_1:
    createDummy(Hero.GENJI, Team.2, -1, vect(70.371, -0.827, -20.78), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(70.371, -0.827, -20.78), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(70.371, -0.827, -20.78), 1)
    Z[8] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.GENJI, Team.2).getSlot())
    Z[8] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(70.371, -0.827, -20.78), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(70.371, -0.827, -20.78), 1)


rule "Mei Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(75.632, -0.502, -17.05)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[9] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    wait(0.05)
    destroyDummy(Team.2, 0)
    lbl_1:
    createDummy(Hero.MEI, Team.2, -1, vect(75.632, -0.502, -17.05), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(75.632, -0.502, -17.05), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(75.632, -0.502, -17.05), 1)
    Z[9] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.MEI, Team.2).getSlot())
    Z[9] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(75.632, -0.502, -17.05), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(75.632, -0.502, -17.05), 1)


rule "Reinhardt Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(62.112, 8.413, -30.584)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[10] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    wait(0.05)
    destroyDummy(Team.2, 0)
    lbl_1:
    createDummy(Hero.REINHARDT, Team.2, -1, vect(62.112, 8.413, -30.584), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(62.112, 8.413, -30.584), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(62.112, 8.413, -30.584), 1)
    Z[10] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.REINHARDT, Team.2).getSlot())
    Z[10] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(62.112, 8.413, -30.584), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(62.112, 8.413, -30.584), 1)


rule "Sombra Button":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(83.29, -2.824, 48.24)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[11] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    wait(0.05)
    destroyDummy(Team.2, 0)
    lbl_1:
    createDummy(Hero.SOMBRA, Team.2, -1, vect(83.29,  1, 48.24), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(83.29, -2.824, 48.24), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(83.29, -2.824, 48.24), 1)
    Z[11] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.SOMBRA, Team.2).getSlot())
    Z[11] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(83.29, -2.824, 48.24), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(83.29, -2.824, 48.24), 1)


rule "Pharah Bot Up/Down Control":
    @Event eachPlayer
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getRealClosestPlayer(vect(60.865, 1.3, 26.734), Team.1).getEyePosition()), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    if eventPlayer.getEyePosition().y >= 18:
        goto lbl_0
    eventPlayer.startForcingButton(Button.JUMP)
    wait(random.uniform(0.5, 1), Wait.ABORT_WHEN_FALSE)
    eventPlayer.stopForcingButton(Button.JUMP)
    lbl_0:
    wait(random.uniform(0.3, 0.8), Wait.ABORT_WHEN_FALSE)
    if eventPlayer.isAlive():
        goto RULE_START


rule "Pharah Bot Left/Right Control":
    @Event eachPlayer
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startThrottleInDirection(vect(0.8, 0, 0.6), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    if distance(eventPlayer.getPosition(), vect(54.693, 8.451, -24.438)) <= 45:
        goto lbl_0
    eventPlayer.startThrottleInDirection(vect(-0.8, 0, -0.6), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    lbl_0:
    if eventPlayer.isAlive():
        goto RULE_START


rule "Pharah Bot Forward/Back Control":
    @Event eachPlayer
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.iscreatedbot == true
    
    if distance(eventPlayer.getPosition(), vect(74.267, 6.174, 42.611)) >= 55:
        goto lbl_0
    eventPlayer.startThrottleInDirection(vect(0.6, 0, -0.8), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    lbl_0:
    if distance(eventPlayer.getPosition(), vect(74.267, 6.174, 42.611)) <= 32:
        goto lbl_1
    eventPlayer.startThrottleInDirection(vect(-0.6, 0, 0.8), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    lbl_1:
    wait()
    if eventPlayer.isAlive():
        goto RULE_START


rule "Pharah Bot Dies":
    @Event playerDied
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.iscreatedbot == true
    
    if eventPlayer.getTeam() == Team.1:
        goto lbl_0
    destroyDummy(Team.2, eventPlayer.getSlot())
    if eventPlayer.getSlot() != 0:
        goto lbl_1
    createDummy(Hero.PHARAH, Team.2, eventPlayer.getSlot(), vect(84.571, 0.076, 7.529), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    return
    lbl_1:
    createDummy(Hero.PHARAH, Team.2, eventPlayer.getSlot(), vect(94.171, 0.076, 5.429), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    return
    lbl_0:
    destroyDummy(Team.1, eventPlayer.getSlot())
    if eventPlayer.getSlot() != 0:
        goto lbl_2
    createDummy(Hero.PHARAH, Team.1, eventPlayer.getSlot(), vect(84.571, 0.076, 7.529), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    return
    lbl_2:
    createDummy(Hero.PHARAH, Team.1, eventPlayer.getSlot(), vect(94.171, 0.076, 5.429), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true


rule "Sym Turret Movement":
    @Event eachPlayer
    @Team 2
    @Hero symmetra
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    R[0] = random.randint(83, 92)
    eventPlayer.teleport(vect(R[0], random.uniform(7, 11), R[0] - 130))
    wait(1)
    goto RULE_START


rule "Sym Turret Rules":
    @Event eachPlayer
    @Team 2
    @Hero symmetra
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.setGravity(0)
    eventPlayer.setDamageReceived(300)
    eventPlayer.setStatusEffect(null, Status.INVINCIBLE, 9999)


rule "Reaper Bot Movement":
    @Event eachPlayer
    @Team 2
    @Hero reaper
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startFacing(vect(0.81, -0.18, 0.56), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(1)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(0.2)
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(2)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(1)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    eventPlayer.startFacing(vect(-0.81, -0.18, -0.56), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(1)
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(0.2)
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    wait(2)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(1)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    if eventPlayer.isAlive():
        goto RULE_START


rule "Reaper Bot Dies":
    @Event playerDied
    @Team 2
    @Hero reaper
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.REAPER, Team.2, -1, vect(77.884, 3.813, 35.699), vect(0.81, -0.17, 0.56))
    getLastCreatedEntity().iscreatedbot = true


rule "Widow Bot Movement":
    @Event eachPlayer
    @Team 2
    @Hero widowmaker
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.teleport(vect(51.237, 1.486, 14.057))
    wait(0.5)
    eventPlayer.setFacing(vect(0.29, 0.88, -0.38), Relativity.TO_WORLD)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.8)
    eventPlayer.forceButtonPress(Button.JUMP)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getRealClosestPlayer(eventPlayer.getPosition(), Team.1).getEyePosition()), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(4)
    eventPlayer.stopFacing()
    if eventPlayer.isAlive():
        goto RULE_START


rule "Widow Bot Dies":
    @Event playerDied
    @Team 2
    @Hero widowmaker
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.WIDOWMAKER, Team.2, -1, vect(51.237, 1.486, 14.057), vect(0.29, 0.88, -0.38))
    getLastCreatedEntity().iscreatedbot = true


rule "Jump Pad":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(56.613, -0.574, -7.1)) <= 2
    
    eventPlayer.applyImpulse(vect(0, 1, 0), 20, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)


rule "Tracer Bot Foward/Back Control":
    @Event eachPlayer
    @Team 2
    @Hero tracer
    @Condition eventPlayer.I == true
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getRealClosestPlayer(eventPlayer.getPosition(), Team.1).getEyePosition()), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.startThrottleInDirection(vect(0.6, 0, -0.8), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 1), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startThrottleInDirection(vect(-0.6, 0, 0.8), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 1), Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Tracer Bot Left/Right Control":
    @Event eachPlayer
    @Team 2
    @Hero tracer
    @Condition eventPlayer.isAlive() == true
    @Condition eventPlayer.I == true
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startThrottleInDirection(vect(-0.8, 0, -0.6), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 1), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startThrottleInDirection(vect(0.8, 0, 0.6), 2, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 1), Wait.ABORT_WHEN_FALSE)
    if RULE_CONDITION:
        goto RULE_START


rule "Tracer Bot Abilities Control":
    @Event eachPlayer
    @Team 2
    @Hero tracer
    @Condition eventPlayer.I == true
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.T = random.randint(0, 10)
    eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    if eventPlayer.T != 1:
        goto lbl_0
    eventPlayer.startForcingButton(Button.CROUCH)
    wait(0.7)
    eventPlayer.stopForcingButton(Button.CROUCH)
    lbl_0:
    if eventPlayer.T != 2:
        goto lbl_1
    eventPlayer.forceButtonPress(Button.PRIMARY_FIRE)
    lbl_1:
    if eventPlayer.T != 3:
        goto lbl_2
    eventPlayer.startForcingButton(Button.CROUCH)
    wait(0.7)
    eventPlayer.stopForcingButton(Button.CROUCH)
    lbl_2:
    if eventPlayer.T != 4:
        goto lbl_3
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    wait(0.7)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    lbl_3:
    wait(random.uniform(2, 3))
    if eventPlayer.isAlive():
        goto RULE_START


rule "Tracer Bot Dies":
    @Event playerDied
    @Team 2
    @Hero tracer
    @Condition eventPlayer.I == true
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.TRACER, Team.2, -1, vect(43.229, 3.173, 11.398), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    getLastCreatedEntity().I = true


rule "Tracer Bot Out of Bounds":
    @Event eachPlayer
    @Team 2
    @Hero tracer
    @Condition distance(eventPlayer.getPosition(), vect(41.201, 3.423, 14.473)) >= 6
    @Condition eventPlayer.I == true
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.I = false
    eventPlayer.startThrottleInDirection(directionTowards(eventPlayer.getPosition(), vect(40.869, 3.177, 14.074)), 1, Relativity.TO_WORLD, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(0.05)
    if distance(eventPlayer.getPosition(), vect(9.159, 3.504, -9.189)) < 46:
        goto lbl_0
    eventPlayer.forceButtonPress(Button.JUMP)
    lbl_0:
    if RULE_CONDITION:
        goto RULE_START
    wait(random.uniform(0.5, 0.8))
    eventPlayer.I = true


rule "Tracer Falls":
    @Event eachPlayer
    @Team 2
    @Hero tracer
    @Condition eventPlayer.getPosition().y <= 0.5
    @Condition eventPlayer.I == true
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.forceButtonPress(Button.ABILITY_2)


rule "Lucio Bot Foward/Back Control":
    @Event eachPlayer
    @Team 2
    @Hero lucio
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getRealClosestPlayer(eventPlayer.getPosition(), Team.1).getEyePosition()), 500, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.startThrottleInDirection(vect(0.6, 0, -0.8), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startThrottleInDirection(vect(-0.6, 0, 0.8), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    if eventPlayer.isAlive():
        goto RULE_START


rule "Lucio Bot Left/Right Control":
    @Event eachPlayer
    @Team 2
    @Hero lucio
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startThrottleInDirection(vect(-0.8, 0, -0.6), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    eventPlayer.startThrottleInDirection(vect(0.8, 0, 0.6), 1, Relativity.TO_PLAYER, Throttle.REPLACE_EXISTING, ThrottleReeval.DIRECTION_AND_MAGNITUDE)
    wait(random.uniform(0.5, 2), Wait.ABORT_WHEN_FALSE)
    wait()
    if eventPlayer.isAlive():
        goto RULE_START


rule "Lucio Bot Abilities Control":
    @Event eachPlayer
    @Team 2
    @Hero lucio
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.T = random.randint(0, 10)
    eventPlayer.forceButtonPress(Button.JUMP)
    if eventPlayer.T != 1:
        goto lbl_0
    # eventPlayer.forceButtonPress(Button.SECONDARY_FIRE)
    lbl_0:
    if eventPlayer.T != 3:
        goto lbl_1
    eventPlayer.startForcingButton(Button.CROUCH)
    wait(1)
    eventPlayer.stopForcingButton(Button.CROUCH)
    lbl_1:
    if eventPlayer.T != 4:
        goto lbl_2
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    lbl_2:
    if eventPlayer.T != 5:
        goto lbl_3
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    lbl_3:
    if eventPlayer.T != 6:
        goto lbl_4
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    lbl_4:
    wait(0.5)
    eventPlayer.forceButtonPress(Button.JUMP)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.5)
    eventPlayer.forceButtonPress(Button.JUMP)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.5)
    if eventPlayer.isAlive():
        goto RULE_START


rule "Lucio Bot Dies":
    @Event playerDied
    @Team 2
    @Hero lucio
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.LUCIO, Team.2, -1, vect(52.437, -0.827, -15.581), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true


rule "Lucio Bot Out of Bounds":
    @Event eachPlayer
    @Team 2
    @Hero lucio
    @Condition distance(eventPlayer.getPosition(), vect(52.284, -0.826, -17.559)) >= 7.6
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.applyImpulse(directionTowards(eventPlayer.getPosition(), vect(52.284, -0.826, -17.559)), abs(distance(eventPlayer, vect(52.284, -0.826, -17.559))), Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START


rule "Friendly Pharah Bot Health":
    @Event eachPlayer
    @Team 1
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.setMaxHealth(1000)
    eventPlayer.setHealingReceived(0.01)
    wait(0.05)
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getRealClosestPlayer(vect(61.797, 0.475, 28.245), Team.1).getEyePosition()), 800, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    damage(eventPlayer, null, eventPlayer.getHealth() - 1)


rule "Friendly Pharah Bot Fly":
    @Event eachPlayer
    @Team 1
    @Hero pharah
    @Condition eventPlayer.isDummy() == true
    @Condition eventPlayer.getPosition().y <= -2
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)


rule "Mercy Button Show":
    @Condition Z[2] == 1
    
    createEffect(getAllPlayers(), Effect.SPHERE, Color.YELLOW, vect(88.878, -0.6, 12.805), 0.4, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    mercySphere = getLastCreatedEntity()


rule "Mercy Button Hide":
    @Condition Z[2] != 1
    
    destroyEffect(mercySphere)


rule "Mercy Pharah Button":
    @Event eachPlayer
    @Condition Z[2] == 1
    @Condition distance(eventPlayer.getPosition(), vect(88.878, -0.6, 12.805)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    
    if Z[7] == 1:
        goto lbl_0
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_1
    destroyDummy(Team.2, 0)
    wait(0.05)
    lbl_1:
    createDummy(Hero.MERCY, Team.2, -1, getPlayersOnHero(Hero.PHARAH, Team.2).getPosition() - getPlayersOnHero(Hero.PHARAH, Team.2).getFacingDirection(), vect(-0.58, 0, 0.81))
    getLastCreatedEntity().iscreatedbot = true
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(88.878, -0.6, 12.805), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(88.878, -0.6, 12.805), 1)
    Z[7] = 1
    return
    lbl_0:
    destroyDummy(Team.2, getPlayersOnHero(Hero.MERCY, Team.2).getSlot())
    Z[7] = 0
    playEffect(getAllPlayers(), DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, vect(88.878, -0.6, 12.805), 100)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(88.878, -0.6, 12.805), 1)


rule "Mercy Bot Movement":
    @Event eachPlayer
    @Team 2
    @Hero mercy
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getPlayersOnHero(Hero.PHARAH, Team.2).getEyePosition()), 300, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    eventPlayer.setWeapon(0)
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.startForcingButton(Button.JUMP)
    wait(random.uniform(0.5, 1.5))
    eventPlayer.stopForcingButton(Button.JUMP)
    wait(random.uniform(0.3, 0.8))
    eventPlayer.startForcingButton(Button.ABILITY_1)
    wait(0.5)
    # eventPlayer.startForcingButton(Button.JUMP)
    eventPlayer.stopForcingButton(Button.ABILITY_1)
    if eventPlayer.isAlive():
        goto RULE_START


rule "Mercy Bot Dies":
    @Event playerDied
    @Team 2
    @Hero mercy
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.MERCY, Team.2, -1, getPlayersOnHero(Hero.PHARAH, Team.2).getPosition() - getPlayersOnHero(Hero.PHARAH, Team.2).getFacingDirection(), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true


rule "Zayra Charge":
    @Event eachPlayer
    @Team 1
    @Hero zarya
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1) == true
    
    if getNumberOfPlayers(Team.2) < 5:
        goto lbl_0
    destroyDummy(Team.2, 0)
    wait(0.05)
    lbl_0:
    createDummy(Hero.TORBJORN, Team.2, -1, eventPlayer.getPosition() - eventPlayer.getFacingDirection(), eventPlayer.getFacingDirection())
    getLastCreatedEntity().iscreatedbot = true
    getPlayersOnHero(Hero.TORBJORN, Team.2).startFacing(directionTowards(getPlayersOnHero(Hero.TORBJORN, Team.2).getEyePosition(), eventPlayer.getEyePosition()), 700, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    wait(0.25)
    getPlayersOnHero(Hero.TORBJORN, Team.2).forceButtonPress(Button.SECONDARY_FIRE)
    wait(0.25)
    destroyDummy(Team.2, getPlayersOnHero(Hero.TORBJORN, Team.2).getSlot())


rule "Genji Abilities":
    @Event eachPlayer
    @Team 2
    @Hero genji
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    wait(3)
    if eventPlayer.isAlive():
        goto RULE_START


rule "Genji Bot Dies":
    @Event playerDied
    @Team 2
    @Hero genji
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.GENJI, Team.2, -1, vect(70.368, -0.799, -20.782), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true


rule "Mei Abilities":
    @Event eachPlayer
    @Team 2
    @Hero mei
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(5)
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.MEI, Team.2, -1, vect(75.632, -0.502, -17.05), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true
    if eventPlayer.isAlive():
        goto RULE_START


rule "Mei Bot Dies":
    @Event playerDied
    @Team 2
    @Hero mei
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.MEI, Team.2, -1, vect(75.632, -0.502, -17.05), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true


rule "Reinhardt Abilities":
    @Event eachPlayer
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.setUltCharge(100)
    wait(random.uniform(1.5, 3))
    eventPlayer.stopForcingButton(Button.SECONDARY_FIRE)
    eventPlayer.R = random.randint(1, 5)
    if eventPlayer.R != 1:
        goto lbl_0
    eventPlayer.startForcingButton(Button.PRIMARY_FIRE)
    lbl_0:
    if eventPlayer.R != 2:
        goto lbl_1
    eventPlayer.forceButtonPress(Button.ABILITY_2)
    lbl_1:
    if eventPlayer.R != 3:
        goto lbl_2
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    lbl_2:
    if eventPlayer.R != 4:
        goto lbl_3
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    lbl_3:
    if eventPlayer.R != 5:
        goto lbl_4
    eventPlayer.forceButtonPress(Button.ULTIMATE)
    lbl_4:
    wait(2)
    eventPlayer.stopForcingButton(Button.PRIMARY_FIRE)
    eventPlayer.startForcingButton(Button.SECONDARY_FIRE)
    if eventPlayer.isAlive():
        goto RULE_START


rule "Reinhardt Bot Dies":
    @Event playerDied
    @Team 2
    @Hero reinhardt
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.REINHARDT, Team.2, -1, vect(62.127, 8.417, -30.576), vect(-0.6, 0, 0.8))
    getLastCreatedEntity().iscreatedbot = true


rule "Sombra EMP":
    @Event eachPlayer
    @Team 2
    @Hero sombra
    @Condition eventPlayer.iscreatedbot == true
    
    eventPlayer.startFacing(directionTowards(eventPlayer.getEyePosition(), getRealClosestPlayer(eventPlayer.getPosition(), Team.1).getEyePosition()), 900, Relativity.TO_WORLD, FacingReeval.DIRECTION_AND_TURN_RATE)
    heal(eventPlayer, null, 200)
    eventPlayer.setUltCharge(100)
    wait(3.5)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(random.uniform(1, 4))
    eventPlayer.R = random.randint(1, 5)
    if eventPlayer.R != 1:
        goto lbl_0
    eventPlayer.teleport(vect(75.883, -2.827, 37.092))
    lbl_0:
    if eventPlayer.R != 2:
        goto lbl_1
    eventPlayer.teleport(vect(81.266, -2.702, 38.421))
    lbl_1:
    if eventPlayer.R != 3:
        goto lbl_2
    eventPlayer.teleport(vect(84.809, -2.699, 42.465))
    lbl_2:
    if eventPlayer.R != 4:
        goto lbl_3
    eventPlayer.teleport(vect(79.978, -2.698, 47.629))
    lbl_3:
    if eventPlayer.R != 5:
        goto lbl_4
    eventPlayer.teleport(vect(74.649, -2.698, 41.761))
    lbl_4:
    eventPlayer.startForcingButton(Button.ULTIMATE)
    wait(2)
    eventPlayer.stopForcingButton(Button.ULTIMATE)
    eventPlayer.teleport(vect(83.29,  1, 48.24))
    if eventPlayer.isAlive():
        goto RULE_START


rule "Sombra Bot Dies":
    @Event playerDied
    @Team 2
    @Hero sombra
    @Condition eventPlayer.iscreatedbot == true
    
    destroyDummy(Team.2, eventPlayer.getSlot())
    createDummy(Hero.SOMBRA, Team.2, -1, vect(83.29,  1, 48.24), vect(0.6, 0, -0.8))
    getLastCreatedEntity().iscreatedbot = true


rule "Reinhardt Stunned":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.hasStatusEffect(Status.STUNNED) == true
    @Condition eventPlayer.iscreatedbot == true
    
    wait(0.5)
    eventPlayer.clearStatusEffect(Status.STUNNED)
