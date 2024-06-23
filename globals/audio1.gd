extends AudioStreamPlayer


const level_music = preload("res://audio/[No Copyright Music] Jazz Trio loop music Imagination.mp3")

func _play_music(music: AudioStream, volume = -20):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()
	
func _play_music_level():
	_play_music(level_music)
