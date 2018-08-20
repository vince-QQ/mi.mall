<?php
namespace app\first\controller;
use think\Controller;
class Category extends Controller{

function echarts(){

	$_temp_list = db('category')->select();
	$cate_list = [];
	foreach ($_temp_list as $key1 => $value1) {
		if($value1['parent_id']>0){
			$children['name']= $value1['c_name'];
			$children['value']=db('goods')
			->where('category_id='.$value1['id'])
			->count();
			$cate_list[$value1['parent_id']]['children'][]=$children;
			$cate_list[$value1['parent_id']]['value']+=1;
		}
		else{
			$cate_list[$value1['id']]['name']=$value1['c_name'];
			$cate_list[$value1['id']]['value']=0;

			
		}
	}
	unset($_temp_list);
	$cate_data = [];
	foreach ($cate_list as $value) {
		$cate_data[]=$value;
	}
	return $cate_json = [

		'name'=>'商品分类',
		'children'=>$cate_data
	];
	
}


function show_cate(){
	$where_sql =''; 
	if(input('id')>0){
	 $where_sql = "level = 2 and parent_id=".input('id');
	}else{
		$where_sql = 'level=1';
	}
	$cate_list = db('category')
	->where($where_sql)
	->order('id desc')
	->paginate(5);
	$this->assign('cate_list',$cate_list);
   	return $this->fetch();
}
function show_edit(){

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
	$info = db('category')->where("id = '$id'")->find();
	$this->assign('cate',$info);
   	return $this->fetch();
}


function do_edit(){
   $eid = input('id');
 	db('category')->where('id',$eid)->update(input());
 	$this->success('编辑成功',url('show_cate'));	
}
function do_delete(){
	$did = input('id');
  	db('category')->where('id',$did)->delete();
  	$this->success('删除成功',url('show_cate'));	
}
function show_edit_name(){
	$id = input('id');
	$info = db('category')->where("id = '$id'")->find();
	$this->assign('cate',$info);
   	
	return $this->fetch();
}


}



?>