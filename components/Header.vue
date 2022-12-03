<template>
  <nav id="nav">
    <div class="nav-container flex justify-between items-center">
      <div class="nav-img">
        <img src="~/assets/images/logo.png" alt="" width="60" height="60">
      </div>
      <div
        @click="menuState"
        class="hamburger-lines"
        :class="this.menuOpen ? 'active' : ''">
        <span class="line line1"></span>
        <span class="line line2"></span>
        <span class="line line3"></span>
      </div>
      <div
        :class="this.menuOpen ? 'active' : ''"
        class="menu-items">
        <div class="menu-body">
          <div class="header-link"><a href="#"> Home <font-awesome-icon class="header-icon" :icon="['far', 'compass']"/></span></a></div>
          <div class="header-link"><a href="#"> About <font-awesome-icon class="header-icon" :icon="['far', 'compass']"/></span></a></div>
          <div class="header-link"><a href="#"> Services <font-awesome-icon class="header-icon" :icon="['far', 'compass']"/></span></a></div>
          <div class="header-link"><a href="#"> Showcase <font-awesome-icon class="header-icon" :icon="['far', 'compass']"/></span></a></div>
          <div class="header-link"><a href="#"> Contact <font-awesome-icon class="header-icon" :icon="['far', 'compass']"/></span></a></div>
        </div>
        <div class="menu-footer">
          <a href="https://wa.me/+601110259170" target="_blank" class="fs-400"> <font-awesome-icon :icon="['fab', 'whatsapp']" /> 011 - 1025 9170</a>
          <a href="https://www.facebook.com/zestartistryteam" target="_blank" class="fs-400 md:justify-self-end"> <font-awesome-icon :icon="['fab', 'facebook']" /> Zest Productions MY</a>
          <a href="https://www.instagram.com/byzestproductions/" target="_blank" class="fs-400"> <font-awesome-icon :icon="['fab', 'instagram']" /> @zestproductionsmy</a>
          <a href="mailto:zestproductionsmy@gmail.com" target="_blank" class="fs-400 md:justify-self-end"><font-awesome-icon :icon="['far', 'envelope']" /> zestproductionsmy@gmail.com</a>
        </div>
      </div>
    </div>
  </nav>
</template>

<script>
  export default {
    data(){
      return{
        menuOpen:false
      }
    },
    mounted(){
      this.$nextTick(function(){
        window.addEventListener("scroll", function(){
          var navbar = document.getElementById("nav");
          var nav_classes = navbar.classList;
          if(document.documentElement.scrollTop >= 500) {
            if (nav_classes.contains("isScroll") === false) {
              nav_classes.toggle("isScroll");
            }
          }
          else {
            if (nav_classes.contains("isScroll") === true) {
              nav_classes.toggle("isScroll");
            }
          }
        })
      })
    },
    methods: {
      menuState(){
        this.menuOpen = !this.menuOpen
        if(this.menuOpen){
          document.querySelector('body').style.overflowY = 'hidden';
        }else{
          document.querySelector('body').style.overflowY = 'auto';
        }
      }
    },
  }
</script>

<style lang="css" scoped>
  nav{
    position: fixed;
    z-index: 99;
    top:0;
    left:0;
    width:100%;
    transition: all .5s ease-in;
  }
  nav.isScroll{
    background:rgba(0,0,0,.5);
    -webkit-backdrop-filter: blur(12px);
    backdrop-filter: blur(12px);
  }
  .nav-container{
    position: relative;
    padding:1rem 2rem;
  }
  .nav-img,.hamburger-lines{
    position: relative;
  }
  .nav-container .hamburger-lines {
    right:1rem;
    height: 26px;
    width: 32px;
    z-index: 2;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    cursor: pointer;
  }

  .nav-container .hamburger-lines:hover .line{
    background:rgba(var(--clr-main));
  }

  .nav-container .hamburger-lines .line {
    display: block;
    height: 4px;
    width: 100%;
    border-radius: 10px;
    background: white;
    transition: all .5s ease-out;
  }

  .nav-container .hamburger-lines .line1 {
    transform-origin: 0% 0%;
    transition: transform 0.2s ease-in-out;
  }

  .nav-container .hamburger-lines .line2 {
    transition: transform 0.2s ease-in-out;
  }

  .nav-container .hamburger-lines .line3 {
    transform-origin: 0% 100%;
    transition: transform 0.2s ease-in-out;
  }

  .nav-container .hamburger-lines.active .line1 {
    transform: rotate(45deg);
  }

  .nav-container .hamburger-lines.active .line2 {
    transform: scaleY(0);
  }

  .nav-container .hamburger-lines.active .line3 {
    transform: rotate(-45deg);
  }

  .menu-items {
    position: absolute;
    left:0;
    top:0;
    height: 100vh;
    width: 100%;
    transform: translateY(-99.8%);
    overflow: hidden;
    transition: transform 0.5s ease-out;
    background-color:rgba(var(--clr-dark),.8);
    backdrop-filter:blur(12px);
    color:white;
    display: flex;
    flex-direction: column;
  }
  .menu-body{
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    padding: 4.1666666667vw 1.5625vw 0;
    height:100%;
  }
  .nav-container .menu-items.active {
    transform: translateY(0);
  }

  .nav-container .menu-items .header-link{
    overflow: hidden;
  }
  .header-link > a{
    font-family: var(--ff-glitch);
    display: flex;
    align-content: center;
    gap:1.5rem;
    font-weight: 400;
    font-size: var(--fs-700);
    line-height: .45em;
    text-transform: uppercase;
    max-width: max-content;
    white-space: nowrap;
    margin-bottom: 0;
    color:white;
    align-items: flex-start;
    transition: color .5s var(--ease);
  }

  .header-icon{
    font-size: .8em;
    overflow: hidden;
    transform: translateX(-100%);
    opacity: 0;
    transition: all .1s linear;
  }
  .header-link:hover > a .header-icon{
    transform: translateX(0);
    opacity: 1;
  }
  .header-link:hover > a,.menu-footer> a:hover{
    color:rgba(var(--clr-main));
  }
  .menu-footer{
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: .5rem;
    padding:2rem;
    border-bottom: 3px solid #efefef;
    transform: translateY(150%);
    transition: transform .75s var(--ease);
    transition-delay: 0.5s;
    opacity: 0;
  }
  .menu-items.active .menu-footer{
    border-bottom:0;
    border-top:3px solid #efefef;
    transform: translateY(0);
    opacity: 1;
  }
  .menu-footer > a{
    width:fit-content;
  }
  /* mobile size */
  @media (max-width: 44em) {
    .nav-container{
      padding:0.5rem;
    }
    .menu-body{
      padding:10vw 5vw 0;
    }
    .menu-footer{
      grid-template-columns: 1fr;
      padding: 1rem 1.5rem;
    }
    .menu-footer > a{
      text-align: left!important;
    }
  }
</style>
