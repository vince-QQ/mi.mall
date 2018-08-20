<template>
   <div class="contaner">
     <h1>这是登录界面</h1>
     <form onsubmit="return false">
        <div class="form-row">
          <label>用户名：</label>
          <input ref="un" class="txt" v-model="uname"  type="text" name="uname" @blur="search_uname()">
          <div ref="tip" class="tip">***您输入的用户名不存在****</div>
        </div>
        <div class="form-row">
          <label>密码：</label>
          <input v-model="upwd" class="txt" type="password" name="upwd">
        </div>
        <div class="form-row">
          <input class="butto" type="button" value="登录" @click="login()">
           <input class="butto"  type="button" value="注册" @click="reg()">
        </div>
    </form>

   </div>
</template>
<script>

  export default{
    data(){
      return {
        uname:'',
        upwd:''
      }
    },
    methods:{
      search_uname(){
          this.$http.post('User/search_uname',{
            uname:this.uname
          }).then((data)=>{
            if(data.data == 'fail'){
              this.$refs.un.style.border = '1px solid red';
              this.$refs.tip.style.display = 'block';
            }
            else if(data.data=='success'){
              this.$refs.un.style.border = '1px solid orange';
              this.$refs.tip.style.display = 'none';
            }
          })
      },
      login(){
          this.$http.post('User/login',{
            uname:this.uname,
            password:this.upwd
          }).then((data)=>{
            if(data.data == 'fail'){
             this.$Message.error('您输入的密码有误！请重新输入');
            }
            else if(data.data=='success'){
                localStorage.setItem('user_state',JSON.stringify({id:1,uname:'陈'}));
                //先设置本地存储的状态
                this.$store.commit('set_user_state',{id:1,uname:'陈'});
                //设置state的user_state转态
                  // 跳转个人中心
                this.$router.push('/car');
                 //设置跳转的路由              
            }
          })
  
      },
      reg(){
       this.$router.push({ path:'/reg'});
      }
    }
  }
</script>

<style>
.butto{
  font-size: 24px;
  padding:2px 8px;
  margin-right: 30px;
}
h1{
  text-align: center;
}
.form-row{
  font-size: 20px;
  margin-top: 50px;
  text-align: center;
}
.txt{
  border:1px solid orange;
  outline: none;
}
.tip{
  color: red;
  display: none;
}
</style>
