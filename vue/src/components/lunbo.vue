<template>
	<div class="box" @touchstart="start" @touchmove="move" @touchend="end">
		<ul class="img-box" id="cwrap" style="margin-left: 0px">
			<li class="ali" v-for="img in picurl" ref="autoli"><img :src="pic+img"></li>
			<!-- <li class="ali"><img src="http://localhost/images/02.jpg"></li>
			<li class="ali"><img src="http://localhost/images/03.jpg"></li>
			<li class="ali"><img src="http://localhost/images/04.jpg"></li> -->
		</ul>
		<div class="slide-tip">
			<span class="tip" v-for=" (item,i) in picurl" :class="{'curr':index==i}"></span>
		</div>
	</div>
</template>
<script>
export default{
props:{
		picurl:{}
		},
data () {
	return{
		startX:0,
		endX:0,
		index:0,
		width:0,
		pic:this.$picurl,
		timer:{},
	}
},
mounted(){

	let autoli = this.$refs.autoli;
	this.width = document.body.clientWidth;
	for(var i = 0; i<autoli.length;i++){
		autoli[i].style.width=this.width+'px';
	}
	this.timer=setInterval(this.auto,1500);
	// console.log(ali);
	// console.log(this.width);
	// ali.style = "float:left;width:"+this.width+"px";
	// console.log(ali.style);
}
,
methods:{
	auto(){
		var wrap = document.getElementById('cwrap');
		let autoli = this.$refs.autoli;

		this.index++;
		if(this.index>=autoli.length){
			this.index=0;
		}
		wrap.style.marginLeft= (-this.index * this.width) + 'px';

	},
	start(e){	

		this.startX = e.touches[0].clientX;
		clearInterval(this.timer);

	},
	move(e){


		var wrap = document.getElementById('cwrap');
		var ali = document.getElementsByClassName('ali');
		var len = e.touches[0].clientX-this.startX;
		var wid = 100*ali.length;
		// if(this.index==0){			
		// 	wrap.style="width:"+wid+"%;margin-left:"+ len + 'px';	
		// }
		// else if(this.index==ali.length-1){

		wrap.style="width:"+wid+"%;margin-left:"+ (len-(this.index * this.width)) + 'px';
	
		// }
	},
	end(e){
		// var bli = this.$refs.bli;
		
		var wrap = document.getElementById('cwrap');
		var ali = document.getElementsByClassName('ali');
		var wid = ali.length*100;		
		var direct = e.changedTouches[0].clientX-this.startX;
		if(direct>0){
			this.index-=1;
			if(this.index<0){
				this.index=0;
			}
		}
		else if(direct<0){
			this.index+=1;
			if(this.index>=ali.length){
				this.index =ali.length-1;
			}
		}
		wrap.style="width:"+wid+"%;transition:all 0.5s;margin-left:"+  (-this.index * this.width) + 'px';
		
			this.timer=setInterval(this.auto,1500);
		


	}
}

}	

</script>
<style type="text/css">
	*{
		margin:0;
		padding:0;
		list-style: none;
	}
	.box{
		width:100%;
		height:187.5px;
		overflow:hidden;
		position: relative;
	}
	
	.img-box li{
		width:375px;
		float:left;
	}
	.img-box li  img{
		width:100%;
	}
	.slide-tip{
		text-align: center;
		position: absolute;
		bottom: 10px;
		left: 40%;
		display: inline-block;

	}
	.tip{
		display: inline-block;
		width: 10px;
		height: 10px;
		border:1px solid orange;
		border-radius: 50%;
		margin-right: 8px;
	}
	.curr{
		background: orange;
	}
	/*.ol{
		display:block;
    	text-align: center;
	}
	.ol .oli{
		width: 10px;
		height: 10px;
		border: 1px solid white;
		border-radius: 50%
	}
	.cur{
		background: white;
	}*/
</style>