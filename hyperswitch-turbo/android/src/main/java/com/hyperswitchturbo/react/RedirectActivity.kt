package com.hyperswitchturbo.react

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
// import com.proyecto26.inappbrowser.ChromeTabsDismissedEvent
// import com.proyecto26.inappbrowser.ChromeTabsManagerActivity

class RedirectActivity : AppCompatActivity() {

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    // Handle the redirect
    val intent = this.intent
    val data = intent.data

    if (data != null) {
      // Send event to dismiss Chrome Custom Tabs
      // ChromeTabsDismissedEvent.send()
      
      // Close the activity
      finish()
    } else {
      // Fallback behavior
      finish()
    }
  }
}
