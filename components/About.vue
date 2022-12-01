<template>
  <div>
    <div class="my-20 mx-auto text-center uppercase font-bold" style="max-width:120ch;">
      <span class="fs-500">Whether it's media production, or media management... be it for personal use or for your business - we are here for exactly for that very reason.</span>
    </div>
    <div class="marquee-container my-20">
      <div class="marquee" style="--play:running; --direction:normal; --duration:30s; --delay:0s; --iteration-count:infinite;">
        <span class="marquee-item" v-for="(sample,index) in samples" :key="index">
          <img class="marquee-img" :src="sample.image.url" alt="sample">
        </span>
      </div>
      <div class="marquee" style="--play:running; --direction:normal; --duration:30s; --delay:0s; --iteration-count:infinite;">
        <span class="marquee-item" v-for="(sample,index) in samples" :key="index">
          <img class="marquee-img" :src="sample.image.url" alt="sample">
        </span>
      </div>
    </div>
  </div>
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
        ]
      }
    },
  }
</script>

<style lang="scss" scoped>

</style>
