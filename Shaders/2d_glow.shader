shader_type canvas_item;

uniform sampler2D emission_texture;
uniform vec4 glow_color : hint_color = vec4(1.0);

uniform float emission_pulse_speed = 1.0;
uniform float emission_energy = 0.0;

void fragment() {
	vec4 current_color = texture(TEXTURE, UV);
	vec4 emission_color = texture(emission_texture, UV);
	
	float emission_time_factor = clamp(sin(TIME * emission_pulse_speed) + 0.33, 0.33, 1);
	
	if (emission_color.r > 0.0) {
		COLOR = glow_color * emission_energy * emission_time_factor
	} else {
		COLOR = current_color
	}
	
}