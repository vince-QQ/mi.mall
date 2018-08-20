<template>
    <div>
    	<div class="a-wrap" style="width: 100%">
	        <h1>结算页面</h1>

	        <h2>收货人信息</h2>
	        <div class="a-box" @click="change_address()">
	        	<div class="a-name">姓名：{{item.a_name}}</div>
	        	<div class="a-phone">电话号码：{{item.a_phone}}</div>
	        	<div class="a-area">详细地址：{{item.a_area}}</div>
	        </div>
	        <h2>订单商品信息</h2>
	      
			<div class="good-box" v-for="car in car_list">
				<div class="img-box">
					<img :src="imgurl+car.goods_picurl" alt="">
				</div>
				<div class="content-box">
					<h2>商品名称：{{car.goods_name}}</h2>
					<h3>版本：<span>{{car.spec_content.split('|')[0]}}</span>
						颜色：<span>{{car.spec_content.split('|')[1]}}</span></h3>
					<h3>商品价格：<span>{{car.goods_price}}</span></h3>
					<h3>购买数量：<span>{{car.num}}</span></h3>
					<h3>小计金额：<span>{{car.num*car.goods_price}}</span></h3>
				</div>

			</div>
			<div class="but-box">
				<button class="add_address" @click = "show_order()">确认下单</button>
			</div>
			<pop v-model="c_show">
				<div class="co-img"><img src="../assets/1/11.jpg" ></div>
				
				 	<button class="zhifu" @click = "sure_order()">确认支付</button>
				
			</pop>

	    </div>
    </div>
</template>
<script>
import pop from '../components/pop.vue'

export default {
		data(){
	    return{
	    	c_show:false,
	    	imgurl:this.$picurl,
	    	car_list:[],
	    	item:[],
	    	id:this.$route.params.id,
	    	uid : 0,

	    }
	  }, 
	 	components:{
	 		pop
	 	},
	  created(){
	  	if(this.$route.params.id){
	  	this.$http.get('Goods/address_id',{
	  		params:{
	  			id:this.id
	  		}
	  	})
	  	.then((rtnD)=>{
	  	this.item = rtnD.data;
	  	console.log(this.item);	
	  	});
	    }else{
	    	this.$http.get('Goods/address_id',{
	  		params:{
	  			id:1
	  		}
	  	})
	  	.then((rtnD)=>{
	  	this.item = rtnD.data;
	  	console.log(this.item);	
	  	});
	    }



	      this.$http.get('Goods/cart')
	      .then((rtnD)=>{
	      console.log(rtnD.data); 
	      this.car_list = rtnD.data;

	      })
   
	  	
	  	
	  },
	  methods:{
	  	change_address(){
	  		this.$router.push({ path:'/address'});
	  	},
	  	show_order(){
	  		this.uid = Math.floor(Math.random()*100);
	  		this.c_show = true;
	  		this.$http.post('Goods/order',{
	  			order_info: JSON.stringify(this.car_list),
	  			uid : this.uid 
	  			
	  		})
	  	},
	  	sure_order(){
	  		this.c_show = false;
	  		this.$Message.success('支付成功');
	  		this.$http.post('Goods/order',{
	  			order_info: JSON.stringify(this.car_list),
	  			status: '已支付',
	  			uid : this.uid
	  		})
	  	}
	  	
	  },
	  
}
</script>

<style>
.zhifu{
	width: 100%;
	font-size: 30px;
	position: fixed;
	bottom: 10px;
}
.co-img{
	text-align: center;
	padding-top: 70px;
}
.co-img img{
	width: 80%;
}
.but-box{
	text-align: center;
}
.add_address{
	margin-top: 40px;
	outline: none;
	font-size: 32px;
	color: white;
	font-family: 微软雅黑;
	background: #ff6700;
	margin-bottom: 70px;
}
.good-box{
	border:1px solid gray;
	display: flex;
}

.img-box{
	width: 40%;
}
.img-box img{
	width: 100%;
}
.content-box{
	width: 60%;
}
.content-box h3{
	font-size: 18px;
}
.content-box h3 span{
	color: red;
}
.a-wrap{
	
	margin:0px auto;
	
}
.a-wrap h1{
	text-align: center;
	color: orange;
	font-size: 26px;
}
.a-wrap h2{
	margin-top: 20px;
	text-align: center;
	color: black;
	font-size: 22px;
}
.a-name{
	font-size: 24px;

}
.a-phone{
	font-size: 22px;
}
.a-area{
	font-size: 20px;
}
.a-box{
	border:1px dashed gray;
	position: relative;

	margin:10px 5% 10px 5%;
}
.a-butt{
	padding:2px 6px;
	font-size: 22px;
	outline: none;
	background: #ff6700;
	color: white;
	position: absolute;
	top: 20px;
	right: 20px;
}
.add_address{
	margin-top: 40px;
	outline: none;
	padding: 0px 10px;
	font-size: 32px;
	color: white】;
	font-family: 微软雅黑;
	background: blue;
	margin-bottom: 70px;
}


</style>
