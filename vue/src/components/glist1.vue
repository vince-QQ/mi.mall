<template>
    

<div>
            
     <div>
               
                <div class="goods"    v-for="goods in goodslist" >
                       <!-- //v-for="goods in goodslist把已经获取的商品信息遍历出来 -->
                    <router-link to="/ginfor"  >
                    <img :src="apiurl+goods.g_picurl"  alt=''>
                    <br>
                    <p>{{goods.g_name}}</p>       
                    </router-link>                    
                </div>
     </div>        
         
           

                
            
</div>
</template>



<script>
export default {
    //获取从上一个页面传过来的数据
    props:{
        goodslist:{
            type:Array,
        }
    },
    //data 是用来定义一个变量
      data(){ 
        return{
            apiurl :this.$picurl
        }
    },

   

}




</script>

<style type="text/css">
.goods_box{
    display: flex;
    width: 100%;

}
.goods{
    float: left;
    height: 100px;
    width:33.3%;
}
.goods img{
    width: 50px;
    height: 50px;
}


</style>
