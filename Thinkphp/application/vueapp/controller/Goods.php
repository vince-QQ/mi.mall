<?php
namespace app\vueapp\controller;
use think\Controller;

class Goods extends Controller{


 public function goods_list(){

	$goods_list = db('goods')->select();
	return json($goods_list);
}
public function good_id(){
	$gid = input('id');
	$good = db('goods')->where("id=$gid")->find();
	return json($good);
}

public function comment(){
	$time = date("Y-m-d H:i:s",time());
	db('comment')->insert([	
		'id'=>input('id'),
		'c_name'=>input('c_name'),
		'c_content'=>input('c_content'),
		'time'=>$time
	]);
}
public function comment_list(){
	$id = input('id');
	$comment_list = db('comment')->where('id='.$id)->select();
	if($comment_list){
	return json($comment_list);
	}
}


function get_attr(){
  $id = input('id');

  $good_spec = db('goods_spec_option')->select();
  $good_attr = db('goods_attr')->where('good_id='.$id)->select();
  $attr_data=[];
 	foreach ($good_attr as $key => $attr){//合并两张表的数据进行一个输出
 		$attr_data[$key]['price'] = $attr['price'];
 		$attr_data[$key]['sku']=$attr['sku'];
 		$s =explode('|', $attr['spec_option_id']) ;
 		foreach ($good_spec as $skey => $spec) {
 			if($spec['id']==$s[0]){
 				$attr_data[$key]['type']=$spec['attr_name'];
 			}else if($spec['id']==$s[1]){
 				$attr_data[$key]['color']=$spec['attr_name'];
 			}
 		}
 	}
  	return json($attr_data);
}

function add_car(){	
	$info =json_decode(input('info'),true);
	$attr =json_decode(input('attr'),true);
 
	$in['uid']=input('uid');
	$in['goods_id']=input('good_id');
	$in['goods_name']=$info['g_name'];
	$in['goods_picurl']=$info['g_picurl'];
	
	if($attr){
		$in['spec_content'] = $attr['type'].'|'.$attr['color'];
		$in['goods_price']=$attr['price'];
	}
	else{
		$in['spec_content'] = '';
		$in['goods_price']=$info['price'];
	}
	$car=db('cart')->where('goods_id='.$in['goods_id'])->find();
	if($car){
		if($car['spec_content']==$in['spec_content']){
			$in['num']=$car['num']+1;
		 db('cart')->where('goods_id='.$in['goods_id'])->update($in);
		}
		else{
		$in['num']=1;
		db('cart')->insert($in);
		}	
	}
	else{
		$in['num']=1;
		db('cart')->insert($in);
	}
	
}


function cart(){
	$cart_list = db('cart')->select();
	return json_encode($cart_list);
}

function add_button(){

	$id = input('id');
	$spec_content = input('spec_content');
	$info = db('cart')->where('goods_id='.$id)->select();
	foreach ($info as $key => $value) {
		if($value['spec_content']==$spec_content){
			
			$info[$key]['num']+=1;
			
		}
		db('cart')->where('id='.$info[$key]['id'])->update($info[$key]);

	}
	

}

function substract_button(){

	$id = input('id');
	$spec_content = input('spec_content');
	$info = db('cart')->where('goods_id='.$id)->select();
	foreach ($info as $key => $value) {
		if($value['spec_content']==$spec_content){		
			$info[$key]['num']-=1;		
		}
		if($info[$key]['num']==0){
			db('cart')->delete($info[$key]['id']);
		}
		else{
		db('cart')->where('id='.$info[$key]['id'])->update($info[$key]);
		}

	}
}


function delete_button(){

	$id = input('id');
	$spec_content = input('spec_content');
	$info = db('cart')->where('goods_id='.$id)->select();
	foreach ($info as $key => $value) {
		if($value['spec_content']==$spec_content){		
			db('cart')->delete($info[$key]['id']);
		}
	}
}
function address(){

	$address_list = db('address')->order('id desc')->select();
	return json_encode($address_list);


}
function add_address(){
	db('address')->insert(input());
}

function address_id(){
	$id = input('id');
	$address = db('address')->where('id='.$id)->find();
	return json_encode($address);
}
function order(){

	$tmp_order = json_decode(input('order_info'),true);
	$order = [];
	$order['uid'] = input('uid');
	$order['sum_num'] = 0;
	$order['sum_price'] = 0;
	$order['order_sn'] = time();
	$order['time'] = date("Y年m月d日 H:i:s",time());
	foreach ($tmp_order as $key => $value) {
		$order['sum_num']+=$value['num'];
		$order['sum_price'] += ($value['num']*$value['goods_price']);
	}

	if(input('status')){
		print_r(1);
		$order['status']= "已付款";
		db('order')->where('uid ='.$order['uid'])->update($order);
	}else{
		$order['status']= "未付款";
		db('order')->insert($order);
	}
}
	
function order_list(){
	$order_list = db('order')->select();
	return json_encode($order_list);
}
function order_id(){
	$id = input('oid');
	$order  =db('order')->where('id='.$id)->find();
	$order['status']= "已付款";
	$order = db('order')->where('id='.$id)->update($order);
}

	



	





}

?>