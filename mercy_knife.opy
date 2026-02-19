settings {
    "main": {
        "modeName": "멜시 근접",
        "description": "WHIS27#3669 [FHZFA] Last Update: 250518"
    },
    "lobby": {
        "allowPlayersInQueue": true
    },
    "gamemodes": {
        "ffa": {
            "enabledMaps": [
                "workshopExpanse",
                "workshopExpanseNight",
                "workshopChamber",
                "workshopIsland",
                "workshopIslandNight"
            ]
        },
        "general": {
            "gamemodeStartTrigger": "immediately",
            "respawnTime%": 1,
            "scoreToWin": 2727,
            "enableHeroSwitching": false,
            "heroLimit": "off",
            "enableSelfInitiatedRespawn": false
        }
    },
    "heroes": {
        "allTeams": {
            "mercy": {
                "healingReceived%": 10,
                "health%": 100,
                "combatUltGen%": 300,
                "passiveUltGen%": 0,
                "ultGen%": 100,
                "enableInfiniteAmmo": true
            },
            "enabledHeroes": [
                "mercy"
            ]
        }
    }
}

playervar ult 0
playervar gage 1
playervar header 2
playervar target_weapon 3

globalvar gage_desc 0
globalvar gage_inc 1
globalvar boost_loop_delay 2
globalvar prevent_falling_pos 3
globalvar boost_speed 4
globalvar recv_heal 5
globalvar max_health 6
globalvar ult_duration 7
globalvar ult_damage_per 8
globalvar score_kill 9
globalvar score_fall 10
globalvar ult_projectile_speed 11
globalvar fall_stun_delay

#!extension explosionSounds

def hl():
    eventPlayer.setHealth(eventPlayer.getMaxHealth())
    eventPlayer.gage = 100

rule "초기화":
    setMatchTime(0)
    wait()
    pauseMatchTime()
    setMatchTime(27)
    disableScoring()
    gage_desc = createWorkshopSettingFloat("부스트 설정", "게이지 감소량", 5.0, 0.0, 100.0, 0)
    gage_inc = createWorkshopSettingFloat("부스트 설정", "게이지 증가량", 0.5, 0.0, 100.0, 1)
    boost_loop_delay = createWorkshopSettingFloat("부스트 설정", "루프 딜레이", 0.05, 0.016, 1.0, 2)
    boost_speed = createWorkshopSettingFloat("부스트 설정", "부스트 속도 배율", 2.0, 1.0, 5.0, 3)

    prevent_falling_pos = createWorkshopSettingFloat("낙사방지 설정", "높이(-1.0으로 끄기)", -5.0, -10.0, -1.0, 0)
    fall_stun_delay = createWorkshopSettingFloat("낙사방지 설정", "스턴 지속시간", 1.0, 0.0, 10.0, 1)

    recv_heal = createWorkshopSettingFloat("체력 설정", "받는 힐량", 0.5, 0.0, 5.0, 0)
    max_health = createWorkshopSettingInt("체력 설정", "최대 체력", 100, 40, 500, 1)

    ult_duration = createWorkshopSettingFloat("궁극기 설정", "지속 시간", 5.0, 0.1, 60.0, 0)
    ult_damage_per = createWorkshopSettingFloat("궁극기 설정", "데미지 %", 50.0, 0.0, 500.0, 1)
    ult_projectile_speed = createWorkshopSettingFloat("궁극기 설정", "투사체 속도", 200.0, 0.0, 1000.0, 2)

    score_kill = createWorkshopSettingInt("점수 설정", "킬 시", 1, -100, 100, 0)
    score_fall = createWorkshopSettingInt("점수 설정", "낙사 시", -10, -100, 100, 1)



rule "초기화(플레이어)":
    @Event eachPlayer
    eventPlayer.setHealingReceived(recv_heal*100)
    eventPlayer.setMaxHealth(max_health/225*100)
    getAllPlayers().disableNameplatesFor(getAllPlayers())
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setProjectileSpeed(ult_projectile_speed)
    eventPlayer.target_weapon = 1

