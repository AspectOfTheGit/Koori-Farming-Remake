#> kf:selectors/block_display

# Sprinkler
execute if entity @s[tag=kf.Sprinkler] run function kf:blocks/sprinkler/_main

# Harvester
execute if entity @s[tag=kf.Harvester] unless entity @e[type=slime,tag=kf.Harvester,distance=...8] run kill @s