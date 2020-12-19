extends Area2D

export var killable = true
export var max_health = 20
export var ignore_projectile = true  # projectiles won't be destroyed when hit
export var entity_type = "Entity"
var health = max_health

# heal the entity
func heal(hl):
	health += hl
	if health > max_health:
		health = max_health
	elif health < 0:
		health = 0
	check_health()

# get health of the entity
func get_health():
	return health

func check_health():
	if health <= 0 and killable:
		get_tree().queue_delete(self)

# gets called when projectile/object hits the entity
func process_collision(collision_object):
	if collision_object.entity_type == "Projectile":
		process_projectile(collision_object)
	elif collision_object.entity_type == "Medkit":
		process_medkit(collision_object)

func process_projectile(collision_object):
	if not ignore_projectile:
		if collision_object.get_sender().name == self.name:
			return
		heal(-collision_object.max_health)
		get_tree().queue_delete(collision_object)
		projectile_effect()

func projectile_effect():
	pass  # implemented in entity if necessary (-> AnimationPlayer for effects)

func process_medkit(collision_object):
	pass
