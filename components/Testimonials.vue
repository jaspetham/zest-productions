<template>
  <section id="testimonial" class="section-split">
    <div class="content-p">
      <div class="relative">
        <Title :title="'Testimonials'" />
        <div class="quote normal">
          <svg
            width="100%"
            height="100%"
            viewBox="0 0 24 24"
            xmlns="http://www.w3.org/2000/svg"
          >
            <rect x="0" fill="none" width="24" height="24" />
            <g>
              <path
                fill="currentColor"
                d="M11.192 15.757c0-.88-.23-1.618-.69-2.217-.326-.412-.768-.683-1.327-.812-.55-.128-1.07-.137-1.54-.028-.16-.95.1-1.956.76-3.022.66-1.065 1.515-1.867 2.558-2.403L9.373 5c-.8.396-1.56.898-2.26 1.505-.71.607-1.34 1.305-1.9 2.094s-.98 1.68-1.25 2.69-.346 2.04-.217 3.1c.168 1.4.62 2.52 1.356 3.35.735.84 1.652 1.26 2.748 1.26.965 0 1.766-.29 2.4-.878.628-.576.94-1.365.94-2.368l.002.003zm9.124 0c0-.88-.23-1.618-.69-2.217-.326-.42-.77-.692-1.327-.817-.56-.124-1.074-.13-1.54-.022-.16-.94.09-1.95.75-3.02.66-1.06 1.514-1.86 2.557-2.4L18.49 5c-.8.396-1.555.898-2.26 1.505-.708.607-1.34 1.305-1.894 2.094-.556.79-.97 1.68-1.24 2.69-.273 1-.345 2.04-.217 3.1.165 1.4.615 2.52 1.35 3.35.732.833 1.646 1.25 2.742 1.25.967 0 1.768-.29 2.402-.876.627-.576.942-1.365.942-2.368v.01z"
              />
            </g>
          </svg>
        </div>
        <VueSlickCarousel class="my-10" :arrows="false" :dots="true">
          <div
            class="testimonial"
            v-for="(testimonal, index) in testimonials"
            :key="index"
          >
            <div class="testimonial-grid">
              <div class="customer-img">
                <img :src="testimonal.imgSrc" :alt="testimonal.name" />
              </div>
              <div>
                <div class="info mb-6">
                  <p class="fs-400">{{ testimonal.info1 }}</p>
                  <p class="fs-400">{{ testimonal.info2 }}</p>
                  <p class="fs-400">{{ testimonal.info3 }}</p>
                </div>
                <div
                  class="customer fs-400 flex items-center justify-center gap-3 flex-wrap"
                >
                  <div class="line"></div>
                  <span>{{ testimonal.name }},</span>
                  <span>{{ testimonal.title }}</span>
                </div>
              </div>
            </div>
          </div>
        </VueSlickCarousel>
      </div>
    </div>
  </section>
</template>

<script>
import VueSlickCarousel from "vue-slick-carousel";
import "vue-slick-carousel/dist/vue-slick-carousel.css";
import "vue-slick-carousel/dist/vue-slick-carousel-theme.css";
const work1 = "/images/works/work1.jpg";
const work2 = "/images/works/work2.jpg";
const work3 = "/images/works/work3.jpg";
const work4 = "/images/works/work4.jpg";
export default {
  components: { VueSlickCarousel },
  data() {
    return {
      testimonials: [
        {
          imgSrc: work1,
          info1: `I would recommend Zest Artistry to anyone looking for a social media management team.  Pictures taken and edited professionally, they’re engaging to my customers with frequent posts and replies to any inquiries customers may have. What I love most is how spontaneous they are when accommodating my requests on a daily basis! My followers has also grown significantly after they have taken over my restaurant’s social media accounts! Kudos to Brie and the team!`,
          name: "Chef Nathanael Bony",
          title: "Founder of BoBo Restaurant & Cafe",
        },
        {
          imgSrc: work2,
          info1: `"We're Lost, hopelessly lost", That's how we were in the maze of social
                  media marketing and management. We didn't know the heads and tails of
                  what we were doing on Instagram and Facebook - until the day we met Zest
                  Artistry who took hold of our hands and effortlessly guide us through
                  the maze and showed us the way to the right path on social media
                  marketing bliss.`,
          name: "Jengs",
          title: "Founder of Jengs Homemade Brownies",
        },
        {
          imgSrc: work3,
          info1: `"Thank you so much Zest Artistry, we have been working together for 5 months and our sales and branding has improved tremendously.`,
          info2: `We are always happy with the content and postings you deliver to our social media accounts.`,
          info3: `Looking forward to working with you always.`,
          name: "Piraveen Raj",
          title: "Founder of V Beauty Cosmetics",
        },
        {
          imgSrc: work4,
          info1: `Ladies and gents, honestly, all I can say is Zest Productions is ELITE at their social media management, well… basically, EVERYTHING!`,
          info2: `They are the best team to assist you to slay your presence on social media. If it wasn’t for Zest Productions, Cinnamonkins wouldn’t be here where we’re at today. Till we grow big and successful, we’ll be always with Zest Productions :)`,
          name: "Jocelyn Deana Nair",
          title: "Founder of Cinnamonkins",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
.quote {
  position: absolute;
  width: 150px;
  height: 150px;
  z-index: -1;
  color: rgb(var(--clr-main));
}
.quote.normal {
  left: 10px;
  top: 10px;
}
.info {
  max-width: 120ch;
  margin-inline: auto;
  display: flex;
  flex-direction: column;
  gap: 1rem;
}
.line {
  background: rgb(var(--clr-main));
  width: 30px;
  height: 5px;
  border-radius: 5px;
  display: inline-flex;
}
.customer-img {
  border-radius: 50%;
  width: 100%;
  height: 100%;
  max-width: clamp(150px, 25vh, 250px);
  max-height: clamp(150px, 25vh, 250px);
  align-self: center;
  justify-self: center;
  overflow: hidden;
  border: 2px solid white;
}
.customer-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.testimonial-grid {
  display: grid;
  grid-template-columns: 1fr;
  align-content: center;
  gap: 2rem;
  text-align: center;
  margin-bottom: 2.5rem;
}
.customer {
  line-height: 1;
}
/* mobile size */
@media (max-width: 44em) {
  .customer-img {
    max-width: 150px;
    max-height: 150px;
  }
  .quote {
    width: 50px;
    height: 50px;
  }
}
</style>
