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
  const work1 = "/images/works/work1.jpg"
  const work2 = "/images/works/work2.jpg"
  const work3 = "/images/works/work3.jpg"
  const work4 = "/images/works/work4.jpg"
  const work5 = "/images/works/work5.jpg"
  const work6 = "/images/works/work6.jpg"
  const work7 = "/images/works/work7.jpg"
  const work8 = "/images/works/work8.jpg"
  const work9 = "/images/works/work9.jpg"
  const work10 = "/images/works/work10.jpg"
  const work11 = "/images/works/work11.jpg"
  const work12 = "/images/works/work12.jpg"
  const work13 = "/images/works/work13.jpg"
  const work14 = "/images/works/work14.jpg"
  const work15 = "/images/works/work15.jpg"
  const work16 = "/images/works/work16.jpg"
  const work17 = "/images/works/work17.jpg"
  const work18 = "/images/works/work18.jpg"
  const work19 = "/images/works/work19.jpg"
  const work20 = "/images/works/work20.jpg"
  const work21 = "/images/works/work21.jpg"
  const work22 = "/images/works/work22.jpg"
  const work23 = "/images/works/work23.jpg"
  const work24 = "/images/works/work24.jpg"
  const work25 = "/images/works/work25.jpg"
  const work26 = "/images/works/work26.jpg"
  const work27 = "/images/works/work27.jpg"
  const work28 = "/images/works/work28.jpg"
  const work29 = "/images/works/work29.jpg"
  const work30 = "/images/works/work30.jpg"
  const work31 = "/images/works/work31.jpg"
  const work32 = "/images/works/work32.jpg"
  const work33 = "/images/works/work33.jpg"

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
            imageSrc:work24,
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
    position: relative;
  }
  .selection.active,.selection:hover{
    color:rgb(var(--clr-main));
  }
  .selection::after{
    opacity: 0;
    position: absolute;
    content:'';
    left:50%;
    bottom:0;
    transform:translateX(-150%);
    width:100%;
    height:4px;
    border-radius: 10px;
    background:rgb(var(--clr-main));
    transition: all .5s ease;
  }
  .selection.active::after,.selection:hover::after{
    opacity: 1;
    transform:translateX(-50%);
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
