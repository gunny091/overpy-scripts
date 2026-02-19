#!mainFile "main.opy"

def good_sound():
    playEffect(eventPlayer, DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, eventPlayer.getPosition(), 100)
    
def bad_sound():
    playEffect(eventPlayer, DynamicEffect.DEBUFF_IMPACT_SOUND, Color.WHITE, eventPlayer.getPosition(), 100)

rule "HUD":
    @Event eachPlayer
    @Team 1

    hudSubtext(eventPlayer, "원본: Practice Range 2.2 by PMAJellies (AJERA)", HudPosition.RIGHT, -12, Color.GREEN, HudReeval.VISIBILITY, SpecVisibility.ALWAYS)
    hudSubtext(eventPlayer, "WIHS27#3669 업데이트 v2.7 (7N5FA)", HudPosition.RIGHT, -11, Color.BLUE, HudReeval.VISIBILITY, SpecVisibility.ALWAYS)

    hudSubtext(eventPlayer, " {0} + {1} : 이속 증가, 무적".format(buttonString(Button.INTERACT), buttonString(Button.MELEE)), HudPosition.RIGHT, -3, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)
    hudSubtext(eventPlayer, " {0} + {1} : 메뉴 열기".format(buttonString(Button.CROUCH), buttonString(Button.MELEE)), HudPosition.RIGHT, -1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.ALWAYS)

    hudHeader(eventPlayer if eventPlayer.isInMenu else null, "메뉴 | {0}, {1} : 선택 변경, {2} : 선택".format(buttonString(Button.PRIMARY_FIRE), buttonString(Button.SECONDARY_FIRE), buttonString(Button.INTERACT)), HudPosition.TOP, 1, Color.WHITE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer if eventPlayer.isInMenu else null, "취소", HudPosition.TOP, 2, Color.RED if eventPlayer.menuValue == 0 else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer if eventPlayer.isInMenu else null, "힐", HudPosition.TOP, 3, Color.GREEN if eventPlayer.menuValue == 1 else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer if eventPlayer.isInMenu else null, "즉사", HudPosition.TOP, 4, Color.GREEN if eventPlayer.menuValue == 2 else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer if eventPlayer.isInMenu else null, "무한궁: {0}".format("켜짐" if eventPlayer.infUlt else "꺼짐"), HudPosition.TOP, 5, Color.GREEN if eventPlayer.menuValue == 3 else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer if eventPlayer.isInMenu else null, "무한탄창: {0}".format("켜짐" if eventPlayer.infAmmo else "꺼짐"), HudPosition.TOP, 6, Color.GREEN if eventPlayer.menuValue == 4 else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer if eventPlayer.isInMenu else null, "무한스킬: {0}".format("켜짐" if eventPlayer.infAbill else "꺼짐"), HudPosition.TOP, 7, Color.GREEN if eventPlayer.menuValue == 5 else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer if eventPlayer.isInMenu else null, "데미지 5배: {0}".format("켜짐" if eventPlayer.damageBoost else "꺼짐"), HudPosition.TOP, 8, Color.GREEN if eventPlayer.menuValue == 6 else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    hudSubtext(eventPlayer if eventPlayer.isInMenu else null, "비행: {0}".format("켜짐" if eventPlayer.isFlying else "꺼짐"), HudPosition.TOP, 9, Color.GREEN if eventPlayer.menuValue == 7 else Color.WHITE, HudReeval.VISIBILITY_STRING_AND_COLOR, SpecVisibility.DEFAULT)
    
    hudHeader(eventPlayer if eventPlayer.isInBoost else null, eventPlayer.boostTime, HudPosition.TOP, 1, Color.ORANGE, HudReeval.VISIBILITY_AND_STRING, SpecVisibility.DEFAULT)


rule "초기화":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false

    eventPlayer.isInMenu = false

    eventPlayer.infUlt = false
    eventPlayer.infAmmo = false
    eventPlayer.infAbill = false
    eventPlayer.damageBoost = false
    eventPlayer.isFlying = false

    eventPlayer.boostTime = 0


rule "사격장으로":
    @Event eachPlayer
    @Team 1
    @Condition distance(eventPlayer.getPosition(), vect(60.024, 2.550, 38.255)) <= 2
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true

    eventPlayer.teleport(vect(78.409, -4, 52.333))
    eventPlayer.setFacing(vect(1, -0.28, 0.6), Relativity.TO_WORLD)

    good_sound()


rule "이속무적":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isHoldingButton(Button.INTERACT) == true
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    @Condition eventPlayer.isInMenu == false
    @Condition eventPlayer.isInBoost == false

    eventPlayer.setMoveSpeed(300)
    eventPlayer.setJumpVerticalSpeed(300)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, 5)
    eventPlayer.boostTime = 5
    chase(eventPlayer.boostTime, 0, duration=5, ChaseReeval.NONE)
    eventPlayer.isInBoost = true

    wait(5)

    eventPlayer.setMoveSpeed(100)
    eventPlayer.setJumpVerticalSpeed(100)
    eventPlayer.boostTime = 0
    eventPlayer.isInBoost = false


