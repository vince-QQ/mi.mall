import vue from 'vue'
import vuex from 'vuex'

vue.use(vuex)


const Vuex = new vuex.Store({

	state:{
		cartNum:{length:2},
		foot_type:'default',
		user_state: JSON.parse(localStorage.getItem('user_state'))||[],
		gwc_show:false,
		
	},
	
	mutations:{
		setCartNum(state){
			// state.cartNum = JSON.parse(localStorage.getItem('car'));
			
			state.cartNum +=1;
		},
		setFoot(state,type){
			state.foot_type = type
		},
		set_user_state(state,_state){
			state.user_state = _state
		},
		set_gwc_show_true(state){//这里可以设置成一个接受状态参数的函数
			state.gwc_show = true
		},
		set_gwc_show_false(state){
			state.gwc_show = false
		}
	}

})

export default Vuex