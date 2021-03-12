import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
} from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { StackRoute } from '../constant/routes';
import HomeScreen from '../screens/Home';

const Tab = createStackNavigator();

const HomeNavigationStack = () => {
  return (
    <Tab.Navigator initialRouteName={StackRoute.HomePageScreen}>
      <Tab.Screen name={StackRoute.HomePageScreen} component={HomeScreen} />
      {/* <Tab.Screen
        name={StackRoute.SettingScreen}
        options={{ headerShown: false }}
        component={SettingScreen}
      />
      <Tab.Screen
        name={StackRoute.AnimationNavigation1Screen}
        options={{ headerShown: false }}
        component={AnimationSampleStack}
      />
      <Tab.Screen
        name={StackRoute.BottomNavigation1ScreenScreen}
        component={BottomNavigationStack}
        options={{
          title: 'Bottom Navigation Example',
        }}
      />
      <Tab.Screen
        name={StackRoute.ModalNavigation1Screen}
        component={ModalNavigationStack}
        options={{ headerShown: false }}
      />
      <Tab.Screen
        name={StackRoute.SwipeSampleScreen}
        component={SwipeSampleStack}
        options={{ headerShown: false }}
      /> */}
    </Tab.Navigator>
  );
};

export default HomeNavigationStack;