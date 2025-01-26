package com.example.flutter_with_kotlin

import android.content.Intent
import android.os.Bundle
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "uniqueChannelName"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)

        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "userName" -> {
                    val word = "Kotlin file text added"
                    Toast.makeText(this, word, Toast.LENGTH_LONG).show()
                    result.success(word)
                }

                "openNewScreen" -> {
                    val intent = Intent(this, NewScreenActivity::class.java)
                    startActivity(intent)
                    result.success(null) 
                }

                else -> {
                    result.notImplemented() 
                }
            }
        }
    }
}

class NewScreenActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_new_screen)

        val textView: TextView = findViewById(R.id.textViewMessage)
        textView.text = "Wellcome to Kotlin screen!"
    }
}
