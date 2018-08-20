<template>
		<div class="slider_box" @touchstart="tStart" @touchmove="tMove" @touchend="tEnd" :style="'height:'+height">
			<div class="slider_img" v-for="(img,index) in picurl2">
				<transition :name="howGo">
					<img v-show="index == show" :src="pic+img"  alt="">
				</transition>
			</div>
			<ol class="oli">
				<li v-for=" (i ,index) in picurl2" :class="{'cur': index == show}"></li>
			</ol>
		</div>

	</div>
</template>

<script>

	export default {
		data(){
			return {
				msg:'',
				howGo:null,
				show:0,
				startX:0,
				pic:this.$picurl,
			}
		},
		props:{
			picurl2:{
				type:Array
			},
			height:{
				type:String,
				default:'153px'
			}
		},
		methods:{
			
			tStart(e){
				this.startX = e.touches[0].clientX
			},
			tMove(e){

			},
			tEnd(e){
				
				let endX = e.changedTouches[0].clientX;
				if(endX > this.startX){
					this.howGo = 'right';
					this.show-=1;
					if(this.show<0){
						this.show = 0;
					}
				}else if(endX < this.startX){
					
					this.show += 1;
					this.howGo = 'left';
					if(this.show>=this.picurl2.length){
						this.show = this.picurl2.length-1;
					}

				}
			}
		}
	}
</script>

<style type="text/css">
	img{width: 100%}
	/*进来前*/
	/*enter是给下一张图片加样式*/
	 .left-enter{
	 	transform: translate(100%,0);
	 } 
	 .left-leave-to{
		transform: translate(-100%,0);
			
	 }
	  .left-enter-active ,.left-leave-active,.right-enter-active ,.right-leave-active{
	 	transition: all 1s;
	 }
	 /*向右*/
	  .right-enter{

	 	transform: translate(-100%,0);
	 }
	 .right-leave-to{
		transform: translate(100%,0);
			
	 }
	 .slider_box{position: relative;}
	 .slider_box > div{position: absolute; top: 0}
	 .oli{
	 	display: inline-block;
	 	position: absolute;
	 	left: 37%;
	 	bottom: 10px;
	 	text-align: center;
	 }
	 .oli li{
	 	width: 10px;
	 	height: 10px;
	 	border: 1px solid orange;
	 	border-radius: 50%;
	 	float: left;
		margin-left: 10px;
		list-style: none;
	 }
	 .cur{
	 	background: white;
	 }
</style>