rule "GUI":
    hudSubtext(getAllPlayers(), "칼찌 by WIHS27#3669", HudPosition.LEFT, 0, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.ALWAYS)
    hudSubtext(getAllPlayers(), "코드: FHZFA", HudPosition.LEFT, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubtext(getAllPlayers(), "{0}: 부스트".format(buttonString(Button.ABILITY_1)), HudPosition.LEFT, 2, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubtext(getAllPlayers(), "{0}: (궁) {1}초동안 딱총".format(buttonString(Button.ULTIMATE), ult_duration), HudPosition.LEFT, 3, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubtext(getAllPlayers(), "*궁 있을 때 인게임에서 없다고 뜨고\nHUD만 나오는거 정상임".format(buttonString(Button.ULTIMATE)), HudPosition.LEFT, 4, Color.GRAY, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudHeader([i for i in getAllPlayers() if i.ult == true], "궁 있음", HudPosition.TOP, 0.2, Color.RED, HudReeval.VISIBILITY, SpecVisibility.NEVER)
    hudHeader([i for i in getAllPlayers() if i.getPosition().y < -1.0 and i.getPosition().y > prevent_falling_pos], "{0} 눌러 다시 올라가기".format(buttonString(Button.ABILITY_2)), HudPosition.TOP, 0.3, Color.RED, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    progressBarHud(getAllPlayers(), localPlayer.gage, "부스트", HudPosition.TOP, 0.1, Color.WHITE, Color.WHITE, ProgressHudReeval.VISIBILITY_AND_VALUES, SpecVisibility.NEVER)
    # 방장기능
    hudSubtext(hostPlayer, "방장 기능", HudPosition.RIGHT, 10, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubtext(hostPlayer, "{0}: 힐, 풀게이지, 궁채우기".format(inputBindingString(Button.INTERACT)), HudPosition.RIGHT, 11, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    hudSubtext(hostPlayer, "{0} {1}: 다 죽이기".format(inputBindingString(Button.CROUCH), inputBindingString(Button.INTERACT)), HudPosition.RIGHT, 12, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.NEVER)
    
rule "플레이어 위에 뜨는거 죽으면 없애기":
    @Event playerDied
    destroyHudText(eventPlayer.header)

rule "스폰":
    @Event eachPlayer
    @Condition eventPlayer.hasSpawned() == true
    @Condition eventPlayer.isAlive() == true
    hl()
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setDamageDealt(100)
    eventPlayer.target_weapon = 1

    wait(0.1)
    createInWorldText(getAllPlayers(), "{2}: {0}hp {1}".format(round(eventPlayer.getHealth()), "*궁*" if eventPlayer.ult == true else "", eventPlayer), eventPlayer, 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_STRING_AND_COLOR, Color.BLACK if eventPlayer.getHealth() == 0 else (Color.RED if eventPlayer.getHealth() <= 40 else (Color.YELLOW if eventPlayer.getHealth() <= 80 else Color.GREEN)), SpecVisibility.ALWAYS)
    eventPlayer.header = getLastCreatedText()

rule "죽이면":
    @Event playerDealtFinalBlow
    hl()
    eventPlayer.setScore(eventPlayer.getScore() + score_kill)

rule "궁준비":
    @Event eachPlayer
    @Condition eventPlayer.getUltCharge() > 90
    eventPlayer.setUltEnabled(false)
    eventPlayer.ult = true

rule "궁씀":
    @Event eachPlayer
    @Condition eventPlayer.ult == true
    @Condition eventPlayer.isHoldingButton(Button.ULTIMATE)
    @Condition eventPlayer.isAlive() == true
    eventPlayer.ult = false
    eventPlayer.setUltEnabled(true)
    eventPlayer.setUltCharge(0)

    smallMessage(getAllPlayers(), "{0}: 딱총 ON(궁 사용, {1}초)".format(eventPlayer, ult_duration))
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setDamageDealt(ult_damage_per)
    eventPlayer.target_weapon = 2

    wait(ult_duration)

    smallMessage(eventPlayer, "궁 끝")
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setDamageDealt(100)
    eventPlayer.target_weapon = 1

rule "쉬프트":
    @Event eachPlayer
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_1) or eventPlayer.gage != 100

    if eventPlayer.isHoldingButton(Button.ABILITY_1) and eventPlayer.gage >= 5:
        eventPlayer.setMoveSpeed(100 * boost_speed)
        eventPlayer.gage -= gage_desc
    else:
        eventPlayer.setMoveSpeed(100)
        eventPlayer.gage += gage_inc
    
    if eventPlayer.gage < 0:
        eventPlayer.gage = 0

    if eventPlayer.gage > 100:
        eventPlayer.gage = 100
    
    wait(boost_loop_delay)
    if ruleCondition:
        loop()

rule "낙사":
    @Event playerDied
    @Condition eventWasEnvironment == true
    eventPlayer.setScore(eventPlayer.getScore() + score_fall)

rule "낙사방지":
    @Event eachPlayer
    @Condition eventPlayer.getPosition().y < -1.0 and eventPlayer.getPosition().y > prevent_falling_pos
    @Condition eventPlayer.isHoldingButton(Button.ABILITY_2) == true
    eventPlayer.teleport(nearestWalkablePosition(eventPlayer.getPosition()))
    eventPlayer.setStatusEffect(null, Status.STUNNED, fall_stun_delay)

rule "무기 고정":
    @Event eachPlayer
    @Condition eventPlayer.getCurrentWeapon() != eventPlayer.target_weapon
    eventPlayer.setWeapon(eventPlayer.target_weapon)
    
rule "어쩔방장사기맵":
    @Event eachPlayer
    @Condition eventPlayer == hostPlayer
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    if eventPlayer.isHoldingButton(Button.CROUCH):
        smallMessage(text="어쩔방장사기맵: 올킬")
        playEffect(getAllPlayers(), DynamicEffect.DVA_SELF_DESTRUCT_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getPosition(), 1000)

        wait(1)
        kill(getAllPlayers().exclude(eventPlayer), eventPlayer)
    else:
        smallMessage(text="어쩔방장사기맵: 방장버프")
        playEffect(getAllPlayers(), DynamicEffect.MOIRA_FADE_DISAPPEAR_SOUND, Color.WHITE, eventPlayer.getPosition(), 1000)
        
        hl()
        eventPlayer.setUltCharge(99)
