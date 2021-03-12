import { createStackNavigator, TransitionSpecs, CardStyleInterpolators } from '@react-navigation/stack';
import React from 'react';
import { Easing, View, StyleSheet } from 'react-native';
import { StackRoute } from '../constant/routes';
import LoginScreen from '../screens/Login';
import RegisterScreen from '../screens/Register';
import { TransitionSpec } from '@react-navigation/stack/lib/typescript/src/types';

const Stack = createStackNavigator();

const AnimationConfig: TransitionSpec = {
  ...TransitionSpecs.TransitionIOSSpec,
  animation: 'timing',
  config: {
    duration: 1000,
    easing: Easing.inOut(Easing.ease),
  },
};

const AuthNavigationStack = () => {
  return (
    <Stack.Navigator
      initialRouteName={StackRoute.LoginScreen}
      screenOptions={{
        gestureDirection: 'horizontal',
        cardStyleInterpolator: CardStyleInterpolators.forScaleFromCenterAndroid,
        transitionSpec: {
          open: AnimationConfig,
          close: AnimationConfig,
        },
       }}
    >
      <Stack.Screen
        name={StackRoute.LoginScreen}
        component={LoginScreen}
        options={{
          title: 'Login Page',
          headerShown: false,
        }}
      />
      <Stack.Screen
        name={StackRoute.RegisterScreen}
        component={RegisterScreen}
        options={{
          title: 'Register Page',
        }}
      />
    </Stack.Navigator>
  );
};

export default AuthNavigationStack;