<template>
  <section class="section-split">
      <div class="scroll-thing-wrapper">
        <section class="scroll-thing hidden lg:block">
          <div id="row" class="row">
            <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase </h2>
            <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase </h2>
            <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase </h2>
          </div>
          <div id="row-reverse" class="row">
            <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins</h2>
            <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins</h2>
            <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins</h2>
          </div>
        </section>
        <section class="lg:hidden scroll-thing mobile">
          <div class="marquee-container">
            <div class="marquee" style="--play:running; --direction:normal; --duration:30s; --delay:0s; --iteration-count:infinite;">
              <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase</h2>
              <h2 class="scroll-text">Showcase / Showcase / Showcase / Showcase / Showcase / Showcase / Showcase</h2>
            </div>
          </div>
          <div class="marquee-container">
            <div class="marquee" style="--play:running; --direction:reverse; --duration:30s; --delay:0s; --iteration-count:infinite;">
              <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins</h2>
              <h2 class="scroll-text">Jengs Homemade Brownies / BoBo Restaurant & Cafe / V Beauty Cosmetics / Cinnamonkins</h2>
            </div>
          </div>
        </section>
      </div>

      <div class="fake-scroll" style="height: 300vh"></div>
  </section>
</template>

<script>
  export default {
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
    }
  }
</script>

<style lang="css" scoped>
.row{
  display: flex;
}
.scroll-thing{
  width: 100vw;
  height: 100vh;
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
  color:rgba(var(--clr-dark-light),.8);
}
</style>