rule "낙사방지":
    @Event playerDied
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventWasEnvironment == true

    eventPlayer.resurrect()
    eventPlayer.teleport(nearestWalkablePosition(eventPlayer.getPosition()))
    eventPlayer.setStatusEffect(null, Status.ASLEEP, 0.5)


rule "메뉴: 열기":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isHoldingButton(Button.CROUCH) == true
    @Condition eventPlayer.isHoldingButton(Button.MELEE) == true
    @Condition eventPlayer.isInMenu == false

    eventPlayer.isInMenu = true
    eventPlayer.menuValue = 0

    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.setSecondaryFireEnabled(false)

    good_sound()

#!define RULE_COUNT 7

rule "메뉴: 위로":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isInMenu == true
    @Condition eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) == true

    eventPlayer.menuValue = eventPlayer.menuValue + 1
    if eventPlayer.menuValue > RULE_COUNT:
        eventPlayer.menuValue = RULE_COUNT
        bad_sound()
    else:
        good_sound()


rule "메뉴: 아래로":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isInMenu == true
    @Condition eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) == true

    eventPlayer.menuValue = eventPlayer.menuValue - 1
    if eventPlayer.menuValue < 0:
        eventPlayer.menuValue = 0
        bad_sound()
    else:
        good_sound()


def menu_cancel():
    bigMessage(eventPlayer, "취소")
    bad_sound()


def menu_killself():
    kill(eventPlayer, null)
    bigMessage(eventPlayer, "즉사")
    good_sound()


def menu_heal():
    eventPlayer.setHealth(eventPlayer.getMaxHealth())
    bigMessage(eventPlayer, "힐")
    good_sound()


rule "무한궁":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.getUltCharge() < 100
    @Condition eventPlayer.infUlt == true

    eventPlayer.setUltCharge(100)
    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START


def menu_infult():
    if eventPlayer.infUlt:
        eventPlayer.infUlt = false
        eventPlayer.setUltCharge(0)
        bigMessage(eventPlayer, "무한궁: 꺼짐")
        bad_sound()
    else:
        eventPlayer.infUlt = true
        bigMessage(eventPlayer, "무한궁: 켜짐")
        good_sound()


def menu_damageboost():
    if eventPlayer.damageBoost:
        eventPlayer.damageBoost = false
        eventPlayer.setDamageDealt(100)
        bigMessage(eventPlayer, "데미지 5배: 꺼짐")
        bad_sound()
    else:
        eventPlayer.damageBoost = true
        eventPlayer.setDamageDealt(500)
        bigMessage(eventPlayer, "데미지 5배: 켜짐")
        good_sound()


rule "비행":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isFlying == true
    @Condition eventPlayer.isOnGround() == false
    @Condition eventPlayer.isHoldingButton(Button.JUMP) == true

    eventPlayer.applyImpulse(Vector.UP, 4, Relativity.TO_PLAYER, Impulse.CANCEL_CONTRARY_MOTION)
    wait()
    if RULE_CONDITION:
        goto RULE_START


