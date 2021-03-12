import React from 'react'
// import AuthNavigationStack from './authNavigationStack'
import AuthNavigationStack from './Authentication'
import HomeNavigationStack from './Home'

const selectStack = () => {
  if (true) {
    return <AuthNavigationStack />;
  } else {
    return <HomeNavigationStack />;
  }
};

export default selectStack;