<template>
	<div>
	<div style="width: 100%">
		<goodd :good_list="gooddesc" :slide_pic="slide_data" />
		<div class="c_list">评论列表</div>
		<div class="comment" v-for=" comment in comment_data">
			<div class="cname">评论者：{{comment.c_name}}</div>
			<div class="ctime">评论时间：{{comment.time}}</div>
			<div class="w111">评论内容：</div>
			<div class="ccontent" >{{comment.c_content}}</div>
		</div>
		<div class="add_c"><div @click="add_comment()">添加评论</div></div>
		<pop v-model="c_show">
			<form action="" method="post" class="biaodan">
				<div class="form-group1">
					<label>评论昵称：</label>
					<input class="nichen" type="text" name="c_name" v-model="comment_name">
				</div>
				<div class="form-group2">
					<label>评论内容：</label>
					<textarea name="c_content" v-model="comment_content"></textarea>
				</div>
				<div class="form-group3">
					<input type="hidden" name="id" :value="gooddesc.id">
					<input type="button" class="button_publish" value="确认发布" @click="comment()">
				</div>
				
			</form>
		</pop>
		<pop v-model="gwc_show">
              <form action="" method="post" class="gwc">
                <div class="gwc-wrap">
                	<div class="gwc-img"><img :src="pic+gooddesc.g_picurl"></div>
                	<div>{{gooddesc.g_name}}</div>
                
					<div v-for="(attr,index) in attr_list">
						<ul>
							<li id="ali" :class="{gwc_cur: cur_index== index}" @click="choose(index)">
								<sapn>规格：</sapn>
								 {{attr.type}}/{{attr.color}} 
								<strong>价格：{{attr.price}}</strong>
							</li>
						</ul>
					</div>
					<div class="gwc-button" @click="add_car()">加入购物车</div>
                </div>
                
              </form>
            </pop>
	</div>
	<foot />
</div>
</template>
<script>
import foot from '../components/foot.vue'
import pop from '../components/pop.vue'
import goodd from '../components/goodd.vue'	
import {mapState} from 'vuex'
import {mapMutations} from 'vuex'
	export default {
		data(){
	    return{
	    	c_show:false,
	    	gooddesc:{//单个商品的信息
	    		type:Array
	    	},
	    	slide_data:[],
	    	comment_data:[],//单个商品的轮播图的图片
	    	comment_name:'',
	    	comment_content:'',
	    	pic:this.$picurl,
	    	attr_list:[],
	    	cur_index:null,

	    }
	  },
	  computed:{
	  	...mapState(['cartNum','foot_type','gwc_show'])
	  },
	  created(){
	  	this.$http.get('Goods/good_id',{
	  		params:{
	  			id:this.$route.params.id
	  		}
	  	})
	  	.then((rtnD)=>{
	  	this.gooddesc =  rtnD.data;
	  	this.slide_data = JSON.parse(rtnD.data.slide_picurl);
	  	});
	  	this.$http.get('Goods/comment_list',{
	  		params:{
	  			id:this.$route.params.id
	  		}
	  	})
	  	.then((rtnD)=>{	  		
	  	this.comment_data =  rtnD.data;
	  	});
	  	this.$http.get('Goods/get_attr',{
	  		params:{
	  		id:this.$route.params.id
	  		}
	  	}).then((rtnD)=>{
	  		this.attr_list = rtnD.data;
	  		console.log(this.attr_list);	  		
	  	})
	  },
	  methods:{
	  	...mapMutations(['setCartNum','setFoot','set_gwc_show_false']),
	  	add_car(){

	  		this.$http.post('Goods/add_car',{
	  			attr:JSON.stringify(this.attr_list[this.cur_index]),
	  			good_id:this.$route.params.id,
	  			uid:1,
	  			info:JSON.stringify(this.gooddesc)
	  		}).then(()=>{
	  			 this.$Message.success('添加成功');
	  			 this.set_gwc_show_false();

	  		});
	  	},
	  	choose(index){
	  		this.cur_index = index;
	  	},
	  	add_comment(){
	  		this.c_show = true;
	  	},
	  	comment(){
	  		console.log(this.comment_name);
	  		console.log(this.comment_content);
	  		this.$http.post('Goods/comment',{
	  			c_name:this.comment_name,
	  			c_content:this.comment_content,
	  			id:this.gooddesc.id
	  		}).then(()=>{
	  			this.c_show = false;

	  			this.$http.get('Goods/comment_list',{
		  		params:{
		  			id:this.$route.params.id
		  		}
			  	})
			  	.then((rtnD)=>{
			  	 this.$Message.success('评论成功');	
			  	this.comment_data =  rtnD.data;

			  	})
	  		});
	  	}
	  },
	  components:{
	  	goodd,pop,foot
	  }
	}
</script>
<style type="text/css">
	.gwc-button{
		margin-top: 37px;
		 font-size: 32px;
		 color: white;
		 font-family: 微软雅黑;
		 background: #ff6700;
	}
	.gwc_cur{
		background: pink;
	}
	#ali{
		
		width: 90%;
		height: 40px;
		line-height: 40px;
		font-size: 22px;
		text-align: center;
		border:1px solid orange;
		list-style: none;
		margin-left: 5%;
		margin-bottom:  10px;
	}
	.gwc{
		margin-top: 20px;
	}
	.gwc-wrap{
		text-align: center;
		font-size: 20px;
	}
	.gwc-img{
		width: 40%;
		margin:0px auto;
	}
	.c_list{
		margin-left: 5%;
		margin-top: 20px;
		font-size: 20px;
		color: gray;
		font-family: 微软雅黑;
		font-weight: bolder;
		border-top: 1px dashed orange;
	}
	.comment{
		margin-left: 5%;
		font-size: 16px;
		text-align: left;
		margin-bottom: 40px;
	}
	.cname{
		margin-left: 5%;
		font-size: 22px;
		font-family: 微软雅黑;
		color: black;

	}
	.w111{
		margin-left: 5%;
		font-size: 20px;
	}
	.ctime{
		margin-left: 5%;
		font-size: 18px;

	}
	.ccontent{
		padding :10px;
		width: 90%;
		height: 75px;
		margin:0px auto;
		line-height: 25px;
		border:1px dashed gray;
		font-size: 20px;
	}
	.add_c{
		text-align: center;
		margin-bottom: 60px;
	}
	.add_c div{
		display: inline-block;
		font-size: 25px;
		padding:5px 10px;
		background: red;
		outline: none;
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
		border: 1px solid orange;
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
		width: 50%;
		height: 120px;
		line-height:30px;
		font-size: 26px; 
		vertical-align: top;
		
		border: 1px solid orange;
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

</style>