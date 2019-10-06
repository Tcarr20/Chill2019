varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_fpixelW;
uniform float u_fpixelH;

void main()
{
	vec2 offsetX;
	vec2 offsetY;
	offsetX.x = u_fpixelW;
	offsetY.y = u_fpixelH;
	
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
	float preAlpha = alpha;
	
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetX ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetX ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetY ).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetY ).a);
	
	if (preAlpha == 0.0) { gl_FragColor = v_vColour; }
	else { gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord ); }
	gl_FragColor.a = alpha;
}
