//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform  float roomWidth;
uniform  float roomHieght;


void main()
{
	if((v_vTexcoord.x < roomWidth) && (v_vTexcoord.x > 0.0)  && (v_vTexcoord.y < roomHieght) && (v_vTexcoord.y > 0.0))
	{
			gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	}else {
		gl_FragColor = v_vColour * 0.0;
	}
	
}
