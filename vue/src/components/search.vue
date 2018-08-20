<template>
	<div class="search-box">
		<div class="left-logo"><img src="http://localhost/images/left.png" class="left-img"></div>
		<div class="search"><img class="center" src="http://localhost/images/fdj.png"><input type="text" name="search" @click="sousuo()"></div>
		<div class="right-logo"><img src="http://localhost/images/right.png" class="right-img"></div>
	</div>
</template>
<script>
	export default{
		methods:{
			sousuo(){
				this.$router.push({ path:'/sousuo'});
			}
		}
	}


</script>
<style type="text/css">
	.search-box{
		width: 100%;
		height: 50px;
		display: flex;
		background: #f2f2f2;
	}
	.left-logo,.right-logo{
		width: 15%;
		height:100%;
	}
	.search{
		width: 70%;
		height: 34px;
		margin-top: 8px;
		background: white;
		display: flex;
	}
	.search input{
		height: 34px;
		line-height: 34px;
		font-size: 20px;
		flex: 1;
		border:none;
		outline: none;
	}
	.left-img{
		width: 25px;
		height: 17px;
		margin-top: 16.5px;
	}
	.center{
		width: 34px;
		height: 34px;
		/*position: absolute;
		left: 0px;
		top: 0px;*/
	}
	.right-img{
		width: 32px;
		height: 32px;
		margin-top: 9px;
	}
	
</style>