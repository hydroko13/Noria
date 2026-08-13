package main

import "core:fmt"
import "core:log"

import render "noria_render"
import user_context_package "user_context"



main :: proc() {
	context.logger = log.create_console_logger()


	
	user_context := user_context_package.User_Context{
		render_backend = .OpenGL
	}
	
	context.user_ptr = &user_context 

	log.info("Initializing Noria...")

}
