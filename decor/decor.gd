extends RigidBody3D

var collided = false

func _ready():
	mass = 0.5
	gravity_scale = 0.2
	contact_monitor = true
	max_contacts_reported = 1

	linear_velocity.y = 1
	linear_velocity.z = -3
	angular_velocity.z = randf() * PI
	angular_velocity.y = randf() * PI
	angular_velocity.x = randf() * PI


func _on_body_entered(body):

	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	gravity_scale = 0
	Globals.hit(Globals.decorType)
	collided = true
	
	

func _on_timer_timeout():
	if collided == false:
		queue_free()
