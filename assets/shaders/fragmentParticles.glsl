uniform float time;
uniform float progress;
uniform vec4 resolution;

varying vec2 vUv;
varying vec3 vPosition;

void main(){
  vec2 newUV = (vUv - vec2(0.5))*resolution.zw + vec2(0.5);
  vec3 color = vec3(0.);
  color.r=244./255.;
  color.g=183./255.;
  color.b=66./255.;
  gl_FragColor = vec4(color,.6);
}
