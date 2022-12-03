<template>
  <div>
    <div id="container">
        <div class="banner-details">
          <div class="glitch active" data-text="Video Production">Video Production</div>
          <div class="glitch" data-text="Marketing">Marketing</div>
          <div class="glitch" data-text="Social Media">Social Media</div>
        </div>
    </div>
    <video id="video" src="~/assets/video/test.mp4" muted playsinline></video>
  </div>
</template>
<script>
  import * as THREE from 'three';
  import vertex from '~/assets/shaders/vertex.glsl'
  import fragment from '~/assets/shaders/fragment.glsl'
  import fragmentParticles from '~/assets/shaders/fragmentParticles.glsl'
  import vertexParticles from '~/assets/shaders/vertexParticles.glsl'
  import vertexSquares from '~/assets/shaders/vertexSquares.glsl'
  import fragmentSquares from '~/assets/shaders/fragmentSquares.glsl'
  export default {
    mounted(){
      var lis = Array.prototype.slice.call( document.querySelectorAll('.glitch'));
      var lis_count = lis.length;
      var active_li_index = 0;

      setInterval(function(){
        var active_li = document.querySelector('#container .glitch.active');

        if( lis.indexOf(active_li) == lis_count-1 )
          active_li_index  = 0;
        else
          active_li_index++;

        active_li.classList.remove('active');
        document.querySelectorAll('#container .glitch')[active_li_index].classList.add('active');
      }, 3000);
      class Sketch {
        constructor(options) {
          this.scene = new THREE.Scene();

          this.container = options.dom;
          this.width = this.container.offsetWidth;
          this.height = this.container.offsetHeight;
          this.renderer = new THREE.WebGLRenderer();
          this.renderer.setPixelRatio(window.devicePixelRatio);
          this.renderer.setSize(this.width, this.height);
          this.renderer.setClearColor(0x000000, 1);
          this.renderer.physicallyCorrectLights = true;
          this.renderer.outputEncoding = THREE.sRGBEncoding;

          this.container.appendChild(this.renderer.domElement);

          this.camera = new THREE.PerspectiveCamera(
            70,
            window.innerWidth / window.innerHeight,
            0.001,
            1000
          );

          // var frustumSize = 10;
          // var aspect = window.innerWidth / window.innerHeight;
          // this.camera = new THREE.OrthographicCamera( frustumSize * aspect / - 2, frustumSize * aspect / 2, frustumSize / 2, frustumSize / - 2, -1000, 1000 );
          this.camera.position.set(0, 0, 2);
          // this.controls = new OrbitControls(this.camera, this.renderer.domElement);
          this.time = new THREE.Clock();
          this.elapsedTime = 0;
          this.previousTime = 0;

          this.isPlaying = true;
          this.scrollY = window.scrollY

          this.count = 50;

          this.raycaster = new THREE.Raycaster();
          this.mouse = {x:0,y:0};


          this.addSquares();
          this.addObjects();
          this.addPoints();

          this.addLines();

          this.mouseMove();
          this.scrollMove();

          this.resize();
          this.render();
          this.setupResize();
          // this.settings();
        }

        settings() {
          let that = this;
          this.settings = {
            progress: 0,
          };
          const dat = require('dat.gui');
          this.gui = new dat.GUI();
          this.gui.add(this.settings, "progress", 0, 1, 0.01);
        }

        setupResize() {
          window.addEventListener("resize", this.resize.bind(this));
        }

        resize() {
          this.width = this.container.offsetWidth;
          this.height = this.container.offsetHeight;
          this.renderer.setSize(this.width, this.height);
          this.camera.aspect = this.width / this.height;

          // image cover
          this.imageAspect = 1;
          let a1; let a2;
          if(this.height/this.width>this.imageAspect) {
            a1 = (this.width/this.height) * this.imageAspect ;
            a2 = 1;
          } else{
            a1 = 1;
            a2 = (this.height/this.width) / this.imageAspect;
          }

          this.material.uniforms.resolution.value.x = this.width;
          this.material.uniforms.resolution.value.y = this.height;
          this.material.uniforms.resolution.value.z = a1;
          this.material.uniforms.resolution.value.w = a2;

          // optional - cover with quad
          const dist = this.camera.position.z;
          const height = 1;
          this.camera.fov = 2 * (180/Math.PI) * Math.atan(height / (2 * dist));

          // if w/h > 1
          if(this.width/this.height > 1){
            this.plane.scale.x = this.camera.aspect;
            // this.plane.scale.y = this.camera.aspect;
          }else{
            this.plane.scale.y = 1/this.camera.aspect;
          }

          this.camera.updateProjectionMatrix();
        }

        mouseMove(){
          let that = this;
          this.testPlane = new THREE.Mesh(new THREE.PlaneGeometry(5,5), new THREE.MeshBasicMaterial())
          window.addEventListener('mousemove',function(event){
            that.mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1;
            that.mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;

            that.raycaster.setFromCamera(that.mouse,that.camera);

            let intersects = that.raycaster.intersectObjects([that.testPlane]);

            if(intersects.length>0){
              that.materialSquares.uniforms.mouse.value = intersects[0].point;
            }

          },false);
        }
        scrollMove(){
          window.addEventListener('scroll', () =>{
            this.scrollY = window.scrollY
          })
        }
        addPoints(){
          this.materialPoints = new THREE.ShaderMaterial({
            side: THREE.DoubleSide,
            uniforms: {
              time: {value: 0 },
              resolution: { value: new THREE.Vector4() },
            },
            transparent:true,
            vertexShader: vertexParticles,
            fragmentShader: fragmentParticles
          });

          this.pointsGeo = new THREE.BufferGeometry();
          let vertices = [];

          for(let i = -this.count/2; i < this.count/2; i++){
            for(let j = -this.count/2; j < this.count/2; j++){
              vertices.push(i/10 + 0.05, j/10 + 0.05, 0);
            }
          }

          this.pointsGeo.setAttribute('position',new THREE.Float32BufferAttribute(vertices, 3));

          this.particles = new THREE.Points(this.pointsGeo,this.materialPoints);
          this.scene.add(this.particles)
          this.particles.position.z = 0.008;
        }

        addLines(){
          let material = new THREE.LineBasicMaterial({color:0xF4B742, transparent: true, opacity:0.1});
          let points = [];

          for(let i = -this.count/2; i < this.count/2; i ++){
            points.push( new THREE.Vector3( -5, i/10 + 0.05, 0 ) );
            points.push( new THREE.Vector3( 5, i/10 + 0.05, 0 ) );
          }
          for(let i = -this.count/2; i < this.count/2; i ++){
            points.push( new THREE.Vector3( i/10 + 0.05, -5, 0 ) );
            points.push( new THREE.Vector3( i/10 + 0.05, 5, 0 ) );
          }

          let geometry = new THREE.BufferGeometry().setFromPoints(points);
          this.lines = new THREE.LineSegments( geometry, material );

          this.scene.add(this.lines);
          this.lines.position.z = 0.009;
        }
        addSquares(){
          this.materialSquares = new THREE.ShaderMaterial({
            extensions: {
              derivatives: "#extension GL_OES_standard_derivatives : enable"
            },
            side: THREE.DoubleSide,
            uniforms: {
              time: {value: 0 },
              mouse: {value: new THREE.Vector3() },
              resolution: { value: new THREE.Vector4() },
              uvRate1: {
                value: new THREE.Vector2(1, 1)
              }
            },
            transparent:true,
            vertexShader: vertexSquares,
            fragmentShader: fragmentSquares
          });
          this.geometrySquares = new THREE.PlaneBufferGeometry(0.1,0.1);
          this.squares = new THREE.InstancedMesh(this.geometrySquares, this.materialSquares,this.count**2);

          let dummy = new THREE.Object3D();

          let counter = 0;
          for(let i = -this.count/2; i < this.count/2; i++){
            for(let j = -this.count/2; j < this.count/2; j++){
              dummy.position.set(i/10, j/10 , 0);
              dummy.updateMatrix();
              this.squares.setMatrixAt(counter ++, dummy.matrix);
            }
          }

          this.scene.add(this.squares);
          this.squares.position.z = 0.01;
        }

        addObjects() {
          let video = document.getElementById('video');
          let texture = new THREE.VideoTexture(video);
          texture.minFilter = THREE.LinearFilter;
          texture.magFilter = THREE.LinearFilter;
          texture.format = THREE.RGBAFormat;

          video.play();

          let that = this;
          this.material = new THREE.ShaderMaterial({
            extensions: {
              derivatives: "#extension GL_OES_standard_derivatives : enable"
            },
            side: THREE.DoubleSide,
            uniforms: {
              time: {value: 0 },
              videoTexture: {value:texture},
              resolution: { value: new THREE.Vector4() },
              uvRate1: {
                value: new THREE.Vector2(1, 1)
              }
            },
            vertexShader: vertex,
            fragmentShader: fragment
          });

          this.geometry = new THREE.PlaneGeometry(1, 1, 1, 1);
          this.overlayGeometry = new THREE.PlaneGeometry(3,3);

          this.overlay = new THREE.Mesh(this.overlayGeometry, new THREE.MeshBasicMaterial({color:0x000000,opacity:0.5,transparent:true}));
          this.plane = new THREE.Mesh(this.geometry, this.material);
          this.scene.add(this.plane);
          this.scene.add(this.overlay);
          this.overlay.position.z = 0.008;

        }

        stop() {
          this.isPlaying = false;
        }

        play() {
          if(!this.isPlaying){
            this.render()
            this.isPlaying = true;
          }
        }

        render() {
          if (!this.isPlaying) return;
          this.elapsedTime = this.time.getElapsedTime()
          // const deltaTime = this.elapsedTime - this.previousTime
          // this.previousTime = this.elapsedTime

          this.scene.rotation.x = -this.mouse.y/10;
          this.scene.rotation.y = this.mouse.x/10;
          this.scene.position.y = - (this.scrollY / this.height) * 0.5 ;

          this.material.uniforms.time.value = this.elapsedTime;
          this.materialSquares.uniforms.time.value = this.elapsedTime;
          this.materialPoints.uniforms.time.value = this.elapsedTime;
          requestAnimationFrame(this.render.bind(this));
          this.renderer.render(this.scene, this.camera);
        }
      }
      new Sketch({
        dom: document.getElementById("container")
      });
    }
  }
</script>

<style lang="css" scoped>
  #container{
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .banner-details{
    position: relative;
    z-index: 10;
    overflow:hidden;
  }
</style>
