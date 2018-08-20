<template>
		<div class="box">
			<div class="gwc">购物车</div>
			<div class="sum" @click="show_sum()">

				<span class="gou"></span>
				<strong>合计：</strong>
				<span ref="account">{{price_sum}}</span>
				<strong style="padding-left: 40px;">数量：</strong>
				<span ref="account2">{{count}}</span>
			</div>
			<div class="goods" v-for=" car in car_list">
				
				<div>
					<img class="goodas_picture" :src="imgurl+car.goods_picurl">
				</div>
				<div class="jg">
					<p>商品名称：{{car.goods_name}}</p><br>
					<p>商品价格：￥<span>{{car.goods_price}}</span></p>
					<p>版本：<span>{{car.spec_content.split('|')[0]}}</span>
						颜色：<span>{{car.spec_content.split('|')[1]}}</span>
					</p>
					<div class="sl">
						<button @click="substract(car.goods_id,car.spec_content)">-</button>
						<p class="bq"><span>{{car.num}}</span></p>
						<button @click="add_but(car.goods_id,car.spec_content)">+</button>
						<p class="sx" @click="del(car.goods_id,car.spec_content)">删除</p>
					</div>
				</div>
				
			</div>

			<button class="jiesuan" @click="sum_up()">结算</button>
			
		</div>	
</template>
<script>
export default {
	data(){
		return{
			car_list:[],
			imgurl:this.$picurl,
			sum:0,
			show:false,
		}
	},
	computed:{
			price_sum:function(){ 
				let sum = 0;
				this.car_list.forEach((item,key)=>{
					sum += (parseInt(item.goods_price)*parseInt(item.num));
				})
				return sum;
			},
			count:function(){
				let sum = 0;
				this.car_list.forEach((item,key)=>{
					sum += item.num;
				})
				return sum;
			}
		},
	created(){
      this.$http.get('Goods/cart')
      .then((rtnD)=>{
      console.log(rtnD.data); 
      this.car_list = rtnD.data;

      })
    },
    methods:{
    	add_but(id,spec){
    	this.$http.get('Goods/add_button',{
			  		params:{
			  			id:id,
			  			spec_content:spec
			  		}
			  	}).then(()=>{
			  		this.$http.get('Goods/cart')
				    .then((rtnD)=>{
				    this.car_list = rtnD.data;
      				})
			  	})
    	},
    	substract(id,spec){
    	this.$http.get('Goods/substract_button',{
			  		params:{
			  			id:id,
			  			spec_content:spec
			  		}
			  	}).then(()=>{
			  		this.$http.get('Goods/cart')
				    .then((rtnD)=>{
				    this.car_list = rtnD.data;
      				})
			  	})
    	},
    	del(id,spec){
    	this.$http.get('Goods/delete_button',{
			  		params:{
			  			id:id,
			  			spec_content:spec
			  		}
			  	}).then(()=>{
			  		this.$http.get('Goods/cart')
				    .then((rtnD)=>{
				    this.car_list = rtnD.data;
      				})
			  	})
    	},
    	show_sum(){
			var sPan = this.$refs.account;
			var sPan2 = this.$refs.account2;
			if(this.show){
				this.show=false;
				sPan.style.display = 'none';
				sPan2.style.display = 'none';
			}else{
				this.show = true;
				sPan.style.display = 'inline';
				sPan2.style.display = 'inline';
			}

		},
		sum_up(){
			this.$router.push({path:'/sum_up'});
		}
    }
}
</script>
<style>
.jiesuan{
	width: 100px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	font-size: 30px;
	background: #ff6700;
	outline: none;
	border:none;
	color: white;
	font-weight: bolder;
	margin-bottom: 140px;
}
.sum span .gou{
	width: 20px;
	height: 20px;
	background: red;
	border:1px solid gray;
	border-radius: 50%;
	z-index: 999;
}
.sum{
	font-size: 25px;
}
.sum span{
	font-size: 20px;
	color: red;
	font-weight: bolder;
	display: none;
	
}
.box{
	width: 100%;
	height: 100vh;
	
}
.gwc{
	background:#f3f3f3;
	text-align: center;
	font-size: 30px;
	height: 50px;
	width: 100%;
}
.goodas_picture{
	width: 35%;
		
}
.goodas_picture:hover{
	border: blueviolet solid 2px;
}
.goods{
	display: flex;
	margin-bottom: 20px;
	top:50px;
	overflow:hidden;
}
.jg{
	margin-left:-55%;
}

.sl{
	display: flex;
	margin-top: 20px;
}
.bq{
	width: 50px;
	border:#666 solid 2px;
	text-align: center;
}
button{
	width: 30px;
}
button:hover{
	border: red solid 2px;
}
p{
	font-size: 15px;
}
span{
	color:red;
	font-weight: bold;
}
.sx{
	width: 40px;
	margin-left: 50px;
	
	background: #f3f3f3;
}
.sx:hover{
	border: red solid 2px;
}
</style>
