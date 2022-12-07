<template>
  <section id="showcase" class="section-split">
      <div class="scroll-thing-wrapper">
        <section class="scroll-thing hidden lg:block">
          <div id="row" class="row text-main">
            <span class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / </span>
            <span class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / </span>
            <span class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / </span>
          </div>
          <div id="row-reverse" class="row">
            <span class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </span>
            <span class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </span>
            <span class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </span>
          </div>
        </section>
        <section class="lg:hidden scroll-thing mobile">
          <div class="marquee-container">
            <div class="marquee text-main" style="--play:running; --direction:normal; --duration:60s; --delay:0s; --iteration-count:infinite;">
              <span class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase</span>
              <span class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase</span>
            </div>
          </div>
          <div class="marquee-container">
            <div class="marquee reverse" style="--play:running; --direction:reverse; --duration:60s; --delay:0s; --iteration-count:infinite;">
              <span class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </span>
              <span class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </span>
            </div>
          </div>
        </section>
      </div>
      <div class="showcases flex flex-col content-p">
        <div
          class="showcase"
          :class="(index%2 === 1) ? 'even' : ''"
          v-for="(showcase,index) in showcases"
          :key="index">
          <a>
            <figure class="showcase-wrapper">
                <div class="w-full h-full">
                  <img class="showcase-img" :src="showcase.image" :alt="showcase.name">
                </div>
                <video ref="video" class="showcase-video" :data-showcase-video="index" :src="showcase.video"></video>
                <div class="showcase-detail flex justify-between items-center">
                  <span>{{showcase.name}}</span>
                  <span>{{showcase.type}}</span>
                </div>
                <div class="play-area">
                  <div :id="('play-'+index)" class="area-icon active" @click="showcaseVideo(index)">
                    <font-awesome-icon :icon="['far', 'circle-play']"/>
                  </div>
                  <div :id="('stop-'+index)" class="area-icon" @click="stopVideo(index)">
                    <font-awesome-icon :icon="['far', 'circle-pause']"/>
                  </div>
                </div>
            </figure>
          </a>
        </div>
      </div>
  </section>
</template>

<script>
  const showcase1Img = '/images/showcase/1/image.jpg';
  const showcase1Vid = '/images/showcase/1/video.mp4';
  const showcase2Img = '/images/showcase/2/image.jpg';
  const showcase2Vid = '/images/showcase/2/video.mp4';
  export default {
    data(){
      return{
        showcases:[
          {
            name:'BoBo Restaurant & Cafe',
            type:'Restaurant',
            image:showcase1Img,
            video:showcase1Vid
          },
          {
            name:'Hotel 17',
            type:'Hotel',
            image:showcase2Img,
            video:showcase2Vid
          },
        ]
      }
    },
    mounted(){
      const row = document.getElementById('row');
      const rowReverse = document.getElementById('row-reverse');
      const headerHeight = document.querySelector('nav').offsetHeight;
      window.addEventListener('scroll', () => {{
        rowReverse.style.transform = `translateX(${window.scrollY}px) rotate(360deg) scaleX(-1)`;
        row.style.transform = `translateX(-${window.scrollY}px)`;

        var elementTarget = document.querySelector(".scroll-thing-wrapper");
        var elementStop = document.querySelector('section#gallery');
        var sectionHeight = document.querySelector('section#showcase').offsetHeight;
        if (window.scrollY > (elementTarget.offsetTop - (headerHeight + 20))) {
          document.querySelector('.scroll-thing').classList.add('stick');
          document.querySelector('.scroll-thing').style.top = (headerHeight + 20) + 'px';
          document.querySelector('.scroll-thing.mobile').classList.add('stick');
          document.querySelector('.scroll-thing.mobile').style.top = (headerHeight + 20) + 'px';
        }else{
          document.querySelector('.scroll-thing').classList.remove('stick');
          document.querySelector('.scroll-thing').style.top = 0;
          document.querySelector('.scroll-thing.mobile').classList.remove('stick');
          document.querySelector('.scroll-thing.mobile').style.top = 0;
        }
        if (window.scrollY > (elementStop.offsetTop - (headerHeight + 20) - 120 - 120 - 120)) {
          document.querySelector('.scroll-thing').style.transform = `translate(0,${(sectionHeight - 240)}px)`;
          document.querySelector('.scroll-thing').classList.remove('stick');
          document.querySelector('.scroll-thing.mobile').style.transform = `translate(0,${(sectionHeight - 240)}px)`;
          document.querySelector('.scroll-thing.mobile').classList.remove('stick');
        }else if(window.scrollY > (elementTarget.offsetTop - (headerHeight + 20))){
          document.querySelector('.scroll-thing').style.transform = `translate(0,0)`;
          document.querySelector('.scroll-thing').classList.add('stick');
          document.querySelector('.scroll-thing.mobile').style.transform = `translate(0,0)`;
          document.querySelector('.scroll-thing.mobile').classList.add('stick');
        }
      }});
      this.$refs.video.forEach((el)=>{
        const id = el.getAttribute("data-showcase-video");
        const playIcon = document.getElementById('play-'+id);
        const stopIcon = document.getElementById('stop-'+id);
        el.onpause = function(){
          playIcon.classList.add('active');
          stopIcon.classList.remove('active');
          el.pause();
          el.classList.remove('active');
        }
        el.onseeking = function(){
          playIcon.classList.remove('active');
          stopIcon.classList.add('active');
          el.classList.add('active');
        }
      })
    },
    methods:{
      showcaseVideo(id){
        const video = document.querySelector(`.showcase-video[data-showcase-video="${id}"]`);
        const playIcon = document.getElementById('play-'+id);
        const stopIcon = document.getElementById('stop-'+id);
        playIcon.classList.remove('active');
        stopIcon.classList.add('active');
        video.classList.add('active');
        video.play();
        video.setAttribute("controls","controls");
      },
      stopVideo(id){
        const video = document.querySelector(`.showcase-video[data-showcase-video="${id}"]`);
        const playIcon = document.getElementById('play-'+id);
        const stopIcon = document.getElementById('stop-'+id);
        playIcon.classList.add('active');
        stopIcon.classList.remove('active');
        video.classList.remove('active');
        video.pause();
        video.removeAttribute("controls");
      }
    }
  }
