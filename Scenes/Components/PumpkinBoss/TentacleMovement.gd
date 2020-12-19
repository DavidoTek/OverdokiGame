extends Bone2D

var max_angle
var rest_angle
var speed
var time

func _ready():
	max_angle = randf() * 0.2 + 0.1
	rest_angle = rotation + randf() * 0.1
	speed = randf() * 2 + 1
	time = randf() * 200 + 100
	print(max_angle)
	print(rest_angle)
	print(speed)
	print(time)

func _process(delta):
	time += delta
	rotation = rest_angle + max_angle * sin(time * speed)
