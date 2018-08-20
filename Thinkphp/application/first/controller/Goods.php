<?php

namespace app\first\controller;
use think\Controller;
class Goods extends Controller{
	
function index(){
	return $this->fetch();
}


function add(){
	$_temp_list = db('category')->select();
	$cate_list = [];
	foreach ($_temp_list as $key1 => $value1) {
		if($value1['parent_id']>0){
			$cate_list[$value1['parent_id']]['child_menu'][]=$value1;
		}
		else{
			$cate_list[$value1['id']]=$value1;
		}
	}
	unset($_temp_list);
	$this->assign('cate_list',$cate_list);
	//规格的数据
	$spec_list = db('goods_spec')->select();
	$this->assign('spec_list',json_encode($spec_list));
	//规格具体选项
	$temp_spec_list_option = db('goods_spec_option')->select();
	$spec_list_option = [];
	foreach ($temp_spec_list_option as $key => $value) {
		$spec_list_option[$value['spec_id']][]=$value;
	}
	unset($temp_spec_list_option);
	$this->assign('spec_list_option',json_encode($spec_list_option));
	// var_dump($spec_list);
	// exit();
	return $this->fetch();
}
function do_add(){

	$add_data = input();
	$file = request()->file('picture');
	if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
      
            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            $add_data['g_picurl'] =  $info->getSaveName();
           
        }else{
            // 上传失败获取错误信息
            echo $file->getError();
        }
    }
    
    $add_data['slide_picurl']='["20180812/08d218c41a69705e40a91f7186dae55c.jpg","20180812/0bf6763198efa05e359815abe429dde7.jpg","20180812/3d7bf857864a1c46729a2f51484f64ac.jpg","20180812/a19ebf52f698d47dfc6e9d1fc508d999.jpg"]';
    unset($add_data['good_spec']);
    db('goods')->insert($add_data);//插入商品表

    $g_id = db('goods')->getLastInsID();
    $good_spec = json_decode(input('good_spec'),true);

    foreach ($good_spec as $key => $value) {
    	db('goods_attr')->insert([
    		'good_id'=>$g_id,
    		'spec_option_id'=>$value['first_spec']['id'].'|'.$value['second_spec']['id'],
    		'sku'=>$value['sku'],
    		'price'=>$value['price'],
    	]);
    }

    $this->success('添加成功',url('show_good'));
	
}
function show_good(){
	$goods_list = db('goods')->alias('g')
	->join('category c','g.category_id=c.id')
	->order('g.id desc')
	->field('g.id,g_desc,g.g_name,g.g_picurl,c.c_name')
	->paginate(2);
	$this->assign('goods_list',$goods_list);
	return $this->fetch();
}
function edit_good(){

	$_temp_list = db('category')->select();
	$cate_list = [];
	foreach ($_temp_list as $key1 => $value1) {
		if($value1['parent_id']>0){
			$cate_list[$value1['parent_id']]['child_menu'][]=$value1;
		}
		else{
			$cate_list[$value1['id']]=$value1;
		}
	}
	unset($_temp_list);
	$this->assign('cate_list',$cate_list);
	$id = input('id');
	$info = db('goods')->where("id = '$id'")->find();
	$this->assign('good',$info);
	return $this->fetch();
}
 function do_edit(){
 	
	$add_data = input();
	$file = request()->file('picture');
	if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
      
            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            $add_data['g_picurl'] =  $info->getSaveName();
           
        }else{
            // 上传失败获取错误信息
            echo $file->getError();
        }
    }



 	$eid = input('id');
 	db('goods')->where('id',$eid)->update($add_data);
 	$this->success('编辑成功',url('show_good'));	
 }
  function do_delete(){
  	$did = input('id');
  	db('goods')->where('id',$did)->delete();
  	$this->success('删除成功',url('show_good'));	
  }



  function good_spec(){

  $id = input('id');
  $good = db('goods')->where('id='.$id)->find();
  $good_spec = db('goods_spec_option')->select();
  $good_attr = db('goods_attr')->where('good_id='.$id)->select();
  $attr_data=[];
 	foreach ($good_attr as $key => $attr) {//合并两张表的数据进行一个输出
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
 	$good['g_picurl'] = str_replace('\\', '/', $good['g_picurl']);
 	// unset($good['g_desc']);
  $this->assign('good',json_encode($good));
  $this->assign('attr_data',json_encode($attr_data));
  
  // var_dump($good);
  // exit();
  return $this->fetch();


  }

}



?>