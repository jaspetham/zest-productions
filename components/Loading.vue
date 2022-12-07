<template>
  <div v-if="!isDone" id="loading" class="loading-wrapper" :class="this.loading ? 'active' : ''">
    <div class="loading-img mb-5">
      <img src="images/logo.png" alt="" width="200" height="200">
    </div>
    <h1 class="fs-600">Loading
      <div class="dots"><span class="dot z"></span><span class="dot f"></span><span class="dot s"></span><span class="dot t"><span class="dot l"></span></span></div>
    </h1>
  </div>
</template>

<script>
import load from 'load-asset';
  export default {
    data(){
      return{
        loading:true,
        isDone:false
      }
    },
    async mounted(){
      this.dots();
      await this.loadAssets();
      this.loadingState();
    },
    methods:{
      async loadAssets() {
        // Load a list of named assets in parallel
        const urls = [
          'images/logo.png',
          '/video/test.mp4',
          '/video/zest.mp4',
          '/images/logo-samples/sample1.png',
          '/images/logo-samples/sample2.png',
          '/images/logo-samples/sample3.png',
          '/images/logo-samples/sample4.png',
          '/images/logo-samples/sample5.png',
          '/images/logo-samples/sample6.png',
          '/images/logo-samples/sample7.png',
          '/images/logo-samples/sample8.png',
          '/images/works/work1.jpg',
          '/images/works/work2.jpg',
          '/images/works/work3.jpg',
          '/images/works/work4.jpg',
          '/images/works/work5.jpg',
          '/images/works/work6.jpg',
          '/images/works/work7.jpg',
          '/images/works/work8.jpg',
          '/images/works/work9.jpg',
          '/images/works/work10.jpg',
          '/images/works/work11.jpg',
          '/images/works/work12.jpg',
          '/images/works/work13.jpg',
          '/images/works/work14.jpg',
          '/images/works/work15.jpg',
          '/images/works/work16.jpg',
          '/images/works/work17.jpg',
          '/images/works/work18.jpg',
          '/images/works/work19.jpg',
          '/images/works/work20.jpg',
          '/images/works/work21.jpg',
          '/images/works/work22.jpg',
          '/images/works/work23.jpg',
          '/images/works/work24.jpg',
          '/images/works/work25.jpg',
          '/images/works/work26.jpg',
          '/images/works/work27.jpg',
          '/images/works/work28.jpg',
          '/images/works/work29.jpg',
          '/images/works/work30.jpg',
          '/images/works/work31.jpg',
          '/images/works/work32.jpg',
          '/images/works/work33.jpg',
          '/images/showcase/1/image.jpg',
          '/images/showcase/1/video.mp4',
          '/images/showcase/2/image.jpg',
          '/images/showcase/2/video.mp4',
        ];
        const items = await load.all(urls,ev=>{
          if(ev.progress = 1){
          }
        });
      },
      dots(){
        let $ = (e) => document.querySelector(e);
        // Dots
        // ====
        let dots = $(".dots");

        // Function
        // ========
        function animate(element, className) {
          element.classList.add(className);
          setTimeout(() => {
            element.classList.remove(className);
            setTimeout(() => {
              animate(element, className);
            }, 500);
          }, 2500);
        }

        // Execution
        // =========
        animate(dots, "dots--animate");
      },
      loadingState(){
        setTimeout(()=>{
          this.loading = false;
          this.removeLoading();
        },3500)
      },
      removeLoading(){
        setTimeout(()=>{
          this.isDone = true;
        },2000)
        document.querySelector('body').style.overflowY = 'auto';
      }
    }
  }
</script>

<style lang="scss" scoped>
  .loading-img{
    animation:rotate 4s linear infinite;
  }
  @keyframes rotate {
    from{
      transform: rotate(0);
    }
    to{
      transform: rotate(359deg);
    }
  }
  .loading-wrapper{
    position: fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: black;
    display:flex;
    opacity: 0;
    z-index: 9999;
    visibility: hidden;
    transition: all .5s ease-out;
  }
  .loading-wrapper.active{
    opacity: 1;
    visibility: visible;
  }
.dots {
  display: inline-flex;

  &--animate .dot {

    &.z {
      animation: scale .8s .2s forwards;
    }

    &.f,
    &.s {
      animation: right .5s forwards;
    }

    &.l {
      animation: rightDown .4s .1s forwards linear, drop 2s .4s forwards linear;
    }

  }
}

.dot {

  & {
    display: inline-block;
    width: 10px;
    height: 10px;
    background: white;
    border-radius: 10px;
    position: relative;
    margin-left: 6px;
  }

  &.z {
    position: absolute;
    transform: scale(0);

    @keyframes scale {
      100% {
        transform: scale(1);
      }
    }
  }

  &.f,
  &.s {
    transform: translateX(0px);

    @keyframes right {
      100% {
        transform: translateX(16px);
      }
    }
  }

  &.t {
    background: transparent;
  }

  .l {
    margin-left: 0;
    position: absolute;
    top: 0;
    left: 0;

    @keyframes rightDown {

      50% {
        top: 4px;
        left: 16px;
      }

      100% {
        top: 12px;
        left: 24px;
      }
    }

    @keyframes drop {
      100% {
        transform: translate(70px, calc(35px + (100vh/2)));
      }
    }
  }

}


// ABS
// =====================================
.abs-twitter {

  & {
    position: fixed;
    right: calc(24px + .6vw);
    top: calc(22px + .6vw);
    transform: translate(-8px, 4px);
    opacity: 0;
    transition: .3s ease-in;
  }

  &--show {
    transform: translate(0, 0);
    opacity: 1;
    animation: birdie 1s .8s linear infinite;
  }

  @keyframes birdie {
    13% {
      transform: rotate(14deg);
    }

    26% {
      transform: rotate(28deg)
    }

    100% {
      transform: rotate(0deg)
    }
  }

}
</style>
