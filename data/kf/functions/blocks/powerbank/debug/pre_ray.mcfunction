#> kf:blocks/powerbank/debug/pre_ray

# Remove tag
execute at @s run tag @a[distance=..2.5,tag=.temp] remove .temp

# If player nearby
execute at @s store success score .playerNearby k.Values if entity @p[distance=..1.5] run tag @a[distance=..1.5] add .temp

# Raycast for debug
execute if score .playerNearby k.Values matches 1 facing entity @s feet run function kf:blocks/powerbank/debug/raycast
