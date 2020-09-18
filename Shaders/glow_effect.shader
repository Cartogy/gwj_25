shader_type spatial;
render_mode depth_draw_alpha_prepass, cull_disabled;
//render_mode blend_add;

uniform vec4 emission : hint_color;
uniform float emission_energy;

uniform sampler2D emission_texture;
uniform sampler2D base_texture : hint_albedo;

uniform vec4 albedo : hint_color;
uniform vec4 glow_color : hint_color = vec4(1.0);

uniform float fresnel_power = 3.0;
uniform float fresnel_color_intensity = 1.0;
uniform vec4 fresnel_color : hint_color;

uniform float fresnel_pulse_speed = 1.0;
uniform float emission_pulse_speed = 1.0;

void fragment() {
	vec4 current_color = texture(SCREEN_TEXTURE,UV);
	vec3 emission_color = texture(emission_texture, UV).rgb;
	vec4 albedo_tex = texture(base_texture,UV);
	
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	EMISSION = emission_color.rgb * glow_color.rgb * vec3(5.0);
	ALPHA = 1.0;
	
	float fresnel = pow(1.0 - dot(NORMAL, VIEW), fresnel_power);
	/*if (emission_color.r > 0f) {
		ALBEDO = (emission_color.xyz + glow_color.xyz);
	} else {
		ALBEDO = current_color.xyz;
	}*/
	float fresnel_time_factor = clamp(sin(TIME * fresnel_pulse_speed), 0.15, 1);
	float emission_time_factor = clamp(sin(TIME * emission_pulse_speed) + 0.33, 0.33, 1);
	
	EMISSION = ((emission.rgb*emission_color)*emission_energy * emission_time_factor);
	
}