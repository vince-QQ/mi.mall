<template>
    <div>
    	<div class="a-wrap" style="width: 100%">
	        <h1>收货地址</h1>
	        <div class="a-box" v-for=" item in address">
	        	<button class="a-butt" @click = "choose_address(item.id)">选择</button>
	        	<div class="a-name">{{item.a_name}}</div>
	        	<div class="a-phone">{{item.a_phone}}</div>
	        	<div class="a-area">{{item.a_area}}</div>
	        </div>
	        <button class="add_address" @click = "show_address()">添加收获地址</button>
	        <pop v-model="c_show">
			<form action="" method="post" class="biaodan">
				<div class="form-group1">
					<label>收货人姓名：</label>
					<input class="nichen" type="text"v-model="a_name">
				</div>
				<div class="form-group1">
					<label>收货人号码：</label>
					<input class="nichen" type="text" v-model="a_phone">
				</div>
				<div class="form-group2">
					<label>收获地址：</label>
					<textarea v-model="a_area"></textarea>
				</div>
				<div class="form-group3">
					<input type="button" class="button_publish" value="确认添加" @click="add_address()">
				</div>
				
			</form>
		</pop>
	    </div>
    </div>
</template>
<script>
import pop from '../components/pop.vue'

export default {
		data(){
	    return{
	    	address:[],
	    	c_show:false,
	    	a_name:'',
	    	a_phone:'',
	    	a_area:''

	    }
	  }, 
	  components:{
	  	pop,
	  },
	  created(){
	  	this.$http.get('Goods/address')
	  	.then((rtnD)=>{
	  	this.address =  rtnD.data;
	  	
	  	});
	  	
	  },
	  methods:{
	  	
	  	show_address(){
	  		this.c_show=true;
	  	},
	  	add_address(){
	  		this.$http.post('Goods/add_address',{
	  			a_name:this.a_name,
	  			a_phone:this.a_phone,
	  			a_area:this.a_area
	  		})
		  	.then(()=>{
		  		this.$Message.success('添加成功');
			  	this.$http.get('Goods/address')
			  	.then((rtnD)=>{
			  	this.address =  rtnD.data;
			  	this.c_show = false;
	  		});
		  	
		  	});
	  	},
	  	choose_address(aid){
	  		
	  		this.$router.push({ name:'sum_up', params: { id:aid }});
	  		// this.$http.get('Goods/address_id',{
	  		// 	params:{
	  		// 		id:aid
	  		// 	}
	  		// })
	  	}
	  },
	  
}
</script>




<style>
.form-group1{
	margin-top: 20px;
}
.form-group1 label{
		margin-left: 10px;
		width: 28%;
		height: 30px;
		line-height: 30px;
		font-size: 24px;
	}
	.nichen{
		width: 50%;
		height: 30px;
		line-height: 30px;
		font-size: 24px;
		border:1px solid gray;
		
		outline: none;
		color: black;
	}
.biaodan{
		margin-top: 90px;
	}
	.form-group2{
		margin-top: 70px;
	}
	.form-group2 label{
		width: 30%;
		margin-left: 10px;
		height: 30px;
		line-height: 30px;
		font-size: 24px;

	}
	.form-group2 textarea{
		width: 60%;
		height: 120px;
		line-height:30px;
		font-size: 26px; 
		vertical-align: top;
		
		border:1px solid gray;
		outline: none;
		color: black;
		
	}
	.form-group3{
		text-align: center;
		margin-top: 30px;
	}
	.button_publish{
		width: 120px;
		text-align: center;
		height: 40px;
		line-height: 40px;
		font-size: 25px
	}
.a-wrap{
	
	margin:0px auto;
	
}
.a-wrap h1{
	text-align: center;
	color: orange;
	font-size: 26px;
}
.a-name{
	font-size: 24px;

}
.a-phone{
	font-size: 22px;
}
.a-area{
	font-size: 20px;
}
.a-box{
	border:1px dashed gray;
	position: relative;

	margin:10px 5% 10px 5%;
}
.a-butt{
	padding:2px 6px;
	font-size: 22px;
	outline: none;
	background: #ff6700;
	color: white;
	position: absolute;
	top: 20px;
	right: 20px;
}
.add_address{
	margin-top: 40px;
	outline: none;
	font-size: 32px;
	color: white;
	font-family: 微软雅黑;
	background: #ff6700;
	margin-bottom: 70px;
}
</style>