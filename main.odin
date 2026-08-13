package main

import "core:fmt"
import "core:log"

import render "noria_render"
import user_context_package "user_context"



main :: proc() {

	log.info("Initializing User Context...")
	
	context.logger = log.create_console_logger()

	
	
	user_context := user_context_package.User_Context{
		render_backend = .OpenGL
	}
	
	context.user_ptr = &user_context 

	log.info("Initializing Window...")

	if !render.init_window_system() {
		log.info("Failed to initialize window system")
		return
	}
	log.info("Successfully initialized window system")

	defer render.deinit_window_system()

	window := render.new_window(800, 600, "Hello")

	render.window_select(&window)

	// Main Game Loop
	for { 
		render.window_update(&window)

		render.window_render(&window)
		
		if render.window_was_closed(&window) {
			break
		}
	}
	
}
