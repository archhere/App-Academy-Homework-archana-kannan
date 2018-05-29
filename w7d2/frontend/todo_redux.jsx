import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';





document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store)
  // store = applyMiddleWares(store, addLoggingToDispatch)
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});


// phase 1

// const addLoggingToDispatch = (store)=>{
//   let result = store.dispatch
//   return (action)=>{
//     console.log(store.getState());
//     console.log(action);
//     result(action)
//     console.log(store.getState());
//   }
// }

// phase 2
// const addLoggingToDispatch = (store)=>{
//   return (next) =>{
//     return (action)=>{
//       console.log(store.getState());
//     }
//   }
// }


// refactor phase 2

// const addLoggingToDispatch = store => next => action =>{
//       console.log(store.getState());
//       console.log(action);
//       next(action);
//       console.log(store.getState());
// }
//
//
//
//
// const applyMiddleWares = (store,...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => dispatch = middleware(store)(dispatch));
//   return Object.assign({},store,{dispatch});
// };
