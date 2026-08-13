package noria_render

import "../user_context"



get_render_backend_from_context :: proc() -> user_context.Render_Backend {
	user_context_ptr := (^user_context.User_Context)(context.user_ptr)
	return user_context_ptr.render_backend
}