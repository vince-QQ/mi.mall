<template>
  <div>
    <div class="wrap" v-if="foot_type == 'default'">
      
           <div>
              <router-link to="/home">
                <div>
                  <div class="logo"><img src="http://localhost/images/bottom1.png" alt=""></div>
                  <div class="btag">首页</div>
                </div>
              </router-link>
           </div>
           <div>
            <router-link to="/jjj">
              <div>
                  <div class="logo"><img src="http://localhost/images/bottom2.png" alt=""></div>
                  <div class="btag">分类</div>
                </div>
            </router-link>
          </div>
           <div>
            <router-link to="/car">
              <div>
                  <div class="logo"><img src="http://localhost/images/bottom3.png" alt=""></div>
                  <div class="btag">购物车{{cartNum.length}}</div>
                </div>
           </router-link>
         </div>
           <div>
            <router-link to="/my">
              <div>
                  <div class="logo"><img src="http://localhost/images/bottom4.png" alt=""></div>
                  <div class="btag">我的</div>
              </div>
           </router-link>
         </div> 

      </div>
        
      
        <div class="cbott"   v-if="foot_type == 'ginfo'">
          <div class="chome">
                  <router-link to="/">
                    <div>
                      <div class="clogo"><img src="http://localhost/images/bottom1.png" alt=""></div>
                      <div class="cbtag">首页</div>
                    </div>
                  </router-link>
          </div>
          <div class="ccar">
                  <router-link to="/car">
                    <div>
                      <div class="clogo"><img src="http://localhost/images/bottom3.png" alt=""></div>
                      <div class="cbtag">购物车{{cartNum.length}}</div>
                    </div>
                  </router-link>
            </div>
          <div @click="cadd2()" class="ccar_but">
            加入购物车
          </div>
      
     </div>


   
  </div>
</template>
<script>
import pop from "@/components/pop.vue"
import {mapMutations} from 'vuex' 
import {mapState} from 'vuex'
export default{
  data(){
    return {
      id:this.$route.params.id,
    }
  },
  components:{
    pop,
  },
  computed:{
   ...mapState(['cartNum','foot_type','gwc_show'])
  },
  methods:{
      ...mapMutations(['setCartNum','setFoot','set_gwc_show_true']),
      cadd(){
        this.$http.get('index.php?control=Address&action=add_car',{
            params:{
              id:this.$route.params.id
            }
          }).then(function(){
            alert('加入购物车成功！')
          });
          
      },
      cadd2(){
        
        // var last_cart = localStorage.getItem('car')
        // if (last_cart) {
        //   last_cart = JSON.parse(last_cart)
        // }else{
        //   last_cart =  []
        // }

        // let exist = false;
        // let index = -1;
        // last_cart.forEach((item,key)=>{
        //   if(item.id==this.good_list.id){
        //     exist = true;
        //     index = key;
        //   }
        // })
        // if(exist){
        //   ++last_cart[index]['count'];
        // }else{
        //   this.good_list['count']=1;
        //   last_cart.push(this.good_list);
        // }
        
        // localStorage.setItem('car',JSON.stringify(last_cart));
        // this.setCartNum();
        this.set_gwc_show_true();
        
        
      }

    }
 
}
</script>
<style type="text/css">
  .wrap{
  width: 100%;
  display: flex;
  background: #fff;
  bottom: 0;
  left: 0;
  position: fixed;
  bottom: 0px;
  text-align: center;

}
.wrap>div{
  padding-top: 5px;
  width: 25%;
  color: orange;

}
.logo{
  width: 100%;
}
.logo img{
  width: 30%;
  
  display: inline-block;

}
.btag{
  width: 100%;
  line-height: 20px;
  font-size: 15px;
  text-align: center;
  color: #999;
}


.cbott{
      width: 100%;
      display: flex;
      background: #fff;
      bottom: 0;
      left: 0;
      position: fixed;
      bottom: 0px;
      
  }
  .chome,.ccar{
    width: 25%;
    text-align: left;
  }
  .ccar_but{
    flex: 1;
    line-height: 53px;
    font-size: 16px;
    font-family: 微软雅黑;
    font-weight: bolder;
    background: #ff6700;
    color: #fff;
    text-align: center;
  }
  .clogo{
    width: 100%;
    text-align: center;
  }
  .clogo img{
    width: 30%;
    
    display: inline-block;

  }
  .cbtag{
    width: 100%;
    line-height: 20px;
    font-size: 15px;
    text-align: center;
    color: #999;

  }

</style>