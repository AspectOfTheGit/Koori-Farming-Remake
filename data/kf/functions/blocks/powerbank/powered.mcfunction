#> kf:blocks/powerbank/powered

# Particle
particle wax_off ~ ~-0.3 ~ .5 .5 .5 1 1 normal

# Manage Power
execute store result score .tempUUID kf.PowerUUIDs store result score @s kf.PowerUUIDs run data get entity @s UUID[0]
scoreboard players reset .poweredEntities kf.Power
    ## No Tier
        #> Give Power
        execute as @e[tag=kf.RequiresPower,tag=!kf.Powered,distance=..30] run function kf:blocks/powerbank/power_entities
        #> Remove Power
        execute as @e[tag=kf.Powered,distance=..30] if score @s kf.PowerUUIDs = .tempUUID kf.PowerUUIDs run scoreboard players add .poweredEntities kf.Power 1
        scoreboard players operation .poweredEntities kf.Power *= .powerMultiplier kf.Power
        scoreboard players operation @s kf.Power -= .poweredEntities kf.Power
        #> Cap Power
        execute if score @s kf.Power matches 30000.. run scoreboard players set @s kf.Power 30000

# Name
execute if score .poweredEntities kf.Power matches 1.. run data modify entity @s CustomName set value '{"text":"Active","color":"green"}'
execute unless score .poweredEntities kf.Power matches 1.. run data modify entity @s CustomName set value '{"text":"Inactive","color":"aqua"}'