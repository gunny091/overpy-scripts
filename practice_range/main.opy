settings {
    "main": {
        "modeName": "훈련장+",
        "description": "Practice Range 2.2 by PMAJellies | WIHS27#3669 버그수정/업데이트"
    },
    "lobby": {
        "allowPlayersInQueue": true,
        "team1Slots": 6
    },
    "gamemodes": {
        "practiceRange": {},
        "general": {
            "gamemodeStartTrigger": "manual",
            "respawnTime%": 25,
            "heroLimit": "off"
        }
    },
    "heroes": {
        "team2": {
            "genji": {
                "ability2Cooldown%": 0
            },
            "reinhardt": {
                "enableSpawningWithUlt": true,
                "passiveUltGen%": 500,
                "ultGen%": 500,
                "secondaryFireCooldown%": 0,
                "secondaryFireRechargeRate%": 500,
                "damageDealt%": 10,
                "ability2Cooldown%": 0
            },
            "reaper": {
                "ability2Cooldown%": 0,
                "ability1Cooldown%": 0
            },
            "sombra": {
                "passiveUltGen%": 500,
                "ultGen%": 500,
                "ability1Cooldown%": 0
            },
            "symmetra": {
                "ability1Cooldown%": 0
            },
            "widowmaker": {
                "ability1Cooldown%": 0
            },
            "tracer": {
                "ability2Cooldown%": 0,
                "ability1Cooldown%": 0,
                "damageDealt%": 10
            }
        },
        # "allTeams": {
        #     "pharah": {
        #         "enableSecondaryFireUnlimitedFuel": true
        #     },
        #     "general": {
        #         "abilityCooldown%": 0,
        #         "enableInfiniteAmmo": true
        #     }
        # }
    }
}

globalvar mercySphere 26

playervar iscreatedbot 26
playervar isInMenu 27
playervar menuValue 28
playervar infUlt 29
playervar damageBoost 30
playervar boostTime 31
playervar isInBoost 32
playervar isFlying 33
playervar infAmmo 34
playervar infAbill 35
playervar originAmmo 36

#!include "original.opy"
#!include "chadol.opy"