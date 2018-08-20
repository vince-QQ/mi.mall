<?php
namespace app\first\controller;
use think\Controller;
class Login extends controller{

	public function show_login(){
      
			return $this->fetch();

	}
	public function do_login(){

			$name = input('uname');
			$upassword = input('upassword');
			$info = db('user')->where("name = '$name' and password = '$upassword'")->find();

			if($info){
				$this->success('登录成功！',url('Goods/show_good'));

			}else{
				$this->error('用户名密码错误！');
			}

	}



}




?>