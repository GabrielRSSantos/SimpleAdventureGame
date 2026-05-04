class_name FlyEnemyState extends State

const IDLE = "Idle"
const DEAD = "Dead"
const HURT = "Hurt"
const FALLING = "Fall"

var fly_enemy: FlyEnemy

func _ready() -> void:
	await owner.ready
	fly_enemy = owner as FlyEnemy
	assert(fly_enemy != null, "The EnemyState state type must be used only in the enemy scene. It needs the owner to be a Enemy node.")
