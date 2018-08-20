<template>
	<div class="tag-box">
		<div class="tag" v-for="img in tagurl"><a href=""><img :src="img"></a></div>
	</div>
</template>
<script>
export default{
	props:{
		tagurl:{}
	}
}
</script>
<style type="text/css">
	.tag-box{
		display: flex;
	}
	.tag{
		width: 20%;
	}
	.tag img{
		width: 100%;
	}
</style>