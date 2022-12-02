<template>
  <section>
    <div id="aboutMessage" class="my-20 mx-auto text-center uppercase font-bold opacity-0 content-p" style="max-width:120ch;transform:translateY(-100%)">
      <span class="fs-400">Whether it's media production, or media management... be it for personal use or for your business - we are here for exactly for that very reason.</span>
    </div>
    <div class="marquee-container my-20">
      <div class="marquee" style="--play:running; --direction:normal; --duration:30s; --delay:0s; --iteration-count:infinite;">
        <span class="marquee-item" v-for="(sample,index) in samples" :key="index">
          <img class="marquee-img" :src="sample.image.url" alt="sample">
        </span>
      </div>
      <div class="marquee" style="--play:running; --direction:normal; --duration:30s; --delay:0s; --iteration-count:infinite;padding-bottom:3vw;">
        <span class="marquee-item" v-for="(sample,index) in samples" :key="index">
          <img class="marquee-img" :src="sample.image.url" alt="sample">
        </span>
      </div>
    </div>
    <div id="aboutSection" class="relative content-p mt-15">
      <div>
        <span class="fs-500 about-text">
          We're a media studio with a committed team working on selected projects for startups and companies, bringing what they envision to life through:
          <span class="inner-text">branding, visual design & development of the highest quality.</span>
        </span>
        <div class="video-control">
          <div class="control">
            <div @click="runVideo" id="magnetic-wrap">
              <div id="magnetic-area" class="magnetic-size"></div>
              <div id="magnetic-content">
                <div class="my-burger fs-400">
                  <div class="play-icon play active">
                    <span class="fs-400">Play</span>
                    <font-awesome-icon :icon="['far', 'circle-play']"/>
                  </div>
                  <div class="play-icon pause">
                    <span class="fs-400">Pause</span>
                    <font-awesome-icon :icon="['far', 'circle-pause']"/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="aspect-ratio">
        <div class="relative w-full h-full">
          <div class="about-vid-wrapper">
            <video class="about-video" playsinline src="~/assets/video/zest.mp4"></video>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
  import sample1 from '~/assets/images/logo-samples/sample1.png'
  import sample2 from '~/assets/images/logo-samples/sample2.png'
  import sample3 from '~/assets/images/logo-samples/sample3.png'
  import sample4 from '~/assets/images/logo-samples/sample4.png'
  import sample5 from '~/assets/images/logo-samples/sample5.png'
  import sample6 from '~/assets/images/logo-samples/sample6.png'
  import sample7 from '~/assets/images/logo-samples/sample7.png'
  import sample8 from '~/assets/images/logo-samples/sample8.png'

  export default {
    data(){
      return{
        samples:[
          {
            image:{
              url:sample1
            },
          },
          {
            image:{
              url:sample2
            },
          },
          {
            image:{
              url:sample3
            },
          },
          {
            image:{
              url:sample4
            },
          },
          {
            image:{
              url:sample5
            },
          },
          {
            image:{
              url:sample6
            },
          },
          {
            image:{
              url:sample7
            },
          },
          {
            image:{
              url:sample8
            },
          },
        ],
        videoState:false
      }
    },
    mounted(){
      let gsap = this.$gsap;
      gsap.to("#aboutMessage", {
        scrollTrigger: {
          trigger:'.marquee-container',
          start:'bottom bottom'
        },
        y: 0,
        opacity:1,
        duration:2,
        ease:'bounce'
      });
      gsap.to(".about-text", {
        scrollTrigger: {
          trigger:'.marquee-container',
          start:'center center'
        },
        left: 0,
        opacity:1,
        duration:2,
        ease:'elastic'
      });
      gsap.to("#magnetic-wrap", {
        scrollTrigger: {
          trigger:'.about-text',
          start:'center center'
        },
        y:0,
        opacity:1,
        duration:1.5,
        ease:'expo'
      });
      var mArea = document.querySelector('#magnetic-area');
      // 1. Set the function and variables
      function parallaxIt(e, target, movement = 1){
        var boundingRect = mArea.getBoundingClientRect();
        var relX = e.pageX - boundingRect.left;
        var relY = e.pageY - boundingRect.top;
        var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        gsap.to(target, {
          x: (relX - boundingRect.width/2) * movement,
          y: (relY - boundingRect.height/2 - scrollTop) * movement,
          ease: "power1",
          duration: 0.6
        });
      }

      // 2. Call the function
      function callParallax(e){
        parallaxIt(e, '#magnetic-content');
      }


      mArea.addEventListener('mousemove', function(e){
        callParallax(e);
      });

      mArea.addEventListener('mouseleave', function(e){
        gsap.to('#magnetic-content', {
          scale:1,
          x: 0,
          y: 0,
          ease: "power3",
          duration: 0.6
        });
      });
    },
    methods: {
      runVideo(){
        if(this.videoState){
          document.querySelector('.about-video').pause();
          document.querySelector('.play-icon.play').classList.add('active');
          document.querySelector('.play-icon.pause').classList.remove('active');
        }else{
          document.querySelector('.about-video').play();
          document.querySelector('.play-icon.play').classList.remove('active');
          document.querySelector('.play-icon.pause').classList.add('active');
        }
        this.videoState = !this.videoState
      }
    },
  }
