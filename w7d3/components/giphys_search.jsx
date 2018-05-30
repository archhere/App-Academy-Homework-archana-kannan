import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.component {
  constructor(){
    super();
    this.state = {searchTerm: 'golden retriever' };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }




  componentDidMount(){
    this.props.fetchSearchGiphys('golden+retriever')
  }

  handleChange(e){

  }

  handleSubmit(e){

  }

  render(){
    let {giphys} = this.props;
    return (
      <div>
        <form>
        <input value={this.state.searchTerm} onChange={this.handleChange} />
        <button type="submit" onClick={this.handleSubmit}>Search Giphy </button>
        </form>
        <GiphysIndex giphys={giphys} />
      </div>
    )

  }
}

export default GiphysSearch;
