uniform float time;
uniform float progress;
uniform sampler2D videoTexture;
uniform vec4 resolution;

varying vec2 vUv;
varying vec3 vPosition;

void main(){
  vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);
  vec4 image = texture2D(videoTexture,newUV);
  gl_FragColor=image;
}
