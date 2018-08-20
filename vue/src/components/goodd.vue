<template>
	<div>
		<div class="good-box">
			<div>			
				<div class="img-box"><lunbo2 :picurl2="slide_pic" height="380px" /></div>
				<div>
					
					<div class="title">{{good_list.name}}</div>
					<div class="desc" v-html="good_list.g_desc"></div>
					<div class="price">￥{{good_list.price}}<del class="dprice">{{good_list.d_price}}</del></div>
				</div>		
			</div>
		</div>
</div>
</template>
<script >
import lunbo2 from "@/components/lunbo2.vue"
import {mapState} from 'vuex'
import {mapMutations} from 'vuex' 
export default{
		data(){
			return{
				imgurl:this.$picurl,
				good:[],
				
			}
		},
		created(){

			// this.slide_pic = JSON.parse(this.good_list.slide_picurl);
		},
		// computed:{
		// 	...mapState(['cartNum'])
		// },
		props:{
			
			good_list:{
				
			},
			slide_pic:{
				type:Array
			}
		},
		components:{
			lunbo2
		},
		// methods:{
		// 	...mapMutations(['setCartNum']),
		// 	cadd(){
		// 		this.$http.get('index.php?control=Address&action=add_car',{
		// 	  		params:{
		// 	  			id:this.$route.params.id
		// 	  		}
		// 	  	}).then(function(){
		// 	  		alert('加入购物车成功！')
		// 	  	});
			  	
		// 	},
		// 	cadd2(){

		// 		var last_cart = localStorage.getItem('car')
		// 		if (last_cart) {
		// 			last_cart = JSON.parse(last_cart)
		// 		}else{
		// 			last_cart =  []
		// 		}

		// 		let exist = false;
		// 		let index = -1;
		// 		last_cart.forEach((item,key)=>{
		// 			if(item.id==this.good_list.id){
		// 				exist = true;
		// 				index = key;
		// 			}
		// 		})
		// 		if(exist){
		// 			++last_cart[index]['count'];
		// 		}else{
		// 			this.good_list['count']=1;
		// 			last_cart.push(this.good_list);
		// 		}
				
		// 		localStorage.setItem('car',JSON.stringify(last_cart));
		// 		this.setCartNum();
				
		// 	}

		// }
		
}

</script>
<style type="text/css" scoped="">
	.good-box{
		overflow: hidden;
		width: 100%;
		text-align: left;
	}
	.img-box{
		width: 100%;
	}
	.img-box:after{
		content: '';
		display: block;
		clear: both;

	}
	.title{
		font-size: 32px;
		color: black;
		margin-top: 30px;
	}
	.desc{
		font-size: 20px;
		color: gray;
	}
	.price{
		color: red;
		font-size: 24px;
	}
	.dprice{
		font-size: 18px;
		color: gray;
	}
</style>