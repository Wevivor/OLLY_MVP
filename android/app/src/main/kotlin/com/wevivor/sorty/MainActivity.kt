package com.wevivor.sorty
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import android.content.Intent.FLAG_ACTIVITY_NEW_TASK
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        if (this.intent.getIntExtra("org.chromium.chrome.extra.TASK_ID", -1) == this.taskId) {
            this.finish()
            this.intent.addFlags(FLAG_ACTIVITY_NEW_TASK);
            startActivity(this.intent);
        }
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
    }
}