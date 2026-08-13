package noria_render

import "core:strings"
import "core:log"
import glfw "vendor:glfw"

Window :: struct {
	window_handle: glfw.WindowHandle
}

init_window_system :: proc() -> (ok: bool) {
	res := glfw.Init()
	if res {
		log.info("Glfw initialized successfully")
		return true
	} else {
		log.info("Failed to initialize glfw")
		return false
	}
}

deinit_window_system :: proc() {
	glfw.Terminate()
}

new_window :: proc(width: int, height: int, title: string) -> Window {

	render_backend := get_render_backend_from_context()

	if render_backend == .OpenGL {
		glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 3)
		glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 3)
		glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE)
	}

	title_cstring := strings.clone_to_cstring(title)

	window_handle := glfw.CreateWindow((i32)(width), (i32)(height), title_cstring, nil, nil)

	delete(title_cstring)

	

	

	
	return Window {
		window_handle = window_handle
	}
}

window_select :: proc(win: ^Window) {
	glfw.MakeContextCurrent(win.window_handle)
}

window_was_closed :: proc(win: ^Window) -> bool {
	return bool(glfw.WindowShouldClose(win.window_handle))
}

window_update :: proc(win: ^Window) {
	
	glfw.PollEvents()

	
}

window_render :: proc(win: ^Window) {
	
	glfw.SwapBuffers(win.window_handle)
	
}

