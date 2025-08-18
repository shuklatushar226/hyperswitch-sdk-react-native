package com.facebook.react

import android.app.Application
import android.content.Context
import com.facebook.react.ReactPackage
import com.facebook.react.shell.MainReactPackage
import java.util.ArrayList

class HyperPackageList(application: Application?, context: Context?) {
  val packages: MutableList<ReactPackage> = ArrayList()

  init {
    // Add the main React Native package
    packages.add(MainReactPackage())
  }
}
