<template>
  <div id="app" >
      <div style="position: relative;overflow: hidden;">
        <transition :name="direction">
          <router-view class="page"></router-view><!-- 存放被渲染的页面位置 -->
        </transition>
      </div>
      <foot />
  </div>
</template>

<script>
import foot from './components/foot.vue'
import {mapState} from 'vuex'
export default{
  name:'app',
  data(){
    return{
      direction:''
    }
  },
  components:{
    foot
  },
  watch:{
    '$route'(to,from){
      if(from.meta.num>to.meta.num){
        this.direction = 'right'
      }else{
        this.direction = 'left'
      }
    }
  }
}

</script>

<style>

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  
  color: #2c3e50;
  
  
}

.left-enter{
  transform: translate(100%,0);
}
.left-leave-to{
  transform: translate(-100%,0);
}
.left-enter-active ,.left-leave-active,.right-enter-active ,.right-leave-active{
   transition: all 1s;
}
   /*向右*/
.right-enter{

  transform: translate(-100%,0);
}
.right-leave-to{
  transform: translate(100%,0);  
}
</style>
