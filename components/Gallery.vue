<template>
  <section id="gallery" class="section-split">
    <div class="content-p">
      <h1 class="fs-600 flex justify-center ff-special text-center mb-5">G<span class="text-main">a</span>ll<span class="text-main">e</span>ry</h1>
      <div class="info">
        <h1 class="fs-500 uppercase">We specialise in brand personalization.</h1>
        <p class="fs-400 info-text">We want to ensure that the pictures and videos we take, will reflect the unique identity your brand portrays. Delivering specific context to your digital presence.</p>
      </div>
      <div class="gallery-wrapper my-20">
        <ul class="selections flex items-center justify-center gap-10">
          <li @click="galleryCategory(0)" class="selection active" data-id="0">All</li>
          <li @click="galleryCategory(1)" class="selection" data-id="1">Food</li>
          <li @click="galleryCategory(2)" class="selection" data-id="2">Wine</li>
        </ul>
        <div class="gallery">
          <div class="images-wrapper active" data-gallery="0">
            <div class="images-grid">
              <div v-for="(image,index) in galleryAll" :key="index" class="gallery-img-wrapper">
                <div class="img-info">{{image.title}}</div>
                <img :src="image.imageSrc" :alt="image.title">
              </div>
            </div>
          </div>
          <div class="images-wrapper" data-gallery="1">
            <div class="images-grid">
              <div v-for="(image,index) in galleryOpt1" :key="index" class="gallery-img-wrapper">
                <div class="img-info">{{image.title}}</div>
                <img :src="image.imageSrc" :alt="image.title">
              </div>
            </div>
          </div>
          <div class="images-wrapper" data-gallery="2">
            <div class="images-grid">
              <div v-for="(image,index) in galleryOpt2" :key="index" class="gallery-img-wrapper">
                <div class="img-info">{{image.title}}</div>
                <img :src="image.imageSrc" :alt="image.title">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
  import work1 from "~/assets/images/works/work1.jpg"
  import work2 from "~/assets/images/works/work2.jpg"
  import work3 from "~/assets/images/works/work3.jpg"
  import work4 from "~/assets/images/works/work4.jpg"
  import work5 from "~/assets/images/works/work5.jpg"
  import work6 from "~/assets/images/works/work6.jpg"
  import work7 from "~/assets/images/works/work7.jpg"
  import work8 from "~/assets/images/works/work8.jpg"
  import work9 from "~/assets/images/works/work9.jpg"
  import work10 from "~/assets/images/works/work10.jpg"
  import work11 from "~/assets/images/works/work11.jpg"
  import work12 from "~/assets/images/works/work12.jpg"
  import work13 from "~/assets/images/works/work13.jpg"
  import work14 from "~/assets/images/works/work14.jpg"
  import work15 from "~/assets/images/works/work15.jpg"
  import work16 from "~/assets/images/works/work16.jpg"
  import work17 from "~/assets/images/works/work17.jpg"
  import work18 from "~/assets/images/works/work18.jpg"
  import work19 from "~/assets/images/works/work19.jpg"
  import work20 from "~/assets/images/works/work20.jpg"
  import work21 from "~/assets/images/works/work21.jpg"
  import work22 from "~/assets/images/works/work22.jpg"
  import work23 from "~/assets/images/works/work23.jpg"
  import work24 from "~/assets/images/works/work24.jpg"
  import work25 from "~/assets/images/works/work25.jpg"
  import work26 from "~/assets/images/works/work26.jpg"
  import work27 from "~/assets/images/works/work27.jpg"
  import work28 from "~/assets/images/works/work28.jpg"
  import work29 from "~/assets/images/works/work29.jpg"
  import work30 from "~/assets/images/works/work30.jpg"
  import work31 from "~/assets/images/works/work31.jpg"
  import work32 from "~/assets/images/works/work32.jpg"
  import work33 from "~/assets/images/works/work33.jpg"

  export default {
    data(){
      return{
        galleryAll:[
          {
            imageSrc:work1,
            title:"Burger Pic"
          },
          {
            imageSrc:work2,
            title:"Burger Pic"
          },
          {
            imageSrc:work3,
            title:"Burger Pic"
          },
          {
            imageSrc:work4,
            title:"Burger Pic"
          },
          {
            imageSrc:work5,
            title:"Burger Pic"
          },
          {
            imageSrc:work6,
            title:"Burger Pic"
          },
          {
            imageSrc:work7,
            title:"Burger Pic"
          },
          {
            imageSrc:work8,
            title:"Burger Pic"
          },
          {
            imageSrc:work9,
            title:"Burger Pic"
          },
          {
            imageSrc:work10,
            title:"Burger Pic"
          },
          {
            imageSrc:work11,
            title:"Burger Pic"
          },
          {
            imageSrc:work12,
            title:"Burger Pic"
          },
          {
            imageSrc:work13,
            title:"Burger Pic"
          },
          {
            imageSrc:work14,
            title:"Burger Pic"
          },
          {
            imageSrc:work15,
            title:"Burger Pic"
          },
          {
            imageSrc:work16,
            title:"Burger Pic"
          },
          {
            imageSrc:work17,
            title:"Burger Pic"
          },
          {
            imageSrc:work18,
            title:"Burger Pic"
          },
          {
            imageSrc:work19,
            title:"Burger Pic"
          },
          {
            imageSrc:work20,
            title:"Burger Pic"
          },
          {
            imageSrc:work21,
            title:"Burger Pic"
          },
          {
            imageSrc:work22,
            title:"Burger Pic"
          },
          {
            imageSrc:work23,
            title:"Burger Pic"
          },
          {
            imageSrc:work25,
            title:"Burger Pic"
          },
          {
            imageSrc:work26,
            title:"Burger Pic"
          },
          {
            imageSrc:work27,
            title:"Burger Pic"
          },
          {
            imageSrc:work28,
            title:"Burger Pic"
          },
          {
            imageSrc:work29,
            title:"Burger Pic"
          },
          {
            imageSrc:work30,
            title:"Burger Pic"
          },
          {
            imageSrc:work31,
            title:"Burger Pic"
          },
          {
            imageSrc:work32,
            title:"Burger Pic"
          },
          {
            imageSrc:work33,
            title:"Burger Pic"
          },
        ],
        galleryOpt1:[
          {
            imageSrc:work21,
            title:"Burger Pic"
          },
          {
            imageSrc:work22,
            title:"Burger Pic"
          },
          {
            imageSrc:work23,
            title:"Burger Pic"
          },
          {
            imageSrc:work25,
            title:"Burger Pic"
          },
          {
            imageSrc:work26,
            title:"Burger Pic"
          },
          {
            imageSrc:work27,
            title:"Burger Pic"
          },
          {
            imageSrc:work28,
            title:"Burger Pic"
          },
          {
            imageSrc:work29,
            title:"Burger Pic"
          },
          {
            imageSrc:work30,
            title:"Burger Pic"
          },
          {
            imageSrc:work31,
            title:"Burger Pic"
          },
          {
            imageSrc:work32,
            title:"Burger Pic"
          },
        ],
        galleryOpt2:[
          {
            imageSrc:work11,
            title:"Burger Pic"
          },
          {
            imageSrc:work12,
            title:"Burger Pic"
          },
          {
            imageSrc:work13,
            title:"Burger Pic"
          },
          {
            imageSrc:work14,
            title:"Burger Pic"
          },
          {
            imageSrc:work15,
            title:"Burger Pic"
          },
          {
            imageSrc:work16,
            title:"Burger Pic"
          },
          {
            imageSrc:work17,
            title:"Burger Pic"
          },
          {
            imageSrc:work18,
            title:"Burger Pic"
          },
          {
            imageSrc:work19,
            title:"Burger Pic"
          },
          {
            imageSrc:work20,
            title:"Burger Pic"
          },
        ],
      }
    },
    methods:{
      galleryCategory(id){
        document.querySelectorAll('.selection').forEach(i=>i.classList.remove('active'));
        const selectedCategory = document.querySelector(`.selection[data-id="${id}"]`);
        selectedCategory.classList.add('active');

        document.querySelectorAll('.images-wrapper').forEach(i=>i.classList.remove('active'));
        const selectedGallery = document.querySelector(`.images-wrapper[data-gallery="${id}"]`);
        selectedGallery.classList.add('active');


      }
    }
  }
