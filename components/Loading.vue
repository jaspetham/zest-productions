<template>
  <div v-if="!isDone" id="loading" class="loading-wrapper" :class="this.loading ? 'active' : ''">
    <ul>
      <li v-for="j in 25" :key="j"></li>
    </ul>
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
      this.loadingState();
    },
    methods:{
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
  $color : rgb(var(--clr-main),.6);
  @mixin obj($w,$h,$bg) {
    width: $w;
    height: $h;
    background: $bg;
  }

  @mixin anim($listName,$delay){
    @each $currentBox in $listName {
      $i: index($listName, $currentBox);
      &:nth-child(#{$currentBox}) {
        animation-delay: 0.1s * $i + $delay;
      }
    }
  }
  .wrapper {
    @include obj(auto,auto,null);
  }

  ul {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    animation:rot 16s linear infinite;
    @keyframes rot {
      100% {
        transform:rotate(360deg);
      }
    }
  }

  li {
    @include obj(40px,40px,$color);
    border-radius:4px;
    box-shadow: 0 0 1px #fff, 0 0 5px $color, 0 0 10px $color, 0 0 15px $color, 0 0 25px $color, 0 0 55px $color;
    animation: scale 0.8s linear alternate infinite;

    @keyframes scale {
      100% {
        transform: scale(.1);
        opacity: 0;
      }
    }
    @for $i from 1 through 25 {
      &:nth-child(#{$i}) {
        z-index: 25 - $i;
      }
    }
    @for $i from 1 through 5 {
        &:nth-child(#{$i}) {
          animation-delay: 0.1s * $i;
        }
        &:nth-child(#{$i + 6}) {
          @if ($i<5) {
            animation-delay: 0.1s * $i + 0.2s;
          }
        }
        &:nth-child(#{$i + 12}) {
          @if ($i<4) {
            animation-delay: 0.1s * $i + 0.4s;
          }
        }
        &:nth-child(#{$i + 18}) {
          @if ($i<3) {
            animation-delay: 0.1s * $i + 0.6s;
          }
        }
        &:nth-child(#{$i + 23}) {
          @if ($i<2) {
            animation-delay: 0.1s * $i + 0.8s;
          }
        }
      }

      $fCol: 1 6 11 16 21;
      @include anim($fCol,0);

      $sCol: 7 12 17 22;
      @include anim($sCol,0.2s);

      $tCol: 13 18 23;
      @include anim($tCol,0.4s);

      $foCol: 19 24;
      @include anim($foCol,0.6s);

      &:nth-child(25) {
        animation-delay: 0.9s;
      }
    }
</style>
