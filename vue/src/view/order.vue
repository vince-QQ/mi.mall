<template>
		<div>
			<h1>订单管理界面</h1>
			<div class="order-box" v-for=" (order,index) in order_list">
				<h2>订单号：<span>{{order.order_sn}}</span></h2>
				<h3>下单时间：<span>{{order.time}}</span></h3>
				<h4>商品数量：<span>{{order.sum_num}}</span></h4>
				<h4>订单金额：<span>￥{{order.sum_price}}</span></h4>
				<h4>支付转态：<span>{{order.status}}</span></h4>
				<button class="pay" @click = "pay_order(order.id)" v-if="order.status=='未付款'">去支付</button>
				<pop v-model="c_show">
				<div class="co-img"><img src="../assets/1/11.jpg" ></div>
				
				 	<button class="zhifu" @click = "sure_order()">确认支付</button>
				
				</pop>
			</div>
			<div class="mar-bot"></div>
		</div>
</template>
<script>
import pop from '../components/pop.vue'
export default {
	data(){
		return {
			order_list:[],
			c_show:false,
			oid :0,
		}
	},
	components:{
		pop
	},
	created(){
		this.$http.get('Goods/order_list').then((data)=>{
			this.order_list = data.data;
			console.log(this.order_list);
		})
	},
	methods:{
		pay_order(id){
			this.c_show = true;
			this.oid = id
		},
		sure_order(){
			console.log(this.oid);
			this.$http.post('Goods/order_id',{
				oid:this.oid
			}).then(()=>{
				this.$http.get('Goods/order_list').then((data)=>{
				this.order_list = data.data;
				console.log(this.order_list);
				})

			})


			this.c_show = false;
		}
	}
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
.pay{
	padding:2px 6px;
	position: absolute;
	right: 20px;
	top: 100px;
	background: red;
	color:white;
	font-size: 20px;
}
.order-box{
	position: relative;
	border:1px dashed gray;
	margin-top: 20px;
	color: gray;
}
.order-box span{
	color: black;
}
.order-box h2{
	font-size: 22px;
}
.order-box h3{
	font-size: 20px;
}
.order-box h4{
	font-size: 20px;
}
.mar-bot{
	width: 100%;
	height: 90px;
}
</style>
