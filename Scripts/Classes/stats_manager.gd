extends Node



var health

func get_max_health() -> int:
	return $BaseStats.health + $BonusStats.health
	
func update_health(val: int):
	$CurrentStats.update_health(val)
	# Limit health
	if $CurrentStats.health > get_max_health():
		$CurrentStats.heatlh = get_max_health()
