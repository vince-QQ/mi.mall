<template>
   <div class="contaner">
     <h1>这是注册界面</h1>
     <form onsubmit="return false">
        <div class="form-row">
          <label>用户名：</label>
          <input ref="un" class="txt" v-model="uname"  type="text" name="uname" @blur="search_name()">
          <div ref="tip" class="tip">***您输入的用户名已经存在****</div>
        </div>
        <div class="form-row">
          <label>密码：</label>
          <input v-model="upwd" class="txt" type="password" name="upwd">
        </div>
        <div class="form-row">
           <input class="txt" type="text" placeholder="请输入验证码" v-model ="ma">
        </div>
        <div class="certain" ref="sure" @click="show()">
          点击获取验证码
        </div>
        <div class="form-row">
          <input type="button" value="注册" @click="reg()">
        </div>
    </form>

   </div>
</template>
<script>

  export default{
    data(){
      return {
        uname:'',
        upwd:'',
        num:0,
        ma:'',
      }
    },
    methods:{
    search_name(){
      this.$http.post('User/search_uname',{

            uname:this.uname
          }).then((data)=>{
            if(data.data == 'success'){
              this.$refs.un.style.border = '1px solid red';
              this.$refs.tip.style.display = 'block';
            }
            else if(data.data=='fail'){
              this.$refs.un.style.border = '1px solid orange';
              this.$refs.tip.style.display = 'none';
            }
          })

    },
    show(){
        var d = this.$refs.sure;
        var num = 0;
        for(var i=0;i<4;i++){
          num*=10;
          num+=Math.floor(Math.random()*10);
        }
        if(num<1000)
          num*=10;
        d.innerHTML='验证码：'+num;
        this.num = num;
      },
    reg(){
      if(this.ma==this.num){
       
        this.$Message.success('注册成功');
         this.$http.post('User/reg',{
           uname:this.uname,
           password:this.upwd
        }).then(()=>{
          this.$router.push('/login');
        })
      }else{
        this.$Message.error('您输入的验证码有误！');
      }
    }


    }
  }
</script>

<style>
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
.certain{
  width: 100%;
  height: 50px;
  line-height: 50px;
  font-size: 40px;
  color: red;
  text-align: center;
  border:1px solid orange;
  margin-top: 20px;
}

</style>
