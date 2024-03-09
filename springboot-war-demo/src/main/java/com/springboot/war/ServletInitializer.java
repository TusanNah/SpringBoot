package com.springboot.war;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SpringbootWarDemoApplication.class);
	}
}

//Interface definition
interface Playable {
	void play();

	void pause();
}

//Concrete class representing an audio player
class AudioPlayer implements Playable {
	String audioFile;

	AudioPlayer(String audioFile) {
		this.audioFile = audioFile;
	}

	@Override
	public void play() {
		System.out.println("Playing audio: " + audioFile);
	}

	@Override
	public void pause() {
		System.out.println("Pausing audio: " + audioFile);
	}
}

//Concrete class representing a video player
class VideoPlayer implements Playable {
	String videoFile;

	VideoPlayer(String videoFile) {
		this.videoFile = videoFile;
	}

	@Override
	public void play() {
		System.out.println("Playing video: " + videoFile);
	}

	@Override
	public void pause() {
		System.out.println("Pausing video: " + videoFile);
	}
}
