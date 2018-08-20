<template>
	<div class="good_wrap">
		<div class="top">
			<a href=""><img :src="three[0]" alt=""></a>
		</div>
		<div class="bottom">
			<div class="left"><a href=""><img :src="three[1]" alt=""></a></div>
			<div class="right"><a href=""><img :src="three[2]" alt=""></a></div>
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
		width: 100%;
	}
	.good_wrap:after{
		content: '';
		display: block;
		clear: both;
	}
	.top img{
		width: 100%;
	}
	.left,.right{
		width: 49.5%;

		display: inline-block;
		float: left;

	}
	.right{
		margin-left: 1%
	}
	.bottom img{
		width: 100%;
		height: 187px;
	}
</style>