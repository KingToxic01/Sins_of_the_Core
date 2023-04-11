extends Control

var heart = 4: set = SetHeart
var max_heart = 4: set = SetMaxHeart

@onready var label = $Label

func SetHeart(value):
	heart = clamp(value, 0, max_heart)
	

func SetMaxHeart(value):
	max_heart = max(value,1)
	

#func _ready():
#	self.max_heart = PlayerStats.max_health
#	self.heart = PlayerStats.health
#	PlayerStats.connect("change_health", SetHeart(self) )
