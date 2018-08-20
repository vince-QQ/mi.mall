<template>
    <div style="width:100%;height:100vh;">



        <div class="container" style="background:#DCDCDC;width:100%;height:40px;">
            <Row>
                <Col span="1"  style="height:40px;">
                </Col>

                <Col span="7"  style="color:#708090;height:40px;font-size:30px;font-weight:100;margin-top:-5px;">
                <
                </Col> 

                <Col span="8" style="height:40px;">
                <h2 style="color:#708090;margin-top:5px;">分类</h2>
                </col>

                <Col span="5"  style="height:40px;">
                </Col>

                <Col span="1"  style="height:40px;">
                 <router-link to="/search"  >
                <Button shape="circle" icon="ios-search"  style="color:#708090;margin-top:3px;" ></Button>
                 </router-link>
                </Col>
            </Row>
        </div



        <Row>
            <Col span="4">
                <Anchor :offset-top="30" container=".scroll_box" show-ink>   
                    <AnchorLink class="p1" href="#basic_usage" title="手机" />
                    <AnchorLink class="p1" href="#static_position" title="电脑" />
                    <AnchorLink class="p1" href="#API" title="电视"/>
                    <AnchorLink class="p1" href="#API1" title="家电"/>
                    <AnchorLink class="p1" href="#API2" title="路由"/>
                    <AnchorLink class="p1" href="#API3" title="出行"/>
                    <AnchorLink class="p1" href="#API4" title="穿戴"/>
                    <AnchorLink class="p1" href="#API5" title="智能"/>
                    <AnchorLink class="p1" href="#API6" title="电源"/>
                    <AnchorLink class="p1" href="#API7" title="个护"/>
                    <AnchorLink class="p1" href="#API8" title="灯具"/>
                    <AnchorLink class="p1" href="#API9" title="儿童"/>  
                    <AnchorLink class="p1" href="#API10" title="插头线"/>  
                </Anchor>
            </Col>   
            <Col span="1">
            <div style="height:100vh;">
                <Divider type="vertical" class="a" orientation="left"></Divider>
            </div>
            </col>
            <Col span="19">
                <div class="scroll_box" style="height:100vh;overflow-y:scroll;">
                    <div class="p2" style="height:600px;width:100%" id="basic_usage">
                      <h3>~手机~ </h3>
                    <br> <br> <br> 
                    <glist1 :goodslist="goodslist"/> 
                    

                    </div>

                    <div class="p2" style="height:600px;" id="static_position">                      <h3>~电脑~ </h3>
                    <br> <br> <br>
                    <glist1 :goodslist="goodslist"/> 
                     </div>
                    <div class="p2" style="height:600px;" id="API"><h3>~电视~ </h3> <br> <br> <br>
                    <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API1"><h3>~家电~ </h3> <br> <br> <br>
                    <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API2"><h3>~路由~ </h3> <br> <br> <br>
                    <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API3"><h3>~出行~ </h3> <br> <br> <br>
                    <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API4"><h3>~穿戴~ </h3> <br> <br> <br>
                    <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API5"><h3>~智能~ </h3> <br> <br> <br>
                     <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API6"><h3>~电源~ </h3> <br> <br> <br>
                     <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API7"><h3>~个护~ </h3> <br> <br> <br>
                     <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API8"><h3>~灯具~ </h3> <br> <br> <br>
                     <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API9"><h3>~儿童~ </h3> <br> <br> <br>
                     <glist1 :goodslist="goodslist"/> </div>
                    <div class="p2" style="height:600px;" id="API10"><h3>~路由~ </h3> <br> <br> <br>
                     <glist1 :goodslist="goodslist"/> </div>
                </div>
            </Col>
        </Row>
    </div>
</template>


<script>
import glist1 from "../components/glist1.vue"
export default {
  data() {
    return {
      goodslist: []
    }; 
  },
  created() {
    // 获取数据库里面的数据
    this.$http.get("goods/goods_list").
    then(rtnD => {
      console.log(rtnD.data)
      //数组获取 = rtnD.data
      this.goodslist=rtnD.data

    }
    );
    
  },
  //引入组件的声明
  components: {
    glist1
  }

};
</script>


<style>
.p1{
    margin: 20px 0 auto;
}
.p2{
    text-align: center;
    margin-right: 16px;
}
.a{
    height: 2000px !important;
}


.p2>div{
    float: left;
    height: 100px;
    /* width:33.3%; */
 
}
.p2>div img{
    width: 50px;
    height: 50px;
}
</style>