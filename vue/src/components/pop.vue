<template>
	<div>
		<div>
		<div class="shadow" v-show="pop_show"></div>

		<transition name="updownSlide">
			<div class="p_content" v-show ="pop_show">
				<div class="close" @click="hide()">×</div>
				<div class="content">
					<slot></slot>
				</div>
			</div>
		</transition>
	   </div>
	</div>
</template>


<script >
import {mapState} from 'vuex'
import {mapMutations} from 'vuex'
 export default {
 	computed:{
	  	...mapState(['cartNum','foot_type','gwc_show'])
	  },
		props:{
			value:{
				type:Boolean,
				default:false
			}
		},
		data(){
			return {
				pop_show:this.value
			}
		},
		watch:{
			value(){
				this.pop_show = this.value
			}
		},
		methods:{
			...mapMutations(['setCartNum','setFoot','set_gwc_show_false']),
			hide(){
				this.pop_show = false;
				this.$emit('input',false);
				this.set_gwc_show_false();

			}
		}
}

</script>
<style type="text/css" >
	
	.shadow{position: absolute;bottom:0px;left: 0;width: 100%;height: 100vh;background-color: #333;opacity: 
		0.5;
		}

	.updownSlide-enter{
		transform: translate(0,100%);
	}
	.updownSlide-enter-active,.updownSlide-leave-active{
		transition: all 1s
	}
	.updownSlide-leave-to{
		transform: translate(0,100%);
	}
	.p_content{z-index: 999;background-color: white; width: 100%; height: 500px; position: fixed; bottom: 0;}
	.close{
		width: 40px;
		height: 40px;
		border-radius: 50%;
		border:1px solid gray;
		position: absolute;
		line-height: 40px;
		font-size: 38px;
		top: 10px;
		right: 10px;
		text-align: center;
		
	}
</style>