def menu_flying():
    if eventPlayer.isFlying:
        eventPlayer.isFlying = false
        bigMessage(eventPlayer, "비행: 꺼짐")
        bad_sound()
    else:
        eventPlayer.isFlying = true
        bigMessage(eventPlayer, "비행: 켜짐")
        good_sound()


rule "무한탄창":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.infAmmo == true

    if eventPlayer.getMaxAmmo(0) > 0:
        if eventPlayer.getAmmo(0) > 0 and eventPlayer.getAmmo(0) < 100:
            eventPlayer.setAmmo(0, 999)
    else:
        eventPlayer.setAmmo(0, 999)
    if eventPlayer.getMaxAmmo(1) > 0:
        if eventPlayer.getAmmo(1) > 0 and eventPlayer.getAmmo(1) < 100:
            eventPlayer.setAmmo(1, 999)
    else:
        eventPlayer.setAmmo(1, 999)
    wait(1)
    if RULE_CONDITION:
        goto RULE_START


def menu_infammo():
    if eventPlayer.infAmmo:
        eventPlayer.infAmmo = false
        eventPlayer.setAmmo(0, 0)
        eventPlayer.setAmmo(1, 0)
        bigMessage(eventPlayer, "무한탄창: 꺼짐")
        bad_sound()
    else:
        eventPlayer.infAmmo = true
        bigMessage(eventPlayer, "무한탄창: 켜짐")
        good_sound()

rule "무한스킬":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.infAbill == true

    eventPlayer.setAbilityCooldown(Button.ABILITY_1, 0)
    eventPlayer.setAbilityCooldown(Button.ABILITY_2, 0)
    eventPlayer.setAbilityCooldown(Button.PRIMARY_FIRE, 0)
    eventPlayer.setAbilityCooldown(Button.SECONDARY_FIRE, 0)
    eventPlayer.setAbilityCooldown(Button.JUMP, 0)
    eventPlayer.setAbilityCooldown(Button.RELOAD, 0)

    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START


rule "무한스킬: 트레이서":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.infAbill == true
    @Hero tracer

    eventPlayer.setAbilityCharge(Button.ABILITY_1, 3)

    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START


rule "무한스킬: 정크랫":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.infAbill == true
    @Hero junkrat

    eventPlayer.setAbilityCharge(Button.ABILITY_1, 3)

    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START


rule "무한스킬: 브리기테":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.infAbill == true
    @Hero brigitte

    eventPlayer.setAbilityCharge(Button.ABILITY_2, 3)

    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START


rule "무한스킬: 라인하르트":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.infAbill == true
    @Hero reinhardt

    eventPlayer.setAbilityCharge(Button.ABILITY_2, 2)

    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START


rule "무한스킬: 자리야":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.infAbill == true
    @Hero zarya

    eventPlayer.setAbilityCharge(Button.ABILITY_1, 2)
    eventPlayer.setAbilityCharge(Button.ABILITY_2, 2)

    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START


rule "무한스킬: 프레야":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.infAbill == true
    @Hero freja

    eventPlayer.setAbilityCharge(Button.ABILITY_1, 2)

    wait(0.1)
    if RULE_CONDITION:
        goto RULE_START

def menu_infabill():
    if eventPlayer.infAbill:
        eventPlayer.infAbill = false
        bigMessage(eventPlayer, "무한스킬: 꺼짐")
        bad_sound()
    else:
        eventPlayer.infAbill = true
        bigMessage(eventPlayer, "무한스킬: 켜짐")
        good_sound()


rule "메뉴: 선택":
    @Event eachPlayer
    @Team 1
    @Condition eventPlayer.isDummy() == false
    @Condition eventPlayer.isInMenu == true
    @Condition eventPlayer.isHoldingButton(Button.INTERACT)

    switch eventPlayer.menuValue:
        case 0:
            menu_cancel()
            break
        case 1:
            menu_heal()
            break
        case 2:
            menu_killself()
            break
        case 3:
            menu_infult()
            break
        case 4:
            menu_infammo()
            break
        case 5:
            menu_infabill()
            break
        case 6:
            menu_damageboost()
            break
        case 7:
            menu_flying()
            break

    eventPlayer.isInMenu = false

    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.setSecondaryFireEnabled(true)

