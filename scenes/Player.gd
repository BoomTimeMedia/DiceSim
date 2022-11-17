extends CharacterBody2D
signal player_dead

var speed = 200



var health = 100
var maxHealth = 100
var currDefence = 0
var DiceOutcome = 1

func _ready():
	$"/root/GlobalScript".connect("player_hit",Callable(self,"_hit"))


func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	velocity = velocity.normalized() * speed
		
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity

func _hit(damage, cause):
	var total_defence = currDefence + DiceOutcome
	health = health - (damage -total_defence)
	print("Damage Cause: ", cause, " Current Health: ", health, "/", maxHealth)
	print("Gross Dmg Done: ", damage, " Total_Defence ", total_defence, " Net Dmg: ", (total_defence-damage))
	if(health <= 0):
	   health = 0
	   emit_signal("player_dead")

