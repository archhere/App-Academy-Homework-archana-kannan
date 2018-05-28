import merge from 'lodash/merge';

const initialState = {
  city: "Please Select",
  jobs: []
};

const reducer = (state = initialState, action) => {
  switch(action.type){
    case "SWITCH_LOCATION":
      let nextState = merge({},state);
      nextState.city = action.city;
      nextState.jobs = action.jobs;
      return nextState; // remove this and fill out the body of the reducer function
    default:
      return state;
    }
};

export default reducer;