</script>

<style lang="css" scoped>
  .row{
    display: flex;
  }
  .scroll-thing-wrapper{
    width:100%;
    height:300px;
    max-height: 300px;
  }
  .scroll-thing{
    max-width:100vw;
    width:100vw;
    height:fit-content;
    z-index: -1;
  }
  .scroll-thing.stick{
    position:fixed;
  }
  .scroll-text{
    line-height:1;
    font-family: var(--ff-special);
    white-space: nowrap;
    font-size: max(55px,5.2083333333vw)!important;
    font-weight: 900;
  }
  #row-reverse{
    transform: rotate(360deg) scaleX(-1);
  }
  #row-reverse > .scroll-text{
    transform: rotate(360deg) scaleX(-1);
  }
  #row-reverse > .scroll-text,.marquee.reverse{
    color:rgba(var(--clr-dark-light),.8);
  }
  .showcase-wrapper{
    height: max(395px,29.5833333333vw);
    position: relative;
    z-index: 1;
    width:100%;
  }
  .showcase-img{
    width:100%;
    height:100%;
    object-fit: cover;
  }
  .showcases{
    margin-top:10vw;
    width:100%;
    margin:0 auto;
    padding-left: max(16px,1.5625vw);
    padding-right: max(16px,1.5625vw);
    gap:10rem;
    padding-bottom:5rem;
  }
  .play-area{
    position: absolute;
    top: 50%;
    left: 50%;
    transform:translate(-50%,-50%);
    width: 150px;
    height: 150px;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 10;
    opacity:0;
    font-size: var(--fs-800);
  }
  .play-area .area-icon{
    display:none;
    cursor:pointer;
  }
  .play-area .area-icon.active{
    display:block;
  }

  .showcase-video{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: contain;
    z-index: 10;
    opacity: 0;
    transition: opacity .15s ease-in;
    background:rgba(var(--clr-main),.8);
    backdrop-filter: blur(15px);
  }

  .showcase-wrapper:hover .play-area{
    opacity: 1;
    z-index:20;
  }
  .showcase-video.active{
    opacity: 1;
  }
  .showcase-detail{
    padding:1rem 0;
    font-size: var(--fs-300);
    text-transform: uppercase;
    font-weight: 600;
  }
  @media(min-width:640px){
    .showcases{
      width:50%;
    }
    .showcase-wrapper{
      width:max(256px,47.3958333333vw);
    }
    .showcase.even{
      transform: translateX(-22%);
    }
  }
</style>
