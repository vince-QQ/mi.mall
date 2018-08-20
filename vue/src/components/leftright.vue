<template>
	<div class="good_wrap">
		<div class="left">
			<a href=""><img :src="three[0]" alt=""></a>
		</div>
		<div class="right">
			<a href=""><img :src="three[1]" alt="" class="rigth-top"></a>
			<a href=""><img :src="three[2]" alt="" class="right-bottom"></a>
		</div>
	</div>
</template>
<script>
	export default{
		props:{
			three:{}
		}
	}
</script>
<style type="text/css">
	.good_wrap{
		position: relative;
		width: 100%;
		text-align: left;
	}
	.group a{
		list-style: none;
		display: inline-block;
	}
	.left{
		width: 49%;
		display: inline-block;

	}
	.left img{
		width: 100%;
	}
	.right{

		width: 50%;
		float: right;

	}
	.right img{
		width: 100%;
		height: 128px;
	}
	
</style>