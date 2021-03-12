import React from 'react';
import { Button, SafeAreaView, StyleSheet, View } from 'react-native';
import { Colors } from 'react-native/Libraries/NewAppScreen';
import { StackRoute } from '../../constant/routes';

type Props = {
  navigation: any;
};

const LoginScreen = (props: Props) => {
  const { navigation } = props;
  return (
    <SafeAreaView>
      <View style={styles.body}>
        <Button
          title="Login"
          onPress={() => {
            
          }}
        />
        <Button
          title="Register"
          onPress={() => {
            navigation.navigate(StackRoute.RegisterScreen);
          }}
        />
      </View>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  body: {
    backgroundColor: Colors.white,
  },
});

export default LoginScreen;