</script>

<style lang="css" scoped>
  .info-text{
    max-width:60ch;
  }
  .selection{
    font-size:var(--fs-400);
    text-transform: uppercase;
    font-weight: 600;
    cursor: pointer;
  }
  .selection.active{
    color:rgb(var(--clr-main));
  }
  .images-wrapper{
    width:0;
    height:0;
    opacity: 0;
    transform: translate(150px,150px);
    transition: all .5s ease;
  }
  .images-wrapper.active{
    width:auto;
    height:auto;
    opacity: 1;
    transform: translate(0);
  }
  .images-grid{
    display:grid;
    grid-template-columns: repeat(4,1fr);
    gap:3rem;
  }
  .gallery{
    margin-top: 75px;
  }
  .gallery-img-wrapper{
    width: 100%;
    height: 325px;
    overflow: hidden;
    border-radius: 10px;
    position:relative;
  }
  .gallery-img-wrapper img{
    width: 100%;
    height:100%;
    object-fit: cover;
  }
  .img-info{
    opacity:0;
    background:rgb(var(--clr-main));
    font-size: var(--fs-400);
    font-weight: 900;
    text-transform: uppercase;
    width:100%;
    height:100%;
    position: absolute;
    inset:0;
    transition: all .5s ease;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .gallery-img-wrapper:hover .img-info{
    opacity: 1;
  }
  /* mobile size */
  @media (max-width: 44em) {
    .images-grid{
      grid-template-columns: repeat(1,1fr);
    }
  }
  /* tablet size to laptop */
  @media (min-width: 45em) and (max-width:74em) {
    .images-grid{
      grid-template-columns: repeat(2,1fr);
    }
  }
  /* tablet size to laptop */
  @media (min-width: 75em) and (max-width:89em) {
    .images-grid{
      grid-template-columns: repeat(3,1fr);
    }
  }
</style>
