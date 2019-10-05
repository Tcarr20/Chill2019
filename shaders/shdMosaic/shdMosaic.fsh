// Fragment shader
// Offset texture coords based on the tiling size
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_fMosaicSize;
uniform float u_fTextureWidth;
uniform float u_fTextureHeight;

void main()
{
    vec2 block_start = v_vTexcoord;
	block_start.x *= u_fTextureWidth;
	block_start.y *= u_fTextureHeight;
	block_start = floor(block_start/u_fMosaicSize)*u_fMosaicSize;
	block_start.x /= u_fTextureWidth;
	block_start.y /= u_fTextureHeight;
	
	gl_FragColor = v_vColour * texture2D( gm_BaseTexture, block_start );
}
