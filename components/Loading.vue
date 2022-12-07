<template>
  <div v-if="!isDone" id="loading" class="loading-wrapper" :class="this.loading ? 'active' : ''">
    <div class="loading-img mb-5">
      <img src="~/assets/images/logo.png" alt="" width="200" height="200">
    </div>
    <h1 class="fs-600">Loading
      <div class="dots"><span class="dot z"></span><span class="dot f"></span><span class="dot s"></span><span class="dot t"><span class="dot l"></span></span></div>
    </h1>
  </div>
</template>

<script>
  export default {
    data(){
      return{
        loading:true,
        isDone:false
      }
    },
    mounted(){
      this.dots();
      // this.loadingState();

    },
    methods:{
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
          document.querySelector('body').style.overflowY = 'auto';
        },3500)
      },
      removeLoading(){
        setTimeout(()=>{
          this.isDone = true;
        },2000)
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
