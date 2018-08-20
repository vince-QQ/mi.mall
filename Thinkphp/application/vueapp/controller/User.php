<?php
namespace app\vueapp\controller;
use think\Controller;

class User extends Controller{


 public function search_uname(){

 	$name = input('uname');
 	$info  =db('user')->where('name',$name)->find();
 	// var_dump($info);
 	if($info){
 		print_r('success');
 	}else{
 		print_r('fail');
 	}

}

function login(){
	$name = input('uname');
	$upwd = input('password');
 	$info  =db('user')->where('name',$name)->find();
 	if($info['password']==$upwd){
 		print_r('success');
 	}
 	else{
 		print_r('fail');
 	}

}
public function reg(){

	$name = input('uname');
	$upwd = input('password');
	$time = date("Y-m-d H:i:s",time());
	db('user')->insert([	
		'name'=>$name,
		'password'=>$upwd,
		'time'=>$time
	]);
	
}



}

?>