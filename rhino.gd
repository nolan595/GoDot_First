extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 40
var player
var chase= false

func _ready():
	get_node("AnimatedSprite2D").play("idle")

func _physics_process(delta):
	
	velocity.y += gravity * delta
	if chase == true:
		if get_node("AnimatedSprite2D").animation != "hit":
			get_node("AnimatedSprite2D").play("run")
		player = get_node("../../Player/NewPlayer")
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * speed
	else:
		if get_node("AnimatedSprite2D").animation != "death":
			get_node("AnimatedSprite2D").play("idle")
		velocity.x = 0
	move_and_slide()
	



func _on_player_detection_range_body_entered(body):
	if body.name == "NewPlayer":
		chase = true


func _on_player_detection_range_body_exited(body):
	if body.name == "NewPlayer":
		chase = false


func _on_mob_death_body_entered(body):
	if body.name == "NewPlayer":
		
		death()
		
		
func death():
	Game.Gold += 5
	Utils.saveGame()
	chase = false
	get_node("AnimatedSprite2D").play("death")
	await get_node("AnimatedSprite2D").animation_finished
	self.queue_free()


func _on_area_2d_body_entered(body):
	if body.name == "NewPlayer":
		Game.playerHP -= 3
		death()
