varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelW;
uniform float pixelH;
uniform vec3 pixelC;

void main()
{
	vec2 offset;
	offset.x = pixelW;
	offset.y = pixelH;
	
	float preAlpha = sign(texture2D( gm_BaseTexture, v_vTexcoord ).a);
	float alpha = preAlpha;
	
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offset ).a);
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
	gl_FragColor.r = gl_FragColor.r + (pixelC.x * (1.0 - preAlpha));
	gl_FragColor.g = gl_FragColor.g + (pixelC.y * (1.0 - preAlpha));
	gl_FragColor.b = gl_FragColor.b + (pixelC.z * (1.0 - preAlpha));
}
