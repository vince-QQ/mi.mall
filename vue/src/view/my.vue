<template>
   <div class="contaner">
     <div class="p1 main">
        <img class="nnnn" src="http://localhost/images/images/bg.jpg" alt="">
        <div @click = "show_order()">
        <p>我的订单</p>
        </div>
        <div>
            <img src="http://localhost/images/images/logo.png" alt="">
            <p>我的钱包</p>
        </div>
        <div>
            <img src="http://localhost/images/images/logo4.png" alt="">
            <p>会员中心</p>
        </div>
        <div>
            <img src="http://localhost/images/images/logo2.png" alt="">
            <p>物流提醒</p>
        </div>
      <div class="p2 main">
            <div>
            <img src="http://localhost/images/images/logo3.png" alt="">
            <p>服务中心</p>
            </div>
         <div>
            <img src="http://localhost/images/images/logo8.jpg" alt="">
            <p>直供点</p>
        </div>
         <div>
            <img src="http://localhost/images/images/logo6.jpg" alt="">
            <p>小米之家</p>
        </div>
      </div>
      <div class="p3 main">
            <div>
            <img src="http://localhost/images/images/logo9.jpg" alt="">
            <p>设置</p>
          </div>
      </div>
      <button @click="logout()"  type="error" style="background:red;width:80%;margin-left: 10%; font-size: 30px;color:white;">退出</button>
      </div>
   </div>
</template>

<script>
export default{
  methods:{
    logout(){
      localStorage.removeItem('user_state');//点击触发删除本地存储保存的用户转态
        //先设置本地存储的状态
        this.$store.commit('set_user_state',[]);
        //设置state的user_state转态
          // 跳转个人中心
          this.$router.push('/home');
          //设置跳转的路由
    },
    show_order(){
        this.$router.push('/order');
    }
  }
}
</script>

<style>
.container{
  width: 100%;
  text-align: left!important;
  background: #c0bdbd;
}
.container .main img{

}
.main{
  width: 100%;
  height: 100%;
  margin-bottom: 1rem;
}
.main div{
   width: 100%;
  height: 2.5rem;
  line-height: 2.5rem;
  margin-right: 20rem;
}
.main div p{
  line-height: 2rem;
  font-size: 1rem;
  font-weight: bold;
  margin-left: 1.5rem;
  display: inline-block;
  height: 2rem;
  
}
.nnnn{
  width: 375px;
}
.main div img{
  width:2rem;
  height: 2rem;
  display: inline-block;
}
.xiao{
  width: 1rem;
  height: 1rem;
}
.p1{
  margin-bottom: 2rem;
}
.p2{
  margin-top: 2rem;
}
.p3{
  margin-top: 6rem;
  margin-bottom: 2rem;
}

</style>
