extends CanvasLayer

signal game_started
var is_running = false


func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout
		
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	is_running = false
	$StartButton.show()


func start_game():
	is_running = true
	$StartButton.hide()
	game_started.emit()


func update_score(score):
	$ScoreLabel.text = str(score)


func _on_start_button_pressed():
	start_game()


func _on_message_timer_timeout():
	$Message.hide()
