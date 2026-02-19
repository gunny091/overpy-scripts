settings {
    "main": {
        "modeName": "위도우 1ㄷ1"
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "enableMatchVoiceChat": true,
        "ffaSlots": 8,
        "spectatorSlots": 12
    },
    "gamemodes": {
        "ffa": {
            "enabledMaps": [
                "lijiangNightMarket"
            ]
        },
        "general": {
            "gamemodeStartTrigger": "immediately",
            "enableRandomHeroes": true,
            "enableSelfInitiatedRespawn": false,
            "spawnHealthPacks": "disabled"
        }
    },
    "heroes": {
        "allTeams": {
            "widowmaker": {
                "enableAutomaticFire": false,
                "enableHeadshotsOnly": true,
                "enableAbility2": false
            },
            "enabledHeroes": [
                "widowmaker"
            ],
            "general": {
                "enableUlt": false
            }
        }
    }
}

#Player variables

playervar tg 100
playervar cheat 101


rule "초기설정":
    #범위반경
    J = createWorkshopSettingInt("기본설정(Setting)", "범위반경(radius of area)", 30, 20, 100)
    #disableInspector()
    if "{0}".format(Hero.GENJI) == "겐지":
        L = ["최고기록", "중", "대기목록", "위도우 1VS1\n코드 : 4GNGS\nEDITED BY WIHS27#3669", "승", "패", "시작", "왕초보", "｛연습자｝", "〈 초급자 〉", "〔 노력파 〕", "《 저격수 》", "【 전설 】", "승리", "원 안으로 들어가세요."]
    elif "{0}".format(Hero.GENJI) == "源氏":
        L = ["高分", "", "等候名单", "made by youtube 'kaeku'\nEDITED BY WIHS27#3669", "胜", "败", "开始", "连胜", "幸运", "强大", "狂言", "杀手", "传说", "胜利", "进入圆圈。"]
    elif "{0}".format(Hero.GENJI) == "ゲンジ":
        L = ["最高記録", "中", "待機リスト", "youtube 'kaeku'\nEDITED BY WIHS27#3669", "勝", "敗", "開始", "連勝", "幸運", "強力な", "きょう", "虐殺", "伝説の", "勝利", "ワンの中に入っていきなさい。"]
    else:
        L = ["Record", "", "Waiting list", "made by youtube 'kaeku'\nEDITED BY WIHS27#3669", " win", " lose", "start", " Winning streak", "lucky ", "strong ", "Raving ", "Slayer ", "legend ", "win", "Go inside the circle."]
    G = []
    disableScoring()
    hudHeader(getAllPlayers() if C > 4 and C > E else [], "{0}: {1}".format(L[0], F), HudPosition.LEFT, -6, Color.RED, HudReeval.VISIBILITY_AND_STRING)
    hudHeader(getAllPlayers() if E > 1 else [], "{0}{1}!".format(K, L[1]), HudPosition.LEFT, -5, Color.PURPLE, HudReeval.VISIBILITY_AND_STRING)
    hudHeader(getAllPlayers() if getNumberOfPlayers(Team.ALL) > 2 else [], L[2], HudPosition.RIGHT, 0, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudHeader(getAllPlayers(), "{0}    vs    {1}".format(G[0].E, G[1].E), HudPosition.TOP, -2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    hudHeader(hostPlayer, "{0}/{1}/{2}".format(getServerLoad(),getPeakServerLoad(),getAverageServerLoad()), HudPosition.RIGHT, 10, Color.LIGHT_RED, HudReeval.VISIBILITY_STRING_AND_COLOR)
    setMatchTime(0)
    hudSubtext(getAllPlayers(), L[3], HudPosition.RIGHT, -10, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    disableAnnouncer()
    disableGamemodeCompletion()
    disableMusic()
    hudText(getAllPlayers(), null, "\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n", "\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n", HudPosition.TOP, -1, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    M = ["이거", "전부", "고침"]


rule "위치설정":
    @Condition A == false
    @Condition len(G) > 1
    
    A = nearestWalkablePosition(G[0].getPosition())
    A.append(nearestWalkablePosition(A + vect(20, 2, 20) * directionTowards(A, G[1])))
    #if any([i == __currentMap___ for i in [Map.LIJIANG_NIGHT_MARKET, -1429]]):
    #챔피언위치
    A = vect(13, 2, -30)
    #도전자위치
    A.append(vect(-10, 2, -30))
    #elif any([__currentMap___ == i for i in [Map.WORKSHOP_CHAMBER, Map.WORKSHOP_ISLAND, 196]]):
    #     #챔피언위치
    #     A = vect(13, 2, 0)
    #     #도전자위치
    #     A.append(vect(-10, 2, 0))
    I = (A[0] + A.last()) / 2
    createEffect(getAllPlayers(), Effect.RING, Color.RED, I, J, EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, I + vect(0, 3, 0), J, EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, I + vect(0, 6, 0), J, EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, I + vect(0, 9, 0), J, EffectReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, I + vect(0, -3, 0), J, EffectReeval.VISIBILITY)


rule "접속":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.A == false
    
    eventPlayer.A = true
    eventPlayer.enableDeathSpectateTargetHud()
    eventPlayer.enableDeathSpectateAllPlayers()
    G.append(eventPlayer)
    eventPlayer.setRespawnTime(9999)
    eventPlayer.disableRespawn()
    hudHeader(getAllPlayers() if G.index(eventPlayer) > 1 else [], "{0}{1}".format(heroIcon(eventPlayer.getHero()), eventPlayer), HudPosition.RIGHT, G.index(eventPlayer), Color.WHITE, HudReeval.VISIBILITY_SORT_ORDER_AND_STRING)
    eventPlayer.E = "{0}{1}".format(heroIcon(eventPlayer.getHero()), eventPlayer)
    if "{0}".format(eventPlayer) in M:
        eventPlayer.removeFromGame()


rule "관전자들":
    @Event eachPlayer
    @Condition G.index(eventPlayer) > 1
    @Condition eventPlayer.isAlive() == true
    
    kill(eventPlayer)
    wait(0.25)
    if ruleCondition:
        loop()


rule "자리고정":
    @Event eachPlayer
    @Condition eventPlayer in G.slice(0, 2) == true
    @Condition H == true
    @Condition distance(A[G.index(eventPlayer)], eventPlayer) > 1.5
    @Condition A == true
    @Condition eventPlayer.isAlive() == true
    
    while distance(A[G.index(eventPlayer)], eventPlayer) > 1.5:
        eventPlayer.teleport(A[G.index(eventPlayer)])
        wait(0.05)
    eventPlayer.setFacing(directionTowards(A[G.index(eventPlayer)], A[not G.index(eventPlayer)]), Relativity.TO_WORLD)


rule "영웅":
    @Event playerDealtDamage
    @Hero widowmaker
    @Condition eventPlayer.isUsingUltimate() == false
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true
    
    wait(3)
    heal(victim, null, 125)


rule "시작":
    @Event eachPlayer
    @Condition eventPlayer == G[1]
    @Condition B == false
    @Condition A == true
    
    wait(1, Wait.ABORT_WHEN_FALSE)
    G.slice(0, 2).respawn()
    H = true
    G.slice(0, 2).setStatusEffect(null, Status.PHASED_OUT, 3)
    G.slice(0, 2).setStatusEffect(null, Status.ROOTED, 3)
    smallMessage(getAllPlayers(), 3)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, I, 200)
    wait(1, Wait.ABORT_WHEN_FALSE)
    eventPlayer.E = "{0}{1} {2}".format(heroIcon(eventPlayer.getHero()), eventPlayer, "{0} {1}({2}%)".format("{0}{1}".format(eventPlayer.B, L[4]), "{0}{1}".format(eventPlayer.F, L[5]), eventPlayer.D))
    smallMessage(getAllPlayers(), 2)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, (A[0] + A.last()) / 2, 200)
    wait(1, Wait.ABORT_WHEN_FALSE)
    smallMessage(getAllPlayers(), 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, I, 200)
    wait(1, Wait.ABORT_WHEN_FALSE)
    smallMessage(getAllPlayers(), L[6])
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.WHITE, I, 200)
    B = true
    H = false


rule "나가면":
    @Event playerLeft
    
    if not eventPlayer in G.slice(0, 2):
        goto lbl_0
    B = false
    lbl_0:
    G.remove(eventPlayer)


rule "승리":
    @Event playerDied
    @Condition eventPlayer in G.slice(0, 2) == true
    @Condition B == true
    
    B = false
    G.remove(eventPlayer)
    G.append(eventPlayer)
    G[0].B += 1
    eventPlayer.F += 1
    [G[0], eventPlayer].C += 1
    eventPlayer.D = round(100 * (eventPlayer.B / eventPlayer.C))
    G[0].D = round(100 * (G[0].B / G[0].C))
    eventPlayer.E = "{0}{1} {2}".format(heroIcon(eventPlayer.getHero()), eventPlayer, "{0} {1}({2}%)".format("{0}{1}".format(eventPlayer.B, L[4]), "{0}{1}".format(eventPlayer.F, L[5]), eventPlayer.D))
    G[0].E = "{0}{1} {2}".format(heroIcon(G[0].getHero()), G[0], "{0} {1}({2}%)".format("{0}{1}".format(G[0].B, L[4]), "{0}{1}".format(G[0].F, L[5]), G[0].D))
    G[0].cancelPrimaryAction()
    if D != G[0]:
        goto lbl_0
    E += 1
    goto lbl_1
    lbl_0:
    D = G[0]
    E = 1
    lbl_1:
    K = "{0}{1} {2}".format(L[8] if E < 5 else L[9] if E < 10 else L[10] if E < 15 else L[11] if E < 20 else L[12], "{0}{1}".format(heroIcon(D.getHero()), D), "{0}{1}".format(E, L[7]))
    if E > C:
        C = E
        F = K
    G[0].addToScore(1)
    wait(0.1)
    bigMessage(getAllPlayers(), "{0} {1}!".format(G[0], L[13]))
    wait(2)
    eventPlayer.forceButtonPress(Button.JUMP)
    eventPlayer.disableRespawn()
    G.slice(2, 10).forceButtonPress(Button.SECONDARY_FIRE)


rule "위치제한":
    @Event eachPlayer
    @Condition eventPlayer in G.slice(0, 2) == true
    @Condition B == true
    @Condition abs(vect(1, 2, 1) * vectorTowards(I, eventPlayer.getPosition())) >= J
    @Condition eventPlayer.isAlive() == true
    
    damage(eventPlayer, G[not G.index(eventPlayer)], eventPlayer.getMaxHealth() / 10)
    playEffect(eventPlayer, DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, eventPlayer, 50)
    smallMessage(eventPlayer, L[14])
    wait(1)
    if ruleCondition:
        loop()


rule "에임핵 ㅋㅋ":
  @Event eachPlayer
  # 이걸 수정하려고 찾으셨다면 밑에 닉네임을 수정하세요 (by WHIS27#3669)
  @Condition "{0}".format(eventPlayer) == "WIHS27"
    @Condition eventPlayer in G.slice(0, 2) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) or eventPlayer.cheat
    
    if ruleCondition:
        #eventPlayer.tg = eventPlayer.getPlayerClosestToReticle(Team.ALL)
        eventPlayer.tg = G[0] if G[1] == eventPlayer else G[1]
        eventPlayer.startFacing(directionTowards(eventPlayer + (eventPlayer.getEyePosition() - eventPlayer), ((eventPlayer.tg + (eventPlayer.tg.getEyePosition() - eventPlayer.tg) + (vect(0, -0.1, 0) if eventPlayer.tg.isHoldingButton(Button.CROUCH) else vect(0, 0.1, 0))) + vect(eventPlayer.tg.getSpeedInDirection(Vector.LEFT), eventPlayer.tg.getSpeedInDirection(Vector.UP), eventPlayer.tg.getSpeedInDirection(Vector.FORWARD)) * 0.03) + vect(eventPlayer.getSpeedInDirection(Vector.LEFT), eventPlayer.getSpeedInDirection(Vector.UP), eventPlayer.getSpeedInDirection(Vector.FORWARD)) * -0.03), 10000)
        wait()
        loop()
    else:
        eventPlayer.stopFacing()


rule "에임핵 토글":
    @Event eachPlayer
    @Condition "{0}".format(eventPlayer) == "WIHS27"
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    if eventPlayer.cheat == true:
      eventPlayer.cheat = false
    else:
      eventPlayer.cheat = true

    smallMessage(eventPlayer, "cheat: {0}".format(eventPlayer.cheat))