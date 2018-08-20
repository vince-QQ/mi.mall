<template>
	<div class="good-box">
		<div class="img-box"><img :src="data.picurl"></div>
		<div>
			
			<div class="title">{{data.name}}</div>
			<div class="desc">{{data.desc}}</div>
			<div class="price">￥{{data.price}}<del class="dprice">{{data.d_price}}</del></div>
		</div>
	</div>
</template>
<script >
export default{
	
		props:{
			data:{}
		}
	}

</script>
<style>
	.good-box{
		width: 49%;
		text-align: left;
		float: left;
		margin-left: 0.5%;
		
		
	}
	.img-box{
		width: 100%;
		height: 200px;
	}
	.img-box img{
		width: 100%;
		height: 100%;
	}
	.title{
		font-size: 20px;
		color: black;
	}
	.desc{
		font-size: 14px;
		color: gray;
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
