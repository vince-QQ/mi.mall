<template>
	<div class="nva-box"  @touchstart="tStart" @touchmove="tMove" @touchend="tEnd">
		<ul class="nav_bar" ref="bar" id="bar" style="width: 200%">
			<li class="nav" v-for=" item in navdata">{{item}}</li>
		</ul>
		
	</div>
</template>
<script>
	export default{
		data(){
			return{
			startX:0,
			distance:0,
			long:0,
			
		    }
		},
		mounted(){
			let bar = this.$refs.bar;
			// this.long = document.body.clientWidth - parseFloat(bar.style.width);
			this.long = document.body.clientWidth-bar.clientWidth;

		},
		props:{
			navdata:{
				type:Array,
			}
			
		},
	
		methods:{
			tStart(e){
				this.startX = e.touches[0].clientX;
			},
			tMove(e){
				var bar = document.getElementById('bar');
				let move = e.touches[0].clientX-this.startX;
				bar.style.left = this.distance+move+'px';
			},
			tEnd(e){
				var bar = document.getElementById('bar');
				this.distance += e.changedTouches[0].clientX-this.startX;
				if(this.distance>0){
					this.distance=0;
				}
				else if(this.distance<this.long){
					this.distance=this.long;
				}
				
				bar.style.left = this.distance+'px';
				
			}
		}
	}
</script>
<style type="text/css">
	.nva-box{
		vertical-align:middle; 
		width: 100%;
		height: 35px;
		overflow-x: hidden;
		position: relative;
		background: #f2f2f2;
	}
	.nav_bar{
		width: 200%;
		height: 100%;
		margin:0px 0px;
		padding-left: 0px;
		
		position: absolute;
	}
	.nav{
		margin: 0px 0px;
		width: 10%;
		height: 35px;
		line-height: 35px;
		font-size: 16px;
		text-align: center;
		float: left;
		list-style: none;
		font-weight: bold;
		color: gray;
	}
	
</style>