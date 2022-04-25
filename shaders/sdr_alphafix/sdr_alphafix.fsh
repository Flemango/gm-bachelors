varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    vec4 _color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord); 
    _color.a = 1.0; //SET THE ALPHA CHANNEL TO MAX OPACITY TO CORRECT BLENDING MODES
    gl_FragColor = _color;
}
