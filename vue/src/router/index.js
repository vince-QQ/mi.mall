import Vue from 'vue'
import Router from 'vue-router'
import jsonp from 'vue-jsonp'
import HelloWorld from '@/components/HelloWorld'
import home from '../view/home'
import category from '../view/category'
import car from '../view/car'
import my from '../view/my'
import login from '../view/login'
import localcar from '../view/localcar'
import reg from '../view/reg'
import good_desc from '../view/good_desc'
import sum_up from '../view/sum_up'
import address from '../view/address'
import sousuo from '../view/sousuo'
import jjj from '../view/jjj'
import order from '../view/order'

Vue.use(Router)

let router = new Router({
  routes: [
    {
      path: '/',
      // name: 'HelloWorld',
     redirect:'home'
    },
    {
      path:'/order',
      component:order,
    },
    {
      path: '/jjj',
      // name: 'HelloWorld',
     component:jjj
    },
    {
      path:'/sousuo',
      component:sousuo,
    },
    {
      path: '/home',
      // name: 'HelloWorld',
      component: home,
      meta:{
      	num:1,
        
      }
    },
    {
    	path:'/category',
    	component:category,
    	meta:{
    		num:2
    	}
    },
    {
    	path:'/localcar',
    	component:localcar,
    	meta:{
    		num:3,
        require_login:true,
        //设置跳转需要验证
         meta:{
          foot:'localcar'
          }
       
    	}
    },
    {
    	path:'/my',
    	component:my,
    	meta:{
    		num:4,
        
    	}
    },
    {
      path:'/good_desc/:id',
      component:good_desc,
      meta:{
        foot:'ginfo'
      }
    },
    {
      path:'/login',
      component:login,
      
    },
    {
      path:'/reg',
      component:reg,
      
    },
    {
      path:'/car',
      component:car,
      
    },
    {
      path:'/sum_up',
      name:'sum_up',
      component:sum_up,
      meta:{
       
        require_login:true,
       
      }
      
    },
    {
      path:'/address',
      component:address,
      
    }
  ],

})

router.beforeEach((to,from,next)=>{
   let store = router.app.$options.store;
 //这里主要是判断foot的值是否为空，

    if(to.meta.require_login != undefined ){
          if(store.state.user_state.id>0){
            next();
          }
          else{
            router.push('/login');
          }
          
    }

    else{
      if (to.meta.foot != undefined) {
        store.commit('setFoot',to.meta.foot)
      }else{
        store.commit('setFoot','default')
      }
      next()
    }
    if(from.meta.foot == 'ginfo'){
      store.commit('setFoot','default')
    }
  
})

export default router