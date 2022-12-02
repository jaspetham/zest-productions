<template>
  <section id="showcase" class="section-split">
      <div class="scroll-thing-wrapper">
        <section class="scroll-thing hidden lg:block">
          <div id="row" class="row text-main">
            <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / </h2>
            <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / </h2>
            <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / </h2>
          </div>
          <div id="row-reverse" class="row">
            <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </h2>
            <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </h2>
            <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </h2>
          </div>
        </section>
        <section class="lg:hidden scroll-thing mobile">
          <div class="marquee-container">
            <div class="marquee text-main" style="--play:running; --direction:normal; --duration:60s; --delay:0s; --iteration-count:infinite;">
              <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase</h2>
              <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase</h2>
            </div>
          </div>
          <div class="marquee-container">
            <div class="marquee reverse" style="--play:running; --direction:reverse; --duration:60s; --delay:0s; --iteration-count:infinite;">
              <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </h2>
              <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins / </h2>
            </div>
          </div>
        </section>
      </div>
      <div class="showcases flex flex-col content-p">
        <div
          @mouseover="showcaseVideo(index)"
          @mouseleave="stopVideo(index)"
          class="showcase"
          :class="(index%2 === 1) ? 'even' : ''"
          v-for="(showcase,index) in showcases"
          :key="index">
          <a>
            <figure class="showcase-wrapper">
                <div class="w-full h-full">
                  <img class="showcase-img" :src="showcase.image" :alt="showcase.name">
                </div>
                <div><video class="showcase-video" :data-showcase-video="index" :src="showcase.video"></video></div>
                <div class="showcase-detail flex justify-between items-center">
                  <span>{{showcase.name}}</span>
                  <span>{{showcase.type}}</span>
                </div>
            </figure>
          </a>
        </div>
      </div>
  </section>
</template>

<script>
  import showcase1Img from '~/assets/images/showcase/1/image.jpg';
  import showcase1Vid from '~/assets/images/showcase/1/video.mp4';
  import showcase2Img from '~/assets/images/showcase/2/image.jpg';
  import showcase2Vid from '~/assets/images/showcase/2/video.mp4';
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

        // get amount of children in row
        const children = row.children.length;


        const childrenArray = Array.from(row.children);
        const childrenArrayReverse = Array.from(rowReverse.children);
        const lastChild = childrenArray[children - 1].getBoundingClientRect().right;
        const windowWidth = window.innerWidth;

        // if (lastChild < windowWidth) {
        //     childrenArray.forEach((child) => {
        //       // row.appendChild(child.cloneNode(true));
        //     });
        //     childrenArrayReverse.forEach((child) => {
        //       // rowReverse.appendChild(child.cloneNode(true));
        //     });
        // }
        var elementTarget = document.querySelector(".scroll-thing-wrapper");
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
      }});
    },
    methods:{
      showcaseVideo(id){
        const video = document.querySelector(`.showcase-video[data-showcase-video="${id}"]`);
        video.pause();
        video.currenTime = 0;
        video.load();
        video.play();
      },
      stopVideo(id){
        const video = document.querySelector(`.showcase-video[data-showcase-video="${id}"]`);
        video.pause();
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
    white-space: nowrap;
    font-size: max(55px,5.2083333333vw)!important;
    text-transform: uppercase;
    font-weight: 900;
  }
  #row-reverse{
    transform: rotate(360deg) scaleX(-1);
  }
  #row-reverse > h2{
    transform: rotate(360deg) scaleX(-1);
  }
  #row-reverse > h2,.marquee.reverse{
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
  .showcase-wrapper:hover .showcase-video{
    opacity: 1;
  }
  .showcase-video{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background:rgba(var(--clr-main),.8);
    backdrop-filter: blur(15px);
    object-fit: contain;
    z-index: 10;
    opacity: 0;
    transition: opacity .15s ease-in;
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