</script>

<style lang="scss" scoped>
  section{
    overflow:hidden;
  }
  .about-text{
    position: relative;
    left:-100%;
    opacity:0;
    display: block;
    transform: translate(0px, -48.45px);
    mix-blend-mode: difference;
    line-height: 1.1964285714;
    letter-spacing: -.005em;
  }
  .video-control .control{
    display: inline-block;
    border-radius: 50%;
    cursor: pointer;
    backdrop-filter: blur(4px);
  }
  .aspect-ratio{
    aspect-ratio: 1.5;
    position: relative;
    height: 42.6041666667vw;
    min-height: 352px;
    z-index:-1;
    overflow:hidden;
    width:100%;
  }
  .about-vid-wrapper{
    position: relative;
    height: 100%;
    width: 100%;
  }
  .about-video{
    position:absolute;
    top:0;
    left:0;
    display:block;
    width:100%;
    height:100%;
    object-fit:contain;
  }

  #magnetic-wrap {
    display: block;
    position: relative;
    justify-content: center;
    align-items: center;
    transform: translateY(150%);
    opacity:0;
  }

  .my-burger {
    padding:1.25rem;
    border-radius: 50%;
    box-sizing: border-box;
    left: 50%;
    top: 50%;
    background: var(--clr-main);
    transform-origin: 50% 50%;
    display: flex;
    width: fit-content;
    margin-bottom: 2rem;
  }

  .magnetic-size {
    position: absolute;
    inset:0;
    z-index: 1; // The area has to be on top
    border-radius: 50%;
    // border: 2px dashed #333; // Guideline to visualize the area
  }
  .play-icon{
    display: none;
    align-items:center;
    justify-content: center;
    gap:.5rem;
    text-transform: uppercase;
  }
  .play-icon.active{
    display: flex;
  }
  .play-icon span{
    min-width: 5.5ch;
    text-align: center;
  }
  @media (min-width: 640px){
    .aspect-ratio{
      margin-top: 0.2604166667vw;
      width: 63.90625vw;
    }
    .inner-text{
      position: absolute;
      right:10%;
      display:block;
      margin-left: auto;
      max-width: max(260px,47.3958333333vw);
      z-index: -3;
    }
    .video-control{
      transform: translate(0px, -48.45px);
      margin-top: max(20px,5.2083333333vw);
      width: max(260px,47.3958333333vw);
      position: absolute;
      right: 0;
      display: block;
      margin-left: auto;
      top: max(200px,18.2291666667vw);
    }
    .magnetic-size {
      bottom: clamp(-5rem, calc(-5vw - 5rem), -10rem);
      top: clamp(-5rem, calc(-5vw - 5rem), -10rem);
      left: clamp(-5rem, calc(-5vw - 5rem), -10rem);
      right: clamp(-5rem, calc(-5vw - 5rem), -10rem);
    }
  }
</style>
