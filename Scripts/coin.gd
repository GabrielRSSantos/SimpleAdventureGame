extends StaticBody2D

func _on_coin_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$CoinArea/CoinAreaCollision.set_deferred("disabled", true)
		$CoinAnimation.hide() 
		$CoinAudio.play()
		await $CoinAudio.finished
		self.queue_free()
