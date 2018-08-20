<template>   
 <div>   
         <mt-search 
          @keyup.native="getData"
        	v-model="searchString"
        	style="width:100%; height:100vh;font-size: 20px;"
          >
 	        <mt-cell    
            :title="goods_search.title"
            :value="goods_search.value" 
            v-for="goods_search in newSearchList"
           
            >
            <div class="cont">
             <span >{{goods_search.g_name}}</span>
             </div>
        </mt-cell>
         </mt-search> 
 </div>
</template>
<script>
import { Search } from "mint-ui";

export default {
  	data() {
		return {
      value: "",
      newSearchList:[],
			// search_name: [],
			searchString:"",

		}
	},

  components: {
    'mt-search': Search,
  },
  created() {
    //获取数据库里面的数据
    this.$http.get('Goods/goods_list').then(rtnD => {
      console.log(rtnD);
      this.search_name = rtnD.data;
      this.newSearchList = this.search_name;
      // this.getData();

     });
  },
 methods: {
 getData(){
  //  console.log(this.searchString,'this.searchString');
   this.newSearchList = this.search_name.filter((item)=>item.g_name.indexOf(this.searchString.replace(/(^\s+)|(\s+$)/g, ""))>=0);
 }

},

  
}

</script>

<style>
.cont{
  text-align: center;
  font-size: 25px;
  color: orange;
}


</style>