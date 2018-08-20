<template>
	<div>
	<div class="good-box" v-for=" item in goods_list">
		<div>
			<router-link :to="'/good_desc/'+item.id">
				<div class="img-box"><img :src="imgurl+item.g_picurl"></div>
				<div>
					
					<div class="title">{{item.g_name}}</div>
					<div class="desc" v-html="item.g_desc"></div>
					<div class="price">￥{{item.price}}<del class="dprice">{{item.d_price}}</del></div>
				</div>
			</router-link>
		</div>
	</div>

</div>
</template>
<script >
	
export default{
		data(){
			return{
				imgurl:this.$picurl,
			}
		},
		props:{
			goods_list:{
				type:Array
			}
		}
		// created(){
			// console.log(1);
			// this.$jsonp('http://localhost/first_mvc/index.php?control=Goods&action=goods_list_data').then(function(json){
	  //       this.good_list = json.data;
	  //       console.log(this.good_list);

	        
		  // this.$http.get('http://localhost/first_mvc/index.php?control=Goods&action=goods_list_data',{
			 //  // withCredentials:true
		  // }).then(function(data,msg){
			 //  console.log(data);	
			 //  console.log(msg);
		  // }).catch(function(err){
			 //  console.log(err);
		  // })
	// 	 this.init();
	// 	},
      
		
	// 	methods:{
			
	// 		init(){
	// 			this.$jsonp('http://localhost/first_mvc/index.php?control=Goods&action=goods_list_data',{params: {pageID:29},jsonp:"_callback"}).then(json => {
	// 				this.good_list = json.data;
	// 		})
	// 		}
		
	// }
}

</script>
<style type="text/css" scoped="">
	.good-box{
		width: 49%;
		margin-left: 0.5%;
		float: left;
		display: inline-block;
		text-align: left;
	}
	.img-box{
		width: 100%;
	}
	.img-box img{
		width: 100%;
		height: 198px;
	}
	.title{
		font-size: 20px;
		color: black;
		width: 100%;
		height: 25px;
		line-height: 25px;
		overflow: hidden;


	}
	.desc{
		font-size: 14px;
		color: gray;
		height: 20px;
		line-height: 20px;
		overflow: hidden;

	}
	.price{
		color: red;
		font-size: 16px;
	}
	.dprice{
		font-size: 12px;
		color: gray;
	}


</style>