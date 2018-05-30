import { combineReducers } from 'redux';

import giphysReducer from './giphys_reducer';

const rootReducer = combineReducer({
  giphys: giphysReducer
})

export default rootReducer
