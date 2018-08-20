<template>
  <div> 
    <div class="head">
    	<search /> 
      <navbar :navdata="navdata" />
    </div>
  
    <tag :tagurl="tgd" />
    <lunbo :picurl="pic" />
    <leftright :three="three_data" />
    
    <div class="mid"><img src="http://localhost/images/mid.jpg" alt=""></div>
    <div class="mid"><img src="http://localhost/images/d1.jpg" alt=""></div>
    <good :goods_list="goodlist" />
      
  </div>
</template>

<script>
import slider from "@/components/slider.vue"
import lunbo from "@/components/lunbo.vue"
import tag from "@/components/tag.vue"
import leftright from "@/components/leftright.vue"
import topbottom from "@/components/topbottom.vue"
import lunbo2 from "@/components/lunbo2.vue"
import navbar from "@/components/navbar.vue"
import search from "@/components/search.vue"
import good from "@/components/good.vue"
export default {
  name: 'home',
  components:{
    slider,lunbo,tag,leftright,topbottom,lunbo2,navbar,search,good
  },
  data () {
    return{
      pic:['1/01.jpg','1/02.jpg','1/03.jpg','1/04.jpg']//为什么子元素的接受要接受成为对象类型
      ,
      tgd:['http://localhost/images/t1.jpg','http://localhost/images/t2.jpg','http://localhost/images/t3.jpg','http://localhost/images/t4.jpg','http://localhost/images/t5.png'],
      three_data:['http://localhost/images/31.jpg','http://localhost/images/32.jpg','http://localhost/images/33.jpg'],
      another_three:['http://localhost/images/d1.jpg','http://localhost/images/d2.jpg','http://localhost/images/d3.jpg'],
      navdata:['推荐','手机','电视','智能','笔记本','家电','双摄','游戏本','全面屏','生活周边'],
      goodlist:[],
    }
  },
  created(){
      this.$http.get('Goods/goods_list')
      .then((rtnD)=>{
      this.goodlist = rtnD.data;
      })
    },
}
</script>

<style>
a{
  list-style: none;
  text-decoration: none;
  color: rgba(0,0,0,.6);
}

.clear-float{
  width: 100%;
  height: 272px;
}
.mid{
  width: 100%;
}
.mid img{
  width: 100%;
}
.mid_wrap{
  border-top:.1px solid gray;
}
.more{
  width: 100%;
  height: 52px;
  line-height: 52px;
  font-size: 20px;

}
.head{
  width: 100%;
  background: #f2f2f2;
  position: fixed;
  top: 0px;
  z-index: 999;

}
.first{
  margin-top: 85px;
}

</style>
