<template>
  <section id="services" class="section-split">
    <div class="mb-20 content-p">
      <span class="fs-600 flex justify-center font-black uppercase text-center mb-10">Ser<span class="text-main">v</span>ices</span>
      <div class="services">
        <div
          class="service-wrapper relative"
          :class="[(index%2 === 1) ? 'even' : 'odd', 'service-'+index]"
          v-for="(service,index) in services"
          :key="index">
          <div class="service">
            <div class="service-icon"><font-awesome-icon :icon="service.icon"/></div>
            <h2 class="fs-400 font-bold title">{{service.name}}</h2>
            <p class="fs-300">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Fugiat sunt accusamus dicta aperiam eius</p>
          </div>
          <div class="service-style">
            <div class="circle"></div>
            <div class="line"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="section-split">
      <span class="fs-600 flex justify-center font-black uppercase text-center">Lo<span class="text-main">g</span>os Sa<span class="text-main">m</span>ples</span>
      <div class="marquee-container mt-10">
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
        services:[
          {
            name:'Photography',
            icon:['fas', 'camera-retro']
          },
          {
            name:'Videography',
            icon:['fas', 'video']
          },
          {
            name:'Graphic Design',
            icon:['fas', 'pen-nib']
          },
          {
            name:'Social Media Management',
            icon:['fas', 'hashtag']
          },
          {
            name:'Logo Creation',
            icon:['fas', 'layer-group']
          },
          {
            name:'Media Supply',
            icon:['fas', 'play']
          },
          {
            name:'Banner Design',
            icon:['fas', 'paint-roller']
          },
          {
            name:'Event Coverage',
            icon:['fas', 'calendar-check']
          },
        ]
      }
    },
  }
</script>

<style lang="css" scoped>
  .services{
    max-width:1140px;
    margin:0 auto;
    display:grid;
    grid-template-columns: repeat(2,1fr);
    gap:2rem;
  }
  .service{
    box-shadow: 0 10px 20px rgba(var(--clr-main),.6);
    background:rgb(var(--clr-dark));
    padding:3rem;
    display:flex;
    flex-direction: column;
    align-content: center;
    position: relative;
    border-radius: 10px;
  }
  .service .title{
    display:flex;
    align-items: center;
    line-height: 1;
    min-height: 44px;
    margin-bottom: 1rem;
  }
  .service-wrapper .service-style{
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: -1;
  }
  .service-wrapper:first-child .service-style{
    left: 0;
    top: -5%;
    transform: rotate(90deg);
  }
  .service-wrapper:last-child .service-style{
    right: 0;
    top:auto;
    bottom:-5%;
    transform: rotate(270deg);
  }
  .service-wrapper:not(:first-child):nth-child(odd) .service-style{
    left: -15%;
  }
  .service-wrapper:not(:last-child):nth-child(even) .service-style{
    right:-15%;
    transform: translateY(-50%) rotate(180deg);
  }
  .service-style .circle{
    border-radius: 50%;
    background:rgba(var(--clr-main));
    width:12px;
    height:12px;
    box-shadow: 0 1px 12px rgba(var(--clr-main),.6);
  }
  .service-style .line{
    width:100px;
    height: 5px;
    background:rgba(var(--clr-dark));
    border-radius: 5px;
    position: relative;
    left: -5px;
    z-index: -1;
    box-shadow: 0 1px 8px rgba(var(--clr-main),.6);
  }
  .service-icon{
    background:rgba(var(--clr-main));
    border-radius: 50%;
    padding:1rem;
    display:flex;
    font-size: var(--fs-400);
    margin-bottom:1rem;
  }
  .service-wrapper.odd .title{
    justify-content: flex-end;
  }
  .service-wrapper.even{
    text-align: left;
  }
  .service-wrapper.odd{
    text-align: right;
  }
  .service-wrapper.even .service-icon{
    margin-right: auto;
  }
  .service-wrapper.odd .service-icon{
    margin-left: auto;
  }

  @media (max-width: 44em) {
    .services{
      grid-template-columns: 1fr;
    }
    .service{
      text-align: center!important;
      padding:1.5rem;
    }
    .service .service-icon{
      margin-left:auto!important;
      margin-right:auto!important;
    }
    .service-wrapper .title{
      justify-content: center!important;
    }
  }
</style>
