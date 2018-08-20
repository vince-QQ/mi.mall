<template>
		<div class="box">
			<div class="gwc">购物车</div>
			<div class="sum" @click="show_sum()">

				<span class="gou"></span>
				<strong>合计：</strong>
				<span ref="account">{{price_sum}}</span>
			</div>
			<div class="goods" v-for=" car in car_list">
				<div>
					<img class="goodas_picture" :src="imgurl+car.picurl" alt="">
				</div>
				<div class="jg">
					<p>商品名称：{{car.name}}</p><br>
					<p>商品价格：￥<span>{{car.price}}</span></p>
					<p>版本：<span>{{car.spec_content.split('|')[0]}}</span></p>

					<div class="sl">
						<button @click="substract_good(car.id,car.count)">-</button>
						<p class="bq"><span>{{car.count}}</span></p>
						<button @click="add_good(car.id,car.count)">+</button>
						<p class="sx" @click="del(car.id)">删除</p>
					</div>
				</div>
				
			</div>
			
			

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
	  created(){
			this.car_list = JSON.parse(localStorage.getItem('car'));
			console.log(this.car_list);

		},
		computed:{
			price_sum:function(){ 
				let sum = 0;
				this.car_list.forEach((item,key)=>{
					sum += (parseInt(item.price)*parseInt(item.count));
				})
				return sum;
			}
		},
		methods:{
		substract_good(id,count){
			var data = JSON.parse(localStorage.getItem('car'));

			data.forEach((item,key)=>{
					if (item.id == id) {
						if(item.count>1){
							item.count-=1;
						}
						else{
							data.splice(key,1);
						}
					}
				})
			this.car_list = data;
			localStorage.setItem('car',JSON.stringify(data));

		},
		add_good(id,count){
			
			var data = JSON.parse(localStorage.getItem('car'));

			data.forEach((item,key)=>{
					if (item.id == id) {
						item.count+=1;
					}
				})
			this.car_list = data;
			localStorage.setItem('car',JSON.stringify(data));

		},
		del(id){
			var data = JSON.parse(localStorage.getItem('car'));

			data.forEach((item,key)=>{
					if (item.id == id) {
						data.splice(key,1);
					}
				})
			this.car_list = data;
			localStorage.setItem('car',JSON.stringify(data));
		},
		show_sum(){
			var sPan = this.$refs.account;
			if(this.show){
				this.show=false;
				sPan.style.display = 'none';
			}else{
				this.show = true;
				sPan.style.display = 'inline';
			}

		}

	}
}
</script>
<style>
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
	height: 100%;	
}
.goodas_picture:hover{
	border: blueviolet solid 2px;
}
.goods{
	display: flex;
	margin-bottom: 20px;
	top:50px;
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
