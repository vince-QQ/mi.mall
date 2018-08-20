<template>
    <div style="width:100%;height:100vh;">
        <Row>
            <Col span="5">
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
                <Divider type="vertical" class="a"></Divider>
            </div>
            </col>
            <Col span="18">
                <div class="scroll_box" style="height:100vh; overflow-y:scroll;">
                    <div class="p2" style="height:580px;" id="basic_usage"><Divider>手机的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="static_position"><Divider>电脑的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API"><Divider>电视的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API1"><Divider>家电的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API2"><Divider>路由的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API3"><Divider>出行的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API4"><Divider>穿戴的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API5"><Divider>智能的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API6"><Divider>电源的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API7"><Divider>个护的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API8"><Divider>灯具的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API9"><Divider>儿童的商品列表</Divider></div>
                    <div class="p2" style="height:580px;" id="API10"><Divider>插头线的商品列表</Divider></div>
                </div>
            </Col>
        </Row>
    </div>
</template>
<style>
.p1{
    margin: 20px 0 auto;
}
.p2{
    text-align: center;
}
.a{
    height: 2000px !important;
}
</style>
