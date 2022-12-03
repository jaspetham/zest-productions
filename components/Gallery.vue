<template>
  <section id="gallery" class="section-split">
    <div class="content-p">
      <h1 class="fs-600 flex justify-center ff-special text-center mb-5">G<span class="text-main">a</span>ll<span class="text-main">e</span>ry</h1>
      <div class="info">
        <h1 class="fs-600 uppercase">We specialise in brand personalization.</h1>
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
              <div v-for="(image,index) in galleryFood" :key="index" class="gallery-img-wrapper">
                <div class="img-info">{{image.title}}</div>
                <img :src="image.imageSrc" :alt="image.title">
              </div>
            </div>
          </div>
          <div class="images-wrapper" data-gallery="2">
            <div class="images-grid">
              <div v-for="(image,index) in galleryWine" :key="index" class="gallery-img-wrapper">
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
  import galleryImg1 from "~/assets/images/showcase/1/image.jpg"
  import galleryImg2 from "~/assets/images/showcase/2/image.jpg"
  export default {
    data(){
      return{
        galleryAll:[
          {
            imageSrc:galleryImg1,
            title:"Burger Pic"
          },
          {
            imageSrc:galleryImg1,
            title:"Burger Pic"
          },
          {
            imageSrc:galleryImg1,
            title:"Burger Pic"
          },
          {
            imageSrc:galleryImg1,
            title:"Burger Pic"
          },
        ],
        galleryFood:[
          {
            imageSrc:galleryImg1,
            title:"Burger Pic"
          },
          {
            imageSrc:galleryImg2,
            title:"Hotel Pic"
          },
        ],
        galleryWine:[
          {
            imageSrc:galleryImg2,
            title:"Hotel Pic"
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
    margin-top: 60px;
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
